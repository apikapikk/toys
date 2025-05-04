<?php

namespace App\Controllers;

use App\Models\UserModel;
use Irsyadulibad\DataTables\DataTables;

class User extends BaseController
{
    protected $userModel;

    private $rules = [
        'nama'     => ['rules' => 'required'],
        'username' => ['rules' => 'required|alpha_numeric|is_unique[tb_users.username,id,{id}]'],
        'email'    => ['rules' => 'required|valid_email|is_unique[tb_users.email,id,{id}]'],
        'role'     => ['rules' => 'required']
    ];

    public function __construct()
    {
        $this->userModel = new UserModel();
        helper(['form', 'fungsi']);
    }
    public function index()
    {
        $data = [
            'title' => 'Daftar User',
            'roles' => $this->userModel->getRole()
        ];
        echo view('user/index', $data);
    }

    public function ajax()
    {
        if($this->request->isAJAX()){
            return DataTables::use('tb_users')
            ->select('tb_users.id, email, username, nama, alamat, tb_users.id_role AS role, tb_roles.keterangan AS keterangan')
            ->join('tb_roles', 'tb_roles.id = id_role')->where(['tb_users.id !=' => 1])->where(['tb_users.id !=' => session('id')])
            ->make();
        }
    }
    
    public function tambah()
    {
        if ($this->request->isAJAX()) {
            $this->rules['password'] = ['rules' => 'required'];
            if (!$this->validate($this->rules)) {
                $respon = [
                    'validasi' => false,
                    'error' => $this->validator->getErrors()
                ];
            } else {
                $email = strtolower($this->request->getPost('email', FILTER_VALIDATE_EMAIL));
                $token = bin2hex(random_bytes(32));
                $data = [
                    'username' => strtolower($this->request->getPost('username', FILTER_SANITIZE_STRING)),
                    'email' => $email,
                    'password' => buat_password($this->request->getPost('password')),
                    'nama'  => ucwords($this->request->getPost('nama', FILTER_SANITIZE_STRING)),
                    'alamat' => ucwords($this->request->getPost('alamat', FILTER_SANITIZE_STRING)),
                    'id_role' => $this->request->getPost('role', FILTER_SANITIZE_NUMBER_INT),
                    'status' => 0,
                    'token' => $token,
                    'ip_address' => $this->request->getIPAddress()
                ];
                // tambah data user baru 
                $this->userModel->save($data);
                // kirim email verifikasi
                $auth = new Auth();
                $auth->verifikasiAkun($email, $token);
                $respon = [
                    'validasi' => true,
                    'sukses' => true,
                    'pesan' => 'Data berhasil ditambahkan :)'
                ];
            }
            return $this->response->setJSON($respon);
        }
    }

    public function ubah()
    {
        // jika photo profile di update 
        if ($this->request->getFile('avatar')) {
            $this->rules['avatar'] = 'max_size[avatar,1024]|is_image[avatar]|mime_in[avatar,image/png,image/jpg,image/jpeg]|max_dims[avatar,500,500]';
        }

        if ($this->request->isAJAX()) {
            if (!$this->validate($this->rules)) {
                $respon = [
                    'validasi' => false,
                    'error' => $this->validator->getErrors()
                ];
            } else {
                $id = $this->request->getPost('id', FILTER_SANITIZE_NUMBER_INT);
                $data = [
                    'id' => $id,
                    'username' => strtolower($this->request->getPost('username', FILTER_SANITIZE_STRING)),
                    'email' => strtolower($this->request->getPost('email', FILTER_VALIDATE_EMAIL)),
                    'nama'  => ucwords($this->request->getPost('nama', FILTER_SANITIZE_STRING)),
                    'alamat' => ucwords($this->request->getPost('alamat', FILTER_SANITIZE_STRING))
                ];
                // jika password di update
                if (!empty($this->request->getPost('password'))) {
                    $data['password'] = buat_password($this->request->getPost('password'));
                }
                // jika role akses di update 
                if (!empty($this->request->getPost('role'))) {
                    $data['id_role'] = $this->request->getPost('role', FILTER_SANITIZE_NUMBER_INT);
                }
                $photo = $this->request->getPost('avatarLama', FILTER_SANITIZE_STRING);
                // jika photo profile di update
                if (!empty($this->request->getFile('avatar'))) {
                    $file = $this->request->getFile('avatar'); // ambil data file
                    $namaRandom = $file->getRandomName();
                    if ($file->isValid() && !$file->hasMoved()) {
                        // pindahkan photo baru ke folder uploads/profile
                        $file->move(FCPATH . 'uploads/profile', $namaRandom, true);
                        // hapus photo lama yang sesuai dengan database
                        if ($photo != 'avatar.jpg' && file_exists(FCPATH . 'uploads/profile/' . $photo)) {
                            unlink(FCPATH . 'uploads/profile/' . $photo);
                        }
                        $data['avatar'] = $namaRandom; // update nama photo di database
                    }
                }

                // Simpan data user 
                $this->userModel->save($data);
                $respon = [
                    'validasi' => true,
                    'sukses' => true,
                    'pesan' => 'Data berhasil diubah :)'
                ];
                $user = $this->userModel->getUser($id);
                unset($user->password, $user->token, $user->status, $user->ip_address, $user->updated_at, $user->deleted_at); // hide data user
                $respon['user'] = $user; // Kirim data user setelah berhasil di ubah
            }
            return $this->response->setJSON($respon);
        }
    }

    public function hapus()
    {
        if ($this->request->isAJAX()) {
            $id = $this->request->getPost('id', FILTER_SANITIZE_NUMBER_INT);
            // jika id user yang akan di hapus di temukan, lanjut proses
            if($this->userModel->find($id)){
                $this->userModel->where('id !=', 1)->where('id !=', session('id'))->where('id', $id)->delete();
                    $respon = [
                        'status' => true,
                        'pesan' => 'Data berhasil dihapus :)'
                    ];
                // fitur hapus user hanya untuk superadmin, selain itu dilarang
                // if (user()->id == 1) {
                //     $this->userModel->where('id !=', 1)->where('id !=', session('id'))->where('id', $id)->delete();
                //     $respon = [
                //         'status' => true,
                //         'pesan' => 'Data berhasil dihapus :)'
                //     ];
                // } else {
                //     $respon = [
                //         'status' => false,
                //         'pesan' => 'Tidak diizinkan!'
                //     ];
                // }
                return $this->response->setJSON($respon);
            }
        }
    }

    public function profile()
    {
        // Ambil data pengguna dari sesi atau dari token pengguna yang sedang login
        $userId = session('id'); // Sesuaikan dengan bagaimana sistem login kamu

        $data = [
            'title' => 'Edit Profil',
            'user' => $this->userModel->getUser($userId) // Ambil data user dari database berdasarkan ID
        ];

        echo view('user/profile', $data);
    }

     public function updateProfile()
    {
        if ($this->request->isAJAX()) {
            // Tentukan aturan validasi
            $rules = [
                'nama'     => 'required',
                'username' => 'required|alpha_numeric|is_unique[tb_users.username,id,{id}]',
                'email'    => 'required|valid_email|is_unique[tb_users.email,id,{id}]',
            ];

            // Cek jika ada file avatar yang diupload
            if ($this->request->getFile('avatar')) {
                $rules['avatar'] = 'max_size[avatar,1024]|is_image[avatar]|mime_in[avatar,image/png,image/jpg,image/jpeg]|max_dims[avatar,500,500]';
            }

            // Validasi form
            if (!$this->validate($rules)) {
                return $this->response->setJSON([
                    'validasi' => false,
                    'error'    => $this->validator->getErrors()
                ]);
            }

            // Ambil ID pengguna yang sedang login
            $userId = session('id');

            // Persiapkan data yang akan diupdate
            $data = [
                'id'       => $userId,
                'username' => strtolower($this->request->getPost('username')),
                'email'    => strtolower($this->request->getPost('email')),
                'nama'     => ucwords($this->request->getPost('nama')),
                'alamat'   => ucwords($this->request->getPost('alamat')),
            ];

            // Cek jika password diubah
            if ($this->request->getPost('password')) {
                $data['password'] = buat_password($this->request->getPost('password'));
            }

            // Cek jika ada avatar baru yang diupload
            $photo = $this->request->getPost('avatarLama');
            $file  = $this->request->getFile('avatar');
            if ($file && $file->isValid() && !$file->hasMoved()) {
                $namaRandom = $file->getRandomName();
                $file->move(FCPATH . 'uploads/profile', $namaRandom);

                // Hapus foto lama jika ada
                if ($photo != 'avatar.jpg' && file_exists(FCPATH . 'uploads/profile/' . $photo)) {
                    unlink(FCPATH . 'uploads/profile/' . $photo);
                }
                $data['avatar'] = $namaRandom;
            }

            // Simpan data pengguna yang sudah diupdate
            $this->userModel->save($data);

            // Ambil kembali data pengguna yang baru untuk ditampilkan
            $user = $this->userModel->getUser($userId);
            unset($user->password, $user->token, $user->status, $user->ip_address); // Sembunyikan beberapa informasi sensitif

            // Kirim respons sukses dan data pengguna yang sudah diupdate
            return $this->response->setJSON([
                'validasi' => true,
                'sukses'   => true,
                'user'     => $user
            ]);
        }
    }


}
