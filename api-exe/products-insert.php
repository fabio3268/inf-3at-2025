<?php

require __DIR__ . "/../source/autoload.php";

use Source\Models\Store\Product;

$get = $_GET;

$product = new Product(
    NULL,
    $get["idCategory"],
    $get["name"],
    $get["price"]
);

if(!$product->insert()){
    echo "erro {$product->getErrorMessage()}!";
    exit();
}

var_dump($product);