<?php

$host     = '127.0.0.1';
$user     = 'ts_dev';
$password = 'YolandaBeHome';
$database = 'ts_dev';

try {
    $conn = new PDO("mysql:host=$host;port=3306;dbname=$database", $user, $password);
    // set the PDO error mode to exception
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Connected successfully";
} catch (PDOException $e) {
    echo "Connection failed: ".$e->getMessage();
}
