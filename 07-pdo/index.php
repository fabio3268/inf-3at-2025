<?php

require __DIR__ . "/../source/autoload.php";

use Source\Models\User;
use Source\Models\Faq\Question;

$user = new User();
$user->findAll();

$question = new Question();
$question->findAll();




