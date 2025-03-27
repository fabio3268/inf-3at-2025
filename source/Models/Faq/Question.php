<?php

namespace Source\Models\Faq;

use Source\Core\Connect;

class Question
{

    private $id;
    private $question;
    private $answer;

    public function __construct(
        int $id = null,
        string $question = null,
        string $answer = null
    )
    {
        $this->id = $id;
        $this->question = $question;
        $this->answer = $answer;
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function setId(?int $id): void
    {
        $this->id = $id;
    }

    public function getQuestion(): ?string
    {
        return $this->question;
    }

    public function setQuestion(?string $question): void
    {
        $this->question = $question;
    }

    public function getAnswer(): ?string
    {
        return $this->answer;
    }

    public function setAnswer(?string $answer): void
    {
        $this->answer = $answer;
    }

    public function findAll ()
    {

        //var_dump(Connect::getInstance());

        $stmt = Connect::getInstance()->query("SELECT * FROM questions");
        var_dump($stmt->fetchAll());

        //$stmt = $connection->query("SELECT * FROM questions");
        //var_dump($stmt->fetchAll());
    }

}