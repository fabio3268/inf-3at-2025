<?php
echo "Olá, namespaces!<br>";

/*require __DIR__ . "/../source/Models/Faq/Question.php";
require __DIR__ . "/../source/Models/Faq/Type.php";
require __DIR__ . "/../source/Models/User.php";
require __DIR__ . "/../source/Models/Type.php";*/

require __DIR__ . "/../source/autoload.php";

use Source\Models\Faq\Question;
use Source\Models\Faq\Type as FaqType;
use Source\Models\User;
use Source\Models\Type as UserType;

$question = new Question();
var_dump($question);

$typeFAQ = new FaqType();
var_dump($typeFAQ);

$typeUser = new UserType();
var_dump($typeUser);