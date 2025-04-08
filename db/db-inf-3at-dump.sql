CREATE DATABASE  IF NOT EXISTS `db-inf-3at` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db-inf-3at`;
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
  `idCategory` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_products_products_categories1_idx` (`idCategory`),
  CONSTRAINT `fk_products_products_categories1` FOREIGN KEY (`idCategory`) REFERENCES `products_categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,1,'Smartphone',1500),(2,1,'Notebook',3500),(3,2,'Camiseta',50),(4,2,'Calça Jeans',120),(5,3,'Sofá',2000),(6,3,'Mesa de Jantar',800),(7,4,'Geladeira',2500),(8,4,'Micro-ondas',400),(9,5,'Bola de Futebol',80),(10,5,'Bicicleta',600),(11,6,'Boneca',70),(12,6,'Carrinho de Controle Remoto',150),(13,7,'Livro de Ficção',40),(14,7,'Livro de História',60),(15,8,'Perfume',120),(16,8,'Creme Hidratante',45),(17,9,'Furadeira',300),(18,9,'Chave de Fenda',20),(19,10,'Pneu',400),(20,10,'Óleo para Motor',50),(21,11,'Chocolate',10),(22,11,'Refrigerante',8),(23,12,'Caderno',15),(24,12,'Caneta',2);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_categories`
--

LOCK TABLES `products_categories` WRITE;
/*!40000 ALTER TABLE `products_categories` DISABLE KEYS */;
INSERT INTO `products_categories` VALUES (1,'Eletrônicos'),(2,'Roupas'),(3,'Móveis'),(4,'Eletrodomésticos'),(5,'Esportes'),(6,'Brinquedos'),(7,'Livros'),(8,'Beleza e Cuidados Pessoais'),(9,'Ferramentas'),(10,'Automotivo'),(11,'Alimentos e Bebidas'),(12,'Papelaria e Escritório');
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
  `idType` int NOT NULL,
  `question` varchar(255) NOT NULL,
  `answer` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_questions_types_idx` (`idType`),
  CONSTRAINT `fk_questions_types` FOREIGN KEY (`idType`) REFERENCES `questions_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (6,1,'Quais os métodos de pagamento disponíveis?','Aceitamos uma variedade de métodos de pagamento para tornar sua experiência de compra mais conveniente. Aceitamos cartões de crédito (Visa, MasterCard, American Express), transferência bancária e pagamento através de plataformas online como PayPal.'),(7,1,'Como posso rastrear o meu pedido após a compra?','Após a confirmação da compra, você receberá um e-mail com os detalhes do seu pedido, incluindo um link de rastreamento. Esse link o direcionará para a página de rastreamento, onde você poderá monitorar o status e a localização atualizada do seu pedido em tempo real.'),(8,1,'Qual é a política de devolução da sua loja?','Garantimos a satisfação dos nossos clientes. Se por algum motivo você não estiver satisfeito com sua compra, aceitamos devoluções dentro de 30 dias após o recebimento do produto. Consulte nossa página de política de devolução para obter mais detalhes sobre como proceder com a devolução.'),(9,1,'Há garantia nos produtos vendidos em sua loja?','Sim, oferecemos garantia em muitos dos nossos produtos. Cada produto terá informações específicas sobre a garantia na página do produto. Em caso de dúvidas ou problemas, entre em contato com nossa equipe de atendimento ao cliente, que ficará feliz em ajudar a resolver qualquer questão relacionada à garantia.'),(10,1,'Vocês oferecem frete grátis para determinadas regiões ou valores de compra?','Sim, frequentemente oferecemos frete grátis para pedidos acima de um determinado valor, bem como promoções especiais para regiões específicas. Essas ofertas podem variar, por isso recomendamos verificar a página de frete e promoções para informações atualizadas sobre frete grátis e outras ofertas especiais.'),(11,2,'Como posso me inscrever para o evento de ciências?','A inscrição para o evento de ciências pode ser feita diretamente em nosso site. Visite a página de inscrição, preencha o formulário com suas informações e siga as instruções fornecidas para concluir o processo de inscrição.'),(12,2,'Quais são as datas limite para as inscrições?','As datas de inscrição e suas respectivas prorrogações são divulgadas em nossa página oficial e nas redes sociais. Recomendamos que os interessados verifiquem regularmente essas informações para garantir que não percam as datas importantes de inscrição.'),(13,2,'Existe alguma taxa de inscrição para participar do evento de ciências?','Sim, há uma taxa de inscrição para participar do evento de ciências. Os detalhes sobre as taxas, métodos de pagamento aceitos e prazos de pagamento podem ser encontrados na seção de taxas e pagamentos da página de inscrição.'),(14,2,'Posso fazer alterações nas informações da minha inscrição após a submissão?','Após a submissão da inscrição, algumas informações podem ser alteradas entrando em contato com nossa equipe de suporte. No entanto, recomendamos revisar cuidadosamente todas as informações antes de enviar a inscrição para evitar problemas futuros.'),(15,2,'Como receberei a confirmação da minha inscrição?','Após o processamento da sua inscrição, você receberá uma confirmação por e-mail. Certifique-se de verificar sua caixa de entrada regularmente. A confirmação incluirá detalhes importantes, como a identificação única da sua inscrição e informações sobre o evento de ciências.');
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
  `idType` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_users_users_types1_idx` (`idType`),
  CONSTRAINT `fk_users_users_types1` FOREIGN KEY (`idType`) REFERENCES `users_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'Fábio Santos','fabio@gmail.com','12345678',NULL),(2,2,'Novo nome','godofredo@gmail.com','987654',NULL),(3,1,'Nome Alterado','fabio@gmail.com','12345678',NULL),(6,2,'Roberto Carlos Cunha','roberto@gmail.com','12345678',NULL),(9,1,'Fulano da Silva','fabio@gmail.com','12345',NULL),(10,1,'Fulano da Silva','fabio@gmail.com','12345',NULL),(14,2,'Teste de instancia','fabio@gmail.com','234567',NULL),(29,2,'Novo Usuário','novo@gmail.com','3456789',NULL),(30,2,'Novo Usuário','novo@gmail.com','3456789',NULL),(31,2,'Novo Usuário','novo@gmail.com','3456789',NULL),(32,2,'Novo Usuário','novo@gmail.com','3456789',NULL),(33,2,'Novo Usuário','novo@gmail.com','3456789',NULL);
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

-- Dump completed on 2025-04-08 13:38:23
