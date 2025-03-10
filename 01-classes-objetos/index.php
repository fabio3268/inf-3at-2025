<?php

echo "Olá, Mundo da Orientação a Objetos em PHP!";

require __DIR__ . "/../source/Models/User.php";
use Source\Models\User;

$user = new User();

var_dump($user);