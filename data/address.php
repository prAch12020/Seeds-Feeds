<?php 
$vet_add = $_POST['add'];

$msg = $_POST['city'];
$date = $_POST['country'];

$address =$vet_add .", ". $msg .", ". $date; ; // Google HQ
$prepAddr = str_replace(' ','+',$address);

$url = 'https://maps.google.com/maps/api/geocode/json?address='.$prepAddr.'&sensor=false&key=AIzaSyClL3XpKG_N2NuCvin3bAX11M8ZqEh-Fig';
$ch = curl_init();
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_URL, $url);
        $result = curl_exec($ch);
        curl_close($ch);

        $data = json_decode($result, true);

        $lat = $data['results'][0]['geometry']['location']['lat'];
        $lng = $data['results'][0]['geometry']['location']['lng'];

	
echo "latitude - ".$lat;
echo "longitude - ".$lng;


require_once 'config.php';
saveAddress($vet_add, $msg, $date, $lat, $lng);
?>
