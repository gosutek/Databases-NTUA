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
        "service_id" => NULL,
        "date" => NULL,
        "max_cost" => NULL,
        "min_cost" => NULL
    );

    foreach ($parameters as $key => $value) {
        $parameters[$key] = $_GET[$key];
    }

    //Remove NULL values and empty strings
    $validParameters = array_filter($parameters, "requestParametersFilter");

    //Generate SQL
    $sql = 'SELECT visits.NFC_ID,venues.service_id,services.service_desc,visits.entry_datetime,visits.exit_datetime,receive_services.charge_amount ' .
           'FROM visits,venues,receive_services,services ' .
           'WHERE visits.venue_id=venues.venue_id ' .
           'AND venues.service_id=services.service_id ' .
           'AND visits.NFC_ID=receive_services.NFC_ID ' .
		   'AND venues.service_id=receive_services.service_id ' .
           'AND receive_services.charge_datetime BETWEEN visits.entry_datetime AND visits.exit_datetime';
           

    //Generate WHERE clause if parameters exist
    if (count($validParameters)>0) {
        //Add parameters
        foreach ($validParameters as $key => $value) {
            if ($key=='service_id') {
                $sql = $sql . ' AND venues.service_id=' . $value;
            } else if ($key=='date') {
                $sql = $sql . ' AND visits.entry_datetime BETWEEN "' . $value . ' 00:00:00" AND "' . $value . ' 23:59:59"';
            } else if ($key=='max_cost') {
                $sql = $sql . ' AND receive_services.charge_amount < ' . $value;
            } else if ($key=='min_cost') {
                $sql = $sql . ' AND receive_services.charge_amount > ' . $value;
            }
        }
    }
    
//    echo $sql;
//    echo "<br>";

    return $sql;
}
?>
