<?php

require_once (__DIR__ . '/dao/GPC.php');
require_once (__DIR__ . '/dao/NCM.php');
require_once (__DIR__ . '/dao/Brand.php');
require_once (__DIR__ . '/dao/Usuario.php');
require_once (__DIR__ . '/dao/TipoLogradouro.php');
require_once (__DIR__ . '/dao/TipoEstabelecimento.php');
require_once (__DIR__ . '/dao/TipoPreco.php');
require_once (__DIR__ . '/dao/TipoAvaliacao.php');
require_once (__DIR__ . '/dao/Estabelecimento.php');
require_once (__DIR__ . '/dao/Cidade.php');
require_once (__DIR__ . '/dao/Preco.php');
require_once (__DIR__ . '/dao/Produto.php');
require_once (__DIR__ . '/dao/Avaliacao.php');
require_once (__DIR__ . '/dao/Alerta.php');

$produtos = Produto::getAll();
$categorias = Categoria::getAll();
echo '';