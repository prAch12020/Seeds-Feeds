<?php 
$vet_add = $_POST['add'];
$msg = $_POST['city'];
$date = $_POST['country'];

$address =$vet_add .", ". $msg .", ". $date; 
$prepAddr = urlencode($address);
$url = 'https://maps.google.com/maps/api/geocode/json?address='.$prepAddr.'&key=AIzaSyClL3XpKG_N2NuCvin3bAX11M8ZqEh-Fig';
$resp = json_decode( file_get_contents( $url ), true );

if ($data && isset($data['results'][0]['geometry']['location']['lat']) && isset($data['results'][0]['geometry']['location']['lng'])) {
    $lat = $data['results'][0]['geometry']['location']['lat'];
    $lng = $data['results'][0]['geometry']['location']['lng'];
    echo "latitude - ".$lat;
    echo "longitude - ".$lng;
}
else{
  echo "Couldn't retrive coordinates";
}

require_once 'config.php';
saveAddress($vet_add, $msg, $date, $lat, $lng);
?>
