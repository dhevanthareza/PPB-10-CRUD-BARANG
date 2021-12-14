<?php
define('HOST', 'localhost');
define('USER', 'root');
define('DB', 'PPB');
define('PASS', 'dhevan007');
$conn = new mysqli(HOST, USER, PASS, DB) or die('Koneksi error untuk mengakses database');
