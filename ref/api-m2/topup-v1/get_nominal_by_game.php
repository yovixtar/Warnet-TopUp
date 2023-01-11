<?php
header("Access-Control_Allow_Origin: *");
header("Access-Control-Allow-Credentials: true");
header("Content-type:application/json;charset=utf-8");
header("Access-Control-Allow-Methods: GET");
//header("Access-Control-Allow-Headers: Access-Control-Allow-Origin, Accept");
header('access-control-allow-origin: *');
header('Access-Control-Allow-Headers: *');

include "dbms.php";

$sql_nominal = "SELECT * FROM nominal WHERE game_id = " . $_GET['game_id'];
$stmt_nominal = $db->prepare($sql_nominal);
$stmt_nominal->execute();
$result_nominal = $stmt_nominal->fetchAll(PDO::FETCH_ASSOC);

$result_send = [];

foreach ($result_nominal as $row_nominal) {
    $row_nominal['id'] = (int) $row_nominal['id'];
    $row_nominal['game_id'] = (int) $row_nominal['game_id'];
    array_push($result_send, $row_nominal);
}
echo json_encode(
    [
        'meta' => [
            'code' => 200,
            'status' => 'success',
            'message' => 'Berhasil mendapatkan nominal game',
        ],
        'data' => $result_send,
    ]
);
