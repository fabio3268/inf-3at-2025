<?php

namespace Source\Models\Employee;

use Source\Models\User;

class Employee extends User
{
    protected $workHours;
    protected $valueHour;

    public function __construct(
        int $id = null,
        int $idType = null,
        string $name = null,
        string $email = null,
        string $password = null,
        string $photo = null,
        float $workHours = null,
        float $valueHour = null
    )
    {
        parent::__construct($id, $idType, $name, $email, $password, $photo);
        $this->workHours = $workHours;
        $this->valueHour = $valueHour;
    }

    public function calcSalary ():float
    {
        return $this->valueHour * $this->workHours;
    }

}