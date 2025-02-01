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
$studentID = $data['studentID'];
$studentName = $data['studentName'];
$year = $data['year'];
$department = $data['department'];
$division = $data['division'];
$isPresent = $data['isPresent'] ? 1 : 0;

$sql = "INSERT INTO attendance (studentID, studentName, year, department, division, daysPresent)
        VALUES (?, ?, ?, ?, ?, ?)
        ON DUPLICATE KEY UPDATE daysPresent = daysPresent + VALUES(daysPresent)";

$stmt = $conn->prepare($sql);
$stmt->bind_param("isissi", $studentID, $studentName, $year, $department, $division, $isPresent);

if ($stmt->execute()) {
    echo json_encode(["success" => true]);
} else {
    echo json_encode(["success" => false, "message" => "Failed to update attendance"]);
}

$stmt->close();
$conn->close();
?>
