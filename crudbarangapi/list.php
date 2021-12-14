<?php
require_once('./config/connection.php');
$myArray = array();
if ($result = mysqli_query($conn, "SELECT * FROM Barang")){
    while ($row = $result->fetch_array(MYSQLI_ASSOC)){
        $myArray[] = $row;
    }
    mysqli_close($conn);
    header('Content-Type: application/json; charset=utf-8');
    echo json_encode($myArray);
}