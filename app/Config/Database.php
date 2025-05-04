<?php

namespace Config;

use CodeIgniter\Database\Config;

/**
 * Database Configuration
 */
class Database extends Config
{
	public $filesPath = APPPATH . 'Database' . DIRECTORY_SEPARATOR;
	public $defaultGroup = 'default';

	public $default = [];
	public $tests = [];

	public function __construct()
	{
		parent::__construct();

		if (ENVIRONMENT === 'testing') {
			$this->defaultGroup = 'tests';
		}

		$this->default = [
			'DSN'      => '',
			'hostname' => env('DB_HOST', '127.0.0.1'),
			'username' => env('DB_USER', 'root'),
			'password' => env('DB_PASSWORD', ''),
			'database' => env('DB_NAME', 'your_default_db_name'),
			'DBDriver' => 'MySQLi',
			'DBPrefix' => '',
			'pConnect' => false,
			'DBDebug'  => (ENVIRONMENT !== 'production'),
			'charset'  => 'utf8',
			'DBCollat' => 'utf8_general_ci',
			'swapPre'  => '',
			'encrypt'  => false,
			'compress' => false,
			'strictOn' => false,
			'failover' => [],
			'port'     => (int) env('DB_PORT', 3306),
		];

		$this->tests = [
			'DSN'      => '',
			'hostname' => '127.0.0.1',
			'username' => '',
			'password' => '',
			'database' => ':memory:',
			'DBDriver' => 'SQLite3',
			'DBPrefix' => 'db_',
			'pConnect' => false,
			'DBDebug'  => (ENVIRONMENT !== 'production'),
			'charset'  => 'utf8',
			'DBCollat' => 'utf8_general_ci',
			'swapPre'  => '',
			'encrypt'  => false,
			'compress' => false,
			'strictOn' => false,
			'failover' => [],
			'port'     => 3306,
		];
	}
}
