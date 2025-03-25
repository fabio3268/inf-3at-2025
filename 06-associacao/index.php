<?php

require __DIR__ . "/../source/autoload.php";

echo "<h1>Associação</h1>";

use Source\Models\Record\Address;
use Source\Models\User;

$addres = new Address(
    "96700-000", "Rua A", "100"
);
var_dump($addres);

$user = new User(name: "Godofredo", address: $addres);
var_dump($user);