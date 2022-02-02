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
    $sql = 'SELECT clients.NFC_ID,clients.first_name,clients.last_name,client_identification.id_no,client_identification.id_type, client_identification.id_issuingauthority, ' .
           'GROUP_CONCAT(DISTINCT client_phones.phone_no SEPARATOR ",") AS phones, ' .
           'GROUP_CONCAT(DISTINCT client_email.email SEPARATOR ",") AS emails ' .
           'FROM (SELECT * FROM visits WHERE visits.NFC_ID=' . $parameters['nfc_id'] . ') AS A,(SELECT * FROM visits WHERE visits.NFC_ID!=' . $parameters['nfc_id'] . ') AS B,clients,client_email,client_phones,client_identification ' .
           'WHERE (B.entry_datetime <= DATE_ADD(A.exit_datetime, INTERVAL 1 HOUR)) ' .
           'AND (B.exit_datetime >= A.entry_datetime) ' .
           'AND clients.NFC_ID=client_email.NFC_ID ' .
           'AND clients.NFC_ID=client_phones.NFC_ID ' .
           'AND clients.NFC_ID=client_identification.NFC_ID ' .
           'AND clients.NFC_ID=B.NFC_ID ';
           

    //Add Parameters
    if (count($validParameters)>1) {
        //Add parameters
        foreach ($validParameters as $key => $value) {

            if ($key!='nfc_id') {
                $sql = $sql . 'AND ' . $key . "='" . $value . "' ";
            } 
            
        }
    }
    
    $sql = $sql . 'GROUP BY clients.NFC_ID,client_identification.id_no ';

//    echo $sql;
//    echo "<br>";

    return $sql;
}
?>
