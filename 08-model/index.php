<?php


require __DIR__ . "/../source/autoload.php";

use Source\Models\User;
use Source\Models\Faq\Question;

// Instanciando um Usuário vazio
echo "<h2>Instanciando um Usuário vazio</h2>";
$user = new User();
var_dump($user);

// Evocando o método findAll
echo "<h2>Evocando o método findAll() </h2>";
var_dump($user->findAll());

// Evocando o método findById e deixando o registro encontrado ativo
echo "<h2>Evocando o método findById() </h2>";
$myUser = new User();
$myUser->findById(2);
var_dump($myUser);

echo "<h2>Alterando o registro ativo com o método updateById() </h2>";
// Alterando o registro encontrado com updateById()
$myUser->setName("Novo nome");
$myUser->setPassword("987654");
$myUser->updateById();
var_dump($myUser);

echo "<h2>Agora deletando o registro ativo </h2>";
//var_dump($user->findAll());
if($myUser->deleteById(5)) {
    echo "<h3>Exclusão com sucesso!</h3>";
}
else {
    echo "<h3>Registro não encontrado</h3>";
}

echo "<h2>Incluindo um novo Usuário, instanciando e depois evocando o método insert()</h2>";
$newUser = new User(
    NULL,
    2,
    "Novo Usuário",
    "novo@gmail.com",
    "3456789"
);
$newUser->insert();
var_dump($newUser);