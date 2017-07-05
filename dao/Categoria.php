<?php

/**
 * Created by PhpStorm.
 * User: brlaranjeira
 * Date: 7/5/17
 * Time: 5:18 PM
 */
require_once (__DIR__ . '/EntidadeAbstrata.php');
class Categoria extends EntidadeAbstrata {
    protected static $tbName = 'categoria';
    protected static $dicionario = ['descricao' => 'descricao'];
    protected static $hasOne = [
        'parent' => [
            'clEntityName' => 'Categoria',
            'tbForeignKey' => 'id_parent'
        ]
    ];

    private $descricao;
    private $parent;

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

    /**
     * @return mixed
     */
    public function getParent() {
        return $this->parent;
    }

    /**
     * @param mixed $parent
     */
    public function setParent($parent) {
        $this->parent = $parent;
    }


}