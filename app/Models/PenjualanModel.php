<?php

namespace App\Models;

use CodeIgniter\Model;
use App\Models\TransaksiModel;
use App\Models\ItemModel;

class PenjualanModel extends Model
{
    protected $table      = 'tb_penjualan';
    protected $primaryKey = 'id';

    protected $allowedFields = [
        'invoice',
        'id_pelanggan',
        'total_harga',
        'diskon',
        'total_akhir',
        'tunai',
        'kembalian',
        'catatan',
        'tanggal',
        'id_user',
        'ip_address'
    ];
    protected $useTimestamps = true;

    public function invoice()
    {
        // ambil invoice terakhir sesuai tanggal hari ini
        $builder = $this->builder($this->table)->selectMax('invoice')->where('tanggal', date('Y-m-d'))->get(1)->getRow();
        // buat format invoice baru
        if (empty($builder->invoice)) {
            $no = '0001';
        } else {
            $data = substr($builder->invoice, -4); // ambil 4 angka ke belakang
            $angka = ((int) $data) + 1;
            $no = sprintf("%'.04d", $angka);
        }
        return "INV" . date('ymd') . $no;
    }

    public function simpanPenjualan(array $post)
    {
        $item = new ItemModel();
        $transaksi = new TransaksiModel();

        $db = \Config\Database::connect();
        $db->transBegin();
        $this->save($post); // simpan transaksi ke tabel penjualan
        $id_penjualan = $this->insertID; // mengambil id penjualan
        $keranjang = session('keranjang'); // menampung session keranjang
        $data = [];
        foreach ($keranjang as $val) {
            $itemTransaksi = [
                'id_penjualan'  => $id_penjualan,
                'id_item'       => $val['id'],
                'harga_item'    => $val['harga'],
                'jumlah_item'   => $val['jumlah'],
                'diskon_item'   => $val['diskon'],
                'subtotal'      => $val['total'],
                'ip_address'    => $post['ip_address'],
                'created_at'    => date("Y-m-d H:i:s"),
                'updated_at'    => date("Y-m-d H:i:s"),
            ];
            array_push($data, $itemTransaksi); // masukan item transaksi ke variabel $data
            // update stok item sesuai idnya
            $item->set('stok', 'stok-'.$val['jumlah'], false);
            $item->where('id', $val['id']);
            $item->update();
        }
        $transaksi->insertBatch($data); // tambahkan ke tabel transaksi

        if ($db->transStatus() === FALSE)
        {
            $db->transRollback();
            return ['status' => false];
        } else {
            // kosongkang keranjang
            unset($_SESSION['keranjang']);
            return ['status' => $db->transCommit(), 'id' => $id_penjualan];
        }
    }


    public function laporanPenjualan($tahun)
{
    // Buat array bulan
    $bulan = [
        '01' => 'Januari',
        '02' => 'Februari',
        '03' => 'Maret',
        '04' => 'April',
        '05' => 'Mei',
        '06' => 'Juni',
        '07' => 'Juli',
        '08' => 'Agustus',
        '09' => 'September',
        '10' => 'Oktober',
        '11' => 'November',
        '12' => 'Desember',
    ];

    // Ambil data penjualan berdasarkan bulan dan tahun
    $dataPenjualan = $this->builder('tb_penjualan')
        ->select('MONTH(tanggal) as bulan, SUM(total_harga) as total')
        ->where('YEAR(tanggal)', $tahun)
        ->groupBy('MONTH(tanggal)')
        ->orderBy('bulan', 'ASC')
        ->get()
        ->getResultArray();

    // Masukkan data bulan yang tidak ada penjualannya (total = 0)
    foreach ($bulan as $key => $namaBulan) {
        $found = false;
        foreach ($dataPenjualan as &$penjualan) {
            if ($penjualan['bulan'] == $key) {
                $found = true;
                break;
            }
        }
        if (!$found) {
            // Jika bulan tidak ditemukan, tambahkan dengan total 0
            $dataPenjualan[] = ['bulan' => $key, 'total' => 0];
        }
    }

    // Sort kembali berdasarkan bulan
    usort($dataPenjualan, function ($a, $b) {
        return $a['bulan'] - $b['bulan'];
    });

    return $dataPenjualan;
}


}
