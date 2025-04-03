<?php

require __DIR__ . "/../source/autoload.php";

use Source\Models\User;
use Source\Models\Faq\Question;

//$user = new User();
//var_dump($user->findAll());
//var_dump($user->findById(1));
//var_dump($user->deleteById(4));

$question = new Question();
//var_dump($question->findAll());
var_dump($question->deleteById(21));




