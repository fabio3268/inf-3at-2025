<?php

namespace Source\Models\Hospital;

use Source\Models\User;

class Patient extends User
{
    private $medicalRecord;
    private $birthData;

    public function __construct(
        int $id = null,
        int $idType = null,
        string $name = null,
        string $email = null,
        string $password = null,
        string $photo = null
    )
    {
        parent::__construct($id, $idType, $name, $email, $password, $photo);
    }
}