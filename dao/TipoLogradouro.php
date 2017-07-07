<?php

/**
 * Created by PhpStorm.
 * User: brlaranjeira
 * Date: 7/7/17
 * Time: 3:46 PM
 */
require_once (__DIR__ . '/EntidadeAbstrata.php');
class TipoLogradouro  extends EntidadeAbstrata {

	private $abrev;
	private $nome;

	protected static $tbName = 'tipo_logradouro';
	protected static $dicionario = [
		'abrev' => 'abrev',
		'nome' => 'nome'
	];

	/**
	 * @return mixed
	 */
	public function getAbrev() {
		return $this->abrev;
	}

	/**
	 * @param mixed $abrev
	 */
	public function setAbrev( $abrev ) {
		$this->abrev = $abrev;
	}

	/**
	 * @return mixed
	 */
	public function getNome() {
		return $this->nome;
	}

	/**
	 * @param mixed $nome
	 */
	public function setNome( $nome ) {
		$this->nome = $nome;
	}



}