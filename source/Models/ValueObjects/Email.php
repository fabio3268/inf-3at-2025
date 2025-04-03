<?php

namespace Source\Models\ValueObjects;

use InvalidArgumentException;

class Email
{
    private string $email;

    public function __construct(string $email = null)
    {
/*        if(!empty($email)){
            $this->validate($email);
        }*/
        $this->email = $email;
    }

    public function validate (): bool
    {
        if(!filter_var($this->email, FILTER_VALIDATE_EMAIL)){
            return false;
        }
        return true;
    }

    public function __toString(): string
    {
        return $this->email;
    }

}


