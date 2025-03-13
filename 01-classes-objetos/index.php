<?php
require __DIR__ . "/../source/Models/User.php";

echo "Olá, Mundo da Orientação a Objetos em PHP!<br>";

use Source\Models\User;
// utilizando use não é mais necessário o nome longo da classe
//$user = new \Source\Models\User();

$user = new User(12, "Godofredo" );
var_dump($user);

/*$user->id = 12;
$user->name = "Fábio";*/
//var_dump($user);
//$user->login();