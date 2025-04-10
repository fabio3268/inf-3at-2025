<?php

require __DIR__ . "/../source/autoload.php";

use Source\Models\User;
$get = $_GET;

$user = new User();
$user->findById($get["id"]);

echo json_encode($user);