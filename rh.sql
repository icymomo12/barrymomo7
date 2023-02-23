-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- Serveur: 127.0.0.1
-- Généré le : Jeu 05 Janvier 2023 à 16:12
-- Version du serveur: 5.5.10
-- Version de PHP: 5.3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `rh`
--

-- --------------------------------------------------------

--
-- Structure de la table `employe`
--

CREATE TABLE IF NOT EXISTS `employe` (
  `NoEMP` int(11) NOT NULL,
  `Nom` varchar(20) NOT NULL,
  `Prenom` varchar(20) NOT NULL,
  `Sexe` varchar(10) NOT NULL,
  `salaire` int(11) NOT NULL,
  `TypeContrat` varchar(20) NOT NULL,
  `Fonction` varchar(20) NOT NULL,
  `Site` varchar(20) NOT NULL,
  `DateEmbauche` date NOT NULL,
  `DateNaissance` date NOT NULL,
  `NoService` int(11) NOT NULL,
  PRIMARY KEY (`NoEMP`),
  KEY `NoService` (`NoService`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `employe`
--

INSERT INTO `employe` (`NoEMP`, `Nom`, `Prenom`, `Sexe`, `salaire`, `TypeContrat`, `Fonction`, `Site`, `DateEmbauche`, `DateNaissance`, `NoService`) VALUES
(0, 'MOMO', 'SMOKE', 'homme', 5000, 'CDI', 'CONSEILLER', 'PARIS', '2020-01-05', '1998-01-11', 1);

-- --------------------------------------------------------

--
-- Structure de la table `intervenir`
--

CREATE TABLE IF NOT EXISTS `intervenir` (
  `Num_interv` varchar(20) NOT NULL,
  `NoProjet` int(11) NOT NULL,
  `NoEmploye` int(11) NOT NULL,
  `NbHeures` int(11) NOT NULL,
  PRIMARY KEY (`Num_interv`),
  KEY `NoEmploye` (`NoEmploye`),
  KEY `NoProjet` (`NoProjet`),
  KEY `Num_interv` (`Num_interv`),
  KEY `NoProjet_2` (`NoProjet`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `intervenir`
--


-- --------------------------------------------------------

--
-- Structure de la table `projet`
--

CREATE TABLE IF NOT EXISTS `projet` (
  `NoProjet` int(11) NOT NULL,
  `LibelleProjet` varchar(20) NOT NULL,
  `NoService` int(11) NOT NULL,
  PRIMARY KEY (`NoProjet`),
  KEY `NoService` (`NoService`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `projet`
--

INSERT INTO `projet` (`NoProjet`, `LibelleProjet`, `NoService`) VALUES
(11, 'conseil_client', 1),
(12, 'livrer_domicile', 2);

-- --------------------------------------------------------

--
-- Structure de la table `service`
--

CREATE TABLE IF NOT EXISTS `service` (
  `NoService` int(11) NOT NULL,
  `NomService` varchar(20) NOT NULL,
  PRIMARY KEY (`NoService`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `service`
--

INSERT INTO `service` (`NoService`, `NomService`) VALUES
(1, 'conseillerclient'),
(2, 'livraison');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `employe`
--
ALTER TABLE `employe`
  ADD CONSTRAINT `employe_ibfk_1` FOREIGN KEY (`NoService`) REFERENCES `service` (`NoService`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `intervenir`
--
ALTER TABLE `intervenir`
  ADD CONSTRAINT `intervenir_ibfk_2` FOREIGN KEY (`NoProjet`) REFERENCES `projet` (`NoProjet`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `intervenir_ibfk_1` FOREIGN KEY (`NoEmploye`) REFERENCES `employe` (`NoEMP`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `projet`
--
ALTER TABLE `projet`
  ADD CONSTRAINT `projet_ibfk_1` FOREIGN KEY (`NoService`) REFERENCES `service` (`NoService`) ON DELETE CASCADE;
