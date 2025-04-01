<?php

require __DIR__ . "/../source/autoload.php";

use Source\Models\User;
use Source\Models\Faq\Question;

$user = new User();
var_dump($user->findAll());

$question = new Question();
var_dump($question->findAll());




