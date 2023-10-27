<?php 
$vet_add = $_POST['add'];
$msg = $_POST['city'];
$date = $_POST['country'];

$address =$vet_add .", ". $msg .", ". $date; 
$prepAddr = urlencode(str_replace(' ', '+', $address));

$url = 'https://maps.google.com/maps/api/geocode/json?address='.$prepAddr.'&key=AIzaSyClL3XpKG_N2NuCvin3bAX11M8ZqEh-Fig';
try{
    $data = json_decode( file_get_contents( $url ), true );
    
    var_dump($data); // Debug: Inspect the entire JSON response
    
    if ($data['status'] === 'OK') {
        // Successfully retrieved coordinates
        $lat = $data['results'][0]['geometry']['location']['lat'];
        $lng = $data['results'][0]['geometry']['location']['lng'];
        echo "latitude - " . $lat;
        echo "longitude - " . $lng;
    } else {
        // Handle the case where the API response has an error
        echo "Geocoding API Error: " . $data['status'];
    }
} catch (Exception $e) {
    echo "Error: " . $e->getMessage();
}

require_once 'config.php';
saveAddress($vet_add, $msg, $date, $lat, $lng);
?>
