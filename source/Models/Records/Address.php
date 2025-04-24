<?php

namespace Source\Models\Records;

class Address
{
    protected $id;
    protected $idForeign;
    protected $zipCode;
    protected $street;
    protected $number;
    protected $complement;

    public function __construct (
        int $id = null,
        int $idForeign = null,
        string $zipCode = null,
        string $street = null,
        string $number = null,
        string $complement = null
    )
    {
        $this->id = $id;
        $this->idForeign = $idForeign;
        $this->zipCode = $zipCode;
        $this->street = $street;
        $this->number = $number;
        $this->complement = $complement;
    }

}