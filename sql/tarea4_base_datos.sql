-- MySQL dump 10.13  Distrib 26.7.0, for macos26.6 (arm64)
--
-- Host: localhost    Database: tarea2
-- ------------------------------------------------------
-- Server version	26.7.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ave`
--

DROP TABLE IF EXISTS `ave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ave` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=586 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ave`
--

LOCK TABLES `ave` WRITE;
/*!40000 ALTER TABLE `ave` DISABLE KEYS */;
INSERT INTO `ave` VALUES (1,'Aguila'),(2,'Aguila pescadora'),(3,'Aguilucho'),(4,'Aguilucho chico'),(5,'Aguilucho de ala rojiza'),(6,'Aguilucho de cola rojiza'),(7,'Aguilucho de la Puna'),(8,'Aguilucho langostero'),(9,'Albatros de Buller'),(10,'Albatros de cabeza gris'),(11,'Albatros de ceja negra'),(12,'Albatros de corona blanca'),(13,'Albatros de frente blanca'),(14,'Albatros de las Antipodas'),(15,'Albatros de las Galápagos'),(16,'Albatros de las Chatham'),(17,'Albatros de pico delgado'),(18,'Albatros errante'),(19,'Albatros oscuro'),(20,'Albatros oscuro de manto claro'),(21,'Albatros real del Norte'),(22,'Albatros real del Sur'),(23,'Arañero cara negra'),(24,'Ave del trópico de cola blanca'),(25,'Ave del trópico de cola roja'),(26,'Ave del trópico de pico rojo'),(27,'Ave fragata'),(28,'Ave fragata grande'),(29,'Bailarín'),(30,'Bailarín chico'),(31,'Bailarín chico argentino'),(32,'Bailarín chico peruano'),(33,'Bandurria'),(34,'Bandurria de la puna'),(35,'Bandurrilla'),(36,'Bandurrilla de Arica'),(37,'Bandurrilla de la puna'),(38,'Bandurrilla de las piedras'),(39,'Bandurrilla de los bosques'),(40,'Bandurrilla de pico recto'),(41,'Batitú'),(42,'Becacina'),(43,'Becacina chica'),(44,'Becacina de la puna'),(45,'Becacina grande'),(46,'Becacina pintada'),(47,'Benteveo'),(48,'Benteveo blanco y negro'),(49,'Benteveo chico'),(50,'Benteveo de vientre azufre'),(51,'Benteveo real'),(52,'Birro comun'),(53,'Blanquillo'),(54,'Burlisto castaño'),(55,'Burrito negruzco'),(56,'Cachaña'),(57,'Cachudito'),(58,'Cachudito de cresta blanca'),(59,'Cachudito de Juan Fernandez'),(60,'Cachudito del Norte'),(61,'Caiquén'),(62,'Caití'),(63,'Canastero'),(64,'Canastero chico'),(65,'Canastero de cola larga'),(66,'Canastero del Norte'),(67,'Canastero del Sur'),(68,'Canastero de las quebradas'),(69,'Candelita americana'),(70,'Canquén'),(71,'Canquén colorado'),(72,'Caranca'),(73,'Carancho cordillerano'),(74,'Carancho cordillerano del sur'),(75,'Carancho negro'),(76,'Carao'),(77,'Cardenal'),(78,'Carpinterito'),(79,'Carpintero negro'),(80,'Carpintero real'),(81,'Cazamoscas chocolate'),(82,'Cazamoscas de cola corta'),(83,'Cazamoscas estriado'),(84,'Cazamoscas picochato'),(85,'Cazamoscas tijereta'),(86,'Celestino'),(87,'Cernícalo'),(88,'Charlatán'),(89,'Chercán'),(90,'Chercán de las vegas'),(91,'Chincol'),(92,'Chiricoca'),(93,'Chirihue'),(94,'Chirihue austral'),(95,'Chirihue azafrán'),(96,'Chirihue cordillerano'),(97,'Chirihue de la puna'),(98,'Chirihue de Raimondi'),(99,'Chirihue dorado'),(100,'Chirihue verdoso'),(101,'Chorlito cordillerano'),(102,'Chorlo ártico'),(103,'Chorlo cabezón'),(104,'Chorlo chileno'),(105,'Chorlo de campo'),(106,'Chorlo de collar'),(107,'Chorlo de doble collar'),(108,'Chorlo de la Puna'),(109,'Chorlo de Magallanes'),(110,'Chorlo de pico grueso'),(111,'Chorlo dorado'),(112,'Chorlo dorado del Pacifico'),(113,'Chorlo gritón'),(114,'Chorlo nevado'),(115,'Chorlo semipalmado'),(116,'Choroy'),(117,'Chucao'),(118,'Chuncho'),(119,'Chuncho del Norte'),(120,'Churrete'),(121,'Churrete acanelado'),(122,'Churrete austral'),(123,'Churrete chico'),(124,'Churrete costero'),(125,'Churrete costero peruano'),(126,'Churrete de alas blancas'),(127,'Churrete de alas crema'),(128,'Churrín de la Mocha'),(129,'Churrín del norte'),(130,'Churrín del Sur'),(131,'Cigüeña de cabeza pelada'),(132,'Cisne coscoroba'),(133,'Cisne de cuello negro'),(134,'Codorniz'),(135,'Colegial'),(136,'Colegial del Norte'),(137,'Colilarga'),(138,'Comesebo chico'),(139,'Comesebo de los tamarugales'),(140,'Comesebo gigante'),(141,'Comesebo grande'),(142,'Comesebo negro'),(143,'Cometocino de Arica'),(144,'Cometocino de dorso castaño'),(145,'Cometocino de Gay'),(146,'Cometocino del norte'),(147,'Cometocino patagónico'),(148,'Concón'),(149,'Cóndor de Los Andes'),(150,'Corbatita'),(151,'Corbatita de doble collar'),(152,'Corbatita overo'),(153,'Cormorán antártico'),(154,'Cormorán de las rocas'),(155,'Cormorán Imperial'),(156,'Cortarramas'),(157,'Cotorra argentina'),(158,'Cuclillo de pico amarillo'),(159,'Cuclillo de pico negro'),(160,'Cuervo de pantano'),(161,'Cuervo de pantano de cara pelada'),(162,'Cuervo de pantano de la Puna'),(163,'Diuca'),(164,'Diuca de alas blancas'),(165,'Diucón'),(166,'Dormilona cenicienta'),(167,'Dormilona chica'),(168,'Dormilona de ceja blanca'),(169,'Dormilona de frente negra'),(170,'Dormilona de la Puna'),(171,'Dormilona de nuca rojiza'),(172,'Dormilona fraile'),(173,'Dormilona gigante'),(174,'Dormilona rufa'),(175,'Dormilona tontito'),(176,'Espátula'),(177,'Estornino pinto'),(178,'Faisán'),(179,'Fardela atlántica'),(180,'Fardela blanca'),(181,'Fardela blanca de Juan Fernandez'),(182,'Fardela blanca de Masatierra'),(183,'Fardela capirotada'),(184,'Fardela chica'),(185,'Fardela de cabeza parda'),(186,'Fardela de Cook'),(187,'Fardela de dorso gris'),(188,'Fardela de Fénix'),(189,'Fardela de frente blanca'),(190,'Fardela de Henderson'),(191,'Fardela de Kerguelen'),(192,'Fardela de Masafuera'),(193,'Fardela de Murphy'),(194,'Fardela de Nueva Zelanda'),(195,'Fardela de Parkinson'),(196,'Fardela de Pascua'),(197,'Fardela del Pacifico'),(198,'Fardela gris'),(199,'Fardela heráldica'),(200,'Fardela negra'),(201,'Fardela negra de Juan Fernandez'),(202,'Fardela negra de patas pálidas'),(203,'Fardela negra grande'),(204,'Fardela Taiko'),(205,'Fardela tropical'),(206,'Federal'),(207,'Fio-fio'),(208,'Fio-fio grande'),(209,'Flamenco chileno'),(210,'Gallina ciega'),(211,'Gallina ciega chica'),(212,'Gallina ciega boreal'),(213,'Gallina ciega peruana'),(214,'Garcita azulada'),(215,'Garza azul'),(216,'Garza boyera o Garza bueyera'),(217,'Garza chica'),(218,'Garza chiflon'),(219,'Garza cuca'),(220,'Garza grande'),(221,'Garza tricolor'),(222,'Gavilan pajarero'),(223,'Gaviota andina'),(224,'Gaviota argentea'),(225,'Gaviota austral'),(226,'Gaviota cáhuil'),(227,'Gaviota de Bonaparte'),(228,'Gaviota de capucho gris'),(229,'Gaviota de Franklin'),(230,'Gaviota de las Galápagos'),(231,'Gaviota de Sabine'),(232,'Gaviota dominicana'),(233,'Gaviota garuma'),(234,'Gaviota peruana'),(235,'Gaviota reidora'),(236,'Gaviotín albo'),(237,'Gaviotín antártico'),(238,'Gaviotín apizarrado'),(239,'Gaviotín ártico'),(240,'Gaviotín boreal'),(241,'Gaviotín chico'),(242,'Gaviotín chico boreal'),(243,'Gaviotín de bridas'),(244,'Gaviotín de pico grande'),(245,'Gaviotín de San Ambrosio'),(246,'Gaviotín de San Félix'),(247,'Gaviotín de Sandwich'),(248,'Gaviotín elegante'),(249,'Gaviotín monja'),(250,'Gaviotín negro'),(251,'Gaviotín oscuro'),(252,'Gaviotín pascuense'),(253,'Gaviotín pico grueso'),(254,'Gaviotín piquerito'),(255,'Gaviotín real'),(256,'Gaviotín sudamericano'),(257,'Golondrina barranquera'),(258,'Golondrina bermeja'),(259,'Golondrina chilena'),(260,'Golondrina de cabeza rojiza'),(261,'Golondrina de dorso negro'),(262,'Golondrina de los riscos'),(263,'Golondrina domestica'),(264,'Golondrina grande'),(265,'Golondrina negra'),(266,'Golondrina negra peruana'),(267,'Golondrina parda'),(268,'Golondrina de mar'),(269,'Golondrina de mar andina'),(270,'Golondrina de mar boreal'),(271,'Golondrina de mar chica'),(272,'Golondrina de mar de ceja blanca'),(273,'Golondrina de mar de collar'),(274,'Golondrina de mar de garganta blanca'),(275,'Golondrina de mar de vientre blanco'),(276,'Golondrina de mar de vientre negro'),(277,'Golondrina de mar negra'),(278,'Golondrina de mar oscura'),(279,'Golondrina de mar peruana'),(280,'Golondrina de mar pincoya'),(281,'Golondrina de mar subantártica'),(282,'Gorrión'),(283,'Guacharo'),(284,'Guanay'),(285,'Halcón de pecho naranja'),(286,'Halcón perdiguero'),(287,'Halcón peregrino'),(288,'Halcón reidor'),(289,'Huairavillo'),(290,'Huairavillo de dorso negro'),(291,'Huairavo'),(292,'Huairavo de corona amarilla'),(293,'Huala'),(294,'Hued-hued castaño'),(295,'Hued-hued del sur'),(296,'Jacana'),(297,'Jílguero'),(298,'Jílguero cordillerano'),(299,'Jílguero grande'),(300,'Jílguero negro'),(301,'Jílguero peruano'),(302,'Jote de cabeza colorada'),(303,'Jote de cabeza negra'),(304,'Lavandera blanca'),(305,'Lechuza'),(306,'Lile'),(307,'Loica'),(308,'Loica argentina'),(309,'Loica peruana'),(310,'Loro de cara roja'),(311,'Loro mitrata'),(312,'Martín pescador'),(313,'Martín pescador chico'),(314,'Matacaballos'),(315,'Matacaballos de pico liso'),(316,'Mero'),(317,'Mero chico'),(318,'Mero de ala canela'),(319,'Mero de la puna'),(320,'Mero de Tarapacá'),(321,'Mero gaucho'),(322,'Milano tijereta'),(323,'Minero'),(324,'Minero austral'),(325,'Minero chico'),(326,'Minero cordillerano'),(327,'Minero de la Puna'),(328,'Minero de pico delgado'),(329,'Minero grande'),(330,'Mirlo'),(331,'Mirlo de pico corto'),(332,'Monjita americana'),(333,'Monjita blanca'),(334,'Monjita castaña'),(335,'Monjita coronada'),(336,'Mosqueta boreal'),(337,'Naranjero'),(338,'Negrillo'),(339,'Nuco'),(340,'Ñacundá'),(341,'Ñandú'),(342,'Pájaro amarillo'),(343,'Pájaro plomo'),(344,'Paloma antártica'),(345,'Paloma de alas blancas'),(346,'Paloma de alas moteadas'),(347,'Paloma doméstica'),(348,'Paloma picazuro'),(349,'Parina chica'),(350,'Parina grande'),(351,'Patagón'),(352,'Pato anteojillo'),(353,'Pato capuchino'),(354,'Pato castaño'),(355,'Pato colorado'),(356,'Pato cortacorrientes'),(357,'Pato crestudo'),(358,'Pato criollo'),(359,'Pato cuchara'),(360,'Pato de alas azules'),(361,'Pato de collar'),(362,'Pato gargantillo'),(363,'Pato jergón chico'),(364,'Pato jergón grande'),(365,'Pato juarjual'),(366,'Pato negro'),(367,'Pato puna'),(368,'Pato rana de pico ancho'),(369,'Pato rana de pico delgado'),(370,'Pato real'),(371,'Pato rinconero'),(372,'Pato silbón'),(373,'Pato silbón de ala blanca'),(374,'Pato silbón pampa'),(375,'Pelícano'),(376,'Pelícano pardo'),(377,'Pepitero'),(378,'Pequén'),(379,'Perdicita'),(380,'Perdicita cojón'),(381,'Perdicita cordillerana'),(382,'Perdicita cordillerana austral'),(383,'Perdiz austral'),(384,'Perdiz chilena'),(385,'Perdiz copetona'),(386,'Perdiz cordillerana'),(387,'Perdiz cordillerana de Arica'),(388,'Perdiz de la Puna'),(389,'Perico cordillerano'),(390,'Perrito'),(391,'Petrel antártico'),(392,'Petrel azulado'),(393,'Petrel boreal'),(394,'Petrel damero'),(395,'Petrel de alas negras'),(396,'Petrel de cara gris'),(397,'Petrel de collar gris'),(398,'Petrel de Gould'),(399,'Petrel de las Galapagos'),(400,'Petrel de las nieves'),(401,'Petrel gigante antártico'),(402,'Petrel gigante subantártico'),(403,'Petrel moteado'),(404,'Petrel plateado'),(405,'Petrel-paloma antártico'),(406,'Petrel-paloma chico'),(407,'Petrel-paloma de pico ancho'),(408,'Petrel-paloma de pico delgado'),(409,'Peuco'),(410,'Peuquito'),(411,'Pibi ahumado'),(412,'Pibi occidental'),(413,'Picabuey'),(414,'Picaflor'),(415,'Picaflor azul'),(416,'Picaflor cometa'),(417,'Picaflor comun argentino'),(418,'Picaflor cordillerano'),(419,'Picaflor de Arica'),(420,'Picaflor de Cora'),(421,'Picaflor de Juan Fernández'),(422,'Picaflor de la Puna'),(423,'Picaflor del Norte'),(424,'Picaflor gigante'),(425,'Picurio'),(426,'Pidén'),(427,'Pidén austral'),(428,'Pidén moteado'),(429,'Pidencito'),(430,'Pillo'),(431,'Pilpilén'),(432,'Pilpilén austral'),(433,'Pilpilén negro'),(434,'Pimpollo'),(435,'Pimpollo tobiano'),(436,'Pingüino de Adelia'),(437,'Pingüino de barbijo'),(438,'Pingüino de Humboldt'),(439,'Pingüino de Magallanes'),(440,'Pingüino de penacho amarillo'),(441,'Pingüino de las Snares'),(442,'Pingüino emperador'),(443,'Pingüino enano'),(444,'Pingüino macaroni'),(445,'Pingüino papúa'),(446,'Pingüino real'),(447,'Pingüino rey'),(448,'Piquero'),(449,'Piquero blanco'),(450,'Piquero de Brewster (Piquero de Cocos)'),(451,'Piquero de Nazca'),(452,'Piquero de patas azules'),(453,'Piquero de patas coloradas'),(454,'Piranga'),(455,'Pirincho'),(456,'Pitajo gris'),(457,'Pitajo rojizo'),(458,'Pitanguá'),(459,'Pitiayumí'),(460,'Pitio'),(461,'Pitio del Norte'),(462,'Pitotoy chico'),(463,'Pitotoy grande'),(464,'Pitotoy solitario'),(465,'Piuquén'),(466,'Pizarrita'),(467,'Platero'),(468,'Playero acuminado'),(469,'Playero ártico'),(470,'Playero blanco'),(471,'Playero canela'),(472,'Playero de Baird'),(473,'Playero de las rompientes'),(474,'Playero de lomo blanco'),(475,'Playero de patas largas'),(476,'Playero enano'),(477,'Playero grande'),(478,'Playero gris'),(479,'Playero manchado'),(480,'Playero occidental'),(481,'Playero pectoral'),(482,'Playero semipalmado'),(483,'Playero ventinegro'),(484,'Playero vuelvepiedras'),(485,'Playero zarapito'),(486,'Plebeyo'),(487,'Pollito de mar boreal'),(488,'Pollito de mar rojizo'),(489,'Pollito de mar tricolor'),(490,'Queltehue'),(491,'Queltehue de la Puna'),(492,'Quetru chileno'),(493,'Quetru no volador'),(494,'Quetru volador'),(495,'Rara'),(496,'Rayadito'),(497,'Rayadito de Masafuera'),(498,'Rayadito subantartico'),(499,'Rayador'),(500,'Reinita acuatica'),(501,'Reinita de Canada'),(502,'Reinita de dorso verde'),(503,'Reinita de garganta naranja'),(504,'Reinita de Tennessee'),(505,'Rey del bosque'),(506,'Run-run'),(507,'Saca-tu-real'),(508,'Salteador chico'),(509,'Salteador chileno'),(510,'Salteador de cola larga'),(511,'Salteador pardo'),(512,'Salteador polar'),(513,'Salteador pomarino'),(514,'Semillero'),(515,'Semillero peruano'),(516,'Siete-colores'),(517,'Tagua'),(518,'Tagua andina'),(519,'Tagua chica'),(520,'Tagua cornuda'),(521,'Tagua de frente roja'),(522,'Tagua gigante'),(523,'Tagüita'),(524,'Tagüita del Norte'),(525,'Tagüita purpúrea'),(526,'Tapaculo'),(527,'Tenca'),(528,'Tenca calandria'),(529,'Tenca de alas blancas'),(530,'Tenca de cola larga'),(531,'Tenca de dorso castaño'),(532,'Tenca patagónica'),(533,'Tersina'),(534,'Tijeral'),(535,'Tijeral listado'),(536,'Tiuque'),(537,'Torcaza'),(538,'Tordo'),(539,'Tordo bayo'),(540,'Tórtola'),(541,'Tórtola cordillerana'),(542,'Tortolita boliviana'),(543,'Tortolita de la Puna'),(544,'Tortolita cuyana'),(545,'Tortolita quiguagua'),(546,'Tortolita rojiza'),(547,'Trabajador'),(548,'Traro'),(549,'Tricahue'),(550,'Trile'),(551,'Trile de cabeza canela'),(552,'Tucúquere'),(553,'Tuquito gris'),(554,'Turca'),(555,'Turpial norteño'),(556,'Turpial variable'),(557,'Urutau'),(558,'Vari'),(559,'Vari huevetero'),(560,'Vencejo chico'),(561,'Vencejo de chimenea'),(562,'Vencejo de collar blanco'),(563,'Verderón de ojos rojos'),(564,'Viudita'),(565,'Viudita negra'),(566,'Yal'),(567,'Yal austral'),(568,'Yal cordillerano'),(569,'Yeco'),(570,'Yunco'),(571,'Yunco de Magallanes'),(572,'Yunco de los canales'),(573,'Zanate mexicano'),(574,'Zarapito'),(575,'Zarapito boreal'),(576,'Zarapito de cola barrada'),(577,'Zarapito de pico recto'),(578,'Zarapito moteado'),(579,'Zarapito polinésico'),(580,'Zorzal'),(581,'Zorzal argentino'),(582,'Zorzal manchado'),(583,'Zorzal negro'),(584,'Zorzal tropical'),(585,'Zorzalito de Swainson');
/*!40000 ALTER TABLE `ave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avistamiento`
--

DROP TABLE IF EXISTS `avistamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avistamiento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `voluntario_id` int NOT NULL,
  `ave_id` int NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `lugar` varchar(200) NOT NULL,
  `descripcion` text,
  `tipo_ave` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_avitamiento_voluntario1_idx` (`voluntario_id`),
  KEY `fk_avistamiento_ave1_idx` (`ave_id`),
  CONSTRAINT `fk_avistamiento_ave1` FOREIGN KEY (`ave_id`) REFERENCES `ave` (`id`),
  CONSTRAINT `fk_avistamiento_voluntario1` FOREIGN KEY (`voluntario_id`) REFERENCES `voluntario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avistamiento`
--

LOCK TABLES `avistamiento` WRITE;
/*!40000 ALTER TABLE `avistamiento` DISABLE KEYS */;
INSERT INTO `avistamiento` VALUES (1,1,347,'2026-09-30 19:05:00','Parque Forestal',NULL,NULL),(2,1,347,'2026-09-30 19:05:00','Parque Forestal',NULL,NULL),(3,4,347,'2026-09-28 17:52:00','Parque Forestal',NULL,NULL),(4,4,347,'2026-10-02 17:55:00','Parque Forestal',NULL,NULL),(5,1,1,'2026-11-02 16:00:00','Santiago',NULL,'rapaz');
/*!40000 ALTER TABLE `avistamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentario`
--

DROP TABLE IF EXISTS `comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) NOT NULL,
  `texto` varchar(300) NOT NULL,
  `fecha` timestamp NOT NULL,
  `avistamiento_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `avistamiento_id` (`avistamiento_id`),
  CONSTRAINT `comentario_ibfk_1` FOREIGN KEY (`avistamiento_id`) REFERENCES `avistamiento` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentario`
--

LOCK TABLES `comentario` WRITE;
/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
INSERT INTO `comentario` VALUES (1,'Valentina Rojas','Las palomas son las únicas aves del mundo que pueden tragar agua sin necesidad de levantar la cabeza','2026-11-03 00:33:41',4),(2,'Valentiina','<script>alert(\"prueba\")</script>','2026-11-03 01:13:27',4);
/*!40000 ALTER TABLE `comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comuna`
--

DROP TABLE IF EXISTS `comuna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comuna` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `region_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comuna_region1_idx` (`region_id`),
  CONSTRAINT `fk_comuna_region1` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=130607 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comuna`
--

LOCK TABLES `comuna` WRITE;
/*!40000 ALTER TABLE `comuna` DISABLE KEYS */;
INSERT INTO `comuna` VALUES (10101,'Gral. Lagos',15),(10102,'Putre',15),(10201,'Arica',15),(10202,'Camarones',15),(10301,'Camiña',1),(10302,'Huara',1),(10303,'Pozo Almonte',1),(10304,'Iquique',1),(10305,'Pica',1),(10306,'Colchane',1),(10307,'Alto Hospicio',1),(20101,'Tocopilla',2),(20102,'Maria Elena',2),(20201,'Ollague',2),(20202,'Calama',2),(20203,'San Pedro Atacama',2),(20301,'Sierra Gorda',2),(20302,'Mejillones',2),(20303,'Antofagasta',2),(20304,'Taltal',2),(30101,'Diego de Almagro',3),(30102,'Chañaral',3),(30201,'Caldera',3),(30202,'Copiapo',3),(30203,'Tierra Amarilla',3),(30301,'Huasco',3),(30302,'Freirina',3),(30303,'Vallenar',3),(30304,'Alto del Carmen',3),(40101,'La Higuera',4),(40102,'La Serena',4),(40103,'Vicuña',4),(40104,'Paihuano',4),(40105,'Coquimbo',4),(40106,'Andacollo',4),(40201,'Rio Hurtado',4),(40202,'Ovalle',4),(40203,'Monte Patria',4),(40204,'Punitaqui',4),(40205,'Combarbala',4),(40301,'Mincha',4),(40302,'Illapel',4),(40303,'Salamanca',4),(40304,'Los Vilos',4),(50101,'Petorca',5),(50102,'Cabildo',5),(50103,'Papudo',5),(50104,'La Ligua',5),(50105,'Zapallar',5),(50201,'Putaendo',5),(50202,'Santa Maria',5),(50203,'San Felipe',5),(50204,'Pencahue',5),(50205,'Catemu',5),(50206,'Llay Llay',5),(50301,'Nogales',5),(50302,'La Calera',5),(50303,'Hijuelas',5),(50304,'La Cruz',5),(50305,'Quillota',5),(50306,'Olmue',5),(50307,'Limache',5),(50401,'Los Andes',5),(50402,'Rinconada',5),(50403,'Calle Larga',5),(50404,'San Esteban',5),(50501,'Puchuncavi',5),(50502,'Quintero',5),(50503,'Viña del Mar',5),(50504,'Villa Alemana',5),(50505,'Quilpue',5),(50506,'Valparaiso',5),(50507,'Juan Fernandez',5),(50508,'Casablanca',5),(50509,'Concon',5),(50601,'Isla de Pascua',5),(50701,'Algarrobo',5),(50702,'El Quisco',5),(50703,'El Tabo',5),(50704,'Cartagena',5),(50705,'San Antonio',5),(50706,'Santo Domingo',5),(60101,'Mostazal',6),(60102,'Codegua',6),(60103,'Graneros',6),(60104,'Machali',6),(60105,'Rancagua',6),(60106,'Olivar',6),(60107,'Doñihue',6),(60108,'Requinoa',6),(60109,'Coinco',6),(60110,'Coltauco',6),(60111,'Quinta Tilcoco',6),(60112,'Las Cabras',6),(60113,'Rengo',6),(60114,'Peumo',6),(60115,'Pichidegua',6),(60116,'Malloa',6),(60117,'San Vicente',6),(60201,'Navidad',6),(60202,'La Estrella',6),(60203,'Marchigue',6),(60204,'Pichilemu',6),(60205,'Litueche',6),(60206,'Paredones',6),(60301,'San Fernando',6),(60302,'Peralillo',6),(60303,'Placilla',6),(60304,'Chimbarongo',6),(60305,'Palmilla',6),(60306,'Nancagua',6),(60307,'Santa Cruz',6),(60308,'Pumanque',6),(60309,'Chepica',6),(60310,'Lolol',6),(70101,'Teno',7),(70102,'Romeral',7),(70103,'Rauco',7),(70104,'Curico',7),(70105,'Sagrada Familia',7),(70106,'Hualañe',7),(70107,'Vichuquen',7),(70108,'Molina',7),(70109,'Licanten',7),(70201,'Rio Claro',7),(70202,'Curepto',7),(70203,'Pelarco',7),(70204,'Talca',7),(70205,'Pencahue',7),(70206,'San Clemente',7),(70207,'Constitucion',7),(70208,'Maule',7),(70209,'Empedrado',7),(70210,'San Rafael',7),(70301,'San Javier',7),(70302,'Colbun',7),(70303,'Villa Alegre',7),(70304,'Yerbas Buenas',7),(70305,'Linares',7),(70306,'Longavi',7),(70307,'Retiro',7),(70308,'Parral',7),(70401,'Chanco',7),(70402,'Pelluhue',7),(70403,'Cauquenes',7),(80101,'Cobquecura',16),(80102,'Ñiquen',16),(80103,'San Fabian',16),(80104,'San Carlos',16),(80105,'Quirihue',16),(80106,'Ninhue',16),(80107,'Trehuaco',16),(80108,'San Nicolas',16),(80109,'Coihueco',16),(80110,'Chillan',16),(80111,'Portezuelo',16),(80112,'Pinto',16),(80113,'Coelemu',16),(80114,'Bulnes',16),(80115,'San Ignacio',16),(80116,'Ranquil',16),(80117,'Quillon',16),(80118,'El Carmen',16),(80119,'Pemuco',16),(80120,'Yungay',16),(80121,'Chillan Viejo',16),(80201,'Tome',8),(80202,'Florida',8),(80203,'Penco',8),(80204,'Talcahuano',8),(80205,'Concepcion',8),(80206,'Hualqui',8),(80207,'Coronel',8),(80208,'Lota',8),(80209,'Santa Juana',8),(80210,'Chiguayante',8),(80211,'San Pedro de la Paz',8),(80212,'Hualpen',8),(80301,'Cabrero',8),(80302,'Yumbel',8),(80303,'Tucapel',8),(80304,'Antuco',8),(80305,'San Rosendo',8),(80306,'Laja',8),(80307,'Quilleco',8),(80308,'Los Angeles',8),(80309,'Nacimiento',8),(80310,'Negrete',8),(80311,'Santa Barbara',8),(80312,'Quilaco',8),(80313,'Mulchen',8),(80314,'Alto Bio Bio',8),(80401,'Arauco',8),(80402,'Curanilahue',8),(80403,'Los Alamos',8),(80404,'Lebu',8),(80405,'Cañete',8),(80406,'Contulmo',8),(80407,'Tirua',8),(90101,'Renaico',9),(90102,'Angol',9),(90103,'Collipulli',9),(90104,'Los Sauces',9),(90105,'Puren',9),(90106,'Ercilla',9),(90107,'Lumaco',9),(90108,'Victoria',9),(90109,'Traiguen',9),(90110,'Curacautin',9),(90111,'Lonquimay',9),(90201,'Perquenco',9),(90202,'Galvarino',9),(90203,'Lautaro',9),(90204,'Vilcun',9),(90205,'Temuco',9),(90206,'Carahue',9),(90207,'Melipeuco',9),(90208,'Nueva Imperial',9),(90209,'Puerto Saavedra',9),(90210,'Cunco',9),(90211,'Freire',9),(90212,'Pitrufquen',9),(90213,'Teodoro Schmidt',9),(90214,'Gorbea',9),(90215,'Pucon',9),(90216,'Villarrica',9),(90217,'Tolten',9),(90218,'Curarrehue',9),(90219,'Loncoche',9),(90220,'Padre Las Casas',9),(90221,'Cholchol',9),(100101,'Lanco',14),(100102,'Mariquina',14),(100103,'Panguipulli',14),(100104,'Mafil',14),(100105,'Valdivia',14),(100106,'Los Lagos',14),(100107,'Corral',14),(100108,'Paillaco',14),(100109,'Futrono',14),(100110,'Lago Ranco',14),(100111,'La Union',14),(100112,'Rio Bueno',14),(100201,'San Pablo',10),(100202,'San Juan',10),(100203,'Osorno',10),(100204,'Puyehue',10),(100205,'Rio Negro',10),(100206,'Purranque',10),(100207,'Puerto Octay',10),(100301,'Frutillar',10),(100302,'Fresia',10),(100303,'Llanquihue',10),(100304,'Puerto Varas',10),(100305,'Los Muermos',10),(100306,'Puerto Montt',10),(100307,'Maullin',10),(100308,'Calbuco',10),(100309,'Cochamo',10),(100401,'Ancud',10),(100402,'Quemchi',10),(100403,'Dalcahue',10),(100404,'Curaco de Velez',10),(100405,'Castro',10),(100406,'Chonchi',10),(100407,'Queilen',10),(100408,'Quellon',10),(100409,'Quinchao',10),(100410,'Puqueldon',10),(100501,'Chaiten',10),(100502,'Futaleufu',10),(100503,'Palena',10),(100504,'Hualaihue',10),(110101,'Guaitecas',11),(110102,'Cisnes',11),(110103,'Aysen',11),(110201,'Coyhaique',11),(110202,'Lago Verde',11),(110301,'Rio Ibañez',11),(110302,'Chile Chico',11),(110401,'Cochrane',11),(110402,'Tortel',11),(110403,'O\'Higgins',11),(120101,'Torres del Paine',12),(120102,'Puerto Natales',12),(120201,'Laguna Blanca',12),(120202,'San Gregorio',12),(120203,'Rio Verde',12),(120204,'Punta Arenas',12),(120301,'Porvenir',12),(120302,'Primavera',12),(120303,'Timaukel',12),(120401,'Antartica',12),(130101,'Tiltil',13),(130102,'Colina',13),(130103,'Lampa',13),(130201,'Conchali',13),(130202,'Quilicura',13),(130203,'Renca',13),(130204,'Las Condes',13),(130205,'Pudahuel',13),(130206,'Quinta Normal',13),(130207,'Providencia',13),(130208,'Santiago',13),(130209,'La Reina',13),(130210,'Ñuñoa',13),(130211,'San Miguel',13),(130212,'Maipú',13),(130213,'La Cisterna',13),(130214,'La Florida',13),(130215,'La Granja',13),(130216,'Independencia',13),(130217,'Huechuraba',13),(130218,'Recoleta',13),(130219,'Vitacura',13),(130220,'Lo Barrenechea',13),(130221,'Macul',13),(130222,'Peñalolén',13),(130223,'San Joaquín',13),(130224,'La Pintana',13),(130225,'San Ramon',13),(130226,'El Bosque',13),(130227,'Pedro Aguirre Cerda',13),(130228,'Lo Espejo',13),(130229,'Estacion Central',13),(130230,'Cerrillos',13),(130231,'Lo Prado',13),(130232,'Cerro Navia',13),(130301,'San José de Maipo',13),(130302,'Puente Alto',13),(130303,'Pirque',13),(130401,'San Bernardo',13),(130402,'Calera de Tango',13),(130403,'Buin',13),(130404,'Paine',13),(130501,'Peñaflor',13),(130502,'Talagante',13),(130503,'El Monte',13),(130504,'Isla de Maipo',13),(130601,'Curacavi',13),(130602,'María Pinto',13),(130603,'Melipilla',13),(130604,'San Pedro',13),(130605,'Alhué',13),(130606,'Padre Hurtado',13);
/*!40000 ALTER TABLE `comuna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nota`
--

DROP TABLE IF EXISTS `nota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nota` (
  `id` int NOT NULL AUTO_INCREMENT,
  `avistamiento_id` int NOT NULL,
  `nota` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_nota_avistamiento1_idx` (`avistamiento_id`),
  CONSTRAINT `fk_nota_avistamiento1` FOREIGN KEY (`avistamiento_id`) REFERENCES `avistamiento` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nota`
--

LOCK TABLES `nota` WRITE;
/*!40000 ALTER TABLE `nota` DISABLE KEYS */;
INSERT INTO `nota` VALUES (1,5,5),(2,5,1),(3,5,1),(4,5,2),(5,5,1),(6,4,7),(7,4,1),(8,1,1),(9,1,7),(10,1,1),(11,1,7);
/*!40000 ALTER TABLE `nota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `region` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES (1,'Región de Tarapacá'),(2,'Región de Antofagasta'),(3,'Región de Atacama'),(4,'Región de Coquimbo '),(5,'Región de Valparaíso'),(6,'Región del Libertador Bernardo O\'Higgins'),(7,'Región del Maule'),(8,'Región del Biobío'),(9,'Región de La Araucanía'),(10,'Región de Los Lagos'),(11,'Región Aisén del General Carlos Ibáñez del Campo'),(12,'Región de Magallanes y la Antártica Chilena'),(13,'Región Metropolitana de Santiago '),(14,'Región de Los Ríos'),(15,'Región Arica y Parinacota'),(16,'Región del Ñuble');
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro`
--

DROP TABLE IF EXISTS `registro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registro` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ruta_archivo` varchar(300) NOT NULL,
  `nombre_archivo` varchar(300) NOT NULL,
  `avistamiento_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_registro_avistamiento1_idx` (`avistamiento_id`),
  CONSTRAINT `fk_registro_avistamiento1` FOREIGN KEY (`avistamiento_id`) REFERENCES `avistamiento` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro`
--

LOCK TABLES `registro` WRITE;
/*!40000 ALTER TABLE `registro` DISABLE KEYS */;
INSERT INTO `registro` VALUES (1,'uploads/e345c8c0efe44d139c0e3b8e5cb2a4f6.png','palomadomestica.png',1),(2,'uploads/ba05833b0c944240b46e4742cf4f26ec.png','palomadomestica.png',2),(3,'uploads/a35bfc84fab348d8bacb6b8db26affb8.png','palomadomestica.png',3),(4,'uploads/153706fbdb75446791900fada35591f1.png','palomadomestica.png',4),(5,'uploads/f47a5f1fd4c8432e9ea33d794ef009ff.jpg','Bald_Eagle_Haliaeetus_leucocephalus_Kachemak_Bay_Alaska.jpg',5);
/*!40000 ALTER TABLE `registro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voluntario`
--

DROP TABLE IF EXISTS `voluntario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `voluntario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `email` varchar(80) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `fecha_registro` datetime NOT NULL,
  `comuna_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_voluntario_comuna1_idx` (`comuna_id`),
  CONSTRAINT `fk_voluntario_comuna1` FOREIGN KEY (`comuna_id`) REFERENCES `comuna` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voluntario`
--

LOCK TABLES `voluntario` WRITE;
/*!40000 ALTER TABLE `voluntario` DISABLE KEYS */;
INSERT INTO `voluntario` VALUES (1,'Qianyi Zhang','qianyi.zhang.santaelena@gmail.com','981583690','2026-10-02 16:39:57',130208),(4,'Antonia Chanqueo','antochanqueo@gmail.com','911112222','2026-10-02 17:50:34',10202),(5,'Qianyi Zhang','qianyi.zhang.santaelena@gmail.com','981583690','2026-10-02 17:59:28',130208);
/*!40000 ALTER TABLE `voluntario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-18 21:47:18
