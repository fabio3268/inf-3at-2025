<?php

require __DIR__ . "/../source/autoload.php";

use Source\Models\User;

$user = new User();

var_dump($user);

var_dump($user->findAll());