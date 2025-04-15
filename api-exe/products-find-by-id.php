<?php

require __DIR__ . "/../source/autoload.php";

use Source\Models\Store\Product;
$get = $_GET;

$product = new Product();
$product->findById($get["id"]);

var_dump($product);

echo json_encode($product);