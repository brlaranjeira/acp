<?php

/**
 * Created by PhpStorm.
 * User: brlaranjeira
 * Date: 7/5/17
 * Time: 3:41 PM
 */
require_once( __DIR__ . '/EntidadeAbstrata.php');
class UF extends EntidadeAbstrata {

    private $cod;
    private $nome;

    protected static $tbName = 'uf';
    protected static $dicionario = [
        "cod" => "cod",
        "nome" => "nome"
    ];

    /**
     * @return mixed
     */
    public function getCod() {
        return $this->cod;
    }

    /**
     * @return mixed
     */
    public function getNome() {
        return $this->nome;
    }

    /**
     * @param mixed $cod
     */
    public function setCod($cod) {
        $this->cod = $cod;
    }

    /**
     * @param mixed $nome
     */
    public function setNome($nome) {
        $this->nome = $nome;
    }






}