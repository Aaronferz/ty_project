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
$year = $data['year'];
$department = $data['department'];
$division = $data['division'];

error_log("Received Data: Year = $year, Department = $department, Division = $division"); // Add this line for logging

$sql = "SELECT studentID AS id, studentName AS name FROM attendance WHERE year = ? AND department = ? AND division = ?";
$stmt = $conn->prepare($sql);

if (!$stmt) {
    error_log("Prepare failed: " . $conn->error); // Log preparation error
    die(json_encode(["success" => false, "message" => "Prepare failed: " . $conn->error]));
}

$stmt->bind_param("iss", $year, $department, $division);
$stmt->execute();
$result = $stmt->get_result();

$students = [];

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $students[] = $row;
    }
} else {
    error_log("No students found for the given criteria: Year = $year, Department = $department, Division = $division"); // Log no results
}

echo json_encode(["students" => $students]);

$stmt->close();
$conn->close();
?>
