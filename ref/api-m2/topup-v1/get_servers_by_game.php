<?php
header("Access-Control_Allow_Origin: *");
header("Access-Control-Allow-Credentials: true");
header("Content-type:application/json;charset=utf-8");
header("Access-Control-Allow-Methods: GET");
//header("Access-Control-Allow-Headers: Access-Control-Allow-Origin, Accept");
header('access-control-allow-origin: *');
header('Access-Control-Allow-Headers: *');

include "dbms.php";

$sql_servers = "SELECT * FROM servers WHERE game_id = " . $_GET['game_id'];
$stmt_servers = $db->prepare($sql_servers);
$stmt_servers->execute();
$result_servers = $stmt_servers->fetchAll(PDO::FETCH_ASSOC);

$result_send = [];

foreach ($result_servers as $row_servers) {
    $row_servers['id'] = (int) $row_servers['id'];
    $row_servers['game_id'] = (int) $row_servers['game_id'];
    array_push($result_send, $row_servers);
}

echo json_encode(
    [
        'meta' => [
            'code' => 200,
            'status' => 'success',
            'message' => 'Berhasil Get Server Game',
        ],
        'data' => $result_send,
    ]
);
