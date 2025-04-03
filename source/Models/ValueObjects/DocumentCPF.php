<?php

namespace Source\Models\ValueObjects;

use InvalidArgumentException;

class DocumentCPF
{
    private string $cpf;

    public function __construct(string $cpf)
    {
        if(!empty($cpf)){
            $this->validate($cpf);
        }
        $this->cpf = $cpf;
    }

    private function validate(string $cpf): void
    {
        $cpf = preg_replace('/[^0-9]/is', '', $cpf);

        if (strlen($cpf) !== 11) {
            throw new InvalidArgumentException("CPF inválido!");
        }

/*        if (preg_match('/(\d)\1{10}/', $cpf)) {
            echo "CPF inválido!";
            return;
        }

        for ($t = 9; $t < 11; $t++) {
            for ($d = 0, $c = 0; $c < $t; $c++) {
                $d += $cpf[$c] * (($t + 1) - $c);
            }
            $d = ((10 * $d) % 11) % 10;
            if ($cpf[$c] != $d) {
                echo "CPF inválido!";
                return;
            }
        }*/
    }

    public function __toString(): string
    {
        return $this->cpf;
    }

}