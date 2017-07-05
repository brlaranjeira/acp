<?php

/**
 * Created by PhpStorm.
 * User: brlaranjeira
 * Date: 7/5/17
 * Time: 5:52 PM
 */
require_once (__DIR__ . '/EntidadeAbstrata.php');
class GPC extends EntidadeAbstrata {

    protected static $tbName = 'gpc';
    protected static $dicionario = [
        'gpc' => 'gpc',
        'descricao' => 'descricao'
    ];

    private $gpc;
    private $descricao;

    /**
     * @return mixed
     */
    public function getGpc() {
        return $this->gpc;
    }

    /**
     * @param mixed $gpc
     */
    public function setGpc($gpc) {
        $this->gpc = $gpc;
    }

    /**
     * @return mixed
     */
    public function getDescricao() {
        return $this->descricao;
    }

    /**
     * @param mixed $descricao
     */
    public function setDescricao($descricao) {
        $this->descricao = $descricao;
    }


}