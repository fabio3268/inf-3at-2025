<?php

namespace source\Core;

use Source\Core\Connect;
use PDO;
use PDOException;
use ReflectionClass;

abstract class Model
{
    protected $table;
    protected $errorMessage;

    public function insert(): bool
    {
        $reflection = new ReflectionClass($this);
        $properties = $reflection->getProperties();
        $columns = [];
        $placeholders = [];
        $values = [];

        foreach ($properties as $property) {
            $property->setAccessible(true);
            $name = $property->getName();
            $value = $property->getValue($this);
            if ($name !== "table" && $name !== "errorMessage") {
                $columns[] = $name;
                $placeholders[] = ":{$name}";
                $values[$name] = $value;
            }
        }

        $columns = implode(", ", $columns);
        $placeholders = implode(", ", $placeholders);
        $sql = "INSERT INTO {$this->table} ({$columns}) VALUES ({$placeholders})";

        try {
            $stmt = Connect::getInstance()->prepare($sql);
            foreach ($values as $column => $value) {
                if(is_null($value)){
                    $stmt->bindValue($column, 'NULL', PDO::PARAM_NULL);
                    continue;
                }
                if(is_int($value)) {
                    $stmt->bindValue($column, $value, PDO::PARAM_INT);
                    continue;
                }
                $stmt->bindValue($column, $value);

            }
            if(!$stmt->execute()){
                return false;
            }
            $id = Connect::getInstance()->lastInsertId();
            $reflection->getProperty('id')->setAccessible(true);
            $reflection->getProperty('id')->setValue($this, $id);
            return true;
        } catch (PDOException $e) {
            $this->errorMessage = "Erro ao inserir o registro: {$e->getMessage()}";
            return false;
        }
    }

    public function updateById (): bool
    {
        $reflection = new ReflectionClass($this);
        $properties = $reflection->getProperties();
        $columns = [];
        $values = [];

        foreach ($properties as $property) {
            $property->setAccessible(true);
            $name = $property->getName();
            $value = $property->getValue($this);
            if ($name !== "table" && $name !== "errorMessage") {
                $columns[] = "{$name} = :{$name}";
                $values[$name] = $value;
            }
        }

        $columns = implode(", ", $columns);
        $sql = "UPDATE {$this->table} SET {$columns} WHERE id = :id";

        try {
            $stmt = Connect::getInstance()->prepare($sql);
            foreach ($values as $column => $value) {
                if(is_null($value)){
                    $stmt->bindValue($column, 'NULL', PDO::PARAM_NULL);
                } else if(is_int($value)) {
                    $stmt->bindValue($column, $value, PDO::PARAM_INT);
                } else {
                    $stmt->bindValue($column, $value, PDO::PARAM_STR);
                }
            }
            return $stmt->execute();
        } catch (PDOException $e) {
            $this->errorMessage = "Erro ao inserir o registro: {$e->getMessage()}";
            return false;
        }

    }

    public function findAll(): array
    {
        try {
            $stmt = Connect::getInstance()->query("SELECT * FROM {$this->table}");
            return $stmt->fetchAll();
        } catch (PDOException $e) {
            $this->errorMessage = "Erro ao inserir o registro: {$e->getMessage()}";
            return [];
        }
    }

    public function findById (int $id): bool
    {
        try {
            $stmt = Connect::getInstance()
                ->prepare("SELECT * FROM {$this->table} WHERE id = :id");
            $stmt->bindValue("id",$id);
            $stmt->execute();
            $result = $stmt->fetch();
            if (!$result) {
                return false;
            }
            $reflection = new ReflectionClass($this);
            foreach ($result as $column => $value) {
                if ($reflection->hasProperty($column)) {
                    $property = $reflection->getProperty($column);
                    $property->setAccessible(true);
                    $property->setValue($this, $value);
                }
            }
            return true;
        } catch (PDOException $e) {
            $this->errorMessage = "Erro ao inserir o registro: {$e->getMessage()}";
            return false;
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
            $this->errorMessage = "Erro ao excluir o registro: {$e->getMessage()}";
            return false;
        }
    }

    public function getErrorMessage (): ?string
    {
        return $this->errorMessage;
    }

}