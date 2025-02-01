<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

header('Content-Type: application/json');

$servername = "localhost";
$username = "root";
$password = "root@123";
$dbname = "school_info";

// Create connection
$conn = new mysqli($servername, $username, '', $dbname);

// Check connection
if ($conn->connect_error) {
    die(json_encode(["success" => false, "message" => "Connection failed: " . $conn->connect_error]));
}

$data = json_decode(file_get_contents("php://input"), true);
$userType = $data['userType'];
$id = $data['id'];
$password = $data['password'];

$response = ["success" => false, "message" => "Invalid credentials"];

if ($userType === 'student') {
    $sql = "SELECT * FROM students WHERE rollNo = ? AND password = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("is", $id, $password);
    $stmt->execute();
    $result = $stmt->get_result();
    
    if ($result->num_rows > 0) {
        $response = ["success" => true, "url" => "welcome.html"];
    }
} else {
    $sql = "SELECT * FROM teachers WHERE teacherName = ? AND password = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $id, $password);
    $stmt->execute();
    $result = $stmt->get_result();
    
    if ($result->num_rows > 0) {
        $response = ["success" => true, "url" => "teacher_welcome.html"];
    }
}

echo json_encode($response);

$conn->close();
?>
