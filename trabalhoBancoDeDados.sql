CREATE DATABASE  IF NOT EXISTS `gestao_hoteleira` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `gestao_hoteleira`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: gestao_hoteleira
-- ------------------------------------------------------
-- Server version	5.7.31

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
-- Table structure for table `acomodacao`
--

DROP TABLE IF EXISTS `acomodacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acomodacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `valor_diaria` float(9,2) NOT NULL,
  `limite_hospedes` int(11) NOT NULL,
  `descricao` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acomodacao`
--

LOCK TABLES `acomodacao` WRITE;
/*!40000 ALTER TABLE `acomodacao` DISABLE KEYS */;
INSERT INTO `acomodacao` VALUES (1,'Chalé Família',400.00,5,'Isto é uma descrição.'),(2,'Suíte Executiva',250.00,4,'Suíte espaçosa com sala de estar e vista panorâmica.'),(3,'Cabana Familiar',300.00,6,'Cabana ideal para famílias com área de lazer privativa.'),(4,'Apartamento Luxo',200.00,3,'Apartamento elegante com amenities de luxo.'),(5,'Chalé Romântico',180.00,2,'Chalé aconchegante para casais em busca de romance.'),(6,'Villa Familiar',400.00,7,'Villa com piscina privativa e espaço amplo para a família.'),(7,'Bangalô de Luxo',280.00,4,'Bangalô com vista para o mar e serviços exclusivos.'),(8,'Quarto Duplo',150.00,2,'Quarto com duas camas de solteiro.'),(9,'Suíte Presidencial',500.00,8,'Suíte luxuosa com todas as comodidades.'),(10,'Apto. Panorâmico',300.00,5,'Apartamento com varanda panorâmica e decoração moderna.'),(11,'Quarto Standard',120.00,2,'Quarto simples com cama de casal.');
/*!40000 ALTER TABLE `acomodacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `cli_reservas`
--

DROP TABLE IF EXISTS `cli_reservas`;
/*!50001 DROP VIEW IF EXISTS `cli_reservas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cli_reservas` AS SELECT 
 1 AS `#`,
 1 AS `Nome completo`,
 1 AS `Data nascimento`,
 1 AS `Documento de Registro`,
 1 AS `Cidade`,
 1 AS `Estado`,
 1 AS `País`,
 1 AS `Fidelidade`,
 1 AS `qtdReserva`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pessoa` int(11) NOT NULL,
  `fidelidade` tinyint(1) NOT NULL DEFAULT '0',
  `observacao` text,
  PRIMARY KEY (`id`),
  KEY `cliente_pessoa_idx` (`id_pessoa`),
  CONSTRAINT `cliente_pessoa_fk` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,1,1,'\'Cliente VIP\''),(2,2,0,'Sem Fidelidade'),(3,3,1,'Cliente corporativo'),(4,4,0,'Sem Fidelidade'),(5,5,1,'Cliente preferencial'),(6,6,0,'Sem Fidelidade'),(7,7,1,'Cliente antigo'),(8,8,0,'Sem Fidelidade'),(9,9,1,'Cliente VIP'),(10,10,0,'Sem Fidelidade'),(11,11,1,'Cliente corporativo'),(12,12,0,'Sem Fidelidade'),(13,13,1,'Cliente preferencial'),(14,14,0,'Sem Fidelidade'),(15,15,1,'Cliente antigo'),(16,16,1,'Cliente VIP');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pessoa` int(11) NOT NULL,
  `cargo` varchar(100) NOT NULL,
  `salario` float(9,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `funcionario_pessoa_fk_idx` (`id_pessoa`),
  CONSTRAINT `funcionario_pessoa_fk` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES (1,2,'Camareira',3000.00),(2,17,'Garçom',4000.00),(3,18,'Garçom',3200.00),(4,19,'Chefe de Cozinha',6000.00),(5,20,'Recepcionista',4000.00),(6,21,'Chefe de Cozinha',7500.00),(7,22,'Recepcionista',3000.00),(8,23,'Camareira',2500.00),(9,24,'Garçom',3000.00),(10,25,'Recepcionista',5000.00),(11,26,'Camareira',3500.00),(12,27,'Garçom',4000.00),(13,28,'Camareira',2500.00);
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `midia_acomodacao`
--

DROP TABLE IF EXISTS `midia_acomodacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `midia_acomodacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_acomodacao` int(11) NOT NULL,
  `tipo` enum('imagem','video') NOT NULL,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `midia_acomodacao_fk_idx` (`id_acomodacao`),
  CONSTRAINT `midia_acomodacao_fk` FOREIGN KEY (`id_acomodacao`) REFERENCES `acomodacao` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `midia_acomodacao`
--

LOCK TABLES `midia_acomodacao` WRITE;
/*!40000 ALTER TABLE `midia_acomodacao` DISABLE KEYS */;
INSERT INTO `midia_acomodacao` VALUES (1,1,'imagem','varanda.jpg'),(2,5,'imagem','romance_getaway_banner.jpg'),(3,7,'imagem','bangalo_luxo_piscina.jpg'),(4,3,'imagem','cabana_familiar_patio.jpg'),(5,9,'imagem','suite_presidencial_bedroom.jpg'),(6,2,'imagem','suite_executiva_2.jpg');
/*!40000 ALTER TABLE `midia_acomodacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pacote`
--

DROP TABLE IF EXISTS `pacote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pacote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_acomodacao` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `qtd_diarias` int(11) NOT NULL,
  `valor_total` float(9,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pacote_acomodacao_fk_idx` (`id_acomodacao`),
  CONSTRAINT `pacote_acomodacao_fk` FOREIGN KEY (`id_acomodacao`) REFERENCES `acomodacao` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacote`
--

LOCK TABLES `pacote` WRITE;
/*!40000 ALTER TABLE `pacote` DISABLE KEYS */;
INSERT INTO `pacote` VALUES (1,1,'Carnaval',5,1800.00),(2,5,'Pacote Romântico',2,360.00),(3,7,'Pacote de Luxo',4,1120.00),(4,3,'Pacote Familiar',5,1500.00),(5,9,'Pacote VIP',7,3500.00),(6,2,'Pacote Executivo',3,750.00);
/*!40000 ALTER TABLE `pacote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_completo` varchar(100) NOT NULL,
  `data_nascimento` date NOT NULL,
  `documento` varchar(30) NOT NULL,
  `pais` varchar(100) DEFAULT NULL,
  `estado` varchar(100) DEFAULT NULL,
  `cidade` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
INSERT INTO `pessoa` VALUES (1,'José da Silva','1980-02-01','123','Brasil','SC','Tubarão'),(2,'Joana Souza','1985-01-02','456','Brasil','SC','Laguna'),(3,'Pedro Santos','1995-02-10','567890123','Brasil','SC','Brusque'),(4,'Ana Costa','1988-11-05','654321098','Brasil','BA','Salvador'),(5,'Carlos Pereira','1980-09-30','789012345','Brasil','RS','Bagé'),(6,'Fernanda Lima','1992-04-18','456789012','Brasil','SC','Florianópolis'),(7,'Ricardo Oliveira','1983-07-12','890123456','Brasil','SP','Campinas'),(8,'Camila Souza','1991-01-25','345678901','Brasil','PR','Curitiba'),(9,'Lucas Silva','1987-06-08','012345678','Brasil','RJ','Niterói'),(10,'Juliana Santos','1993-09-03','901234567','Brasil','SC','Itajaí'),(11,'Gabriel Pereira','1986-11-20','234567890','Brasil','SP','Santos'),(12,'Patrícia Costa','1990-03-28','789012345','Brasil','SC','Lages'),(13,'Daniel Oliveira','1984-12-15','345678901','Brasil','RS','Caxias'),(14,'Mariana Lima','1989-02-10','567890123','Brasil','RS','Erechim'),(15,'Eduardo Souza','1995-07-01','012345678','Brasil','PR','Londrina'),(16,'Amanda Silva','1994-08-12','345678912','Brasil','SC','Joinville'),(17,'Vinícius Oliveira','1989-03-25','567890234','Brasil','PR','Londrina'),(18,'Roberta Santos','1992-06-30','789012345','Brasil','SC','Itapema'),(19,'Rafael Costa','1987-10-05','901234567','Brasil','SP','São Paulo'),(20,'Carolina Pereira','1991-01-18','123456789','Brasil','RS','Porto Alegre'),(21,'Luciano Lima','1985-04-22','234567890','Brasil','SC','Blumenau'),(22,'Aline Oliveira','1996-09-07','456789012','Brasil','PR','Curitiba'),(23,'Bruno Souza','1980-12-14','678901234','Brasil','RJ','Rio de Janeiro'),(24,'Isabela Santos','1993-02-28','890123456','Brasil','SP','Campinas'),(25,'Fábio Costa','1984-11-15','012345678','Brasil','RS','Canoas'),(26,'Natália Pereira','1988-07-10','123456789','Brasil','SC','Florianópolis'),(27,'José Oliveira','1995-04-03','234567890','Brasil','PR','Maringá'),(28,'Renata Lima','1983-10-20','345678901','Brasil','SC','Joinville'),(29,'Marcelo Silva','1990-03-08','567890123','Brasil','RS','Novo Hamburgo'),(30,'Tatiane Souza','1986-06-01','789012345','Brasil','PR','Londrina'),(31,'João da Silva','1990-05-15','123456789','Brasil','SC','Chapecó'),(32,'Maria Oliveira','1985-08-22','987654321','Brasil','PR','Maringá');
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva`
--

DROP TABLE IF EXISTS `reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserva` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_acomodacao` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `data_inicio` date NOT NULL,
  `data_fim` date NOT NULL,
  `valor_total` float(9,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reserva_cliente_fk_idx` (`id_cliente`),
  KEY `reserva_acomodacao_fk_idx` (`id_acomodacao`),
  CONSTRAINT `reserva_acomodacao_fk` FOREIGN KEY (`id_acomodacao`) REFERENCES `acomodacao` (`id`),
  CONSTRAINT `reserva_cliente_fk` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva`
--

LOCK TABLES `reserva` WRITE;
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
INSERT INTO `reserva` VALUES (1,1,1,'2023-11-10','2020-11-12',800.00),(2,5,3,'2023-12-25','2023-12-30',900.00),(3,7,15,'2023-12-02','2023-12-07',800.00),(4,3,5,'2023-02-08','2023-02-13',1200.00),(5,9,1,'2023-07-20','2023-07-25',1500.00),(6,1,7,'2023-12-05','2023-12-10',700.00),(7,3,8,'2023-12-15','2023-12-20',1000.00),(8,4,9,'2023-12-22','2023-12-27',1300.00),(9,10,10,'2023-10-28','2024-10-02',1800.00),(10,2,4,'2023-03-05','2023-03-10',550.00),(11,10,9,'2023-11-30','2023-12-05',4600.00),(12,5,3,'2023-04-25','2023-05-30',900.00),(13,7,1,'2023-12-02','2023-12-07',800.00),(14,3,5,'2023-06-08','2023-06-13',1200.00),(15,9,9,'2023-07-20','2023-07-25',1500.00),(16,2,2,'2023-12-10','2023-12-15',500.00);
/*!40000 ALTER TABLE `reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `reservas`
--

DROP TABLE IF EXISTS `reservas`;
/*!50001 DROP VIEW IF EXISTS `reservas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `reservas` AS SELECT 
 1 AS `#`,
 1 AS `Nome completo`,
 1 AS `Data nascimento`,
 1 AS `Documento de Registro`,
 1 AS `Cidade`,
 1 AS `Estado`,
 1 AS `País`,
 1 AS `Fidelidade`,
 1 AS `Quantidade de reservas`,
 1 AS `Tem Reserva Futura`,
 1 AS `Valor total gasto`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_dados_clientes`
--

DROP TABLE IF EXISTS `view_dados_clientes`;
/*!50001 DROP VIEW IF EXISTS `view_dados_clientes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_dados_clientes` AS SELECT 
 1 AS `#`,
 1 AS `Nome completo`,
 1 AS `Data nascimento`,
 1 AS `Documento de Registro`,
 1 AS `cidade`,
 1 AS `estado`,
 1 AS `pais`,
 1 AS `fidelidade`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `cli_reservas`
--

/*!50001 DROP VIEW IF EXISTS `cli_reservas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cli_reservas` AS select `pessoa`.`id` AS `#`,`pessoa`.`nome_completo` AS `Nome completo`,`pessoa`.`data_nascimento` AS `Data nascimento`,`pessoa`.`documento` AS `Documento de Registro`,`pessoa`.`cidade` AS `Cidade`,`pessoa`.`estado` AS `Estado`,`pessoa`.`pais` AS `País`,`cliente`.`fidelidade` AS `Fidelidade`,`reserva`.`id` AS `qtdReserva` from ((`pessoa` join `cliente` on((`pessoa`.`id` = `cliente`.`id_pessoa`))) join `reserva` on((`reserva`.`id_cliente` = `cliente`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `reservas`
--

/*!50001 DROP VIEW IF EXISTS `reservas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `reservas` AS select `pessoa`.`id` AS `#`,`pessoa`.`nome_completo` AS `Nome completo`,date_format(`pessoa`.`data_nascimento`,'%d/%m/%Y') AS `Data nascimento`,`pessoa`.`documento` AS `Documento de Registro`,`pessoa`.`cidade` AS `Cidade`,`pessoa`.`estado` AS `Estado`,`pessoa`.`pais` AS `País`,`cliente`.`fidelidade` AS `Fidelidade`,count(`reserva`.`id_cliente`) AS `Quantidade de reservas`,(case when (max(`reserva`.`data_inicio`) > curdate()) then 'Sim' else 'Não' end) AS `Tem Reserva Futura`,sum(`reserva`.`valor_total`) AS `Valor total gasto` from ((`pessoa` join `cliente` on((`pessoa`.`id` = `cliente`.`id_pessoa`))) join `reserva` on((`reserva`.`id_cliente` = `cliente`.`id`))) group by `pessoa`.`id`,`pessoa`.`nome_completo`,`pessoa`.`data_nascimento`,`pessoa`.`documento`,`pessoa`.`cidade`,`pessoa`.`estado`,`pessoa`.`pais`,`cliente`.`fidelidade` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_dados_clientes`
--

/*!50001 DROP VIEW IF EXISTS `view_dados_clientes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_dados_clientes` AS select `pessoa`.`id` AS `#`,`pessoa`.`nome_completo` AS `Nome completo`,`pessoa`.`data_nascimento` AS `Data nascimento`,`pessoa`.`documento` AS `Documento de Registro`,`pessoa`.`cidade` AS `cidade`,`pessoa`.`estado` AS `estado`,`pessoa`.`pais` AS `pais`,`cliente`.`fidelidade` AS `fidelidade` from (`pessoa` join `cliente` on((`pessoa`.`id` = `cliente`.`id_pessoa`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-30 19:58:57
