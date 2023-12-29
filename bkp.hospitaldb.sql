CREATE DATABASE  IF NOT EXISTS `hospital_db_matheusleal` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hospital_db_matheusleal`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hospital_db_matheusleal
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `consulta`
--

DROP TABLE IF EXISTS `consulta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consulta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data_hora` datetime DEFAULT NULL,
  `valor_consulta` decimal(9,2) DEFAULT NULL,
  `medico_id` int NOT NULL,
  `paciente_id` int NOT NULL,
  `convenio_id` int DEFAULT NULL,
  `especialidade_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `medico_id` (`medico_id`),
  KEY `paciente_id` (`paciente_id`),
  KEY `convenio_id` (`convenio_id`),
  KEY `especialidade_id` (`especialidade_id`),
  CONSTRAINT `consulta_ibfk_1` FOREIGN KEY (`medico_id`) REFERENCES `medico` (`id`),
  CONSTRAINT `consulta_ibfk_2` FOREIGN KEY (`paciente_id`) REFERENCES `paciente` (`id`),
  CONSTRAINT `consulta_ibfk_3` FOREIGN KEY (`convenio_id`) REFERENCES `convenio` (`id`),
  CONSTRAINT `consulta_ibfk_4` FOREIGN KEY (`especialidade_id`) REFERENCES `especialidade` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consulta`
--

LOCK TABLES `consulta` WRITE;
/*!40000 ALTER TABLE `consulta` DISABLE KEYS */;
INSERT INTO `consulta` VALUES (1,'2020-07-18 16:00:00',3250.59,1,6,4,5),(2,'2017-02-05 09:15:00',976.89,3,1,NULL,9),(3,'2020-09-10 10:40:00',557.19,4,9,1,10),(4,'2022-03-11 11:00:00',897.76,4,8,4,1),(5,'2020-12-19 08:00:00',698.90,9,12,5,1),(6,'2020-06-01 18:00:00',785.40,14,7,NULL,6),(7,'2018-04-09 19:00:00',645.90,5,11,2,8),(8,'2020-09-12 17:30:00',1298.90,2,10,1,2),(9,'2020-03-27 14:45:00',150.98,6,5,NULL,4),(10,'2019-05-26 07:30:00',345.90,7,2,3,9),(11,'2020-07-29 05:10:00',267.89,10,3,4,4),(12,'2021-09-12 13:30:00',596.90,8,4,2,7),(13,'2020-01-10 14:10:00',925.30,1,6,4,7),(14,'2020-08-15 01:30:00',745.90,2,5,NULL,2),(15,'2020-09-25 06:30:00',438.90,10,6,4,2);
/*!40000 ALTER TABLE `consulta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `convenio`
--

DROP TABLE IF EXISTS `convenio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `convenio` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cpnj` varchar(45) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `tempo_de_carencia` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `convenio`
--

LOCK TABLES `convenio` WRITE;
/*!40000 ALTER TABLE `convenio` DISABLE KEYS */;
INSERT INTO `convenio` VALUES (1,'12342255000111','Hapvida','90 dias'),(2,'53241590000100','Amil',' 45 dias'),(3,'31637057000120','Unimed',' 30 dias '),(4,'49832257000107','Sulamérica Saúde',' 180 dias '),(5,'86018953000100','Bradesco Saúde',' 60 dias ');
/*!40000 ALTER TABLE `convenio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cep` varchar(45) NOT NULL,
  `numero_casa` varchar(45) NOT NULL,
  `lagradouro` varchar(45) NOT NULL,
  `barrio` varchar(45) NOT NULL,
  `cidade` varchar(45) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `medico_id` int NOT NULL,
  `paciente_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `medico_id` (`medico_id`),
  KEY `paciente_id` (`paciente_id`),
  CONSTRAINT `endereco_ibfk_1` FOREIGN KEY (`medico_id`) REFERENCES `medico` (`id`),
  CONSTRAINT `endereco_ibfk_2` FOREIGN KEY (`paciente_id`) REFERENCES `paciente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enfermeiro`
--

DROP TABLE IF EXISTS `enfermeiro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enfermeiro` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `cpf` char(11) NOT NULL,
  `cre` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cpf` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enfermeiro`
--

LOCK TABLES `enfermeiro` WRITE;
/*!40000 ALTER TABLE `enfermeiro` DISABLE KEYS */;
INSERT INTO `enfermeiro` VALUES (1,'Andréia Leal','78897480004','134980'),(2,'Daiana Duarte','66775491000','875135'),(3,'Maria Valdate Santos','96772173210','562802'),(4,'Maria Rosa OLiveira','23533789276',' 934647'),(5,'Marcio Silva','54685854721','092867'),(6,' Ana maria Souzar Soares','37106940437','283517');
/*!40000 ALTER TABLE `enfermeiro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidade`
--

DROP TABLE IF EXISTS `especialidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especialidade` (
  `id` int NOT NULL AUTO_INCREMENT,
  `especialidade` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidade`
--

LOCK TABLES `especialidade` WRITE;
/*!40000 ALTER TABLE `especialidade` DISABLE KEYS */;
INSERT INTO `especialidade` VALUES (1,'pediatria'),(2,'clínica geral'),(3,'gastroenterologia'),(4,'dermatologia'),(5,'Cardiologia'),(6,'Neurologia'),(7,'Urologia'),(8,'Hepatologia'),(9,'Endocrinologia'),(10,'Reumatologia');
/*!40000 ALTER TABLE `especialidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ineternacao_enfermeiro`
--

DROP TABLE IF EXISTS `ineternacao_enfermeiro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ineternacao_enfermeiro` (
  `id_internacao` int NOT NULL,
  `id_enfermeiro` int NOT NULL,
  PRIMARY KEY (`id_internacao`,`id_enfermeiro`),
  KEY `id_enfermeiro` (`id_enfermeiro`),
  CONSTRAINT `ineternacao_enfermeiro_ibfk_1` FOREIGN KEY (`id_internacao`) REFERENCES `internacao` (`id`),
  CONSTRAINT `ineternacao_enfermeiro_ibfk_2` FOREIGN KEY (`id_enfermeiro`) REFERENCES `enfermeiro` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ineternacao_enfermeiro`
--

LOCK TABLES `ineternacao_enfermeiro` WRITE;
/*!40000 ALTER TABLE `ineternacao_enfermeiro` DISABLE KEYS */;
INSERT INTO `ineternacao_enfermeiro` VALUES (2,1),(4,1),(7,1),(3,2),(5,2),(1,3),(6,3),(1,4),(5,4),(7,4),(3,5),(2,6),(4,6),(6,6);
/*!40000 ALTER TABLE `ineternacao_enfermeiro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `internacao`
--

DROP TABLE IF EXISTS `internacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `internacao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data_entrada` datetime DEFAULT NULL,
  `data_prev_alta` date DEFAULT NULL,
  `data_alta` datetime DEFAULT NULL,
  `procedimento` text,
  `quarto_id` int NOT NULL,
  `medico_id` int NOT NULL,
  `paciente_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `quarto_id` (`quarto_id`),
  KEY `medico_id` (`medico_id`),
  KEY `paciente_id` (`paciente_id`),
  CONSTRAINT `internacao_ibfk_1` FOREIGN KEY (`quarto_id`) REFERENCES `quarto` (`id`),
  CONSTRAINT `internacao_ibfk_2` FOREIGN KEY (`medico_id`) REFERENCES `medico` (`id`),
  CONSTRAINT `internacao_ibfk_3` FOREIGN KEY (`paciente_id`) REFERENCES `paciente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `internacao`
--

LOCK TABLES `internacao` WRITE;
/*!40000 ALTER TABLE `internacao` DISABLE KEYS */;
INSERT INTO `internacao` VALUES (1,'2020-07-16 16:18:00','2020-07-20','2020-07-19 16:18:00','Cistolitotomia: Remoção de cálculos (pedras) na bexiga.',2,8,1),(2,'2021-09-10 10:00:00','2021-09-15','2021-09-13 10:00:00','Vasectomia: Procedimento contraceptivo masculino que envolve a ligadura ou corte dos ductos deferentes.\n',5,13,11),(3,'2020-03-05 09:30:00','2020-03-08','2020-03-08 09:30:00','Excisão de Lesões Cutâneas: Procedimento para remoção cirúrgica de lesões cutâneas, como tumores, cistos ou outros crescimentos anormais.\n',1,6,6),(4,'2022-09-20 06:08:00','2022-09-25','2022-09-23 06:08:00','Cistectomia: Remoção parcial ou total da bexiga, geralmente realizada em casos de câncer de bexiga.\n',4,13,1),(5,'2017-01-26 18:00:00','2017-01-30','2017-01-29 18:00:00','Ablação por Cateter: Utilização de calor, frio ou energia de radiofrequência para destruir tecido cardíaco que pode estar causando arritmias.',3,7,10),(6,'2022-02-05 08:00:00','2022-02-09','2022-02-08 08:00:00','Cateterismo Cardíaco: Um cateter é inserido em uma artéria ou veia para diagnosticar e tratar problemas cardíacos, como bloqueios nas artérias coronárias.\n',5,1,10),(7,'2019-06-17 15:00:00','2019-06-21','2019-06-20 15:00:00','Polissectomia Endoscópica: Remoção de pólipos durante uma endoscopia para prevenir o desenvolvimento de câncer colorretal.',2,5,9);
/*!40000 ALTER TABLE `internacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medico`
--

DROP TABLE IF EXISTS `medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medico` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) NOT NULL,
  `cpf` char(11) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `rg` char(9) NOT NULL,
  `data_nascimento` date NOT NULL,
  `crm` varchar(10) DEFAULT NULL,
  `uf_crm` varchar(45) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `em_atividade` bit(1) DEFAULT (1),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medico`
--

LOCK TABLES `medico` WRITE;
/*!40000 ALTER TABLE `medico` DISABLE KEYS */;
INSERT INTO `medico` VALUES (1,'Helen Duarte Leite ','45434376080',NULL,'462409429','2000-04-02','061223','BA','(71) 9964-7637',_binary ''),(2,'Suéli Simão Pegado','62876978067',NULL,'237072737','1990-08-27','15891','SP','(71) 9964-7637',_binary ''),(3,'Alisson Sacramento ','80814279023',NULL,'140650064','1981-01-15','178105','Minas','(79) 2718-0264',_binary ''),(4,'Lívia Veloso','20924987030',NULL,'223103603','1972-03-22','17897','Minas','(61) 3019-1483',_binary ''),(5,'Gael Milheiro Lemes','38603737061',NULL,'270223666','1964-02-13','9826','RS','(82) 2433-7762',_binary ''),(6,'Gisela Espinosa','23529091049',NULL,'401743950','1980-09-12','34548','SP','(86) 3368-4812',_binary ''),(7,'Nelson Anjos Palmeira','03626639045',NULL,'265605726','1980-10-14','344789','SP','(54) 3941-4795',_binary ''),(8,'Ezequiel Pestana Henriques','67297959057',NULL,'389519959','1979-06-30','9756','RS','(69) 2537-6076',_binary ''),(9,'Tito Carqueijeiro','74588651056',NULL,'377488082','1973-05-19','14777','RS','(83) 3272-8326',_binary ''),(10,'Fabiano Gomide','32972518080',NULL,'126961797','1989-08-31','65765','RS','(63) 3230-5071',_binary ''),(11,'Cristovão Xavier','92690490005',NULL,'197373860','1979-12-12','67432','RS','(24) 2448-9465',_binary '\0'),(12,'Alberto Veríssimo','70600178013',NULL,'185796801','1986-06-26','13548','SP','(67) 3754-8886',_binary '\0'),(13,'Júlia Camarinho','74492596054',NULL,'481756346','1980-07-05','24654','MG','(61) 2615-4776',_binary '\0'),(14,'Anny Quintanilha ','86132473009',NULL,'159592872','1970-11-10','120935','RS','(69) 3752-5488',_binary '');
/*!40000 ALTER TABLE `medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medico_especialidade`
--

DROP TABLE IF EXISTS `medico_especialidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medico_especialidade` (
  `id_medico` int NOT NULL,
  `id_especialidade` int NOT NULL,
  PRIMARY KEY (`id_medico`,`id_especialidade`),
  KEY `id_especialidade` (`id_especialidade`),
  CONSTRAINT `medico_especialidade_ibfk_1` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id`),
  CONSTRAINT `medico_especialidade_ibfk_2` FOREIGN KEY (`id_especialidade`) REFERENCES `especialidade` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medico_especialidade`
--

LOCK TABLES `medico_especialidade` WRITE;
/*!40000 ALTER TABLE `medico_especialidade` DISABLE KEYS */;
INSERT INTO `medico_especialidade` VALUES (4,1),(9,1),(12,1),(2,2),(10,2),(3,3),(5,3),(6,3),(5,4),(6,4),(10,4),(1,5),(7,5),(1,6),(11,6),(14,6),(1,7),(8,7),(13,7),(5,8),(3,9),(7,9),(4,10),(9,10);
/*!40000 ALTER TABLE `medico_especialidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `cpf` char(11) DEFAULT NULL,
  `rg` char(9) DEFAULT NULL,
  `convenio_id` int DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cpf` (`cpf`),
  KEY `convenio_id` (`convenio_id`),
  CONSTRAINT `paciente_ibfk_1` FOREIGN KEY (`convenio_id`) REFERENCES `convenio` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` VALUES (1,'Mauro José dos Santos',NULL,'1945-07-12','42733582046','115685844',NULL,NULL),(2,'Emerson Pereira Silva',NULL,'2005-07-01','87884326370','348569737',3,NULL),(3,'Murilo Galvão',NULL,'2003-12-06','74570884580','288790133',4,NULL),(4,'Maria Joana Soares',NULL,'2000-01-23','53253754669','442092805',2,NULL),(5,'Liz Leal',NULL,'2004-09-10','76170645601','472175014',NULL,NULL),(6,'Matheus Henrique de Jesus Leal',NULL,'2006-06-29','84361317976','141233059',4,NULL),(7,'Kamily dos Santos Leite',NULL,'2005-02-17','77358846052','181912855',NULL,NULL),(8,'Mayla Leal Souza',NULL,'2021-12-02','02820882293','504245831',4,NULL),(9,'Antonio de Jesus',NULL,'1967-04-27','37962122129','370967847',1,NULL),(10,'Claudomiro Souza Neto filho',NULL,'1977-08-09','02212185804','339846434',1,NULL),(11,'Luiz Henrique dos Santos Leal',NULL,'1986-05-27','89208195724','464136891',2,NULL),(12,'Maria Luiza Souza',NULL,'2020-12-09','79771837818','180452174',5,NULL);
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quarto`
--

DROP TABLE IF EXISTS `quarto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quarto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `numero` int NOT NULL,
  `tp_quarto_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tp_quarto_id` (`tp_quarto_id`),
  CONSTRAINT `quarto_ibfk_1` FOREIGN KEY (`tp_quarto_id`) REFERENCES `tipo_quarto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quarto`
--

LOCK TABLES `quarto` WRITE;
/*!40000 ALTER TABLE `quarto` DISABLE KEYS */;
INSERT INTO `quarto` VALUES (1,10,1),(2,11,2),(3,12,3),(4,13,4),(5,14,5);
/*!40000 ALTER TABLE `quarto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receita`
--

DROP TABLE IF EXISTS `receita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receita` (
  `id` int NOT NULL AUTO_INCREMENT,
  `consulta_id` int NOT NULL,
  `prescricoes` text,
  PRIMARY KEY (`id`),
  KEY `consulta_id` (`consulta_id`),
  CONSTRAINT `receita_ibfk_1` FOREIGN KEY (`consulta_id`) REFERENCES `consulta` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receita`
--

LOCK TABLES `receita` WRITE;
/*!40000 ALTER TABLE `receita` DISABLE KEYS */;
INSERT INTO `receita` VALUES (1,2,'\n1. Medicação A:\n    Nome Comercial: GlucoControl\n    Princípio Ativo: Metformina\n    Posologia: 500 mg/dia, Manhã\n    Instruções Específicas: Tomar antes da refeição.\n   2. Medicação B:\n    Nome Comercial: ThyroMax\n    Princípio Ativo: Levotiroxina\n    Posologia: 50 mcg/dia, Manhã\n    Instruções Específicas: Tomar em jejum.'),(2,4,'1. Vitamina A:\n   Nome Comercial: PedVit\n   Posologia: 1 mL/dia, Manhã\n   Instruções Específicas: Administrar durante ou após a refeição.\n   2. Antitérmico:\n   Nome Comercial: Febrolin Infantil\n   Posologia: Conforme necessário para febre acima de 38°C.\n   Instruções Específicas: Seguir as orientações do rótulo. Não ultrapassar a dose recomendada.'),(3,5,' 1.Suplemento de Ferro:\n   Nome Comercial: FerroKids\n   Posologia: 5 mL/dia, Manhã\n   Instruções Específicas: Administrar antes do café da manhã. Evitar misturar com produtos lácteos.\n   2. Vitamina D:\n   Nome Comercial: D3Kids\n   Posologia: 400 UI/dia, Manhã\n   Instruções Específicas: Pode ser administrada diretamente ou misturada com alimentos.'),(4,7,'1. HepaProtect:\n   Nome Comercial: HepaGuard\n   Princípio Ativo: Silimarina\n   Posologia: 150 mg/dia, Manhã e Noite\n   Instruções Específicas: Tomar com o estômago vazio.\n   2. Ácido Ursodesoxicólico:\n   Nome Comercial: Ursoliv\n   Posologia: 300 mg/dia, Noite\n   Instruções Específicas: Tomar após a última refeição.'),(5,9,'\n   1. Creme para Acne:\n   Nome Comercial: DermaClear\n   Princípio Ativo: Peróxido de Benzoíla\n   Posologia: Aplicar uma fina camada na área afetada, à noite.\n   Instruções Específicas: Lavar o rosto antes da aplicação. Evitar contato com os olhos.\n   2. Protetor Solar:\n   Nome Comercial: SunGuard\n   Fator de Proteção Solar (FPS): 30\n   Posologia: Aplicar generosamente todas as manhãs, mesmo em dias nublados.\n   Instruções Específicas: Reaplicar a cada 2 horas se exposto ao sol.'),(6,12,' 1. Medicação para Hiperplasia Prostática:\n	Nome Comercial: ProstaRelief\n    Princípio Ativo: Tansulosina\n    Posologia: 0,4 mg/dia, Noite\n    Instruções Específicas: Tomar antes de dormir.\n\n   2. Suplemento para Saúde da Próstata:**\n   Nome Comercial: UroVit\n   Componentes Ativos: Saw Palmetto, Zinco, Selênio\n   Posologia: 1 comprimido/dia, Manhã\n   Instruções Específicas: Pode ser tomado com ou sem alimentos.');
/*!40000 ALTER TABLE `receita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_quarto`
--

DROP TABLE IF EXISTS `tipo_quarto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_quarto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descricao` text NOT NULL,
  `valor_diaria` decimal(9,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_quarto`
--

LOCK TABLES `tipo_quarto` WRITE;
/*!40000 ALTER TABLE `tipo_quarto` DISABLE KEYS */;
INSERT INTO `tipo_quarto` VALUES (1,'Suíte Master :  Ideal para famílias, esta suíte espaçosa oferece dois quartos interligados.\n Decoração moderna, área de estar e comodidades pensadas para garantir conforto a todos.',2545.99),(2,'Suíte Exucutiva:  Sofisticação encontra conforto nesta suíte executiva com um terraço privativo. \nEspaço amplo, área de estar aconchegante e vistas panorâmicas para relaxar. ',1789.90),(3,'Quarto Standard:  Um refúgio acolhedor com uma vista deslumbrante da cidade. \nDecoração moderna, cama confortável e todas as comodidades essenciais para uma estadia agradável.',590.90),(4,'Quarto Standard com Varanda Privativa: Charme e simplicidade se encontram neste quarto com varanda privativa. \nPerfeito para relaxar ao ar livre e apreciar a atmosfera tranquila.',790.00),(5,'Quarto Deluxe com Vista para o Mar : Desfrute de uma estadia luxuosa neste quarto espaçoso com uma deslumbrante vista para o mar.\n Decoração elegante, cama king-size e amenidades exclusivas para uma experiência única.',1250.00);
/*!40000 ALTER TABLE `tipo_quarto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'hospital_db_matheusleal'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-17 19:39:01
