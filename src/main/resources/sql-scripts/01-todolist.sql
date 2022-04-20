CREATE SCHEMA IF NOT EXISTS `todolist`;
USE `todolist`;

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL UNIQUE,
  `password` VARCHAR(64) NOT NULL,
  `firstName` VARCHAR(20) NOT NULL,
  `lastName` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

LOCK TABLES `users` WRITE;

INSERT INTO `users` VALUES
	(1,'john.williams@gmail.com','password', 'John', 'Williams'),
	(2,'james.smith@gmail.com','password', 'James', 'Smith'),
	(3,'jacob.brown@gmail.com','password', 'Jacob', 'Brown');

UNLOCK TABLES;