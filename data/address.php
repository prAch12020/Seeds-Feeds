<?php 
$vet_add = $_POST['add'];

$msg = $_POST['city'];
$date = $_POST['country'];

$address =$vet_add .", ". $msg .", ". $date; 
echo $address;
$prepAddr = urlencode($address);
echo $prepAddr;

$url = 'https://maps.google.com/maps/api/geocode/json?address='.$prepAddr.'&key=AIzaSyClL3XpKG_N2NuCvin3bAX11M8ZqEh-Fig';

echo $url;
$resp = json_decode( file_get_contents( $url ), true );
echo $resp;
// Latitude and Longitude (PHP 7 syntax)
$lat    = $resp['results'][0]['geometry']['location']['lat'] ?? '';
$long   = $resp['results'][0]['geometry']['location']['lng'] ?? '';
echo "latitude - ".$lat;
echo "longitude - ".$lng;


require_once 'config.php';
saveAddress($vet_add, $msg, $date, $lat, $lng);
?>
