
CREATE DATABASE if NOT EXISTS `quote`;
USE quote;
DROP TABLE IF EXISTS `quote`;

CREATE TABLE IF NOT EXISTS `quote` (
  `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `author` varchar(250) NOT NULL,
  `quote` text  NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO `quote` (`author`, `quote`) VALUES('Anonymous', 'A dirty mind is a joy forever.');

