<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

header('Content-Type: application/json');

$servername = "localhost";
$username = "root";
// $password = "root@123";
$dbname = "school_info";

$conn = new mysqli($servername, $username, '', $dbname);

if ($conn->connect_error) {
    die(json_encode(["success" => false, "message" => "Connection failed: " . $conn->connect_error]));
}

$sql = "SELECT * FROM notices WHERE endDate >= CURDATE() ORDER BY noticeID DESC";
$result = $conn->query($sql);

$notices = [];

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $notices[] = $row;
    }
}

echo json_encode($notices);

$conn->close();
?>
