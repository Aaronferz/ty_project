<?php
$servername = "localhost";
$username = "root";
$password = "root@123";
$dbname = "school_info";

// Create connection
$conn = new mysqli($servername, $username, '', $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$name = $_POST['name'];
$fathername = $_POST['fathername'];
$mothername = $_POST['mothername'];
$rollno = $_POST['rollno'];
$email = $_POST['email'];
$mobile = $_POST['mobile'];
$address = $_POST['address'];
$dob = $_POST['dob'];
$gender = $_POST['gender'];
$course = $_POST['course'];
$password = $_POST['password'];

$sql = "INSERT INTO students (rollNo, studentName, fatherName, motherName, studentsMail, mobile, addr, DOB, gender, password)
VALUES ('$rollno', '$name', '$fathername', '$mothername', '$email', '$mobile', '$address', '$dob', '$gender', '$password')";

if ($conn->query($sql) === TRUE) {
    echo "New record created successfully";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
