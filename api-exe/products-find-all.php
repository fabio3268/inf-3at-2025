<?php

require __DIR__ . "/../source/autoload.php";

use Source\Models\Store\Product;

$products = new Product();
echo json_encode($products->findAll(), JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE);