<?php

namespace Source\Models\Hospital;

use Source\Models\User;

class Doctor extends User
{

    private $crm;
    private $speciality;

    public function __construct(
        int $id = null,
        int $idType = null,
        string $name = null,
        string $email = null,
        string $password = null,
        string $photo = null,
        string $crm = null,
        string $speciality = null
    )
    {
        parent::__construct($id,$idType,$name, $email, $password, $photo);
        $this->crm = $crm;
        $this->speciality = $speciality;
    }

    public function getCrm(): ?string
    {
        return $this->crm;
    }

    public function setCrm(?string $crm): void
    {
        $this->crm = $crm;
    }

    public function getSpeciality(): ?string
    {
        return $this->speciality;
    }

    public function setSpeciality(?string $speciality): void
    {
        $this->speciality = $speciality;
    }

}