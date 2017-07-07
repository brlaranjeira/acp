<?php

/**
 * Created by PhpStorm.
 * User: brlaranjeira
 * Date: 7/7/17
 * Time: 5:01 PM
 */
require_once (__DIR__ . '/EntidadeAbstrata.php');
class TipoAvaliacao extends EntidadeAbstrata {

	private $descricao;
	private $valor;

	protected static $tbName = 'tipo_avaliacao';
	protected static $dicionario = [
		'descricao' => 'desc',
		'valor' => 'valor'
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

	/**
	 * @return mixed
	 */
	public function getValor() {
		return $this->valor;
	}

	/**
	 * @param mixed $valor
	 */
	public function setValor( $valor ) {
		$this->valor = $valor;
	}



}