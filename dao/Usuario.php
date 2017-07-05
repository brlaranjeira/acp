<?php

/**
 * Created by PhpStorm.
 * User: brlaranjeira
 * Date: 7/5/17
 * Time: 7:29 PM
 */
require_once (__DIR__ . '/EntidadeAbstrata.php');
class Usuario extends EntidadeAbstrata {

    private $login;
    private $prenome;
    private $sobrenome;
    private $iteracoes;
    private $passwd;
    private $salt;
    private $tipo;

    protected static $tbName = 'usuario';
    protected static $dicionario = [
        'login' => 'login',
        'prenome' => 'prenome',
        'sobrenome' => 'sobrenome',
        'iteracoes' => 'iteracoes',
        'passwd' => 'passwd',
        'salt' => 'salt'
    ];
    protected static $hasOne = [
        'tipo' => [
            'clEntityName' => 'TipoUsuario',
            'tbForeignKey' => 'id_tipo'
        ]
    ];


    public function geraPW( $raw ) {
        require_once (__DIR__ . "/../lib/ConfigClass.php");
        $this->iteracoes = ConfigClass::pw_iter;
        $tmpSalt = array();
        while (sizeof($tmpSalt) < ConfigClass::pw_saltLength) {
            $current = unpack('C*',pack("L",rand()));
            for ($i = 1; $i <= sizeof($current) && sizeof($tmpSalt) < ConfigClass::pw_saltLength; $i++ ) {
                $tmpSalt[] = $current[$i];
            }
        }
        $saltStr = implode(array_map("chr", $tmpSalt));
        $this->salt = $saltStr;

        $hashed = self::calculaPW($raw,$saltStr,$this->iteracoes);
        $this->passwd = $hashed;
    }



}