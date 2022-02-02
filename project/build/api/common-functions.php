<?php
function getQueryResults(string $sql) {
    $conn = mysqli_connect('127.0.0.1','root','root','hoteldb');
    if (!$conn) {
        echo 'Bad Connection' . mysqli_connect_error();
    }

    $results = mysqli_query($conn, $sql);


    return $results;
}

function requestParametersFilter($var){
    return ($var !== NULL && $var !== "");
}

?>
