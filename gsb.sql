-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 27 avr. 2021 à 12:59
-- Version du serveur :  5.7.31
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gsb`
--

-- --------------------------------------------------------

--
-- Structure de la table `activite_compl`
--

DROP TABLE IF EXISTS `activite_compl`;
CREATE TABLE IF NOT EXISTS `activite_compl` (
  `AC_NUM` int(11) NOT NULL AUTO_INCREMENT,
  `AC_DATE` datetime NOT NULL,
  `AC_LIEU` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `AC_THEME` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `AC_MOTIF` char(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`AC_NUM`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `activite_compl`
--

INSERT INTO `activite_compl` (`AC_NUM`, `AC_DATE`, `AC_LIEU`, `AC_THEME`, `AC_MOTIF`) VALUES
(1, '2004-07-28 15:47:38', '49, boulevard de Marie\n96 865 Vincent-les-Bains', 'cueillette de champignon', 'anniversaire de Marie Curry'),
(2, '2010-05-20 23:36:17', '71, rue de Alexandre\n73363 Jacquot', 'docteur maboule IRL', 'la découverte du sida'),
(3, '2018-03-13 08:52:31', '42, rue Capucine Carpentier\n35 154 Munoz', 'escape game', 'le nouvel ans'),
(4, '1994-09-05 06:44:29', '10, rue Christiane Renault\n32 455 Lagarde-la-Forêt', 'golf', 'telethon'),
(5, '1972-01-01 21:59:25', 'avenue Maillet\n31979 Pires', ' degustation oenologie', 'Zevent');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20210425124840', '2021-04-25 12:48:56', 1107);

-- --------------------------------------------------------

--
-- Structure de la table `inviter`
--

DROP TABLE IF EXISTS `inviter`;
CREATE TABLE IF NOT EXISTS `inviter` (
  `ID_INVITER` int(11) NOT NULL AUTO_INCREMENT,
  `SPECIALISTEON` tinyint(1) NOT NULL,
  `AC_NUM` int(11) DEFAULT NULL,
  `PRA_NUM` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`ID_INVITER`),
  KEY `AC_NUM` (`AC_NUM`),
  KEY `PRA_NUM` (`PRA_NUM`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `inviter`
--

INSERT INTO `inviter` (`ID_INVITER`, `SPECIALISTEON`, `AC_NUM`, `PRA_NUM`) VALUES
(1, 1, 1, 1),
(2, 1, 5, 2),
(3, 1, 3, 7),
(4, 1, 5, 4),
(5, 1, 4, 6),
(6, 1, 5, 3),
(7, 1, 5, 8),
(8, 1, 3, 2),
(9, 1, 3, 1),
(10, 1, 2, 10),
(11, 1, 4, 2),
(12, 1, 3, 2),
(13, 1, 4, 9),
(14, 1, 4, 5),
(15, 1, 1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `posseder`
--

DROP TABLE IF EXISTS `posseder`;
CREATE TABLE IF NOT EXISTS `posseder` (
  `ID_POSSEDER` int(11) NOT NULL AUTO_INCREMENT,
  `POS_DIPLOME` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `POS_COEFPRESCRIPTION` double NOT NULL,
  `PRA_NUM` smallint(6) DEFAULT NULL,
  `SPE_CODE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_POSSEDER`),
  KEY `PRA_NUM` (`PRA_NUM`),
  KEY `SPE_CODE` (`SPE_CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `posseder`
--

INSERT INTO `posseder` (`ID_POSSEDER`, `POS_DIPLOME`, `POS_COEFPRESCRIPTION`, `PRA_NUM`, `SPE_CODE`) VALUES
(1, 'id', 0.7, 7, 5),
(2, 'zh', 1.7, 2, 4),
(3, 'ne', 0, 6, 5),
(4, 'nv', 3.8, 4, 5),
(5, 'gv', 2, 3, 3),
(6, 'om', 2.3, 10, 3);

-- --------------------------------------------------------

--
-- Structure de la table `praticien`
--

DROP TABLE IF EXISTS `praticien`;
CREATE TABLE IF NOT EXISTS `praticien` (
  `PRA_NUM` smallint(6) NOT NULL AUTO_INCREMENT,
  `PRA_NOM` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PRA_PRENOM` char(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PRA_ADRESSE` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PRA_CP` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PRA_VILLE` char(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PRA_COEFNOTORIETE` double NOT NULL,
  `TYP_CODE` int(11) DEFAULT NULL,
  PRIMARY KEY (`PRA_NUM`),
  KEY `TYP_CODE` (`TYP_CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `praticien`
--

INSERT INTO `praticien` (`PRA_NUM`, `PRA_NOM`, `PRA_PRENOM`, `PRA_ADRESSE`, `PRA_CP`, `PRA_VILLE`, `PRA_COEFNOTORIETE`, `TYP_CODE`) VALUES
(1, 'Osteopathe de yaacov', 'Frédérique', 'place de Ferreira\n47244 Gay', '09389', 'Imbertboeuf', 0.8, 4),
(2, 'Henri Mallet', 'Yves', 'impasse Blanc\n80 517 Henry-sur-Mer', '42 230', 'Blot', 3.8, 5),
(3, 'Bernard-Alexandre Leger', 'Susanne', '85, rue Maryse Martins\n88869 Berthelotdan', '74391', 'Riou-sur-Mer', 1.6, 4),
(4, 'Patrick Mallet', 'Claude', '65, boulevard Arnaude Briand\n07 355 Le GoffVille', '66 569', 'Durand', 2, 4),
(5, 'Éric Le Dubois', 'Richard', '5, avenue Faure\n38 687 Turpin-sur-Maurice', '34 483', 'Bouvet', 3, 4),
(6, 'Hélène Le Hoarau', 'Virginie', '55, place de Pineau\n48419 Chevalier-la-Forêt', '13 031', 'Gauthier-les-Bains', 4.1, 1),
(7, 'Andrée Cohen', 'Pierre', 'chemin Gay\n71457 Rocher', '65480', 'Pages', 0.5, 1),
(8, 'Olivie Bouchet', 'Julien', '6, chemin Roy\n31 037 Caron', '50161', 'Blot', 3.5, 3),
(9, 'Jeannine Baudry-Poirier', 'Jacqueline', '87, rue de Fabre\n46028 Wagnerdan', '17 708', 'Bouvet', 0.9, 3),
(10, 'Augustin Leconte', 'Léon', 'rue Isabelle Renaud\n31107 Fernandez-sur-Foucher', '89677', 'Devaux', 0.6, 2);

-- --------------------------------------------------------

--
-- Structure de la table `specialite`
--

DROP TABLE IF EXISTS `specialite`;
CREATE TABLE IF NOT EXISTS `specialite` (
  `SPE_CODE` int(11) NOT NULL AUTO_INCREMENT,
  `SPE_LIBELLE` char(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`SPE_CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `specialite`
--

INSERT INTO `specialite` (`SPE_CODE`, `SPE_LIBELLE`) VALUES
(1, 'orthopediste'),
(2, 'acuponcture'),
(3, 'PNL'),
(4, 'ophtalmologie'),
(5, 'cardiologie'),
(6, 'cancérologie'),
(7, 'ORL'),
(8, 'Acuponcture');

-- --------------------------------------------------------

--
-- Structure de la table `type_praticien`
--

DROP TABLE IF EXISTS `type_praticien`;
CREATE TABLE IF NOT EXISTS `type_praticien` (
  `TYP_CODE` int(11) NOT NULL AUTO_INCREMENT,
  `TYP_LIBELLE` char(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TYP_LIEU` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`TYP_CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `type_praticien`
--

INSERT INTO `type_praticien` (`TYP_CODE`, `TYP_LIBELLE`, `TYP_LIEU`) VALUES
(1, 'feu', '53, boulevard de Humbert\n74723 Richarddan'),
(2, 'eau', '709, boulevard Jean Delahaye\n11751 Girard'),
(3, 'terre', '9, avenue Lefevre\n25 833 Paris-sur-Mendes'),
(4, 'glasse', '62, rue Klein\n34820 Pottier'),
(5, 'vent', '697, avenue de Gregoire\n04761 Robin');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `inviter`
--
ALTER TABLE `inviter`
  ADD CONSTRAINT `FK_74795AFA4C5E71F1` FOREIGN KEY (`AC_NUM`) REFERENCES `activite_compl` (`AC_NUM`),
  ADD CONSTRAINT `FK_74795AFABCA7C5CE` FOREIGN KEY (`PRA_NUM`) REFERENCES `praticien` (`PRA_NUM`);

--
-- Contraintes pour la table `posseder`
--
ALTER TABLE `posseder`
  ADD CONSTRAINT `FK_62EF7CBA184C030E` FOREIGN KEY (`SPE_CODE`) REFERENCES `specialite` (`SPE_CODE`),
  ADD CONSTRAINT `FK_62EF7CBABCA7C5CE` FOREIGN KEY (`PRA_NUM`) REFERENCES `praticien` (`PRA_NUM`);

--
-- Contraintes pour la table `praticien`
--
ALTER TABLE `praticien`
  ADD CONSTRAINT `FK_D9A27D3D40ADCEC` FOREIGN KEY (`TYP_CODE`) REFERENCES `type_praticien` (`TYP_CODE`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
