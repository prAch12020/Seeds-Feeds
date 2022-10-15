<?php 
$vet = $_POST['add'];
$msg = $_POST['city'];
$date = $_POST['country'];

$address =$vet .", ". $msg .", ". $date; ; // Google HQ
$prepAddr = str_replace(' ','+',$address);
$geocode=file_get_contents('https://maps.google.com/maps/api/geocode/json?address='.$prepAddr.'&sensor=false&key=AIzaSyAbmkz2jxzccN6q7mdMpXyFYRJR83qhY2s');
$output= json_decode($geocode);
$latitude = $output->results[0]->geometry->location->lat;
$longitude = $output->results[0]->geometry->location->lng;
	
echo "latitude - ".$latitude;
echo "longitude - ".$longitude;


require_once 'config.php';
saveAddress($vet, $msg, $date, $latitude, $longitude);
?>