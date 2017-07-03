-- MySQL dump 10.13  Distrib 5.7.18, for Linux (x86_64)
--
-- Host: localhost    Database: acp
-- ------------------------------------------------------
-- Server version	5.7.18-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alerta`
--

DROP TABLE IF EXISTS `alerta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alerta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_usuario` bigint(20) NOT NULL,
  `id_produto` bigint(20) NOT NULL,
  `valor` float NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `alerta_id_uindex` (`id`),
  KEY `alerta_usuario_id_fk` (`id_usuario`),
  KEY `alerta_produto_id_fk` (`id_produto`),
  CONSTRAINT `alerta_produto_id_fk` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `alerta_usuario_id_fk` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alerta`
--

LOCK TABLES `alerta` WRITE;
/*!40000 ALTER TABLE `alerta` DISABLE KEYS */;
/*!40000 ALTER TABLE `alerta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avaliacao`
--

DROP TABLE IF EXISTS `avaliacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avaliacao` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_preco` bigint(20) NOT NULL,
  `id_usuario` bigint(20) NOT NULL,
  `id_tipo_avaliacao` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `avaliacao_id_uindex` (`id`),
  KEY `avaliacao_preco_id_fk` (`id_preco`),
  KEY `avaliacao_usuario_id_fk` (`id_usuario`),
  KEY `avaliacao_tipo_avaliacao_id_fk` (`id_tipo_avaliacao`),
  CONSTRAINT `avaliacao_preco_id_fk` FOREIGN KEY (`id_preco`) REFERENCES `preco` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `avaliacao_tipo_avaliacao_id_fk` FOREIGN KEY (`id_tipo_avaliacao`) REFERENCES `tipo_avaliacao` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `avaliacao_usuario_id_fk` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avaliacao`
--

LOCK TABLES `avaliacao` WRITE;
/*!40000 ALTER TABLE `avaliacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `avaliacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `imagem` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `brand_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) NOT NULL,
  `id_parent` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categoria_id_uindex` (`id`),
  KEY `categoria_categoria_id_fk` (`id_parent`),
  CONSTRAINT `categoria_categoria_id_fk` FOREIGN KEY (`id_parent`) REFERENCES `categoria` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Alimento',NULL),(2,'Saladas',1);
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cidade`
--

DROP TABLE IF EXISTS `cidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cidade` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_uf` bigint(20) NOT NULL,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cidade_id_uindex` (`id`),
  KEY `cidade_uf_id_fk` (`id_uf`),
  CONSTRAINT `cidade_uf_id_fk` FOREIGN KEY (`id_uf`) REFERENCES `uf` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidade`
--

LOCK TABLES `cidade` WRITE;
/*!40000 ALTER TABLE `cidade` DISABLE KEYS */;
/*!40000 ALTER TABLE `cidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estabelecimento`
--

DROP TABLE IF EXISTS `estabelecimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estabelecimento` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  `end_logradouro` varchar(30) NOT NULL,
  `end_complemento` varchar(30) DEFAULT NULL,
  `end_latitude` decimal(10,8) NOT NULL,
  `end_longitude` decimal(10,8) NOT NULL,
  `id_tipo_estabelecimento` bigint(20) NOT NULL,
  `id_tipo_logradouro` bigint(20) NOT NULL,
  `id_cidade` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `estabelecimento_id_uindex` (`id`),
  KEY `estabelecimento_tipo_estabelecimento_id_fk` (`id_tipo_estabelecimento`),
  KEY `estabelecimento_cidade_id_fk` (`id_cidade`),
  CONSTRAINT `estabelecimento_cidade_id_fk` FOREIGN KEY (`id_cidade`) REFERENCES `cidade` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `estabelecimento_tipo_estabelecimento_id_fk` FOREIGN KEY (`id_tipo_estabelecimento`) REFERENCES `tipo_estabelecimento` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estabelecimento`
--

LOCK TABLES `estabelecimento` WRITE;
/*!40000 ALTER TABLE `estabelecimento` DISABLE KEYS */;
/*!40000 ALTER TABLE `estabelecimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gpc`
--

DROP TABLE IF EXISTS `gpc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gpc` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gpc` varchar(8) NOT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gpc_id_uindex` (`id`),
  UNIQUE KEY `gpc_gpc_uindex` (`gpc`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gpc`
--

LOCK TABLES `gpc` WRITE;
/*!40000 ALTER TABLE `gpc` DISABLE KEYS */;
INSERT INTO `gpc` VALUES (1,'12345678','aiushd iasiouh asdiuo '),(3,'14982329','teste xyzw'),(4,'14982330','teste xyzw'),(5,'98233086','teste xyzw'),(19,'98243020','teste xyzw'),(20,'98243082','teste xyzw'),(21,'98243163','teste xyzw'),(22,'98243246','teste xyzw'),(23,'98243301','teste xyzw'),(24,'98243362','teste xyzw');
/*!40000 ALTER TABLE `gpc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ncm`
--

DROP TABLE IF EXISTS `ncm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ncm` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ncm` varchar(10) NOT NULL,
  `descricao` text NOT NULL,
  `descricao_full` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ncm_id_uindex` (`id`),
  UNIQUE KEY `ncm_ncm_uindex` (`ncm`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ncm`
--

LOCK TABLES `ncm` WRITE;
/*!40000 ALTER TABLE `ncm` DISABLE KEYS */;
INSERT INTO `ncm` VALUES (1,'1234.56.78','Descricao curta','Descricao longa');
/*!40000 ALTER TABLE `ncm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preco`
--

DROP TABLE IF EXISTS `preco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preco` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `valor` float(10,2) NOT NULL,
  `id_tipo_preco` bigint(20) NOT NULL,
  `id_usuario` bigint(20) NOT NULL,
  `id_produto` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `preco_id_uindex` (`id`),
  KEY `preco_usuario_id_fk` (`id_usuario`),
  KEY `preco_produto_id_fk` (`id_produto`),
  KEY `preco_tipo_preco_id_fk` (`id_tipo_preco`),
  CONSTRAINT `preco_produto_id_fk` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `preco_tipo_preco_id_fk` FOREIGN KEY (`id_tipo_preco`) REFERENCES `tipo_preco` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `preco_usuario_id_fk` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preco`
--

LOCK TABLES `preco` WRITE;
/*!40000 ALTER TABLE `preco` DISABLE KEYS */;
/*!40000 ALTER TABLE `preco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) NOT NULL,
  `id_gpc` bigint(20) DEFAULT NULL,
  `id_ncm` bigint(20) DEFAULT NULL,
  `id_categoria` bigint(20) DEFAULT NULL,
  `id_brand` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `produto_id_uindex` (`id`),
  KEY `produto_ncm_id_fk` (`id_ncm`),
  KEY `produto_gpc_id_fk` (`id_gpc`),
  KEY `produto_categoria_id_fk` (`id_categoria`),
  KEY `produto_brand_id_fk` (`id_brand`),
  CONSTRAINT `produto_brand_id_fk` FOREIGN KEY (`id_brand`) REFERENCES `brand` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `produto_categoria_id_fk` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `produto_gpc_id_fk` FOREIGN KEY (`id_gpc`) REFERENCES `gpc` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `produto_ncm_id_fk` FOREIGN KEY (`id_ncm`) REFERENCES `ncm` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'coca cola',24,1,NULL,NULL),(2,'alface',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_tem_propriedade`
--

DROP TABLE IF EXISTS `produto_tem_propriedade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto_tem_propriedade` (
  `id_produto` bigint(20) NOT NULL,
  `id_propriedade` bigint(20) NOT NULL,
  `valor` varchar(50) NOT NULL,
  PRIMARY KEY (`id_propriedade`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_tem_propriedade`
--

LOCK TABLES `produto_tem_propriedade` WRITE;
/*!40000 ALTER TABLE `produto_tem_propriedade` DISABLE KEYS */;
INSERT INTO `produto_tem_propriedade` VALUES (1,1,'250'),(1,2,'1.3');
/*!40000 ALTER TABLE `produto_tem_propriedade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propriedade`
--

DROP TABLE IF EXISTS `propriedade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `propriedade` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `propriedade_id_uindex` (`id`),
  UNIQUE KEY `propriedade_descricao_uindex` (`descricao`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propriedade`
--

LOCK TABLES `propriedade` WRITE;
/*!40000 ALTER TABLE `propriedade` DISABLE KEYS */;
INSERT INTO `propriedade` VALUES (26,'galoes'),(1,'litros'),(2,'quilogramas');
/*!40000 ALTER TABLE `propriedade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_avaliacao`
--

DROP TABLE IF EXISTS `tipo_avaliacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_avaliacao` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `desc` varchar(10) NOT NULL,
  `valor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tipo_avaliacao_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_avaliacao`
--

LOCK TABLES `tipo_avaliacao` WRITE;
/*!40000 ALTER TABLE `tipo_avaliacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_avaliacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_estabelecimento`
--

DROP TABLE IF EXISTS `tipo_estabelecimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_estabelecimento` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(30) NOT NULL,
  `imagem` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tipo_estabelecimento_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_estabelecimento`
--

LOCK TABLES `tipo_estabelecimento` WRITE;
/*!40000 ALTER TABLE `tipo_estabelecimento` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_estabelecimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_logradouro`
--

DROP TABLE IF EXISTS `tipo_logradouro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_logradouro` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `abrev` varchar(5) NOT NULL,
  `nome` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tipo_logradouro_id_uindex` (`id`),
  UNIQUE KEY `tipo_logradouro_abrev_uindex` (`abrev`),
  UNIQUE KEY `tipo_logradouro_nome_uindex` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_logradouro`
--

LOCK TABLES `tipo_logradouro` WRITE;
/*!40000 ALTER TABLE `tipo_logradouro` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_logradouro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_preco`
--

DROP TABLE IF EXISTS `tipo_preco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_preco` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tipo_preco_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_preco`
--

LOCK TABLES `tipo_preco` WRITE;
/*!40000 ALTER TABLE `tipo_preco` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_preco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_usuario`
--

DROP TABLE IF EXISTS `tipo_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_usuario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tipo_usuario_id_uindex` (`id`),
  UNIQUE KEY `tipo_usuario_descricao_uindex` (`descricao`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_usuario`
--

LOCK TABLES `tipo_usuario` WRITE;
/*!40000 ALTER TABLE `tipo_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uf`
--

DROP TABLE IF EXISTS `uf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uf` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cod` char(2) NOT NULL,
  `nome` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uf_id_uindex` (`id`),
  UNIQUE KEY `uf_cod_uindex` (`cod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uf`
--

LOCK TABLES `uf` WRITE;
/*!40000 ALTER TABLE `uf` DISABLE KEYS */;
/*!40000 ALTER TABLE `uf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `login` varchar(20) NOT NULL,
  `prenome` varchar(30) NOT NULL,
  `sobrenome` varchar(30) NOT NULL,
  `iteracoes` int(11) DEFAULT NULL,
  `passwd` char(64) NOT NULL,
  `salt` char(32) NOT NULL,
  `id_tipo` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario_id_uindex` (`id`),
  UNIQUE KEY `usuario_login_uindex` (`login`),
  KEY `usuario_tipo_usuario_id_fk` (`id_tipo`),
  CONSTRAINT `usuario_tipo_usuario_id_fk` FOREIGN KEY (`id_tipo`) REFERENCES `tipo_usuario` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-03 16:15:58
