<?php

/**
 * Created by PhpStorm.
 * User: brlaranjeira
 * Date: 7/5/17
 * Time: 5:58 PM
 */
require_once (__DIR__ . '/EntidadeAbstrata.php');
class Brand extends EntidadeAbstrata {

    protected static $tbName = 'brand';
    protected static $dicionario = [
        'nome' => 'nome',
        'imagem' => 'imagem'
    ];

    private $nome;
    private $imagem;

    /**
     * @return mixed
     */
    public function getNome() {
        return $this->nome;
    }

    /**
     * @param mixed $nome
     */
    public function setNome($nome) {
        $this->nome = $nome;
    }

    /**
     * @return mixed
     */
    public function getImagem() {
        return $this->imagem;
    }

    /**
     * @param mixed $imagem
     */
    public function setImagem($imagem) {
        $this->imagem = $imagem;
    }



}