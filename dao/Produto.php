<?php

/**
 * Created by PhpStorm.
 * User: brlaranjeira
 * Date: 7/5/17
 * Time: 6:03 PM
 */
require_once (__DIR__ . '/EntidadeAbstrata.php');
class Produto extends EntidadeAbstrata {

    private $descricao;
    private $gpc;
    private $ncm;
    private $categoria;
    private $brand;

    protected static $tbName = 'produto';
    protected static $dicionario = [
        'descricao' => 'descricao'
    ];
    protected static $hasOne = [
        'gpc' => [
            'clEntityName' => 'GPC',
            'tbForeignKey' => 'id_gpc'
        ], 'ncm' => [
            'clEntityName' => 'NCM',
            'tbForeignKey' => 'id_ncm'
        ], 'categoria' => [
            'clEntityName' => 'Categoria',
            'tbForeignKey' => 'id_categoria'
        ],'brand' => [
            'clEntityName' => 'Brand',
            'tbForeignKey' => 'id_brand'
        ]
    ];

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
    public function getNcm() {
        return $this->ncm;
    }

    /**
     * @param mixed $ncm
     */
    public function setNcm($ncm) {
        $this->ncm = $ncm;
    }

    /**
     * @return mixed
     */
    public function getCategoria() {
        return $this->categoria;
    }

    /**
     * @param mixed $categoria
     */
    public function setCategoria($categoria) {
        $this->categoria = $categoria;
    }

    /**
     * @return mixed
     */
    public function getBrand() {
        return $this->brand;
    }

    /**
     * @param mixed $brand
     */
    public function setBrand($brand) {
        $this->brand = $brand;
    }



}