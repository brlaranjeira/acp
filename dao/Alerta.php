<?php

/**
 * Created by PhpStorm.
 * User: brlaranjeira
 * Date: 7/7/17
 * Time: 5:11 PM
 */
require_once (__DIR__ . '/EntidadeAbstrata.php');
class Alerta extends EntidadeAbstrata {

	private $usuario;
	private $produto;
	private $valor;

	protected static $tbName = 'alerta';
	protected static $dicionario = [
		'valor' => 'valor'
	];
	protected static $hasOne = [
		'usuario' => [
			'clEntityName' => 'Usuario',
			'tbForeignKey' => 'id_usuario'
		], 'produto' => [
			'clEntityName' => 'Produto',
			'tbForeignKey' => 'id_produto'
		]
	];

	/**
	 * @return mixed
	 */
	public function getUsuario() {
		return $this->usuario;
	}

	/**
	 * @param mixed $usuario
	 */
	public function setUsuario( $usuario ) {
		$this->usuario = $usuario;
	}

	/**
	 * @return mixed
	 */
	public function getProduto() {
		return $this->produto;
	}

	/**
	 * @param mixed $produto
	 */
	public function setProduto( $produto ) {
		$this->produto = $produto;
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