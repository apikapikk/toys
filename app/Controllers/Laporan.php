<?php

namespace App\Controllers;

use App\Controllers\BaseController;

class Laporan extends BaseController
{
    public function index()
    {
        echo view('laporan/index');
    }
}
