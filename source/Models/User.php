<?php

namespace Source\Models;

class User
{
    private $id;
    private $name;

    public function __construct (int $id = null, string $name = null)
    {
        $this->id = $id;
        $this->name = $name;
    }

    public function getId (): ?int
    {
        return $this->id;
    }

    public function setId (?int $id): void
    {
        $this->id = $id;
    }

    public function getName (): ?string
    {
        return $this->name;
    }

    public function setName (?string $name): void
    {
        $this->name = $name;
    }

    public function login () {
        echo "Olá, {$this->name}! Você por aqui de novo?";
    }
}