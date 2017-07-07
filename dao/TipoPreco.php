<?php

/**
 * Created by PhpStorm.
 * User: brlaranjeira
 * Date: 7/7/17
 * Time: 4:19 PM
 */
require_once (__DIR__ . '/EntidadeAbstrata.php');
class TipoPreco extends EntidadeAbstrata {

	private $descricao;
	protected static $tbName = 'tipo_preco';
	protected static $dicionario = [
		'descricao' => 'descricao'
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
	public function setDescricao( $descricao ) {
		$this->descricao = $descricao;
	}



}