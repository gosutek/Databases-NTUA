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
        "time_range" => NULL,
        "age" => NULL
    );

    foreach ($parameters as $key => $value) {
        $parameters[$key] = $_GET[$key];
    }

    //Remove NULL values and empty strings
    $validParameters = array_filter($parameters, "requestParametersFilter");

    //Generate SQL
    $sql = 'SELECT services.service_id,services.service_desc, COUNT(DISTINCT clients.NFC_ID) AS number_of_visits ' .
           'FROM visits,venues,clients,services ' .
           'WHERE venues.venue_id=visits.venue_id ' .
           'AND clients.NFC_ID=visits.NFC_ID ' . 
           'AND venues.service_id=services.service_id ';

    //Generate WHERE clause if parameters exist
    if (count($validParameters)>0) {
        //Add parameters
        foreach ($validParameters as $key => $value) {
            if ($key=='time_range') {
                if ($value == 'month') {
                    $sql = $sql . 'AND visits.entry_datetime BETWEEN DATE_SUB(NOW(), INTERVAL 1 MONTH) AND NOW() ';
                } else if ($value == 'year') {
                    $sql = $sql . 'AND visits.entry_datetime BETWEEN DATE_SUB(NOW(), INTERVAL 1 YEAR) AND NOW() ';
                } 
            } else if ($key=='age') {
                if ($value == '20-40') {
                    $sql = $sql . 'AND clients.dob BETWEEN DATE_SUB(NOW(), INTERVAL 40 YEAR) AND DATE_SUB(NOW(), INTERVAL 20 YEAR) ';
                } else if ($value == '41-60') {
                    $sql = $sql . 'AND clients.dob BETWEEN DATE_SUB(NOW(), INTERVAL 60 YEAR) AND DATE_SUB(NOW(), INTERVAL 41 YEAR) ';
                } else if ($value == '61plus'){
                    $sql = $sql . 'AND clients.dob < DATE_SUB(NOW(), INTERVAL 61 YEAR) ';
                }
            }
        }
    }

    $sql = $sql . 
          'GROUP BY services.service_id ' .
          'ORDER BY number_of_visits DESC';
    
//    echo $sql;
//    echo "<br>";

    return $sql;
}
?>
