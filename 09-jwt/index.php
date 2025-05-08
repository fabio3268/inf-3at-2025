<?php

require __DIR__ . '/../vendor/autoload.php';

use Source\Core\JWTToken;

// Instanciar a classe JWTToken
$jwt = new JWTToken();

// Criar um payload de exemplo
$payload = [
    "name" => "Fábio Luís da Silva Santos",
    "email" => "fabiosantos@ifsul.edu.br"
];

// Gerar o token JWT
$token = $jwt->create($payload);
echo "Token gerado:\n" . $token . "\n\n";


