<?php

namespace source\Core;

use PDO;
use PDOException;

class Connect
{
    private const OPTIONS = [
        PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8",
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_OBJ,
        PDO::ATTR_CASE => PDO::CASE_NATURAL
    ];

    private static $instance;

    public static function getInstance(): ?PDO
    {
        if (empty(self::$instance)) {
            try {
                self::$instance = new PDO(
                    "mysql:host=" . "mysql" . ";dbname=" . "db-test",
                    "root",
                    "asdf1234",
                    self::OPTIONS
                );
            } catch (PDOException $exception) {
                //redirect("/ops/problemas");
                echo "Problemas ao Conectar...";
                echo $exception->getMessage();
            }
        }

        return self::$instance;
    }

    final private function __construct()
    {
    }

    private function __clone()
    {
    }
}