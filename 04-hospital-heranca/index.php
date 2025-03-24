<?php

require __DIR__ . "/../source/autoload.php";

use Source\Models\User;
use Source\Models\Hospital\Doctor;

$user = new User(1,2,"Fábio","f@f.com.br");
var_dump($user);

$doctor = new Doctor(1,3,"Vinicius","a@a.com","34567","photo","2345","Cardiologista");
var_dump($doctor);

/*use Source\Models\Hospital\Doctor;

$doctor = new Doctor();
var_dump($doctor);*/