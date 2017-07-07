<?php

/**
 * Created by PhpStorm.
 * User: brlaranjeira
 * Date: 7/7/17
 * Time: 3:30 PM
 */
require_once (__DIR__ . '/EntidadeAbstrata.php');
class TipoEstabelecimento extends EntidadeAbstrata {

	private $descricao;
	private $imagem;

	protected static $tbName = 'tipo_estabelecimento';
	protected static $dicionario = [
		'descricao'=>'descricao',
		'imagem'=>'imagem',];

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
	public function getImagem() {
		return $this->imagem;
	}

	/**
	 * @param mixed $imagem
	 */
	public function setImagem( $imagem ) {
		$this->imagem = $imagem;
	}






}