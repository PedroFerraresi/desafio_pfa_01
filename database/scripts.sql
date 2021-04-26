USE `desafio_01_fc`;

SET NAMES 'utf8';

CREATE TABLE `desafio_01_fc`.`modulos` (
  `id` INT NOT NULL,
  `name` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id`)) CHARACTER SET utf8 COLLATE utf8_general_ci;

INSERT INTO `desafio_01_fc`.`modulos` (`id`, `name`) VALUES ('1', 'Docker');
INSERT INTO `desafio_01_fc`.`modulos` (`id`, `name`) VALUES ('2', 'Fundamentos de Arquitetura de Software');
INSERT INTO `desafio_01_fc`.`modulos` (`id`, `name`) VALUES ('3', 'Comunicação');
INSERT INTO `desafio_01_fc`.`modulos` (`id`, `name`) VALUES ('4', 'RabbitMQ');
INSERT INTO `desafio_01_fc`.`modulos` (`id`, `name`) VALUES ('5', 'Autenticação e Keycloak');
INSERT INTO `desafio_01_fc`.`modulos` (`id`, `name`) VALUES ('6', 'Domain Driven Design e Arquitetura Hexagonal');
INSERT INTO `desafio_01_fc`.`modulos` (`id`, `name`) VALUES ('7', 'Arquitetura de Projeto Prático - Codeflix');
INSERT INTO `desafio_01_fc`.`modulos` (`id`, `name`) VALUES ('8', 'Micro Serviço: Catálogo de Vídeos com Laravel (Back-end)');
INSERT INTO `desafio_01_fc`.`modulos` (`id`, `name`) VALUES ('9', 'Micro Serviço: Catálogo de Vídeos com React (Front-end)');
INSERT INTO `desafio_01_fc`.`modulos` (`id`, `name`) VALUES ('10', 'Micro Serviço de Encoder de Vídeo com Go Lang');