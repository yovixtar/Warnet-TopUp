<?php
header("Access-Control_Allow_Origin: *");
header("Access-Control-Allow-Credentials: true");
header("Content-type:application/json;charset=utf-8");
header("Access-Control-Allow-Methods: GET");
//header("Access-Control-Allow-Headers: Access-Control-Allow-Origin, Accept");
header('access-control-allow-origin: *');
header('Access-Control-Allow-Headers: *');

include "dbms.php";

$sql_games = "SELECT games.id AS id, games.name AS name, category_id, image, player_id, zone_id, servers, categories.name AS category_name FROM games JOIN categories ON games.category_id = categories.id";
$stmt_games = $db->prepare($sql_games);
$stmt_games->execute();
$result_games = $stmt_games->fetchAll(PDO::FETCH_ASSOC);

$result_send = [];

foreach ($result_games as $row_game) {
    $row_game['id'] = (int) $row_game['id'];
    $row_game['category_id'] = (int) $row_game['category_id'];
    array_push($result_send, $row_game);
}

echo json_encode(
    [
        'meta' => [
            'code' => 200,
            'status' => 'success',
            'message' => 'Get All Games',
        ],
        'data' => $result_send,
    ]
);
