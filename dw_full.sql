
--
-- Table structure for table `dim_animal`
--

DROP TABLE IF EXISTS `dim_animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_animal` (
  `id_animal` int NOT NULL,
  `nm_animal` varchar(45) NOT NULL,
  `raca` varchar(45) NOT NULL,
  `dt_nascimento` int NOT NULL,
  PRIMARY KEY (`id_animal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_animal`
--

LOCK TABLES `dim_animal` WRITE;
/*!40000 ALTER TABLE `dim_animal` DISABLE KEYS */;
INSERT INTO `dim_animal` VALUES (1,'Pitoco','Labrador',20100305),(2,'Chico','Vira-Lata',20150108),(3,'Zuka','Golden-Retriever',20110502),(4,'Jade','Poodle',20105010),(5,'Bolinha','ChowChow',20101002),(6,'Nick','Poodle',20111005),(7,'Mel','Vira-Lata',20091201),(8,'Lala','Pitbull',20180914);
/*!40000 ALTER TABLE `dim_animal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_cliente`
--

DROP TABLE IF EXISTS `dim_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_cliente` (
  `id_cliente` bigint NOT NULL,
  `nm_cliente` varchar(90) NOT NULL,
  `dt_nascimento` int NOT NULL,
  `genero` varchar(15) NOT NULL,
  `end_cliente` varchar(120) NOT NULL,
  `cidade` varchar(120) NOT NULL,
  `uf` varchar(90) NOT NULL,
  `pais` varchar(120) NOT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_cliente`
--

LOCK TABLES `dim_cliente` WRITE;
/*!40000 ALTER TABLE `dim_cliente` DISABLE KEYS */;
INSERT INTO `dim_cliente` VALUES (12345678912,'Luisa Possi',19800206,'feminino','rua do piolho 765','Rio de Janeiro','RJ','Brasil'),(12345678913,'Bruna Sales',19750605,'feminino','rua da manga 89','Rio de Janeiro','RJ','Brasil'),(12345678914,'Paulo Parloto',19771030,'masculino','rua do gomes fialho','Rio de Janeiro','RJ','Brasil'),(12345678915,'Luis Silva',19790610,'masculino','avenida do galo','Belo Horizonte','MG','Brasil'),(12345678916,'Rafael Moloto',19850512,'masculino','Rua do Carmo','Goiânia','GO','Brasil'),(12345678917,'Valéria Gomes',19690503,'feminino','Avenida Molina','Sãp Paulo','SP','Brasil'),(12345678918,'Milena Silva',19910610,'feminino','Avenida Afonso Pena','Goiânia','GO','Brasil'),(12345678919,'Marcos Pontes',19820708,'masculino','Rua do Ouvidor','Rio de Janeiro','RJ','Brasil');
/*!40000 ALTER TABLE `dim_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_empregado`
--

DROP TABLE IF EXISTS `dim_empregado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_empregado` (
  `id_empregado` bigint NOT NULL,
  `nome` varchar(128) NOT NULL,
  `sobrenome` varchar(128) NOT NULL,
  `dt_nascimento` int NOT NULL,
  PRIMARY KEY (`id_empregado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_empregado`
--

LOCK TABLES `dim_empregado` WRITE;
/*!40000 ALTER TABLE `dim_empregado` DISABLE KEYS */;
INSERT INTO `dim_empregado` VALUES (98765432142,'Guilia','Sampaio',19910308),(98765432145,'Paulo','Dantas',19800524),(98765432146,'Barroso','Lima',19761204),(98765432147,'Marcos','Silva',19861115),(98765432148,'Vitória','Silva',19901204),(98765432149,'Maria','Vilioa',19950514);
/*!40000 ALTER TABLE `dim_empregado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_fornecedor`
--

DROP TABLE IF EXISTS `dim_fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_fornecedor` (
  `id_fornecedor` bigint NOT NULL,
  `end_fornecedor` varchar(255) NOT NULL,
  `cidade` varchar(120) NOT NULL,
  `uf` varchar(70) NOT NULL,
  `pais` varchar(100) NOT NULL,
  PRIMARY KEY (`id_fornecedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_fornecedor`
--

LOCK TABLES `dim_fornecedor` WRITE;
/*!40000 ALTER TABLE `dim_fornecedor` DISABLE KEYS */;
INSERT INTO `dim_fornecedor` VALUES (12345678932105,'Avenida Presidente Vargas 100','Rio de Janeiro','RJ','Brasil'),(12345678932106,'Rua Pedro Ernesto 111','Rio de Janeiro','RJ','Brasil'),(12345678932108,'Avenida Macarenhas Bolina','São Paulo','SP','Brasil'),(12345678932109,'Rua Braga Borges','Belo Horizonte','MG','Brasil');
/*!40000 ALTER TABLE `dim_fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_loja`
--

DROP TABLE IF EXISTS `dim_loja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_loja` (
  `id_loja` bigint NOT NULL,
  `end_loja` varchar(120) NOT NULL,
  `cidade` varchar(120) NOT NULL,
  `regiao` varchar(90) NOT NULL,
  `uf` varchar(90) NOT NULL,
  PRIMARY KEY (`id_loja`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_loja`
--

LOCK TABLES `dim_loja` WRITE;
/*!40000 ALTER TABLE `dim_loja` DISABLE KEYS */;
INSERT INTO `dim_loja` VALUES (98765432145677,'Avenida Tancredo Neves 123','Belo Horizonte','Sudeste','MG'),(98765432145678,'Avenida Gomes Freire 345','Rio de Janeiro','Sudeste','RJ'),(98765432145679,'Avenida Mario Covas','São Paulo','Sudeste','SP');
/*!40000 ALTER TABLE `dim_loja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_produto`
--

DROP TABLE IF EXISTS `dim_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_produto` (
  `id_produto` int NOT NULL,
  `nm_produto` varchar(255) NOT NULL,
  `tipo_produto` varchar(255) NOT NULL,
  PRIMARY KEY (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_produto`
--

LOCK TABLES `dim_produto` WRITE;
/*!40000 ALTER TABLE `dim_produto` DISABLE KEYS */;
INSERT INTO `dim_produto` VALUES (1,'Coleira Confort - K9 Spirit','Coleira'),(2,'Shampoo Antialérgico - Recover','Shampoo'),(3,'Shampoo Natural de Neem - Higiene e Hidratação','Shampoo'),(4,'Sabonete Vegano e Natural de Neem - Para cuidado da pele - Preserva Mundi - 120g','Sabonete'),(5,'Shampoo Tradicional Propovets','Shampoo'),(6,'Chifre de Búfalo Mastigável Natural - Pure Toy','Petiscos'),(7,'Lenços Umedecidos com Álcool Gel para Pets - Alcat Pata Lenço','Higiene'),(8,'Pó de Neem - Suplemento Pet - Tratamento Fitoterápico contra Pragas - 100gramas','Suplemento');
/*!40000 ALTER TABLE `dim_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_promocao`
--

DROP TABLE IF EXISTS `dim_promocao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_promocao` (
  `id_promocao` int NOT NULL,
  `nm_promocao` varchar(90) NOT NULL,
  `tipo_cupom` varchar(45) NOT NULL,
  `dt_inicio_promocao` int NOT NULL,
  `dt_fim_promocao` int NOT NULL,
  `custo_promocao` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_promocao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_promocao`
--

LOCK TABLES `dim_promocao` WRITE;
/*!40000 ALTER TABLE `dim_promocao` DISABLE KEYS */;
INSERT INTO `dim_promocao` VALUES (1,'Cão Alegria','voucher',20191005,20191020,1200.00),(2,'Gato Sabão','fidelizacao',20201108,20201130,1000.00),(3,'Animal Limp','desconto',20200501,20200530,800.00);
/*!40000 ALTER TABLE `dim_promocao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_tempo`
--

DROP TABLE IF EXISTS `dim_tempo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_tempo` (
  `id` int NOT NULL,
  `db_data` date NOT NULL,
  `ano` int NOT NULL,
  `mes` int NOT NULL,
  `dia` int NOT NULL,
  `trimestre` int NOT NULL,
  `semana` int NOT NULL,
  `nm_dia` varchar(9) NOT NULL,
  `nm_mes` varchar(9) NOT NULL,
  `feriado_flag` char(1) DEFAULT 'f',
  `fim_de_semana_flag` char(1) DEFAULT 'f',
  PRIMARY KEY (`id`),
  UNIQUE KEY `td_ymd_idx` (`ano`,`mes`,`dia`),
  UNIQUE KEY `td_dbdate_idx` (`db_data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;