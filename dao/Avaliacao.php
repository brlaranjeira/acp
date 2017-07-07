<?php

/**
 * Created by PhpStorm.
 * User: brlaranjeira
 * Date: 7/7/17
 * Time: 5:04 PM
 */
require_once (__DIR__ . '/EntidadeAbstrata.php');
class Avaliacao extends EntidadeAbstrata {

	private $preco;
	private $usuario;
	private $tipo;

	protected static $tbName = 'avaliacao';
	protected static $hasOne = [
		'preco' => [
			'clEntityName' => 'Preco',
			'tbForeignKey' => 'id_preco'
		], 'usuario' => [
			'clEntityName' => 'Usuario',
			'tbForeignKey' => 'id_usuario'
		], 'tipo' => [
			'clEntityName' => 'TipoAvaliacao',
			'tbForeignKey' => 'id_tipo_avaliacao'
		]
	];

	/**
	 * @return mixed
	 */
	public function getPreco() {
		return $this->preco;
	}

	/**
	 * @param mixed $preco
	 */
	public function setPreco( $preco ) {
		$this->preco = $preco;
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
	public function getTipo() {
		return $this->tipo;
	}

	/**
	 * @param mixed $tipo
	 */
	public function setTipo( $tipo ) {
		$this->tipo = $tipo;
	}




}