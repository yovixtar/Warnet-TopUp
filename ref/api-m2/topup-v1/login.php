<?php
header("Access-Control_Allow_Origin: *");
header("Access-Control-Allow-Credentials: true");
header("Content-type:application/json;charset=utf-8");
header("Access-Control-Allow-Methods: GET");
//header("Access-Control-Allow-Headers: Access-Control-Allow-Origin, Accept");
header('access-control-allow-origin: *');
header('Access-Control-Allow-Headers: *');

include "dbms.php";

if (empty($_POST['username']) || empty($_POST['password'])) {
    echo json_encode(
        [
            'meta' => [
                'code' => 403,
                'status' => 'failed',
                'message' => "Isi form tidak lengkap !",
            ],
            'data' => ['id' => 'tidak ditemukan'],
        ]
    );
} else {

    $username = $_POST['username'];
    $password = $_POST['password'];
    $sql = "SELECT * FROM users WHERE username = ? && password = SHA1 (?) LIMIT 1";
    $stmt = $db->prepare($sql);
    $stmt->execute([$username, $password]);
    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

    if ($stmt->rowCount() > 0) {
        $pesan = "Berhasil Login";
        $status = "success";
        $token = md5(uniqid(rand(), true));

        $sql = "UPDATE users SET token = ? WHERE username = ? && password = SHA1 (?) LIMIT 1";
        $stmt = $db->prepare($sql);
        $stmt->execute([$token, $username, $password]);
        
        $resultSend = $result[0];
        $resultSend['id'] = (int) $resultSend['id'];
        $resultSend['balance'] = (int) $resultSend['balance'];
        $resultSend['token'] = $token;
    } else {
        $pesan = "Username / Password Salah!";
        $status = "failed";
        $resultSend = ['id' => 'tidak ditemukan'];
    }
    echo json_encode(
        [
            'meta' => [
                'code' => 200,
                'status' => $status,
                'message' => $pesan,
            ],
            'data' => $resultSend,
        ]
    );
}
