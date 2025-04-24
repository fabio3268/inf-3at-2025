<?php

namespace source\Models\Employee;

class Seller extends Employee
{
    private $salesValue;

    public function __construct(
        $id = null,
        $idType = null,
        $name = null,
        $email = null,
        $password = null,
        $photo = null,
        $workHours = null,
        $valueHour = null,
        $salesValue = null
    )
    {
        parent::__construct($id,$idType,$name, $email, $password, $photo, $workHours, $valueHour);
        $this->salesValue = $salesValue;
    }

    public function calcSalary(): float
    {
        return parent::calcSalary() + ($this->salesValue * 0.1);
    }


}