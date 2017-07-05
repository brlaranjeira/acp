<?php

/**
 * Created by PhpStorm.
 * User: brlaranjeira
 * Date: 7/5/17
 * Time: 5:54 PM
 */
require_once (__DIR__ . '/EntidadeAbstrata.php');
class NCM extends EntidadeAbstrata {

    protected static $tbName = 'ncm';
    protected static $dicionario = [
        'ncm' => 'ncm',
        'descricao' => 'descricao'
    ];

    private $ncm;
    private $descricao;

    /**
     * @return mixed
     */
    public function getNcm()
    {
        return $this->ncm;
    }

    /**
     * @param mixed $ncm
     */
    public function setNcm($ncm)
    {
        $this->ncm = $ncm;
    }

    /**
     * @return mixed
     */
    public function getDescricao()
    {
        return $this->descricao;
    }

    /**
     * @param mixed $descricao
     */
    public function setDescricao($descricao)
    {
        $this->descricao = $descricao;
    }




}