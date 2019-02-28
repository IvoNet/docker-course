
CREATE DATABASE if NOT EXISTS `kwetter`;
USE kwetter;
DROP TABLE IF EXISTS `kwetter`;
DROP TABLE IF EXISTS `users`;

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE IF NOT EXISTS `kwetter` (
  `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `kwetter` varchar(140) NOT NULL  NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO `users` (`name`) VALUES('ivonet');
INSERT INTO `users` (`name`) VALUES('piet');

INSERT INTO `kwetter` (`name`, `kwetter`) VALUES('ivonet', '#jakartaee is the bom');
INSERT INTO `kwetter` (`name`, `kwetter`) VALUES('piet', '@ivonet indeed #jakartaee is fantastic');

