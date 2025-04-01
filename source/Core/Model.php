<?php

namespace source\Core;

use PDO;
use PDOException;
use Source\Core\Connect;

abstract class Model
{
    protected $table;

    public function findAll(): array
    {
        try {
            $stmt = Connect::getInstance()->query("SELECT * FROM {$this->table}");
            return $stmt->fetchAll();
        } catch (PDOException $e) {
            echo "Ocorreu um erro {$e}";
            return [];
        }
    }

//    public function findAll(): array
//    {
//        $sql = "SELECT * FROM {$this->table}";
//
//        try {
//            //$stmt = $this->connection->query($sql);
//            $stmt = Connect::getInstance()->query($sql);
//            return $stmt->fetchAll(PDO::FETCH_OBJ);
//        } catch (PDOException $e) {
//            // Handle exception
//            return [];
//        }
//    }

    /*public function insert(array $data): bool
    {
        $columns = implode(", ", array_keys($data));
        $placeholders = ":" . implode(", :", array_keys($data));
        $sql = "INSERT INTO {$this->table} ({$columns}) VALUES ({$placeholders})";

        try {
            $stmt = $this->connection->prepare($sql);
            return $stmt->execute($data);
        } catch (PDOException $e) {
            // Handle exception
            return false;
        }
    }*/

    /*public function update(int $id, array $data): bool
    {
        $set = "";
        foreach ($data as $key => $value) {
            $set .= "{$key} = :{$key}, ";
        }
        $set = rtrim($set, ", ");
        $sql = "UPDATE {$this->table} SET {$set} WHERE {$this->primaryKey} = :id";
        $data['id'] = $id;

        try {
            $stmt = $this->connection->prepare($sql);
            return $stmt->execute($data);
        } catch (PDOException $e) {
            // Handle exception
            return false;
        }
    }*/

    /*public function delete(int $id): bool
    {
        $sql = "DELETE FROM {$this->table} WHERE {$this->primaryKey} = :id";

        try {
            $stmt = $this->connection->prepare($sql);
            return $stmt->execute(['id' => $id]);
        } catch (PDOException $e) {
            // Handle exception
            return false;
        }
    }*/

    /*public function findById(int $id): ?array
    {
        $sql = "SELECT * FROM {$this->table} WHERE {$this->primaryKey} = :id";

        try {
            $stmt = $this->connection->prepare($sql);
            $stmt->execute(['id' => $id]);
            $result = $stmt->fetch(PDO::FETCH_ASSOC);
            return $result ?: null;
        } catch (PDOException $e) {
            // Handle exception
            return null;
        }
    }*/
}