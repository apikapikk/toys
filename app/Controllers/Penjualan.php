<?php

namespace App\Controllers;

use App\Libraries\Keranjang;
use App\Models\KeranjangModel;
use App\Models\PelangganModel;
use App\Models\PenjualanModel;
use App\Models\TransaksiModel;
use Irsyadulibad\DataTables\DataTables;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class Penjualan extends BaseController {
    protected $table = 'tb_item';
    protected $pelangganModel;
    protected $keranjangModel;
    protected $penjualanModel;
    protected $transaksi;

    public function __construct() {
        $this->pelangganModel = new PelangganModel();
        $this->penjualanModel = new PenjualanModel();
        $this->transaksi      = new TransaksiModel();
        $this->keranjangModel = new KeranjangModel();
        helper('form');
    }
    public function index() {
        $data = [
            'title'     => 'Input Penjualan',
            'pelanggan' => $this->pelangganModel->detailPelanggan(),
        ];
        echo view('penjualan/index', $data);
    }

    public function cekStok() {
        $barcode = $this->request->getGet('barcode');
        $respon  = $this->keranjangModel->cekStokProduk($barcode);

        return $this->response->setJSON($respon);
    }

    public function tambah() {
        if ($this->request->getMethod() == 'post') {
            $id   = $this->request->getPost('iditem', FILTER_SANITIZE_NUMBER_INT);
            $item = [
                'id'      => $id,
                'barcode' => $this->request->getPost('barcode', FILTER_SANITIZE_STRING),
                'nama'    => $this->request->getPost('nama', FILTER_SANITIZE_STRING),
                'harga'   => $this->request->getPost('harga', FILTER_SANITIZE_NUMBER_INT),
                'jumlah'  => $this->request->getPost('jumlah', FILTER_SANITIZE_NUMBER_INT),
                'stok'    => $this->request->getPost('stok', FILTER_SANITIZE_NUMBER_INT),
            ];
            $hasil = Keranjang::tambah($id, $item); // masukan item ke keranjang
            if ($hasil == 'error') {
                $respon = [
                    'status' => false,
                    'pesan'  => 'Item yang ditambahkan melebihi stok',
                ];
            } else {
                $respon = [
                    'status' => true,
                    'pesan'  => 'Item berhasil ditambahkan ke keranjang.',
                ];
            }

            return $this->response->setJSON($respon);
        }
    }

    public function ubah() {
        if ($this->request->getMethod() == 'post') {
            $id   = $this->request->getPost('item_id', FILTER_SANITIZE_NUMBER_INT);
            $item = [
                'jumlah' => $this->request->getPost('item_jumlah', FILTER_SANITIZE_NUMBER_INT),
                'diskon' => $this->request->getPost('item_diskon', FILTER_SANITIZE_NUMBER_INT),
                'total'  => $this->request->getPost('harga_setelah_diskon', FILTER_SANITIZE_NUMBER_INT),
            ];
            Keranjang::ubah($id, $item); // masukan item ke keranjang
            $respon = [
                'pesan' => 'Item berhasil diubah.',
            ];

            return $this->response->setJSON($respon);
        }
    }

    public function hapus() {
        if ($this->request->isAJAX()) {
            $iditem = $this->request->getPost('iditem', FILTER_SANITIZE_NUMBER_INT);
            if (empty($iditem)) {
                // hapus session keranjang
                session()->remove('keranjang');
                $respon = [
                    'status' => true,
                    'pesan'  => 'Transaksi berhasil dibatalkan.',
                ];
            } else {
                $hapus = Keranjang::hapus($iditem);
                if ($hapus) {
                    $respon = [
                        'status' => true,
                        'pesan'  => 'Item berhasil dihapus dari keranjang.',
                    ];
                } else {
                    $respon = [
                        'status' => false,
                        'pesan'  => 'Gagal menghapus item dari keranjang',
                    ];
                }
            }

            return $this->response->setJSON($respon);
        }
    }

    public function bayar() {
        if ($this->request->getMethod() == 'post') {
            // tambahkan record ke tabel penjualan
            $tunai     = $this->request->getPost('tunai', FILTER_SANITIZE_NUMBER_INT);
            $kembalian = $this->request->getPost('kembalian', FILTER_SANITIZE_NUMBER_INT);
            $data      = [
                'invoice'      => $this->penjualanModel->invoice(),
                'id_pelanggan' => $this->request->getPost('id_pelanggan', FILTER_SANITIZE_NUMBER_INT),
                'total_harga'  => $this->request->getPost('subtotal', FILTER_SANITIZE_NUMBER_INT),
                'diskon'       => $this->request->getPost('diskon', FILTER_SANITIZE_NUMBER_INT),
                'total_akhir'  => $this->request->getPost('total_akhir', FILTER_SANITIZE_NUMBER_INT),
                'tunai'        => str_replace('.', '', $tunai),
                'kembalian'    => str_replace('.', '', $kembalian),
                'catatan'      => $this->request->getPost('catatan', FILTER_SANITIZE_STRING),
                'tanggal'      => $this->request->getPost('tanggal', FILTER_SANITIZE_STRING),
                'id_user'      => session('id'),
                'ip_address'   => $this->request->getIPAddress(),
                'created_at'   => date('Y-m-d H:i:s'),
                'updated_at'   => date('Y-m-d H:i:s'),
            ];

            $result = $this->penjualanModel->simpanPenjualan($data);
            if ($result['status']) {
                $respon = [
                    'status'      => $result['status'],
                    'pesan'       => 'Transaksi berhasil.',
                    'idpenjualan' => $result['id'],
                ];
            } else {
                $respon = [
                    'status' => $result['status'],
                    'pesan'  => 'Transaksi gagal',
                ];
            }

            return $this->response->setJSON($respon);
        }
    }

    public function keranjang() {
        if ($this->request->isAJAX()) {
            $respon = [
                'invoice'   => $this->penjualanModel->invoice(),
                'keranjang' => Keranjang::keranjang(),
                'sub_total' => Keranjang::sub_total(),
            ];

            return $this->response->setJSON($respon);
        }
    }

    public function invoice() {
        $input = $this->request->getGet('tanggal');

        $builder = DataTables::use('tb_penjualan')->select('id, invoice, tanggal');

        if ($this->request->isAJAX()) {
            if ($input != null && strpos($input, ' to ') !== false) {
                [$start, $end] = explode(' to ', $input);
                $builder->where([
                    'tanggal >=' => $start,
                    'tanggal <=' => $end
                ]);
            }

            return $builder->make();
        } else if ($this->request->getMethod() === 'get') {
            $data = [
                'title' => 'Daftar Invoice',
            ];
            return view('penjualan/daftar_invoice', $data);
        }
    }

    public function cetak($id) {
        $transaksi = $this->transaksi->detailTransaksi($id);
        // jika id penjualan tidak ditemukan redirect ke halaman invoice dan tampilkan error
        if (empty($transaksi)) {
            return redirect()->to('/penjualan/invoice')->with('pesan', 'Invoice tidak ditemukan');
        }
        echo view('penjualan/cetak_termal', ['transaksi' => $transaksi]);
    }

    public function exportExcel() {
        $input = $this->request->getGet('tanggal');
        // var_dump($input); die;
        // Tarik data
        $data = $this->transaksi
        ->join('tb_penjualan', 'tb_penjualan.id = tb_transaksi.id_penjualan')
        ->join('tb_users as pelanggan', 'pelanggan.id = tb_penjualan.id_pelanggan')
        ->join('tb_users as kasir', 'kasir.id = tb_penjualan.id_user')
        ->join('tb_item', 'tb_item.id = tb_transaksi.id_item');
        if ($input != null && strpos($input, ' to ') !== false) {
            [$start, $end] = explode(' to ', $input);
            $data = $data->where([
                'tb_penjualan.tanggal >=' => $start,
                'tb_penjualan.tanggal <=' => $end
            ]);
        }
        $data = $data->findAll();
        // $builder = $this->builder('tb_penjualan')->get()->getResult();
        // Instansiasi Spreadsheet
        $spreadsheet = new SpreadSheet();
        // styling
        $style = [
            'font'      => ['bold' => true],
            'alignment' => [
                'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
                'vertical'   => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER,
            ],
        ];
        $spreadsheet->getActiveSheet()->getStyle('A1:J1')->applyFromArray($style); // tambahkan style
        $spreadsheet->getActiveSheet()->getRowDimension(1)->setRowHeight(30); // setting tinggi baris
        // setting lebar kolom otomatis
        $spreadsheet->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
        $spreadsheet->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
        $spreadsheet->getActiveSheet()->getColumnDimension('C')->setAutoSize(true);
        $spreadsheet->getActiveSheet()->getColumnDimension('D')->setAutoSize(true);
        $spreadsheet->getActiveSheet()->getColumnDimension('E')->setAutoSize(true);
        $spreadsheet->getActiveSheet()->getColumnDimension('F')->setAutoSize(true);
        $spreadsheet->getActiveSheet()->getColumnDimension('G')->setAutoSize(true);
        $spreadsheet->getActiveSheet()->getColumnDimension('H')->setAutoSize(true);
        $spreadsheet->getActiveSheet()->getColumnDimension('I')->setAutoSize(true);
        $spreadsheet->getActiveSheet()->getColumnDimension('J')->setAutoSize(true);
        // set kolom head
        $spreadsheet->setActiveSheetIndex(0)
            ->setCellValue('A1', 'No')
            ->setCellValue('B1', 'Invoice No')
            ->setCellValue('C1', 'Tanggal')
            ->setCellValue('D1', 'Pelanggan')
            ->setCellValue('E1', 'Total Harga')
            ->setCellValue('F1', 'Diskon')
            ->setCellValue('G1', 'Jumlah Akhir')
            ->setCellValue('H1', 'Pembayaran Tunai')
            ->setCellValue('I1', 'Kembalian')
            ->setCellValue('J1', 'Produk');
        $row = 2;
        // var_dump($data); die;
        // looping data item
        foreach ($data as $key => $dt) {
            $spreadsheet->getActiveSheet()
                ->setCellValue('A' . $row, $key + 1)
                ->setCellValue('B' . $row, $dt['invoice'])
                ->setCellValue('C' . $row, $dt['tanggal'])
                ->setCellValue('D' . $row, $dt['username'])
                ->setCellValue('E' . $row, $dt['total_harga'])
                ->setCellValue('F' . $row, $dt['diskon'])
                ->setCellValue('G' . $row, $dt['total_akhir'])
                ->setCellValue('H' . $row, $dt['tunai'])
                ->setCellValue('I' . $row, $dt['kembalian'])
                ->setCellValue('J' . $row, $dt['nama_item']);
            $row++;
        }
        // tulis dalam format .xlsx
        $writer   = new Xlsx($spreadsheet);
        $namaFile = 'Laporan_Invoice_' . date('d-m-Y') . '.xlsx';

        // Tentukan path penyimpanan (contoh: public/exports/)
        $savePath = FCPATH . 'exports/' . $namaFile;

        // Pastikan folder 'exports' ada
        if (!is_dir(FCPATH . 'exports')) {
            mkdir(FCPATH . 'exports', 0777, true);
        }

        // Simpan file ke server
        $writer->save($savePath);

        // Kembalikan response JSON
        return $this->response->setJSON([
            'status' => 'success',
            'message' => 'File berhasil dibuat',
            'file_url' => base_url('exports/' . $namaFile),
            'file_name' => $namaFile
        ]);
    }

}
