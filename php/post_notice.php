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

$data = json_decode(file_get_contents("php://input"), true);
$teacherName = $data['teacherName'];
$noticeText = $data['noticeText'];
$endDate = $data['endDate'];

$sql = "INSERT INTO notices (teacherName, noticeText, endDate) VALUES (?, ?, ?)";
$stmt = $conn->prepare($sql);
$stmt->bind_param("sss", $teacherName, $noticeText, $endDate);

if ($stmt->execute()) {
    echo json_encode(["success" => true]);
} else {
    echo json_encode(["success" => false, "message" => "Failed to post notice"]);
}

$stmt->close();
$conn->close();
?>
