<?php

require __DIR__ . "/../source/autoload.php";

echo "<h1>Polimorfismo</h1>";
echo "<h2>Empresa</h2>";

use Source\Models\Employee\Employee;
use Source\Models\Employee\Seller;

$employee = new Employee(
    name: "Fábio",
    workHours: 30,
    valueHour: 50
);

var_dump($employee);
$salary = number_format($employee->calcSalary(),2,",",".");
echo "O funcionário {$employee->getName()} recebe o salário de R$ {$salary} <br>";

$seller = new Seller(
    name: "Godofredo",
    workHours: 30,
    valueHour: 60,
    salesValue: 4000
);
var_dump($seller);
echo "O vendedor {$seller->getName()} recebere o salario de R$ {$seller->calcSalary()}";

