<?php

namespace Source\Models;

class User
{
    private $id;
    private $name;

    public function __construct (int $id, string $name)
    {
        //echo "Olá, {$name} seu tipo é {$type}";
        $this->id = $id;
        $this->name = $name;
    }

    public function login () {
        echo "Olá, {$this->name}! Você por aqui de novo?";
    }
}