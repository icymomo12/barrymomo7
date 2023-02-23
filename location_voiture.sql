-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- Serveur: 127.0.0.1
-- Généré le : Jeu 08 Décembre 2022 à 15:13
-- Version du serveur: 5.5.10
-- Version de PHP: 5.3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `location_voiture`
--

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE IF NOT EXISTS `clients` (
  `code_client` varchar(5) NOT NULL,
  `nom_prenom` varchar(20) NOT NULL,
  `adresse` text NOT NULL,
  `ville` text NOT NULL,
  `telephone` varchar(10) NOT NULL,
  `date_permis` date NOT NULL,
  `code_postal` varchar(5) NOT NULL,
  `email` varchar(20) NOT NULL,
  `date_naissance` date NOT NULL,
  PRIMARY KEY (`code_client`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `clients`
--

INSERT INTO `clients` (`code_client`, `nom_prenom`, `adresse`, `ville`, `telephone`, `date_permis`, `code_postal`, `email`, `date_naissance`) VALUES
('12A', 'MOMO P', '35 allée claude', 'Paris', '06987654', '2021-04-16', '75000', 'momo@gmail.com', '2003-02-18'),
('13A', 'FIFI S', '23 rue DE GUAULLE', 'Creteil', '07896543', '2006-12-12', '94000', 'FIFI@gmail.com', '1999-12-13');

-- --------------------------------------------------------

--
-- Structure de la table `locations`
--

CREATE TABLE IF NOT EXISTS `locations` (
  `id_location` int(11) NOT NULL AUTO_INCREMENT,
  `date_location` date NOT NULL,
  `duree` int(11) NOT NULL,
  `prix_jour` int(11) NOT NULL,
  `code_client` varchar(5) NOT NULL,
  `immatriculation` varchar(10) NOT NULL,
  PRIMARY KEY (`id_location`),
  KEY `code_client` (`code_client`,`immatriculation`),
  KEY `immatriculation` (`immatriculation`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Contenu de la table `locations`
--

INSERT INTO `locations` (`id_location`, `date_location`, `duree`, `prix_jour`, `code_client`, `immatriculation`) VALUES
(13, '2022-12-07', 5, 50, '12A', '13RE42');

-- --------------------------------------------------------

--
-- Structure de la table `reparation`
--

CREATE TABLE IF NOT EXISTS `reparation` (
  `num_reparation` int(11) NOT NULL AUTO_INCREMENT,
  `date_reparation` date NOT NULL,
  `duree_reparation` varchar(30) NOT NULL,
  `cout_reparation` varchar(10) NOT NULL,
  `responsable_reparation` varchar(20) NOT NULL,
  `immatriculation` varchar(10) NOT NULL,
  PRIMARY KEY (`num_reparation`),
  KEY `immatriculation` (`immatriculation`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `reparation`
--


-- --------------------------------------------------------

--
-- Structure de la table `voitures`
--

CREATE TABLE IF NOT EXISTS `voitures` (
  `immatriculation` varchar(10) NOT NULL,
  `couleur` varchar(10) NOT NULL,
  `marque` varchar(10) NOT NULL,
  `kilometrage` int(11) NOT NULL,
  `annee_circulation` date NOT NULL,
  `modele` varchar(10) NOT NULL,
  PRIMARY KEY (`immatriculation`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `voitures`
--

INSERT INTO `voitures` (`immatriculation`, `couleur`, `marque`, `kilometrage`, `annee_circulation`, `modele`) VALUES
('12TU2000', 'noir', 'mercedes', 20000, '2012-12-09', 'AMG'),
('13RE42', 'bleu', 'rolls_royc', 30000, '2022-12-19', 'CULLINAN');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `locations_ibfk_2` FOREIGN KEY (`immatriculation`) REFERENCES `voitures` (`immatriculation`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `locations_ibfk_1` FOREIGN KEY (`code_client`) REFERENCES `clients` (`code_client`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `reparation`
--
ALTER TABLE `reparation`
  ADD CONSTRAINT `reparation_ibfk_1` FOREIGN KEY (`immatriculation`) REFERENCES `voitures` (`immatriculation`) ON DELETE CASCADE ON UPDATE CASCADE;
