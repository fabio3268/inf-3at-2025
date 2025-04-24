<?php

namespace Source\Models\Store;

use Source\Core\Model;

class Product extends Model
{
    private $id;
    private $idCategory;
    private $name;
    private $price;

    public function __construct(
        int $id = NULL,
        int $idCategory = NULL,
        string $name = NULL,
        float $price = NULL
    )
    {
        $this->table = "products";
        $this->id = $id;
        $this->idCategory = $idCategory;
        $this->name = $name;
        $this->price = $price;
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function setId(?int $id): void
    {
        $this->id = $id;
    }

    public function getIdCategory(): ?int
    {
        return $this->idCategory;
    }

    public function setIdCategory(?int $idCategory): void
    {
        $this->idCategory = $idCategory;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(?string $name): void
    {
        $this->name = $name;
    }

    public function getPrice(): ?float
    {
        return $this->price;
    }

    public function setPrice(?float $price): void
    {
        $this->price = $price;
    }

}