<?php

namespace source\Core;

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
            echo "Ocorreu um erro -> {$e}";
            return [];
        }
    }

    public function findById (int $id): ?object
    {
        try {
            $stmt = Connect::getInstance()->query("SELECT * FROM {$this->table} WHERE id = {$id}");
            return $stmt->fetch();
        } catch (PDOException $e) {
            echo "Ocorreu um erro -> {$e}";
            return null;
        }
    }

    public function deleteById (int $id): bool
    {
        try {
            $stmt = Connect::getInstance()->prepare("DELETE FROM {$this->table} WHERE id = :id");
            $stmt->bindParam("id",$id);
            $stmt->execute();
            if ($stmt->rowCount() == 0) {
                return false;
            }
            return true;
        } catch (PDOException $e) {
            echo "Ocorreu um erro -> {$e}";
            return false;
        }
    }

}