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
        "nfc_id" => NULL,
        "date" => NULL
    );

    foreach ($parameters as $key => $value) {
        $parameters[$key] = $_GET[$key];
    }

    //Remove NULL values and empty strings
    $validParameters = array_filter($parameters, "requestParametersFilter");

    //Generate SQL
    $sql = 'SELECT visits.NFC_ID,venues.venue_id,venues.venue_name,venues.venue_desc,venues.venue_floor,visits.entry_datetime,visits.exit_datetime ' .
           'FROM venues,visits ' .
           'WHERE visits.NFC_ID=' . $parameters['nfc_id'] . ' ' .
           'AND visits.venue_id=venues.venue_id';
           
    //Generate WHERE clause if parameters exist
    if (count($validParameters)>0) {
        //Add parameters
        foreach ($validParameters as $key => $value) {
            if ($key=='date') {
                $sql = $sql . ' AND visits.entry_datetime BETWEEN "' . $value . ' 00:00:00" AND "' . $value . ' 23:59:59"';
            }
        }
    }
    
//    echo $sql;
//    echo "<br>";

    return $sql;
}
?>
