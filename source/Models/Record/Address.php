<?php

namespace Source\Models\Record;

class Address
{
    private $zipCode;
    private $street;
    private $number;

    public function __construct (
        string $zipCode = null,
        string $street = null,
        string $number = null
    )
    {
        $this->zipCode = $zipCode;
        $this->street = $street;
        $this->number = $number;
    }

}