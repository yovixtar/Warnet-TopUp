<?php
$host = "localhost";
$port = "3306";
$db = "id17932224_db_20240_0007";
$charset = "utf8mb4";
$user = "id17932224_khazimstar";
$pass = "Khazimfikri.3";

$dsn = "mysql:host=$host;port=$port;dbname=$db;charset=$charset";

$db = new PDO($dsn, $user, $pass);
$db->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );