<?php
header("Access-Control_Allow_Origin: *");
header("Access-Control-Allow-Credentials: true");
header("Content-type:application/json;charset=utf-8"); 
header("Access-Control-Allow-Methods: GET");
//header("Access-Control-Allow-Headers: Access-Control-Allow-Origin, Accept");
header('access-control-allow-origin: *');
header('Access-Control-Allow-Headers: *');
include "dbms.php";

$nim = $_POST['nim'];
$nama = $_POST['nama'];
$progdi = $_POST['progdi'];
$alamat = $_POST['alamat'];
$sql = "UPDATE mahasiswa SET nama = ? , progdi = ? , alamat = ? WHERE nim = ?";
$stmt = $db->prepare($sql);
$result = $stmt->execute([$nama, $progdi, $alamat, $nim]);
echo json_encode(['success' => $result]);