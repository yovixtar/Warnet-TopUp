<?php
header("Access-Control_Allow_Origin: *");
header("Access-Control-Allow-Credentials: true");
header("Content-type:application/json;charset=utf-8"); 
header("Access-Control-Allow-Methods: GET");
//header("Access-Control-Allow-Headers: Access-Control-Allow-Origin, Accept");
header('access-control-allow-origin: *');
header('Access-Control-Allow-Headers: *');
include "dbsql.php";

$username = $_POST['username'];
$password = $_POST['password'];
$sql = "SELECT * FROM user WHERE username = ? && password = SHA1 (?) LIMIT 1";
$stmt = $db->prepare($sql);
$stmt->execute([$username, $password]);
$result = $stmt->fetchAll(PDO::FETCH_ASSOC);

if ($stmt->rowCount() > 0) {
    $pesan = "Berhasil Login";
}else{
    $pesan = "Gagal Login";
}
echo json_encode(['user' => $result, 'pesan' => $pesan]);