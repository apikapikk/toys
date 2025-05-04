<?php

namespace App\Controllers;

use App\Models\UserModel;
use \Mailjet\Resources;

class Auth extends BaseController
{
    protected $userModel;

    public function __construct()
    {
        $this->userModel = new UserModel();
        helper('form');
    }

    public function index()
    {
        if (is_login()) {
            return redirect()->to('dashboard');
        }
        echo view('auth/login', ['title' => 'Login Admin']);
    }

    public function proses()
    {
        if ($this->request->getMethod() == 'post') {
            // Validasi form input
            $rules = $this->validate([
                'username' => 'required|alpha_numeric',
                'password' => 'required'
            ]);

            // Jika validasi gagal, kembalikan error
            if (!$rules) {
                $respon = [
                    'validasi' => false,
                    'error' => [
                        'username' => $this->validator->getError('username'),
                        'password' => $this->validator->getError('password')
                    ]
                ];
                return $this->response->setJSON($respon);
            } else {
                // Ambil user berdasarkan username yang dimasukkan
                $user = $this->userModel->getUser($this->request->getPost('username', FILTER_SANITIZE_STRING));

                if (empty($user)) {
                    $respon = [
                        'validasi' => true,
                        'error' => ['username' => 'Username tidak terdaftar!']
                    ];
                    return $this->response->setJSON($respon);
                } else {
                    // Verifikasi password
                    if (!password_verify($this->request->getPost('password'), $user->password)) {
                        $respon = [
                            'validasi' => true,
                            'error' => ['password' => 'Password tidak sesuai!']
                        ];
                        return $this->response->setJSON($respon);
                    } else {
                        // Login sukses, set session user
                        $data = [
                            'login' => true,
                            'id'    => $user->id,
                        ];
                        $this->session->set($data); // Set session

                        $respon = [
                            'validasi' => true,
                            'sukses' => true,
                            'aksi' => 'login',
                            'pesan' => 'Login berhasil!',
                            'roleId' => $user->id_role
                        ];
                        return $this->response->setJSON($respon);
                    }
                }
            }
        }
    }

    public function lupaPassword()
    {
        if ($this->request->getMethod() == 'get') {
            echo view('auth/lupa-password', ['title' => 'Lupa Password']);
        } else {
            // Validasi email
            $rules = $this->validate([
                'email' => 'required|valid_email',
            ]);

            if (!$rules) {
                $respon = [
                    'validasi' => false,
                    'error' => $this->validator->getErrors()
                ];
                return $this->response->setJSON($respon);
            } else {
                // Ambil user berdasarkan email
                $user = $this->userModel->getUser($this->request->getPost('email', FILTER_SANITIZE_EMAIL));

                if (empty($user)) {
                    $respon = [
                        'validasi' => true,
                        'error' => ['email' => 'Email tidak terdaftar!']
                    ];
                    return $this->response->setJSON($respon);
                } else {
                    // Generate token untuk reset password
                    $token = bin2hex(random_bytes(32));
                    $this->userModel->update($user->id, ['token' => $token]);
                    $kirimEmail = $this->_kirimEmail($user->email, 'reset', $token);

                    if ($kirimEmail) {
                        $respon = [
                            'validasi' => true,
                            'sukses' => true,
                            'aksi' => 'lupa',
                            'pesan' => 'Link ganti password berhasil dikirim ke email, silahkan cek di kotak masuk atau folder spam :)'
                        ];
                    } else {
                        $respon = [
                            'validasi' => true,
                            'status' => false,
                            'pesan' => 'Tidak dapat mengirim email, server sedang gangguan!'
                        ];
                    }
                    return $this->response->setJSON($respon);
                }
            }
        }
    }

    public function reset()
    {
        $token = $this->request->getGet('token', FILTER_SANITIZE_STRING);
        echo view('auth/ubah-password', ['title' => 'Ubah Password', 'token' => $token]);
    }

    public function gantiPassword()
    {
        if ($this->request->getMethod() == 'post') {
            // Validasi password
            $rules = $this->validate([
                'password' => 'required|min_length[6]|matches[konfirmasi_password]',
                'konfirmasi_password' => 'matches[password]'
            ]);

            if (!$rules) {
                $respon = [
                    'validasi' => false,
                    'error' => $this->validator->getErrors()
                ];
                return $this->response->setJSON($respon);
            } else {
                // Ambil user berdasarkan token
                $user = $this->userModel->getToken($this->request->getPost('kode'));

                if (empty($user)) {
                    $respon = [
                        'validasi' => true,
                        'error' => ['token' => 'Token tidak valid, silahkan request link reset password kembali!']
                    ];
                    return $this->response->setJSON($respon);
                } else {
                    // Update password
                    $password = buat_password($this->request->getPost('konfirmasi_password'));
                    try {
                        $this->userModel->update($user->id, ['password' => $password, 'token' => null]);
                        $this->_kirimEmail($user->email, 'ganti');
                        $respon = [
                            'validasi' => true,
                            'sukses' => true,
                            'aksi' => 'ubah',
                            'pesan' => 'Password berhasil diubah, silahkan login :)'
                        ];
                    } catch (\Exception $e) {
                        $respon = [
                            'validasi' => true,
                            'sukses' => false,
                            'pesan' => 'Gagal mengubah password, coba lagi nanti.'
                        ];
                    }
                    return $this->response->setJSON($respon);
                }
            }
        }
    }

    private function _kirimEmail($tujuan, $tipe = 'reset', $token = null): bool
    {
        $user = $this->userModel->getUser($tujuan);
        if (empty($user)) {
            return false;
        }

        $public = getenv('MJ_APIKEY_PUBLIC');
        $privat = getenv('MJ_APIKEY_PRIVATE');
        $email = getenv('MJ_FROM_EMAIL');
        $name = getenv('MJ_NAME_EMAIL');

        $mj = new \Mailjet\Client($public, $privat, true, ['version' => 'v3.1']);

        if ($tipe == 'reset') {
            $subjek = 'Lupa Password';
            $pesan = 'Anda telah melakukan permintaan untuk mereset password. Untuk melanjutkan silahkan<br/><br/> <a href="' . base_url("auth/reset?token={$token}") . '">KLIK DISINI</a><br/><br/>';
            $pesan .= 'Tapi jika Anda tidak pernah meminta proses ini, maka kami berharap Anda mengabaikan email ini.';
        } elseif ($tipe == 'ganti') {
            $subjek = 'Ubah Password';
            $pesan = 'Password berhasil di ubah, silahkan login kembali :)';
        } elseif ($tipe == 'verifikasi') {
            $subjek = 'Verifikasi Akun';
            $pesan = 'Silahkan konfirmasi email Anda<br/><br/> <a href="' . base_url("auth/verifikasi?token={$token}") . '">KLIK DISINI</a><br/>';
        }

        $body = [
            'Messages' => [
                [
                    'From' => ['Email' => $email, 'Name' => $name],
                    'To' => [
                        ['Email' => $user->email, 'Name' => $user->nama]
                    ],
                    'Subject' => $subjek,
                    'HTMLPart' => $pesan
                ]
            ]
        ];

        $response = $mj->post(Resources::$Email, ['body' => $body]);
        return  $response->success();
    }

    public function logout()
    {
        session()->remove(['login', 'id']);
        return redirect()->to(base_url())->with('message', 'Anda telah berhasil logout.');
    }
}
