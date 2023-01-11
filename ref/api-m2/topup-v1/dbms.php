<?php
$host = "localhost";
$port = "3306";
$db = "iyabosco_topup";
$charset = "utf8mb4";
$user = "iyabosco_project_kuliah";
$pass = "Khazimfikri3";

$dsn = "mysql:host=$host;port=$port;dbname=$db;charset=$charset";

$db = new PDO($dsn, $user, $pass);
$db->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );