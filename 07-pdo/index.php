<?php

/*$dbUser = "root";
$dbPassword = "asdf1234"; // sem senha para vocês
$options = [
    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_OBJ
];

// para vocês é host=localhost
$connection = new PDO(
    "mysql:host=mysql;dbname=db-inf-3at",
    $dbUser,
    $dbPassword,
    $options
);

var_dump($connection);*/


require __DIR__ . "/../source/autoload.php";

use Source\Models\User;
use Source\Models\Faq\Question;

$user = new User();
$user->findAll();

$question = new Question();
$question->findAll();




