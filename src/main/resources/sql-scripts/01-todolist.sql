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
	(1,'john.williams@gmail.com','$2a$12$nNTKUmxK7b/ut9jGoSXyDu0pTIZHkNfMb3Ust3SNbyUZwt.SemLwq', 'John', 'Williams'),
	(2,'james.smith@gmail.com','$2a$12$nNTKUmxK7b/ut9jGoSXyDu0pTIZHkNfMb3Ust3SNbyUZwt.SemLwq', 'James', 'Smith'),
	(3,'jacob.brown@gmail.com','$2a$12$nNTKUmxK7b/ut9jGoSXyDu0pTIZHkNfMb3Ust3SNbyUZwt.SemLwq', 'Jacob', 'Brown');

UNLOCK TABLES;