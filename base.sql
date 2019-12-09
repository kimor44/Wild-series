-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: wild-series
-- ------------------------------------------------------
-- Server version	5.7.28-0ubuntu0.18.04.4

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
-- Table structure for table `actor`
--

DROP TABLE IF EXISTS `actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor`
--

LOCK TABLES `actor` WRITE;
/*!40000 ALTER TABLE `actor` DISABLE KEYS */;
INSERT INTO `actor` VALUES (1,'Norman Reedus'),(2,'Andrew Lincoln'),(3,'Lauren Cohan'),(4,'Danai Gurira'),(5,'Julien Guibert'),(6,'Marcel Pattulacci'),(7,'Robert Robichet');
/*!40000 ALTER TABLE `actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actor_program`
--

DROP TABLE IF EXISTS `actor_program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actor_program` (
  `actor_id` int(11) NOT NULL,
  `program_id` int(11) NOT NULL,
  PRIMARY KEY (`actor_id`,`program_id`),
  KEY `IDX_B01827EE10DAF24A` (`actor_id`),
  KEY `IDX_B01827EE3EB8070A` (`program_id`),
  CONSTRAINT `FK_B01827EE10DAF24A` FOREIGN KEY (`actor_id`) REFERENCES `actor` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_B01827EE3EB8070A` FOREIGN KEY (`program_id`) REFERENCES `program` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor_program`
--

LOCK TABLES `actor_program` WRITE;
/*!40000 ALTER TABLE `actor_program` DISABLE KEYS */;
INSERT INTO `actor_program` VALUES (1,1),(1,11),(2,1),(2,6),(2,12),(3,1),(3,3),(3,11),(4,1),(4,5),(4,6),(5,7),(6,3),(6,4),(6,11),(6,12),(7,2),(7,4),(7,12);
/*!40000 ALTER TABLE `actor_program` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Horreur'),(3,'Dramatic'),(4,'Comique'),(5,'Action/Aventure'),(6,'SF'),(7,'Fantastique'),(8,'Animation'),(9,'Soap');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `episode`
--

DROP TABLE IF EXISTS `episode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `episode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `season_id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` int(11) NOT NULL,
  `synopsis` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_DDAA1CDA4EC001D1` (`season_id`),
  CONSTRAINT `FK_DDAA1CDA4EC001D1` FOREIGN KEY (`season_id`) REFERENCES `season` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `episode`
--

LOCK TABLES `episode` WRITE;
/*!40000 ALTER TABLE `episode` DISABLE KEYS */;
INSERT INTO `episode` VALUES (1,1,'Days Gone Bye',1,'Deputy Sheriff Rick Grimes awakens from a coma, and searches for his family in a world ravaged by the undead.'),(2,1,'Guts',2,'In Atlanta, Rick is rescued by a group of survivors, but they soon find themselves trapped inside a department store surrounded by walkers.'),(3,1,'Tell It to the Frogs',3,'Rick is reunited with Lori and Carl but soon decides - along with some of the other survivors - to return to the rooftop and rescue Merle. Meanwhile, tensions run high between the other survivors at the camp.'),(4,2,'What Lies Ahead',1,'The group\'s plan to head for Fort Benning is put on hold when Sophia goes missing.'),(5,2,'Bloodletting',2,'After Carl is accidentally shot, the group are brought to a family living on a nearby farm. Shane makes a dangerous trip in search of medical supplies.'),(6,2,'Save the Last One',3,'As Carl\'s condition continues to deteriorate, Shane and Otis try to dodge the walkers as they head back to the farm.'),(7,3,'Seed',1,'After months on the run, the group take refuge in a federal prison, while elsewhere, Andrea\'s health starts to deteriorate.'),(8,3,'Sick',2,'As Hershel\'s condition worsens, Rick, Daryl and T-Dog deal with a group of prisoners.'),(9,3,'Walk with Me',3,'Andrea and Michonne are brought to a walled community run by a man called The Governor.'),(10,4,'Steven Sees a Ghost',1,'While investigating a ghost story for his latest novel, a skeptical Steven receives a call from his sister that triggers a chain of fateful events.'),(11,4,'Open Casket',2,'A devastating family tragedy stirs memories of traumatic losses, reminding Shirley of her first brush with death -- and awakening long-dormant fears.'),(12,4,'Touch',3,'Keenly perceptive Theo sees shades of herself in a troubled young patient, a girl who\'s haunted by the menacing grin of Mr. Smiley.'),(13,5,'Episode #2.1',1,'Toujours pas de synopsis'),(14,5,'Episode #2.2',2,'Toujours pas de synopsis'),(15,6,'Pilot',1,'Therapist Ben Harmon, his wife, Vivien, and their daughter, Violet, move across the country to Los Angeles to escape their troubled past.'),(16,6,'Home Invasion',2,'Serial killer enthusiasts reenact the brutal murders of two nursing students, while Ben returns to Boston to fix a mistake involving an old flame.'),(17,6,'Murder House',3,'Ben confronts Moira about recent strange behavior, while Vivien learns about the house\'s first resident. OK'),(18,7,'Welcome to Briarcliff',1,'After a life-changing experience, a young man is admitted into a notorious insane asylum, while a local reporter is determined to get the full story.'),(19,7,'Tricks and Treats',2,'An exorcist is summoned to Briarcliff to help save a troubled farm boy. Sister Jude\'s darkest secret is revealed.'),(20,7,'Nor\'easter',3,'A group of patients plan an escape from the asylum during a violent storm.'),(21,8,'Bitchcraft',1,'After discovering her unique bloodline, a young girl is whisked away to a special academy for girls who share the same lineage.'),(22,8,'Boy Parts',2,'Fiona threatens a long-standing peace when she delves into Madame LaLaurie\'s past, while Zoe and Madison must deal with a horrible tragedy.'),(23,8,'The Replacements',3,'Fiona takes on an unlikely protege. A guilt-ridden Zoe tries to give Kyle his old life back. Madison has a fiery exchange with Joan Ramsey, a new neighbor.'),(24,9,'Monsters Among Us',1,'After their mother\'s murder, conjoined twins Bette and Dot are hired by struggling freak show owner Elsa Mars.'),(25,9,'Massacres and Matinees',2,'With a killer on the loose, police impose a curfew on Jupiter. Elsa hires a strongman, unaware of his dark past with Ethel.'),(26,9,'Edward Mordrake: Part 1',3,'Elsa defies superstition to rehearse on Halloween, summoning the spirit of Edward Mordrake and his ghostly band of freaks.'),(27,10,'Checking In',1,'A pair of foreign sisters check into the Hotel Cortez, while an L.A. detective investigates a brutal murder.'),(28,10,'Chutes and Ladders',2,'Fashion mogul Will Drake brings couture to the Hotel Cortez. A model catches the Countess\' eye. John learns about the hotel\'s sadistic first owner.'),(29,10,'Mommy',3,'John deals with marital issues. Donovan is targeted by a dangerous rival of the Countess.'),(30,10,'Devil\'s Night',4,'John receives an invitation to attend an exclusive Devil\'s Night Soiree. Alex tries to diagnose Holden\'s strange condition.'),(31,11,'Chapter 1',1,'Matt and Shelby, a couple from Los Angeles, leave the city and move into a mysterious house in North Carolina, where strange things begin to occur.'),(32,11,'Chapter 2',2,'While the Millers discover some of their house\'s history, Lee falls into old habits and her daughter, Flora, makes a new friend.'),(33,11,'Chapter 3',3,'The search for Flora continues as the situation grows more and more dire. The Millers talk to a paranormal expert to help them with their problem.'),(34,12,'Election Night',1,'A married couple struggles with their lives and marriage while clowns terrorize the city.'),(35,12,'Don\'t Be Afraid of the Dark',2,'Ally, Ivy and Oz meet the new neighbors. Kai runs for city council. Detective Samuels investigates a murder. A blackout terrorizes Ally.'),(36,12,'Neighbors from Hell',3,'The community turns on Ally, as she and Ivy are the target of a series of disturbing events; Beverly reports on a serial killer in the area.'),(37,13,'The End',1,'After a nuclear attack, a select few must survive in a bunker dubbed Outpost Three ruled by a tyrannical matriarch.'),(38,13,'The Morning After',2,'Michael Langdon prepares a meeting with the guests of Outpost 3. Meanwhile, Ms. Venable and Ms. Mead have a sinister plan in store.'),(39,13,'Forbidden Fruit',3,'Ms. Venable and Ms. Mead enact a sinister plan on Halloween, while a figure from the past resurfaces.'),(40,14,'Camp Redwood',1,'In the summer of 1984, five friends escape Los Angeles to work as counselors at Camp Redwood. As they adjust to their new jobs, they quickly learn that the only thing scarier than campfire tales is the past coming to haunt you.'),(41,14,'Mr. Jingles',2,'Darkness descends upon the camp. Although it\'s lights out, evil has no curfew.'),(42,14,'Slashdance',3,'Imitation is the best form of tragedy. Coming clean can be pretty messy.'),(43,15,'Sonnie\'s Edge',1,'In the underground world of beastie fights, Sonnie is unbeatable -- as long as she keeps her edge.'),(44,15,'Three Robots',2,'Long after the fall of humanity, three robots embark on a sightseeing tour of a post-apocalyptic city.'),(45,15,'The Witness',3,'After seeing a brutal murder, a woman flees from the killer through the streets of a surreal city.'),(46,16,'Night Work',1,'London 1891. Renowned explorer Sir Malcolm Murray and the strangely beautiful Vanessa Ives recruit American sharp-shooter Ethan Chandler and Dr. Victor Frankenstein to help them search for someone who has been lost.'),(47,16,'Séance',2,'Vanessa and Sir Malcolm encounter the mysteriously beautiful Dorian Gray at a party. Things take a turn, however, when renowned medium Madame Kali hosts a séance. Meanwhile, Ethan befriends Ms. Brona Croft, a young Irish immigrant.'),(48,16,'Resurrection',3,'Dr. Frankenstein is confronted by his past. Vanessa has a vision of Mina, which leads to a strange discovery at the London Zoo.'),(49,17,'Fresh Hell',1,'Sir Malcolm returns to find a new evil hunting Vanessa.'),(50,17,'Verbis Diablo',2,'A haunted Vanessa turns to Sir Malcolm for solace. Meanwhile, Dorian Gray meets an intriguing woman with a secret, Hecate hunts down a prize for her mother - and Ferdinand Lyle reveals the disturbing backstory of the Verbis Diablo.'),(51,17,'The Nightcomers',3,'In a flashback, Vanessa meets The Cut-Wife, who quickly realizes the extent of Vanessa\'s powers and warns her of the danger that lies ahead - and the evil that pursues her.'),(52,18,'The Day Tennyson Died',1,'With Ethan, Sir Malcolm and Dr. Frankenstein now scattered around the world facing their own demons, a shattered and despondent Vanessa seeks the help of Dr. Seward to battle a new evil.'),(53,18,'Predators Far and Near',2,'Sir Malcolm continues on his journey with the enigmatic Kaetenay. Meanwhile, Ethan gets some unexpected help from Hecate, Drs. Frankenstein and Jekyll hatch a plan and unbeknownst to her, evil forces track Vanessa\'s every move.'),(54,18,'Good and Evil Braided Be',3,'Vanessa Ives is confronted by a familiar face who will reveal a clue to her past.'),(55,19,'Pilot',1,'A highly dysfunctional blended family is forced together when they realize a reported virus is actually the onset of the undead apocalypse.'),(56,19,'So Close, Yet So Far',2,'While Madison struggles to keep Nick from a crippling withdrawal, Travis ventures out to find his son before the city of Los Angeles falls.'),(57,19,'The Dog',3,'After they escape a riot, Travis, Liza and Chris seek refuge with the Salazars; Madison defends her home.'),(58,20,'Monster',1,'Travis, Madison, and their blended family set sail on Strand\'s boat off the coast of California in an effort to escape the apocalypse. While they\'re looking for safety, they only find more trouble at sea.'),(59,20,'We All Fall Down',2,'The group seeks shelter with a survivalist family. Madison tries to uncover the family\'s true motives. Meanwhile, Salazar works to discover Strand\'s intentions.'),(60,20,'Ouroboros',3,'Madison confronts Strand about his mysterious destination. Meanwhile, Nick, Alicia and others inspect wreckage from a plane crash.'),(61,21,'Eye of the Beholder',1,'The Clark family find themselves in a dire predicament and must work together to discover a path to safety.'),(62,21,'The New Frontier',2,'Strand faces resistance as he attempts to hold power over his domain.'),(63,21,'TEOTWAWKI',3,'Alicia and Nick fall in with new crowds. Madison discovers Otto\'s past mimics her own.'),(64,22,'De la graine de héros',1,'Les parents de Morty découvrent qu\'il était absent de l\'école pendant la moitié de l\'année scolaire. Il était avec Rick, en vadrouille dans l\'univers.'),(65,22,'I, croquette',2,'Rick améliore l\'intelligence du chien de Jerry puis entraîne Morty dans l\'esprit de son professeur de mathématique pour qu\'il lui donne une bonne note.'),(66,23,'Effet Rick-ochet',1,'Rick lutte pour rétablir une trame temporelle cohérente, mais ne parvient qu\'à attirer l\'attention d\'une entité cosmique venant d\'une autre dimension.'),(67,23,'Prout, l\'extra-terrestre',2,'Après avoir débarqué Jerry, qui s\'était introduit dans leur appareil, Rick et Morty vont vendre une arme à un assassin extraterrestre. Morty s\'en émeut.');
/*!40000 ALTER TABLE `episode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration_versions`
--

DROP TABLE IF EXISTS `migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration_versions`
--

LOCK TABLES `migration_versions` WRITE;
/*!40000 ALTER TABLE `migration_versions` DISABLE KEYS */;
INSERT INTO `migration_versions` VALUES ('20191118160001','2019-11-18 16:05:03'),('20191118161826','2019-11-18 16:23:54'),('20191118192122','2019-11-18 19:23:00'),('20191118192828','2019-11-18 19:29:08'),('20191125150626','2019-11-25 15:07:06'),('20191206123013','2019-12-06 12:43:08');
/*!40000 ALTER TABLE `migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program`
--

DROP TABLE IF EXISTS `program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `poster` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_92ED778412469DE2` (`category_id`),
  CONSTRAINT `FK_92ED778412469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program`
--

LOCK TABLES `program` WRITE;
/*!40000 ALTER TABLE `program` DISABLE KEYS */;
INSERT INTO `program` VALUES (1,'Walking Dead','Le policier Rick Grimes se réveille après un long coma. Il découvre avec effarement que le monde, ravagé par une épidémie, est envahi par les morts-vivants.','https://m.media-amazon.com/images/M/MV5BZmFlMTA0MmUtNWVmOC00ZmE1LWFmMDYtZTJhYjJhNGVjYTU5XkEyXkFqcGdeQXVyMTAzMDM4MjM0._V1_.jpg',1),(2,'The Haunting Of Hill House','Plusieurs frères et sœurs qui, enfants, ont grandi dans la demeure qui allait devenir la maison hantée la plus célèbre des États-Unis, sont contraints de se réunir pour finalement affronter les fantômes de leur passé. Quel suspense !','https://m.media-amazon.com/images/M/MV5BMTU4NzA4MDEwNF5BMl5BanBnXkFtZTgwMTQxODYzNjM@._V1_SY1000_CR0,0,674,1000_AL_.jpg',1),(3,'American Horror Story','A chaque saison, son histoire. American Horror Story nous embarque dans des récits à la fois poignants et cauchemardesques, mêlant la peur, le gore et le politiquement correct.','https://m.media-amazon.com/images/M/MV5BODZlYzc2ODYtYmQyZS00ZTM4LTk4ZDQtMTMyZDdhMDgzZTU0XkEyXkFqcGdeQXVyMzQ2MDI5NjU@._V1_SY1000_CR0,0,666,1000_AL_.jpg',1),(4,'Love Death And Robots','Un yaourt susceptible, des soldats lycanthropes, des robots déchaînés, des monstres-poubelles, des chasseurs de primes cyborgs, des araignées extraterrestres et des démons assoiffés de sang : tout ce beau monde est réuni dans 18 courts métrages animés déconseillés aux âmes sensibles.','https://m.media-amazon.com/images/M/MV5BMTc1MjIyNDI3Nl5BMl5BanBnXkFtZTgwMjQ1OTI0NzM@._V1_SY1000_CR0,0,674,1000_AL_.jpg',1),(5,'Penny Dreadful','Dans le Londres ancien, Vanessa Ives, une jeune femme puissante aux pouvoirs hypnotiques, allie ses forces à celles de Ethan, un garçon rebelle et violent aux allures de cowboy, et de Sir Malcolm, un vieil homme riche aux ressources inépuisables. Ensemble, ils combattent un ennemi inconnu, presque invisible, qui ne semble pas humain et qui massacre la population.','https://m.media-amazon.com/images/M/MV5BNmE5MDE0ZmMtY2I5Mi00Y2RjLWJlYjMtODkxODQ5OWY1ODdkXkEyXkFqcGdeQXVyNjU2NjA5NjM@._V1_SY1000_CR0,0,695,1000_AL_.jpg',1),(6,'Fear The Walking Dead','La série se déroule au tout début de l épidémie relatée dans la série mère The Walking Dead et se passe dans la ville de Los Angeles, et non à Atlanta. Madison est conseillère dans un lycée de Los Angeles. Depuis la mort de son mari, elle élève seule ses deux enfants : Alicia, excellente élève qui découvre les premiers émois amoureux, et son grand frère Nick qui a quitté la fac et a sombré dans la drogue.','https://m.media-amazon.com/images/M/MV5BYWNmY2Y1NTgtYTExMS00NGUxLWIxYWQtMjU4MjNkZjZlZjQ3XkEyXkFqcGdeQXVyMzQ2MDI5NjU@._V1_SY1000_CR0,0,666,1000_AL_.jpg',1),(7,'Rick et Morty','Un brillant inventeur et son petit fils un peu à l\'Ouest partent à l\'aventure...','https://images-na.ssl-images-amazon.com/images/I/91kU1f6aOWL._AC_SL1500_.jpg',4),(8,'Chernobyl','Une série sur Chernobyl','http://fr.web.img2.acsta.net/c_216_288/pictures/19/04/29/08/21/1692162.jpg?coixp=46&coiyp=68',3),(11,'Un si grand soleil','Claire revient à Montpellier après dix sept ans d’absence, afin de faire découvrir à Théo, son fils adolescent, sa ville natale. Quelques heures plus tard, elle est en garde à vue, accusée du meurtre d’un ami d’enfance. Pour se disculper, Claire n’aura d’autre choix que de percer tous les secrets du passé, notamment celui de la mort de sa sœur Angèle…\r\n\r\nTout en se confrontant à Manu, chargé d’enquêter sur le meurtre dont elle est accusée, elle retrouvera également Julien, sa passion de jeunesse, qui a entre-temps fondé une famille. Assumera-t-elle les sentiments qu’elle ressent tour à tour pour les deux hommes ?','https://fusion.molotov.tv/arts/m2/446x588/Ch8SHQoUtqZXMhPIAHS71JuBY--VFd_Q4dwSA2pwZxgBCh8IARIbChSxT7NZZX7O0Wz61c_uqwWDCkXl0hIDcG5n/jpg',9),(12,'Vikings','Scandinavie, à la fin du 8ème siècle. Ragnar Lodbrok, un jeune guerrier viking, est avide d\'aventures et de nouvelles conquêtes. Lassé des pillages sur les terres de l\'Est, il se met en tête d\'explorer l\'Ouest par la mer. Malgré la réprobation de son chef, Haraldson, il se fie aux signes et à la volonté des dieux, en construisant une nouvelle génération de vaisseaux, plus légers et plus rapides...','https://vikings-series.fr/images/Vikings-Saison-2-Affiche.jpg',1);
/*!40000 ALTER TABLE `program` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `season`
--

DROP TABLE IF EXISTS `season`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `season` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `program_id` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F0E45BA93EB8070A` (`program_id`),
  CONSTRAINT `FK_F0E45BA93EB8070A` FOREIGN KEY (`program_id`) REFERENCES `program` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season`
--

LOCK TABLES `season` WRITE;
/*!40000 ALTER TABLE `season` DISABLE KEYS */;
INSERT INTO `season` VALUES (1,1,2010,'La saison 1 de The walking dead avec plusieurs épisodes au suspense insoutenable'),(2,1,2011,'Retrouvez vos héros de la saison 1 avec encore plus d\'intrige et de rebondissements'),(3,1,2012,'La série suit son cours avec son suspense ses coups de tonerres...'),(4,2,2018,'Plusieurs frères et sœurs qui, enfants, ont grandi dans la demeure qui allait devenir la maison hantée la plus célèbre des États-Unis sont contraints de se retrouver pour faire face à cette tragédie ensemble. La famille doit enfin affronter les fantômes de son passé, dont certains sont encore bien présents dans leurs esprits alors que d’autres continuent de traquer Hill House.'),(5,2,2019,'Frères et soeurs sont toujours là et continuent de nous intriger.'),(6,3,2011,'Les esprits rôdent et sont bien décidés à torturer la famille Harmon, afin de les confronter à leurs plus grandes peurs...'),(7,3,2012,'L arrivée d un nouvel élément perturbateur, surnommé Bloody Face et dont on dit qu il a décapité et dépecé trois femmes, dont sa petite amie, entraîne une escalade de violence à la clinique psychiatrique de Briarcliff...'),(8,3,2013,'A la Nouvelle-Orléans, une école spécialisée accueille les plus jeunes sorcières dont Zoé, une jeune fille qui cache un lourd secret.'),(9,3,2014,'Les coulisses d\'une troupe de forains dans l\'Amérique profonde des années 1950.'),(10,3,2015,'Drames et cauchemars dans un mystérieux hôtel de Los Angeles, fréquenté par d\'étranges créatures.'),(11,3,2016,'Le cauchemar d\'un couple s\'installant dans une petite ville de l\'Amérique profonde, raconté à la façon d\'un docu-fiction alternant témoignages des protagonistes et séquences reconstituées par des acteurs. '),(12,3,2017,'Bouleversée par la victoire de Donald Trump à l\'élection présidentielle, une jeune femme est terrorisée par d\'effrayants clowns. Cauchemar ou réalité ?'),(13,3,2018,'À la suite d\'une apocalypse, quelques élus triés sur le volet survivent dans un bunker protégé. Alors que les tensions montent, une question hante les esprits : le véritable enfer est-il à l\'extérieur, dans le désert nucléaire, ou avec eux, dans cet inquiétant lieu clos ?'),(14,3,2019,'Durant l\'été 1984, cinq amis se font engager comme moniteurs au Camp Redwood. Très vite, ils découvrent qu\'il y a quelque chose d\'encore plus terrifiant que les histoires de feu de camp.'),(15,4,2019,'Un yaourt susceptible, des soldats lycanthropes, des robots déchaînés, des monstres-poubelles, des chasseurs de primes cyborgs, des araignées extraterrestres et des démons de l\'enfer assoiffés de sang : tout ce beau monde est réuni dans 18 courts d\'animation déconseillés aux âmes sensibles.'),(16,5,2014,'Londres, 1891. Vanessa Ives, une jeune femme aux pouvoirs puissants et hypnotiques, s’allie à Ethan Chandler, un homme rebelle et violent, ainsi qu’à Sir Malcolm, un homme riche d’un certain âge aux ressources intarissables. Ensemble, ils combattent une menace quasi invisible qui massacre la population.'),(17,5,2015,'Alors que les étranges pouvoirs de Vanessa Ives se développent, des forces sournoises lancent des sorts à ses proches. Dans ce monde troublant, où les personnages les plus emblématiques et terrifiants de la littérature errent dans les rues, des alliances improbables se forment pour combattre des tentations inimaginables.'),(18,5,2016,'Et si le seul moyen de combattre nos démons était de les laisser prendre le dessus ? Confrontés à de nouvelles atrocités dans de nouvelles contrées, Ethan Chandler, Dr. Frankenstein, Dorian Gray, Sir Malcolm, la Créature ainsi que la funeste Lily doivent chacun affronter et ne faire plus qu’un avec la facette la plus monstrueuse de leur personnalité. Mais pour Vanessa Ives, accepter ses démons pourrait lui coûter très cher et plonger le monde dans d’éternelles ténèbres.'),(19,6,2015,'A Los Angeles, Nick Clark, un jeune toxicomane qui accumule les problèmes, se réveille dans une église abandonnée et découvre son amie en train de dévorer la mâchoire d’un cadavre. Révélant ce qu’il a vu, sa famille pense qu’il s’agit d’hallucinations liées à sa consommation de drogue, même si de nombreux phénomènes étranges se produisent en ville. Mais Madison, sa mère, qui ne croit pas les histoires de son fils et encore moins les rumeurs d’épidémie mortelle qui courent dans le lycée où elle travaille, se rend vite compte que l’apocalypse vient de débuter.'),(20,6,2016,'Après avoir assisté à la destruction de la ville de Los Angeles, Travis, Madison et leur famille sont montés à bord du yacht Abigail. Inconscients de l’ampleur de l’apocalypse qui a touché le pays, ils espèrent regagner la terre ferme et trouver refuge dans un endroit épargné par l’infection. Dans le même temps, l’opération Cobalt, menée par les militaires pour enrayer la propagation de l’épidémie, déclenche une migration massive des zombies vers les côtes.'),(21,6,2017,'Alors que Madison et les siens tentent de rétablir un semblant de civilisation à la frontière mexicaine, Alicia a bien du mal à dépasser le meurtre d\'Andres. Pour survivre aux menaces, la petite bande forme de nouvelles alliances et va devoir faire face à de lourdes pertes. De son côté, Nick est plus vulnérable que jamais après l’enlèvement de Luciana par un groupe armé américain.'),(22,7,2013,'Un brillant inventeur et son petit fils un peu à l\'Ouest partent à l\'aventure...'),(23,7,2015,'Pas de description');
/*!40000 ALTER TABLE `season` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-09 10:30:53
