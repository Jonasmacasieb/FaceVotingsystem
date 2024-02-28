<?php
session_start();
if (!isset($_SESSION['login_id'])) {
    header("location:index.php");
    exit();
}

include('./header.php');
include('db_connect.php');
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Face Recognition</title>
</head>

<body>
    <h1>Welcome to Face Recognition</h1>
    <?php
    // Include the Python script here
    $pythonScriptPath = 'C:/xampp/htdocs/github/myworkvotingsytem/train_face/face_recognition.py';
    $output = shell_exec('python ' . $pythonScriptPath);
    echo "<pre>$output</pre>";

    // Check if the training was completed successfully, and redirect to voting.php if needed
    if (strpos($output, "Training completed successfully") !== false) {
        header("location: voting.php");
        exit();
    }
    ?>
</body>

</html>