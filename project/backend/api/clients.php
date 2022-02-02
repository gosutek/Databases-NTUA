<?php
include 'common-functions.php';

$sql = generateSQL();

$queryResults = getQueryResults($sql);

$rows = array();

while($row = mysqli_fetch_assoc($queryResults)) {
    $rows[] = $row;
}
print json_encode($rows);


function generateSQL() {
    //Define and get the parameters from the url
    $parameters = array(
        "first_name" => NULL,
        "last_name" => NULL,
        "id_no" => NULL
    );

    foreach ($parameters as $key => $value) {
        $parameters[$key] = $_GET[$key];
    }

    //Remove NULL values and empty strings
    $validParameters = array_filter($parameters, "requestParametersFilter");

    //Generate SQL
    $sql = 'SELECT * FROM client_info_view';

    //Generate WHERE clause if parameters exist
    if (count($validParameters)>0) {
        $sql = $sql . " WHERE ";

        //Add parameters
        foreach ($validParameters as $key => $value) {
            $sql = $sql . $key . "='" . $value . "' AND ";
        }
        
        //Remove last AND
        $sql = substr($sql, 0, -4);
    }
    
//    echo $sql;
    
    return $sql;
}
?>
