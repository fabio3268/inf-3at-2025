<?php

$dbUser = "root";
$dbPassword = "";
$options = [
    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_OBJ
];

$connection = new PDO(
    "mysql:host=localhost;dbname=db-inf-3at",
    $dbUser,
    $dbPassword,
    $options
);

var_dump($connection);