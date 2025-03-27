-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: db-inf-3at
-- ------------------------------------------------------
-- Server version	8.0.34

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

IF NOT EXISTS CREATE SCHEMA 'bd-inf-3at' ;

USE `bd-inf-3at`;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `products_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cart_users1_idx` (`user_id`),
  KEY `fk_carts_products1_idx` (`products_id`),
  CONSTRAINT `fk_cart_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_carts_products1` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `users_id` int NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sales_users1_idx` (`users_id`),
  CONSTRAINT `fk_sales_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itens`
--

DROP TABLE IF EXISTS `itens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `invoice_id` int NOT NULL,
  `product_id` int NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_itens_invoices1_idx` (`invoice_id`),
  KEY `fk_itens_products1_idx` (`product_id`),
  CONSTRAINT `fk_itens_invoices1` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`),
  CONSTRAINT `fk_itens_products1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itens`
--

LOCK TABLES `itens` WRITE;
/*!40000 ALTER TABLE `itens` DISABLE KEYS */;
/*!40000 ALTER TABLE `itens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL,
  `category_id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_products_products_categories1_idx` (`category_id`),
  CONSTRAINT `fk_products_products_categories1` FOREIGN KEY (`category_id`) REFERENCES `products_categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_categories`
--

DROP TABLE IF EXISTS `products_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_categories`
--

LOCK TABLES `products_categories` WRITE;
/*!40000 ALTER TABLE `products_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type_id` int NOT NULL,
  `question` varchar(255) NOT NULL,
  `answer` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_questions_types_idx` (`type_id`),
  CONSTRAINT `fk_questions_types` FOREIGN KEY (`type_id`) REFERENCES `questions_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (6,1,'Quais métodos de pagamento são aceitos na sua loja online?','Aceitamos uma variedade de métodos de pagamento para tornar sua experiência de compra mais conveniente. Aceitamos cartões de crédito (Visa, MasterCard, American Express), transferência bancária e pagamento através de plataformas online como PayPal.'),(7,1,'Como posso rastrear o meu pedido após a compra?','Após a confirmação da compra, você receberá um e-mail com os detalhes do seu pedido, incluindo um link de rastreamento. Esse link o direcionará para a página de rastreamento, onde você poderá monitorar o status e a localização atualizada do seu pedido em tempo real.'),(8,1,'Qual é a política de devolução da sua loja?','Garantimos a satisfação dos nossos clientes. Se por algum motivo você não estiver satisfeito com sua compra, aceitamos devoluções dentro de 30 dias após o recebimento do produto. Consulte nossa página de política de devolução para obter mais detalhes sobre como proceder com a devolução.'),(9,1,'Há garantia nos produtos vendidos em sua loja?','Sim, oferecemos garantia em muitos dos nossos produtos. Cada produto terá informações específicas sobre a garantia na página do produto. Em caso de dúvidas ou problemas, entre em contato com nossa equipe de atendimento ao cliente, que ficará feliz em ajudar a resolver qualquer questão relacionada à garantia.'),(10,1,'Vocês oferecem frete grátis para determinadas regiões ou valores de compra?','Sim, frequentemente oferecemos frete grátis para pedidos acima de um determinado valor, bem como promoções especiais para regiões específicas. Essas ofertas podem variar, por isso recomendamos verificar a página de frete e promoções para informações atualizadas sobre frete grátis e outras ofertas especiais.'),(11,2,'Como posso me inscrever para o evento de ciências?','A inscrição para o evento de ciências pode ser feita diretamente em nosso site. Visite a página de inscrição, preencha o formulário com suas informações e siga as instruções fornecidas para concluir o processo de inscrição.'),(12,2,'Quais são as datas limite para as inscrições?','As datas de inscrição e suas respectivas prorrogações são divulgadas em nossa página oficial e nas redes sociais. Recomendamos que os interessados verifiquem regularmente essas informações para garantir que não percam as datas importantes de inscrição.'),(13,2,'Existe alguma taxa de inscrição para participar do evento de ciências?','Sim, há uma taxa de inscrição para participar do evento de ciências. Os detalhes sobre as taxas, métodos de pagamento aceitos e prazos de pagamento podem ser encontrados na seção de taxas e pagamentos da página de inscrição.'),(14,2,'Posso fazer alterações nas informações da minha inscrição após a submissão?','Após a submissão da inscrição, algumas informações podem ser alteradas entrando em contato com nossa equipe de suporte. No entanto, recomendamos revisar cuidadosamente todas as informações antes de enviar a inscrição para evitar problemas futuros.'),(15,2,'Como receberei a confirmação da minha inscrição?','Após o processamento da sua inscrição, você receberá uma confirmação por e-mail. Certifique-se de verificar sua caixa de entrada regularmente. A confirmação incluirá detalhes importantes, como a identificação única da sua inscrição e informações sobre o evento de ciências.'),(21,2,'Questão teste','Resposeta teste');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions_types`
--

DROP TABLE IF EXISTS `questions_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions_types`
--

LOCK TABLES `questions_types` WRITE;
/*!40000 ALTER TABLE `questions_types` DISABLE KEYS */;
INSERT INTO `questions_types` VALUES (1,'Vendas'),(2,'Inscrições'),(3,'Sobre o Evento'),(4,'Organização');
/*!40000 ALTER TABLE `questions_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_users_users_types1_idx` (`type_id`),
  CONSTRAINT `fk_users_users_types1` FOREIGN KEY (`type_id`) REFERENCES `users_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'Fábio Santos','fabio@gmail.com','12345678',NULL),(2,2,'Godofredo Silva','godofredo@gmail.com','12345678',NULL),(3,1,'Paulo Silveira','paulo@gmail.com','12345678',NULL),(4,2,'Vinícius de Morais','vinicius@gmail.com','12345678',NULL),(5,1,'João Gilberto Souza','joao@gmail.com','12345678',NULL),(6,2,'Roberto Carlos Cunha','roberto@gmail.com','12345678',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_types`
--

DROP TABLE IF EXISTS `users_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_types`
--

LOCK TABLES `users_types` WRITE;
/*!40000 ALTER TABLE `users_types` DISABLE KEYS */;
INSERT INTO `users_types` VALUES (1,'Administrador'),(2,'Usuário');
/*!40000 ALTER TABLE `users_types` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-27 16:28:39
