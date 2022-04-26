CREATE SCHEMA IF NOT EXISTS `todolist`;
USE `todolist`;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL UNIQUE,
  `password` VARCHAR(64) NOT NULL,
  `first_name` VARCHAR(20) NOT NULL,
  `last_name` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

LOCK TABLES `users` WRITE;

INSERT INTO `users` VALUES
	(1,'john.williams@gmail.com','$2a$12$nNTKUmxK7b/ut9jGoSXyDu0pTIZHkNfMb3Ust3SNbyUZwt.SemLwq', 'John', 'Williams'),
	(2,'james.smith@gmail.com','$2a$12$nNTKUmxK7b/ut9jGoSXyDu0pTIZHkNfMb3Ust3SNbyUZwt.SemLwq', 'James', 'Smith'),
	(3,'jacob.brown@gmail.com','$2a$12$nNTKUmxK7b/ut9jGoSXyDu0pTIZHkNfMb3Ust3SNbyUZwt.SemLwq', 'Jacob', 'Brown');

UNLOCK TABLES;

DROP TABLE IF EXISTS `items`;

CREATE TABLE `items` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `due_date` DATE NOT NULL,
  `priority` VARCHAR(20) NOT NULL,
  `completed` VARCHAR(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  
  KEY `FK_USER_idx` (`user_id`),
  
  CONSTRAINT `FK_USER` 
  FOREIGN KEY (`user_id`) 
  REFERENCES `users` (`id`) 
  
  ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

LOCK TABLES `items` WRITE;

INSERT INTO `items` VALUES
	(1, 'Create database', '2022-04-20', 'CRITICAL', true, 1),
	(2, 'Write project logic', '2022-04-23', 'IMPORTANT', false, 1),
    (3, 'Test the project', '2022-04-29', 'LOW', false, 2);

UNLOCK TABLES;

SET FOREIGN_KEY_CHECKS = 0;