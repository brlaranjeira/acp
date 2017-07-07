<?php

/**
 * Created by PhpStorm.
 * User: brlaranjeira
 * Date: 7/7/17
 * Time: 4:31 PM
 */
require_once (__DIR__ . '/EntidadeAbstrata.php');
class Preco extends EntidadeAbstrata {

	private $valor;
	private $tipo;
	private $usuario;
	private $produto;
	private $estabelecimento;

	protected static $tbName = 'preco';
	protected static $dicionario = [
		'valor' => 'valor'
	];
	protected static $hasOne = [
		'tipo' => [
			'clEntityName' => 'TipoPreco',
			'tbForeignKey' => 'id_tipo_preco'
		],'usuario' => [
			'clEntityName' => 'Usuario',
			'tbForeignKey' => 'id_usuario'
		],'produto' => [
			'clEntityName' => 'Produto',
			'tbForeignKey' => 'id_produto'
		],'estabelecimento' => [
			'clEntityName' => 'Estabelecimento',
			'tbForeignKey' => 'id_estabelecimento'
		]
	];

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

	/**
	 * @return mixed
	 */
	public function getTipo() {
		return $this->tipo;
	}

	/**
	 * @param mixed $tipo
	 */
	public function setTipo( $tipo ) {
		$this->tipo = $tipo;
	}

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
	public function getEstabelecimento() {
		return $this->estabelecimento;
	}

	/**
	 * @param mixed $estabelecimento
	 */
	public function setEstabelecimento( $estabelecimento ) {
		$this->estabelecimento = $estabelecimento;
	}



}