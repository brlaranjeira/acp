<?php

/**
 * Created by PhpStorm.
 * User: brlaranjeira
 * Date: 7/5/17
 * Time: 4:22 PM
 */
require_once (__DIR__ . '/EntidadeAbstrata.php');
class Cidade extends EntidadeAbstrata {

    protected static $tbName = 'cidade';
    protected static $dicionario = [ "nome" => "nome"];
    protected static $hasOne = ["uf" => [
        'clEntityName' => 'UF',
        'tbForeignKey' => 'id_uf'
    ]];

    private $uf;

    /**
     * @return mixed
     */
    public function getUf()
    {
        return $this->uf;
    }

    /**
     * @param mixed $uf
     */
    public function setUf($uf)
    {
        $this->uf = $uf;
    }

    /**
     * @return mixed
     */
    public function getNome()
    {
        return $this->nome;
    }

    /**
     * @param mixed $nome
     */
    public function setNome($nome)
    {
        $this->nome = $nome;
    }
    private $nome;



}