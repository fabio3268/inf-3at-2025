<?php

namespace Source\WebService;

use Source\Models\User;

class Users
{
    public function listUsers ()
    {
        // mais ou menos pronto
        $user = new User();
        echo json_encode($user->findAll());
    }

    public function listById (array $data): void
    {
        // não está pronto
        $user = new User();
        var_dump($user->findById($data["id"]));
        var_dump($user);
    }
}