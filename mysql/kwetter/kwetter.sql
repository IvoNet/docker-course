
CREATE DATABASE if NOT EXISTS `kwetter`;
USE kwetter;
DROP TABLE IF EXISTS `kwetter`;
DROP TABLE IF EXISTS `users`;

CREATE TABLE IF NOT EXISTS `kwetter` (
  `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  message varchar(140) NOT NULL  NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO `kwetter` (`name`, message) VALUES('ivonet', '#jakartaee is the bom');
INSERT INTO `kwetter` (`name`, message) VALUES('piet', '@ivonet indeed #jakartaee is fantastic');

