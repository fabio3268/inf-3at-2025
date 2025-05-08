<?php

namespace Source\WebService;

use Source\Models\User;
use Source\Core\JWTToken;

class Users extends Api
{
    public function listUsers (): void
    {
        $users = new User();
        //var_dump($users->findAll());
        $this->call(200, "success", "Lista de usuários", "success")
            ->back($users->findAll());
    }

    public function createUser(array $data)
    {

        // verifica se os dados estão preenchidos
        if(in_array("", $data)){
            $this->call(400, "bad_request", "Dados inválidos", "error")->back();
            return;
        }

        $user = new User(
            null,
            $data["idType"] ?? null,
            $data["name"] ?? null,
            $data["email"] ?? null,
            $data["password"] ?? null
        );

        if(!$user->insert()){
            $this->call(500, "internal_server_error", $user->getErrorMessage(), "error")->back();
            return;
        }
        // montar $response com as informações necessárias para mostrar no front
        $response = [
            "name" => $user->getName(),
            "email" => $user->getEmail(),
            "photo" => $user->getPhoto()
        ];

        $this->call(201, "created", "Usuário criado com sucesso", "success")
            ->back($response);

    }

    public function listUserById (array $data): void
    {

        if(!isset($data["id"])) {
            $this->call(400, "bad_request", "ID inválido", "error")->back();
            return;
        }

        if(!filter_var($data["id"], FILTER_VALIDATE_INT)) {
            $this->call(400, "bad_request", "ID inválido", "error")->back();
            return;
        }

        $user = new User();
        if(!$user->findById($data["id"])){
            $this->call(200, "success", "Usuário não encontrado", "error")->back();
            return;
        }
        $response = [
            "name" => $user->getName(),
            "email" => $user->getEmail()
        ];
        $this->call(200, "success", "Encontrado com sucesso", "success")->back($response);
    }

    public function deleteUser (array $data): void
    {
        $this->auth();
        $this->call(200, "success", "Usuário excluído com sucesso", "success")
            ->back($data);
    }

    public function updateUser (array $data): void
    {
        $this->auth();
        var_dump($data);
        var_dump( $this->userAuth);
        var_dump($this->userAuth->name, $this->userAuth->email);
    }

    public function login(array $data): void
    {
        // Verificar se os dados de login foram fornecidos
        if (empty($data["email"]) || empty($data["password"])) {
            $this->call(400, "bad_request", "Credenciais inválidas", "error")->back();
            return;
        }

        $user = new User();

        if(!$user->findByEmail($data["email"])){
            $this->call(401, "unauthorized", "Usuário não encontrado", "error")->back();
            return;
        }

        if(!password_verify($data["password"], $user->getPassword())){
            $this->call(401, "unauthorized", "Senha inválida", "error")->back();
            return;
        }

        // Gerar o token JWT
        $jwt = new JWTToken();
        $token = $jwt->create([
            "email" => $user->getEmail(),
            "name" => $user->getName(),
            "photo" => $user->getPhoto(),
            "rule" => $user->getIdType()
        ]);

        // Retornar o token JWT na resposta
        $this->call(200, "success", "Login realizado com sucesso", "success")
            ->back([
                "token" => $token,
                "user" => [
                    "id" => $user->getId(),
                    "name" => $user->getName(),
                    "email" => $user->getEmail(),
                    "photo" => $user->getPhoto()
                ]
            ]);

    }
}