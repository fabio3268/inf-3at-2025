<?php

require __DIR__ . "/../source/Models/User.php";

use Source\Models\User;

$user = new User();
var_dump($user);
$user->setId(16);
$user->setName("Godofredo");
echo "Olá, ID : {$user->getId()} seu nome é: {$user->getName()}<br>";

$userAdm = new User(name: "José");
$userAdm->setId(23);
echo "Olá, ID : {$userAdm->getId()} seu nome é: {$userAdm->getName()}<br>";
var_dump($userAdm);