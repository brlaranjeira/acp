-- MySQL dump 10.13  Distrib 5.7.18, for Linux (x86_64)
--
-- Host: dev    Database: acp
-- ------------------------------------------------------
-- Server version	5.5.52-0+deb8u1

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
  `valor` float(12,5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_produto` (`id_produto`),
  CONSTRAINT `alerta_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `alerta_ibfk_2` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
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
  `valor` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `avaliacao_preco_id_fk` (`id_preco`),
  KEY `avaliacao_usuario_id_fk` (`id_usuario`),
  CONSTRAINT `avaliacao_preco_id_fk` FOREIGN KEY (`id_preco`) REFERENCES `preco` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `avaliacao_usuario_id_fk` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
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
  `nome` varchar(30) CHARACTER SET latin1 NOT NULL,
  `pic` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `brand_nome_uindex` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (152,'COLGATE','COLGATE'),(153,'COCA-COLA','COCA-COLA'),(154,'BIO EXTRATUS',NULL),(155,'GRANADO',NULL),(156,'PHEBO',NULL),(157,'BOTICARIO',NULL),(158,'HYPERMARCAS BRANDS','HYPERMARCAS BRANDS'),(159,'JOHNSON &AMP; JOHNSON','JOHNSON &AMP; JOHNSON'),(160,'CENOURA&AMP;BRONZE',NULL),(161,'BOZZANO',NULL),(162,'CLEAR','CLEAR'),(163,'REXONA','REXONA'),(164,'FARMAERVAS',NULL),(165,'PHYTOERVAS',NULL),(166,'ELSEVE',NULL),(167,'AUTAN','AUTAN'),(168,'GRECIN',NULL),(169,'GARIN BRASIL','GARIN BRASIL'),(170,'INOAR KÉRATINE BRÉSILIENNE',NULL),(171,'SCHWEPPES','SCHWEPPES'),(172,'PALMOLIVE','PALMOLIVE'),(173,'DL',NULL),(174,'GROW',NULL),(175,'HASBRO','HASBRO'),(176,'MATTEL',NULL),(177,'FISHER-PRICE','FISHER-PRICE');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cidade`
--

DROP TABLE IF EXISTS `cidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cidade` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uf` char(2) CHARACTER SET latin1 DEFAULT NULL,
  `nome` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cidade_uf_cod_fk` (`uf`),
  CONSTRAINT `cidade_uf_cod_fk` FOREIGN KEY (`uf`) REFERENCES `uf` (`cod`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidade`
--

LOCK TABLES `cidade` WRITE;
/*!40000 ALTER TABLE `cidade` DISABLE KEYS */;
INSERT INTO `cidade` VALUES (5,'RS','Santa Maria');
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
  `nome` varchar(50) CHARACTER SET latin1 NOT NULL,
  `image` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `end_logradouro` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `end_numero` varchar(8) CHARACTER SET latin1 DEFAULT NULL,
  `end_complemento` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `end_latitude` decimal(10,8) DEFAULT NULL,
  `end_longitude` decimal(10,8) DEFAULT NULL,
  `cidade` bigint(20) DEFAULT NULL,
  `tipo_logradouro` varchar(4) CHARACTER SET latin1 DEFAULT NULL,
  `tipo` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `estabelecimento_tipo_estabelecimento_id_fk` (`tipo`),
  KEY `estabelecimento_cidade_id_fk` (`cidade`),
  KEY `estabelecimento_tipo_logradouro_abrev_fk` (`tipo_logradouro`),
  CONSTRAINT `estabelecimento_cidade_id_fk` FOREIGN KEY (`cidade`) REFERENCES `cidade` (`id`),
  CONSTRAINT `estabelecimento_tipo_estabelecimento_id_fk` FOREIGN KEY (`tipo`) REFERENCES `tipo_estabelecimento` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `estabelecimento_tipo_logradouro_abrev_fk` FOREIGN KEY (`tipo_logradouro`) REFERENCES `tipo_logradouro` (`abrev`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estabelecimento`
--

LOCK TABLES `estabelecimento` WRITE;
/*!40000 ALTER TABLE `estabelecimento` DISABLE KEYS */;
INSERT INTO `estabelecimento` VALUES (1,'Carrefour',NULL,'Rio Branco','732',NULL,NULL,NULL,5,'Av',2);
/*!40000 ALTER TABLE `estabelecimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gpc`
--

DROP TABLE IF EXISTS `gpc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gpc` (
  `id` varchar(8) CHARACTER SET latin1 NOT NULL,
  `descricao` varchar(80) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gpc`
--

LOCK TABLES `gpc` WRITE;
/*!40000 ALTER TABLE `gpc` DISABLE KEYS */;
INSERT INTO `gpc` VALUES ('10000161','Biscoitos;Bolachas (Não perecíveis)'),('10000232','Água engarrafada'),('10000346','Cabelo - Condicionador;tratamento'),('10000368','Cabelo - Xampu'),('47000000','Produtos de Higiene;Limpeza'),('50000000','Alimentos;Bebidas;Tabaco'),('53000000','Higiene;Cuidados Pessoais;Beleza'),('86000000','Brinquedos;Jogos');
/*!40000 ALTER TABLE `gpc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ncm`
--

DROP TABLE IF EXISTS `ncm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ncm` (
  `id` varchar(10) CHARACTER SET latin1 NOT NULL,
  `descricao` text CHARACTER SET latin1,
  `descricao_full` text CHARACTER SET latin1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ncm_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ncm`
--

LOCK TABLES `ncm` WRITE;
/*!40000 ALTER TABLE `ncm` DISABLE KEYS */;
INSERT INTO `ncm` VALUES ('1904.10.00','Produtos à base de cereais, obtidos por expansão ou por torrefação','Preparações à base de cereais, farinhas, amidos, féculas ou de leite; produtos de pastelaria - Produtos à base de cereais, obtidos por expansão ou por torrefação (por exemplo, flocos de milho (?corn flakes?)); cereais (exceto milho) em grãos ou sob a forma de flocos ou de outros grãos trabalhados (com exceção da farinha, do grumo e da sêmola), précozidos ou preparados de outro modo, não especificados nem compreendidos em outras posições'),('1905.31.00','Bolachas e biscoitos, doces (adicionados de edulcorante)','Preparações à base de cereais, farinhas, amidos, féculas ou de leite; produtos de pastelaria - Produtos de padaria, pastelaria ou da indústria de bolachas e biscoitos, mesmo adicionados de cacau; hóstias, cápsulas vazias para medicamentos, obreias, pastas secas de farinha, amido ou fécula, em folhas, e produtos semelhantes - Boachas e biscoitos, doces (adicionados de edulcorante); &quot;waffles&quot; e &quot;wafers&quot;:'),('2103.90.11','Em embalagens imediatas de conteúdo inferior ou igual a 1kg','Preparações alimentícias diversas - Preparações para molhos e molhos preparados; condimentos e temperos compostos; farinha de mostarda e mostarda preparada - Outros - Maionese'),('2106.90.90','Outras','Preparações alimentícias diversas - Preparações alimentícias não especificadas nem compreendidas em outras posições - Outras'),('2201.10.00','Águas minerais e águas gaseificadas','Bebidas, líquidos alcoólicos e vinagres - Águas, incluídas as águas minerais, naturais ou artificiais, e as águas gaseificadas, não adicionadas de açúcar ou de outros edulcorantes nem aromatizadas; gelo e neve'),('2202.10.00','Águas, incluídas as águas minerais e as águas gaseificadas, adicionadas de açúcar ou de outros edulcorantes ou aromatizadas','Bebidas, líquidos alcoólicos e vinagres - Águas, incluídas as águas minerais e as águas gaseificadas, adicionadas de açúcar ou de outros edulcorantes ou aromatizadas e outras bebidas não alcoólicas, exceto sucos de frutas ou de produtos hortícolas, da posição 2009'),('3004.90.63','Albendazol ou seu sulfóxido; mebendazol; 6mercaptopurina; metilsulfato de amezínio; oxifendazol; praziquantel','Produtos farmacêuticos - Medicamentos (exceto os produtos das posições 3002, 3005 ou 3006) constituídos por produtos misturados ou não misturados, preparados para fins terapêuticos ou profiláticos, apresentados em doses (incluídos os destinados a serem administrados por via percutânea) ou acondicionados para venda a retalho - Outros - Contendo produtos da posição 2933, mas não contendo produtos dos itens 3004901 a 3004905'),('3004.90.99','Outros','Produtos farmacêuticos - Medicamentos (exceto os produtos das posições 3002, 3005 ou 3006) constituídos por produtos misturados ou não misturados, preparados para fins terapêuticos ou profiláticos, apresentados em doses (incluídos os destinados a serem administrados por via percutânea) ou acondicionados para venda a retalho - Outros - Outros'),('3213.10.00','Cores em sortidos','Extratos tanantes e tintoriais; taninos e seus derivados; pigmentos e outras matérias corantes, tintas e vernizes, mástiques; tintas de escrever - Cores para pintura artística, atividades educativas, pintura de tabuletas, modificação de tonalidades, recreação e cores semelhantes, em pastilhas, tubos, potes, frascos, godês ou acondicionamentos semelhantes'),('3213.90.00','Outras','Extratos tanantes e tintoriais; taninos e seus derivados; pigmentos e outras matérias corantes, tintas e vernizes, mástiques; tintas de escrever - Cores para pintura artística, atividades educativas, pintura de tabuletas, modificação de tonalidades, recreação e cores semelhantes, em pastilhas, tubos, potes, frascos, godês ou acondicionamentos semelhantes'),('3304.99.90','Outros','Óleos essenciais e resinóides; produtos de perfumaria ou de toucador preparados e preparações cosméticas - Produtos de beleza ou de maquilagem preparados e preparações para conservação ou cuidados da pele (exceto medicamentos), incluídas as preparações antisolares e os bronzeadores; preparações para manicuros e pedicuros - Outros: - Outros'),('3305.10.00','Xampus','Óleos essenciais e resinóides; produtos de perfumaria ou de toucador preparados e preparações cosméticas - Preparações capilares'),('3305.90.00','Outras','Óleos essenciais e resinóides; produtos de perfumaria ou de toucador preparados e preparações cosméticas - Preparações capilares'),('3306.10.00','Dentifrícios','Óleos essenciais e resinóides; produtos de perfumaria ou de toucador preparados e preparações cosméticas - Preparações para higiene bucal ou dentária, incluídos os pós e cremes para facilitar a aderência de dentaduras; fios utilizados para limpar os espaços interdentais (fios dentais), em embalagens individuais para venda a retalho'),('3306.90.00','Outras','Óleos essenciais e resinóides; produtos de perfumaria ou de toucador preparados e preparações cosméticas - Preparações para higiene bucal ou dentária, incluídos os pós e cremes para facilitar a aderência de dentaduras; fios utilizados para limpar os espaços interdentais (fios dentais), em embalagens individuais para venda a retalho'),('3307.10.00','Preparações para barbear (antes, durante ou após)','Óleos essenciais e resinóides; produtos de perfumaria ou de toucador preparados e preparações cosméticas - Preparações para barbear (antes, durante ou após), desodorantes corporais, preparações para banhos, depilatórios, outros produtos de perfumaria ou de toucador preparados e outras preparações cosméticas, não especificados nem compreendidos em outras posições; desodorantes de ambiente, preparados, mesmo não perfumados, com ou sem propriedades desinfetantes'),('3307.20.10','Líquidos','Óleos essenciais e resinóides; produtos de perfumaria ou de toucador preparados e preparações cosméticas - Preparações para barbear (antes, durante ou após), desodorantes corporais, preparações para banhos, depilatórios, outros produtos de perfumaria ou de toucador preparados e outras preparações cosméticas, não especificados nem compreendidos em outras posições; desodorantes de ambiente, preparados, mesmo não perfumados, com ou sem propriedades desinfetantes - Desodorantes corporais e antiperspirantes'),('3307.20.90','Outros','Óleos essenciais e resinóides; produtos de perfumaria ou de toucador preparados e preparações cosméticas - Preparações para barbear (antes, durante ou após), desodorantes corporais, preparações para banhos, depilatórios, outros produtos de perfumaria ou de toucador preparados e outras preparações cosméticas, não especificados nem compreendidos em outras posições; desodorantes de ambiente, preparados, mesmo não perfumados, com ou sem propriedades desinfetantes - Desodorantes corporais e antiperspirantes'),('3401.30.00','Produtos e preparações orgânicos tensoativos para lavagem da pele, na forma de líquido ou de creme, acondicionados para venda a retalho, mesmo contendo sabão','Sabões, agentes orgânicos de superfície, preparações para lavagem, preparações lubrificantes, ceras artificiais, ceras preparadas, produtos de conservação e limpeza, velas e artigos semelhantes, massas ou pastas de modelar, &quot;ceras&quot; para dentistas e composições para dentista à base de gesso - Sabões; produtos e preparações orgânicos tensoativos utilizados como sabão, em barras, pães, pedaços ou figuras moldados, mesmo contendo sabão; produtos e preparações orgânicos tensoativos para lavagem da pele, em forma de líquido ou de creme, acondicionados para venda a retalho, mesmo contendo sabão; papel, pastas (?ouates?), feltros e falsos tecidos, impregnados, revestidos ou recobertos de sabão ou de detergentes'),('3402.20.00','Preparações acondicionadas para venda a retalho','Sabões, agentes orgânicos de superfície, preparações para lavagem, preparações lubrificantes, ceras artificiais, ceras preparadas, produtos de conservação e limpeza, velas e artigos semelhantes, massas ou pastas de modelar, &quot;ceras&quot; para dentistas e composições para dentista à base de gesso - Agentes orgânicos de superfície (exceto sabões); preparações tensoativas, preparações para lavagem (incluídas as preparações auxiliares para lavagem) e preparações para limpeza, mesmo contendo sabão, exceto as da posição 3401'),('3808.91.99','Outros','Produtos diversos das indústrias químicas - Inseticidas, rodenticidas, fungicidas, herbicidas, inibidores de germinação e reguladores de crescimento para plantas, desinfetantes e produtos semelhantes, apresentados em formas ou embalagens para venda a retalho ou como preparações ou ainda sob a forma de artigos, tais como fitas, mechas e velas sulfuradas e papel matamoscas - Outros: - Inseticidas - Outros'),('3924.10.00','Serviços de mesa e outros utensílios de mesa ou de cozinha','Plásticos e suas obras - Serviços de mesa e outros artigos de uso doméstico, de higiene ou de toucador, de plásticos'),('8305.90.00','Outros, incluídas as partes','Obras diversas de metais comuns - Ferragens para encadernação de folhas móveis ou para classificadores, molas para papéis, cantos para cartas, clipes, indicadores para fichas ou cavaleiros e objetos semelhantes de escritório, de metais comuns; grampos apresentados em barretas (por exemplo, de escritório, para atapetar, para embalagem), de metais comuns'),('9503.00.39','Outros','Brinquedos, jogos, artigos para divertimento ou para esporte; suas partes e acessórios - Triciclos, patinetes, carros de pedais e outros brinquedos semelhantes de rodas; carrinhos para bonecos; bonecos; outros brinquedos; modelos reduzidos e modelos semelhantes para divertimento, mesmo animados; quebracabeças (?puzzles?) de qualquer tipo - Brinquedos que representem animais ou seres não humanos');
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
  `id_estabelecimento` bigint(20) NOT NULL,
  `id_usuario` bigint(20) NOT NULL,
  `id_produto` bigint(20) NOT NULL,
  `valor` float(12,5) NOT NULL,
  `promo_datafim` datetime DEFAULT NULL,
  `promo_diasemana` int(11) DEFAULT NULL,
  `promo_qtde` float(12,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `preco_estabelecimento_id_fk` (`id_estabelecimento`),
  KEY `preco_usuario_id_fk` (`id_usuario`),
  KEY `preco_produto_id_fk` (`id_produto`),
  CONSTRAINT `preco_estabelecimento_id_fk` FOREIGN KEY (`id_estabelecimento`) REFERENCES `estabelecimento` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `preco_produto_id_fk` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `preco_usuario_id_fk` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
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
  `gtin` varchar(13) CHARACTER SET latin1 NOT NULL,
  `gtin_desc` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `gtin_pic` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `id_ncm` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `pais` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `id_gpc` varchar(8) CHARACTER SET latin1 DEFAULT NULL,
  `id_brand` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`gtin`),
  UNIQUE KEY `produto_gtin_uindex` (`id`),
  KEY `produto_gpc_id_fk` (`id_gpc`),
  KEY `produto_brand_id_fk` (`id_brand`),
  KEY `fk_ncm` (`id_ncm`),
  CONSTRAINT `fk_ncm` FOREIGN KEY (`id_ncm`) REFERENCES `ncm` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `produto_brand_id_fk` FOREIGN KEY (`id_brand`) REFERENCES `brand` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `produto_gpc_id_fk` FOREIGN KEY (`id_gpc`) REFERENCES `gpc` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=225 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (224,'027084033953',' PEEK-A-BLOCKS TUMBLIN\' SOUNDS GIRAFFE  ','027084033953','9503.00.39','Estados Unidos','86000000',177),(218,'0789856777091',' ASUS FONEPAD 7 3G 8 GB    ','07898567770916.jpg',NULL,'Brasil',NULL,173),(213,'3700123302360',' NESTLÉ AQUAREL SEM GÁS GARRAFA    ','3700123302360.jpg','2201.10.00','França',NULL,170),(222,'5010994811303',' JOGO HASBROTWISTER DANCE    ','5010994811303',NULL,'Reino Unido',NULL,175),(223,'746775302764',' MATTEL DISNEY PRINCESAS PRINCIPE BRILHA','746775302764.jpg',NULL,'Estados Unidos',NULL,176),(193,'7506195183373',' CD ORAL-B STAGES PERSONAGENS    ','7506195183373','3306.10.00','México',NULL,NULL),(200,'7791293022581',' DESODORANTE REXONA AEROSSOL XTRA COOL M','7791293022581.jpg','3307.20.10','Argentina',NULL,163),(196,'7891010031480',' HIGIAPELE JOHNSONS    ','7891010031480','3402.20.00','Brasil','53000000',159),(190,'7891022853155',' LAVA ROUPA MON BIJOU INTIMA    ','7891022853155.png','3402.20.00','Brasil',NULL,NULL),(186,'7891024027622',' ENX BUC PLAX LV500 PG350 ICE INFINITY  ','7891024027622.png','3306.90.00','Brasil',NULL,NULL),(179,'7891024131909',' COLGATE TRIPLA AÇÃO HORTELÃ    ','7891024131909.jpg','3306.10.00','Brasil','53000000',152),(187,'7891024136799',' COLGATE PLAX FRESH TEA    ','7891024136799.jpg','3306.90.00','Brasil',NULL,NULL),(181,'7891025106616',' AGUA MIN.BONAFONT MASCOTE    ','7891025106616.png','2201.10.00','Brasil','10000232',NULL),(192,'7891033195428',' LINHA NATIVA SPA BOTICARIO - LOCAO CREM','7891033195428',NULL,'Brasil',NULL,157),(201,'7891150001183',' SHAMPOO CLEAR MEN ANTICASPA ICE COOL ME','7891150001183.jpg','3305.10.00','Brasil','10000368',NULL),(199,'7891150007406',' SHAMPOO CLEAR MEN ANTICASPA ICE COOL ME','7891150007406.jpg','3305.10.00','Brasil','10000368',162),(183,'7891153020068',' GUACHE ACRILEX C6    ','7891153020068','3213.10.00','Brasil',NULL,NULL),(182,'7891153073217',' ACRILEX SOFT 6 CORES    ','7891153073217.jpg','3213.90.00','Brasil',NULL,NULL),(221,'7891219027130',' GROW SUPER MÁGICAS    ','7891219027130.jpg',NULL,'Brasil',NULL,174),(198,'7891350025187',' ESPUMA DE BARBEAR BOZZANO PROTECTION PA','7891350025187','3307.10.00','Brasil',NULL,161),(195,'7891350032154',' GEL FIXADOR BOZZANO CREME MODELADOR    ','7891350032154.jpg','3305.90.00','Brasil',NULL,158),(216,'7891528038827',' TANDY TUTTI FRUTTI    ','7891528038827.jpg','3306.10.00','Brasil',NULL,172),(208,'7891653011139',' GRECIN 5 SHAMPOO COLOR CASTANHO ESCURO ','7891653011139','3305.90.00','Brasil',NULL,168),(184,'7891962042206',' BISCOITO COOKIES INTEGRAIS BAUDUCCO CAC','7891962042206','1905.31.00','Brasil','10000161',NULL),(206,'7894650079423',' OFF FAMILY SPRAY    ','7894650079423','3808.91.99','Brasil','47000000',167),(180,'7894900010015',' REFRIGERANTE COCA-COLA    ','7894900010015.jpg','2202.10.00','Brasil','50000000',153),(215,'7894900300017',' SCHWEPPES TONICA LATA||REFRIGERANTES | ','7894900300017','2202.10.00','Brasil','50000000',171),(185,'7896002364775',' CROCANTÍSSIMO TOMATE, MANJERICÃO E AZEI','7896002364775.jpg','1904.10.00','Brasil',NULL,NULL),(202,'7896032659032',' CONDICIONADOR FARMAERVAS CHÁ VERDE    ','7896032659032','3305.90.00','Brasil','10000346',164),(203,'7896044955092',' CONDICIONADOR PHYTOERVAS OLEOSOS    ','7896044955092.jpg','3305.90.00','Brasil','10000346',165),(197,'7896094902237',' CENOURA E BRONZE KIDS FPS 30    ','7896094902237.jpg','3304.99.90','Brasil',NULL,160),(212,'7896094910904',' ADOÇANTE ZERO-CAL    ','7896094910904.jpg','2106.90.90','Brasil',NULL,169),(214,'7896102584189',' MAIONESE HEINZ FP    ','7896102584189.png','2103.90.11','Brasil',NULL,NULL),(194,'7896235320449',' NY. LOOKS MEGA FIXAÇÃO SEM ÁLCOOL AZUL ','7896235320449.jpg','3307.20.90','Brasil',NULL,NULL),(191,'7896512909824',' PHEBO NATURELLE SPRAY UNISSEX    ','7896512909824.jpg','3307.20.10','Brasil',NULL,156),(189,'7896512913708',' POLVILHO ANTISSÉPTICO GRANADO TRADICION','7896512913708','3004.90.99','Brasil',NULL,155),(217,'7896714201146',' IBUFRAN 600 MG 30 COMPRIMIDOS NEO QUÍMI','7896714201146','3004.90.99','Brasil',NULL,NULL),(219,'7897849621595',' BACCHI GRAMPEADOR COBRE 6 MILÍMETROS 50','7897849621595.jpg','8305.90.00','Brasil',NULL,NULL),(209,'7897888807479',' GEL ANTISEPTICO DETAGOLD 440G    ','7897888807479.png','3401.30.00','Brasil',NULL,NULL),(207,'7898085943847',' DAVENE INTENSA LEITE DE AVEIA    ','7898085943847.jpg','3307.20.90','Brasil',NULL,NULL),(188,'7898126400964',' GEL CREME HIDRATANTE PARA CABELO TANOGE','7898126400964','3305.90.00','Brasil',NULL,154),(220,'7898202616036',' COLHER REFEIÇÃO DESCARTÁVEL STRAWPLAST ','7898202616036','3924.10.00','Brasil',NULL,NULL),(205,'7899026435810',' OLEO ELSEVE EXTRAORDINARIO TRADIC    ','7899026435810','3305.90.00','Brasil',NULL,166),(211,'7899095201934',' ALBEL 400 MG GEOLAB SIMILAR    ','7899095201934.png','3004.90.63','Brasil',NULL,NULL),(210,'7899095201972',' ALBEL 40 MG/ML GEOLAB SIMILAR    ','7899095201972.png','3004.90.63','Brasil',NULL,NULL),(204,'8410895100167',' SHAMPOO INTEA REFLEXOS LOUROS 250 ML   ','8410895100167.jpg',NULL,'Espanha',NULL,NULL);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_tem_propriedade`
--

DROP TABLE IF EXISTS `produto_tem_propriedade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto_tem_propriedade` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_produto` bigint(20) NOT NULL,
  `id_propriedade` bigint(20) NOT NULL,
  `valor` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_produto` (`id_produto`),
  KEY `id_propriedade` (`id_propriedade`),
  CONSTRAINT `produto_tem_propriedade_ibfk_1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `produto_tem_propriedade_ibfk_2` FOREIGN KEY (`id_propriedade`) REFERENCES `propriedade` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1123 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_tem_propriedade`
--

LOCK TABLES `produto_tem_propriedade` WRITE;
/*!40000 ALTER TABLE `produto_tem_propriedade` DISABLE KEYS */;
INSERT INTO `produto_tem_propriedade` VALUES (866,179,38,'Pacote'),(867,179,39,'12'),(868,179,40,'50 g'),(869,179,41,'50 g'),(870,179,38,'Caixa'),(871,179,39,'1'),(872,179,42,'0.0 cm'),(873,179,43,'0.0 cm'),(874,179,44,'0.0 cm'),(875,179,40,'0 g'),(876,179,41,'0 g'),(877,180,38,'Lata'),(878,180,39,'1'),(879,180,42,'0.0 cm'),(880,180,43,'0.0 cm'),(881,180,44,'0.0 cm'),(882,180,40,'0 g'),(883,180,41,'0 g'),(884,181,38,'Unidade'),(885,181,39,'1'),(886,181,42,'0.0 cm'),(887,181,43,'0.0 cm'),(888,181,44,'0.0 cm'),(889,181,40,'0 g'),(890,181,41,'0 g'),(891,182,38,'Unidade'),(892,182,39,'1'),(893,183,38,'Unidade'),(894,183,39,'1'),(895,184,38,'Unidade'),(896,184,39,'1'),(897,184,42,'0.0 cm'),(898,184,43,'0.0 cm'),(899,184,44,'0.0 cm'),(900,184,40,'0 g'),(901,184,41,'0 g'),(902,185,38,'Unidade'),(903,185,39,'1'),(904,185,42,'0.0 cm'),(905,185,43,'0.0 cm'),(906,185,44,'0.0 cm'),(907,185,40,'0 g'),(908,185,41,'0 g'),(909,186,38,'Unidade'),(910,186,39,'1'),(911,186,42,'0.0 cm'),(912,186,43,'0.0 cm'),(913,186,44,'0.0 cm'),(914,186,40,'0 g'),(915,186,41,'0 g'),(916,187,38,'Caixa'),(917,187,39,'1'),(918,187,42,'0.0 cm'),(919,187,43,'0.0 cm'),(920,187,44,'0.0 cm'),(921,187,40,'0 g'),(922,187,41,'0 g'),(923,188,38,'Unidade'),(924,188,39,'1'),(925,188,42,'0.0 cm'),(926,188,43,'0.0 cm'),(927,188,44,'0.0 cm'),(928,188,40,'0 g'),(929,188,41,'0 g'),(930,189,38,'Caixa'),(931,189,39,'1'),(932,189,42,'0.0 cm'),(933,189,43,'0.0 cm'),(934,189,44,'0.0 cm'),(935,189,40,'0 g'),(936,189,41,'0 g'),(937,190,38,'Unidade'),(938,190,39,'1'),(939,190,40,'300 g'),(940,190,41,'300 g'),(941,191,38,'Unidade'),(942,191,39,'1'),(943,191,40,'90 g'),(944,191,41,'90 g'),(945,192,38,'Unidade'),(946,192,39,'1'),(947,192,40,'399 g'),(948,192,41,'399 g'),(949,193,38,'Caixa'),(950,193,39,'1'),(951,193,40,'75 g'),(952,193,41,'75 g'),(953,194,38,'Caixa'),(954,194,39,'1'),(955,194,42,'0.0 cm'),(956,194,43,'0.0 cm'),(957,194,44,'0.0 cm'),(958,194,40,'0 g'),(959,194,41,'0 g'),(960,195,38,'Caixa'),(961,195,39,'1'),(962,195,42,'0.0 cm'),(963,195,43,'0.0 cm'),(964,195,44,'0.0 cm'),(965,195,40,'0 g'),(966,195,41,'0 g'),(967,196,38,'Unidade'),(968,196,39,'1'),(969,196,42,'0.0 cm'),(970,196,43,'0.0 cm'),(971,196,44,'0.0 cm'),(972,196,40,'0 g'),(973,196,41,'0 g'),(974,197,38,'Unidade'),(975,197,39,'1'),(976,197,42,'0.0 cm'),(977,197,43,'0.0 cm'),(978,197,44,'0.0 cm'),(979,197,40,'0 g'),(980,197,41,'0 g'),(981,198,38,'Unidade'),(982,198,39,'1'),(983,198,42,'0.0 cm'),(984,198,43,'0.0 cm'),(985,198,44,'0.0 cm'),(986,198,40,'0 g'),(987,198,41,'0 g'),(988,199,38,'Caixa'),(989,199,39,'1'),(990,199,42,'0.0 cm'),(991,199,43,'0.0 cm'),(992,199,44,'0.0 cm'),(993,199,40,'0 g'),(994,199,41,'0 g'),(995,200,38,'Caixa'),(996,200,39,'1'),(997,200,42,'0.0 cm'),(998,200,43,'0.0 cm'),(999,200,44,'0.0 cm'),(1000,200,40,'0 g'),(1001,200,41,'0 g'),(1002,201,38,'Caixa'),(1003,201,39,'1'),(1004,201,42,'0.0 cm'),(1005,201,43,'0.0 cm'),(1006,201,44,'0.0 cm'),(1007,201,40,'0 g'),(1008,201,41,'0 g'),(1009,202,38,'Caixa'),(1010,202,39,'1'),(1011,202,40,'320 g'),(1012,202,41,'320 g'),(1013,203,38,'Caixa'),(1014,203,39,'1'),(1015,203,40,'250 g'),(1016,203,41,'250 g'),(1017,204,38,'Unidade'),(1018,204,39,'1'),(1019,205,38,'Unidade'),(1020,205,39,'1'),(1021,205,42,'0.0 cm'),(1022,205,43,'0.0 cm'),(1023,205,44,'0.0 cm'),(1024,205,40,'0 g'),(1025,205,41,'0 g'),(1026,205,38,'Caixa'),(1027,205,39,'12'),(1028,206,38,'Unidade'),(1029,206,39,'1'),(1030,206,42,'0.0 cm'),(1031,206,43,'0.0 cm'),(1032,206,44,'0.0 cm'),(1033,206,40,'0 g'),(1034,206,41,'0 g'),(1035,207,38,'Caixa'),(1036,207,39,'1'),(1037,207,42,'0.0 cm'),(1038,207,43,'0.0 cm'),(1039,207,44,'0.0 cm'),(1040,207,40,'0 g'),(1041,207,41,'0 g'),(1042,208,38,'Caixa'),(1043,208,39,'1'),(1044,208,40,'60 g'),(1045,208,41,'60 g'),(1046,209,38,'Unidade'),(1047,209,39,'1'),(1048,209,42,'0.0 cm'),(1049,209,43,'0.0 cm'),(1050,209,44,'0.0 cm'),(1051,209,40,'0 g'),(1052,209,41,'0 g'),(1053,210,38,'Unidade'),(1054,210,39,'1'),(1055,210,42,'0.0 cm'),(1056,210,43,'0.0 cm'),(1057,210,44,'0.0 cm'),(1058,210,40,'0 g'),(1059,210,41,'0 g'),(1060,211,38,'Unidade'),(1061,211,39,'1'),(1062,212,38,'Caixa'),(1063,212,39,'1'),(1064,212,42,'0.0 cm'),(1065,212,43,'0.0 cm'),(1066,212,44,'0.0 cm'),(1067,212,40,'0 g'),(1068,212,41,'0 g'),(1069,213,38,'Unidade'),(1070,213,39,'1'),(1071,213,42,'0.0 cm'),(1072,213,43,'0.0 cm'),(1073,213,44,'0.0 cm'),(1074,213,40,'0 g'),(1075,213,41,'0 g'),(1076,214,38,'Unidade'),(1077,214,39,'1'),(1078,214,42,'0.0 cm'),(1079,214,43,'0.0 cm'),(1080,214,44,'0.0 cm'),(1081,214,40,'0 g'),(1082,214,41,'0 g'),(1083,215,38,'Lata'),(1084,215,39,'1'),(1085,215,42,'0.0 cm'),(1086,215,43,'0.0 cm'),(1087,215,44,'0.0 cm'),(1088,215,40,'0 g'),(1089,215,41,'0 g'),(1090,216,38,'Caixa'),(1091,216,39,'1'),(1092,216,42,'0.0 cm'),(1093,216,43,'0.0 cm'),(1094,216,44,'0.0 cm'),(1095,216,40,'0 g'),(1096,216,41,'0 g'),(1097,217,38,'Caixa'),(1098,217,39,'1'),(1099,218,38,'Unidade'),(1100,218,39,'1'),(1101,219,38,'Unidade'),(1102,219,39,'1'),(1103,219,42,'0.0 cm'),(1104,219,43,'0.0 cm'),(1105,219,44,'0.0 cm'),(1106,219,40,'0 g'),(1107,219,41,'0 g'),(1108,220,38,'Unidade'),(1109,220,39,'1'),(1110,221,38,'Unidade'),(1111,221,39,'1'),(1112,222,38,'Unidade'),(1113,222,39,'1'),(1114,223,38,'Unidade'),(1115,223,39,'1'),(1116,224,38,'Unidade'),(1117,224,39,'1'),(1118,224,42,'10.0076 cm'),(1119,224,43,'32.9946 cm'),(1120,224,44,'21.9964 cm'),(1121,224,40,'1079 g'),(1122,224,41,'1079 g');
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
  `descricao` varchar(40) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `propriedade_id_uindex` (`id`),
  UNIQUE KEY `propriedade_descricao_uindex` (`descricao`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propriedade`
--

LOCK TABLES `propriedade` WRITE;
/*!40000 ALTER TABLE `propriedade` DISABLE KEYS */;
INSERT INTO `propriedade` VALUES (43,'altura'),(42,'comprimento'),(44,'largura'),(40,'peso bruto'),(41,'peso líquido'),(39,'quantidade da embalagem'),(38,'tipo da embalagem');
/*!40000 ALTER TABLE `propriedade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_estabelecimento`
--

DROP TABLE IF EXISTS `tipo_estabelecimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_estabelecimento` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) CHARACTER SET latin1 NOT NULL,
  `image` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tipo_estabelecimento_descricao_uindex` (`descricao`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_estabelecimento`
--

LOCK TABLES `tipo_estabelecimento` WRITE;
/*!40000 ALTER TABLE `tipo_estabelecimento` DISABLE KEYS */;
INSERT INTO `tipo_estabelecimento` VALUES (1,'Farmácia',NULL),(2,'Supermercado',NULL);
/*!40000 ALTER TABLE `tipo_estabelecimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_logradouro`
--

DROP TABLE IF EXISTS `tipo_logradouro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_logradouro` (
  `descricao` varchar(15) CHARACTER SET latin1 NOT NULL,
  `abrev` varchar(4) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`abrev`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_logradouro`
--

LOCK TABLES `tipo_logradouro` WRITE;
/*!40000 ALTER TABLE `tipo_logradouro` DISABLE KEYS */;
INSERT INTO `tipo_logradouro` VALUES ('Alameda','AL'),('Avenida','AV'),('Beco','BC'),('Estrada','ETR'),('Fazenda','FAZ'),('Galeria','GL'),('Largo','LGO'),('PraÃ§a','PÃ‡A'),('Parque','PRQ'),('Rua','R'),('Rodovia','ROD'),('Travessa','TRV'),('Viaduto','VD');
/*!40000 ALTER TABLE `tipo_logradouro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_usuario`
--

DROP TABLE IF EXISTS `tipo_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_usuario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(20) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_usuario`
--

LOCK TABLES `tipo_usuario` WRITE;
/*!40000 ALTER TABLE `tipo_usuario` DISABLE KEYS */;
INSERT INTO `tipo_usuario` VALUES (1,'normal'),(2,'estabelecimento');
/*!40000 ALTER TABLE `tipo_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uf`
--

DROP TABLE IF EXISTS `uf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uf` (
  `cod` char(2) CHARACTER SET latin1 NOT NULL,
  `nome` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uf`
--

LOCK TABLES `uf` WRITE;
/*!40000 ALTER TABLE `uf` DISABLE KEYS */;
INSERT INTO `uf` VALUES ('RS','Rio Grande do Sul');
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
  `iteracoes` int(11) NOT NULL,
  `passwd` char(64) NOT NULL,
  `salt` char(32) DEFAULT NULL,
  `tipo` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario_login_uindex` (`login`),
  KEY `usuario_tipo_usuario_id_fk` (`tipo`),
  CONSTRAINT `usuario_tipo_usuario_id_fk` FOREIGN KEY (`tipo`) REFERENCES `tipo_usuario` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (2,'brlaranjeira','Bruno','Rezende Laranjeira',20000,'33ea555c480da03e8ad12914a80c0ce986287cd5595de25adeb054a67a298ce6','NòY;½ºoG–Sw¼+œ-T\Z-mH¥æ¹™­G',1),(3,'arlaranjeira','Arthur','Rezende Laranjeira',50000,'af53dcd74552547f5c987676238c2978ed44cdefdbb76b2c58da22db8001208d','\\­KphñF\n\0mzýb*A#¬1:Q©%Nò•=E',1),(5,'xyz','AA','BB',30000,'add5842b2edc4e071bfa0dfbd943827ca1c8002714d45c3d10186b54b5a42a40','z¢ÜC™{Z}r,Á8iO=~„I}×X`RA¼sK',1);
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

-- Dump completed on 2017-07-06 10:04:33
