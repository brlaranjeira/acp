<?php

/**
 * Created by PhpStorm.
 * User: brlaranjeira
 * Date: 7/7/17
 * Time: 3:54 PM
 */
require_once (__DIR__ . '/EntidadeAbstrata.php');
class Estabelecimento extends EntidadeAbstrata {

	private $nome;
	private $imagem;
	private $logradouro;
	private $nro;
	private $complemento;
	private $latitude;
	private $longitude;
	private $tipo;
	private $tipoLogradouro;
	private $cidade;

	protected static $tbName = 'estabelecimento';
	protected static $dicionario = [
		'nome' => 'nome',
		'imagem' => 'image',
		'logradouro' => 'end_logradouro',
		'complemento' => 'end_complemento',
		'latitude' => 'end_latitude',
		'longitude' => 'end_longitude',
		'nro' => 'end_nro'
	];
	protected static $hasOne = [
		'tipo' => [
			'clEntityName' => 'TipoEstabelecimento',
			'tbForeignKey' => 'id_tipo_estabelecimento'
		],
		'tipoLogradouro' => [
			'clEntityName' => 'TipoLogradouro',
			'tbForeignKey' => 'id_tipo_logradouro'
		],
		'cidade' => [
			'clEntityName' => 'Cidade',
			'tbForeignKey' => 'id_cidade'
		]
	];

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

	/**
	 * @return mixed
	 */
	public function getImagem() {
		return $this->imagem;
	}

	/**
	 * @param mixed $imagem
	 */
	public function setImagem( $imagem ) {
		$this->imagem = $imagem;
	}

	/**
	 * @return mixed
	 */
	public function getLogradouro() {
		return $this->logradouro;
	}

	/**
	 * @param mixed $logradouro
	 */
	public function setLogradouro( $logradouro ) {
		$this->logradouro = $logradouro;
	}

	/**
	 * @return mixed
	 */
	public function getNro() {
		return $this->nro;
	}

	/**
	 * @param mixed $nro
	 */
	public function setNro( $nro ) {
		$this->nro = $nro;
	}

	/**
	 * @return mixed
	 */
	public function getComplemento() {
		return $this->complemento;
	}

	/**
	 * @param mixed $complemento
	 */
	public function setComplemento( $complemento ) {
		$this->complemento = $complemento;
	}

	/**
	 * @return mixed
	 */
	public function getLatitude() {
		return $this->latitude;
	}

	/**
	 * @param mixed $latitude
	 */
	public function setLatitude( $latitude ) {
		$this->latitude = $latitude;
	}

	/**
	 * @return mixed
	 */
	public function getLongitude() {
		return $this->longitude;
	}

	/**
	 * @param mixed $longitude
	 */
	public function setLongitude( $longitude ) {
		$this->longitude = $longitude;
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
	public function getTipoLogradouro() {
		return $this->tipoLogradouro;
	}

	/**
	 * @param mixed $tipoLogradouro
	 */
	public function setTipoLogradouro( $tipoLogradouro ) {
		$this->tipoLogradouro = $tipoLogradouro;
	}

	/**
	 * @return mixed
	 */
	public function getCidade() {
		return $this->cidade;
	}

	/**
	 * @param mixed $cidade
	 */
	public function setCidade( $cidade ) {
		$this->cidade = $cidade;
	}


}