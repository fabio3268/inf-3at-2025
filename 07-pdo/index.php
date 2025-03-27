<?php

$dbUser = "root";
$dbPassword = "asdf1234";
$options = [
    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_OBJ
];

$connection = new PDO(
    "mysql:host=localhost;dbname=db-inf-3at",
    $dbUser,
    $dbPassword,
);

var_dump($connection);