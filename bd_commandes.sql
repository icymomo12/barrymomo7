-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- Serveur: 127.0.0.1
-- Généré le : Jeu 12 Janvier 2023 à 15:04
-- Version du serveur: 5.5.10
-- Version de PHP: 5.3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `GESTION DE COMMANDES`
--

-- --------------------------------------------------------

--
-- Structure de la table `ccategorie`
--

CREATE TABLE IF NOT EXISTS `ccategorie` (
  `num_categorie` int(11) NOT NULL,
  `nom_categorie` varchar(20) NOT NULL,
  `cat_remise` int(11) NOT NULL,
  PRIMARY KEY (`num_categorie`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `ccategorie`
--

INSERT INTO `ccategorie` (`num_categorie`, `nom_categorie`, `cat_remise`) VALUES
(1, 'informatique', 5),
(2, 'vetements', 3);

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE IF NOT EXISTS `clients` (
  `client_id` varchar(20) NOT NULL,
  `client_civilite` varchar(20) NOT NULL,
  `client_nom` varchar(20) NOT NULL,
  `client_prenom` varchar(10) NOT NULL,
  `client_dep` varchar(20) NOT NULL,
  `client ville` varchar(20) NOT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `clients`
--

INSERT INTO `clients` (`client_id`, `client_civilite`, `client_nom`, `client_prenom`, `client_dep`, `client ville`) VALUES
('AZERTY12', 'homme', 'SMOKE', 'MOMO', 'PARIS', 'PARIS'),
('AZERTY13', 'femme', 'SALL', 'FIFI', 'NEW_YORK', 'JERSEY');

-- --------------------------------------------------------

--
-- Structure de la table `commandes`
--

CREATE TABLE IF NOT EXISTS `commandes` (
  `com_num` int(11) NOT NULL,
  `com_date` date NOT NULL,
  `com_montant` int(11) NOT NULL,
  `client_id` varchar(20) NOT NULL,
  `produit_ref` varchar(20) NOT NULL,
  PRIMARY KEY (`com_num`),
  KEY `client_id` (`client_id`),
  KEY `produit_ref` (`produit_ref`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `commandes`
--

INSERT INTO `commandes` (`com_num`, `com_date`, `com_montant`, `client_id`, `produit_ref`) VALUES
(1, '2020-01-01', 65, 'AZERTY12', 'CP1234'),
(2, '2021-01-12', 200, 'AZERTY13', 'OR123');

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

CREATE TABLE IF NOT EXISTS `produits` (
  `produit_ref` varchar(20) NOT NULL,
  `produit_nom` varchar(20) NOT NULL,
  `produit_prix` int(11) NOT NULL,
  `produit_poids` int(11) NOT NULL,
  `produit_vues` int(11) NOT NULL,
  `produit_stock` int(11) NOT NULL,
  `produit_code` varchar(20) NOT NULL,
  `num_categorie` int(11) NOT NULL,
  PRIMARY KEY (`produit_ref`),
  KEY `num_categorie` (`num_categorie`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `produits`
--

INSERT INTO `produits` (`produit_ref`, `produit_nom`, `produit_prix`, `produit_poids`, `produit_vues`, `produit_stock`, `produit_code`, `num_categorie`) VALUES
('CP1234', 'cargot_pant', 65, 3, 1000, 22, 'CA1', 2),
('OR123', 'pc_portable', 200, 5, 1500, 23, 'CB1', 1);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD CONSTRAINT `commandes_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`),
  ADD CONSTRAINT `commandes_ibfk_2` FOREIGN KEY (`produit_ref`) REFERENCES `produits` (`produit_ref`);

--
-- Contraintes pour la table `produits`
--
ALTER TABLE `produits`
  ADD CONSTRAINT `produits_ibfk_1` FOREIGN KEY (`num_categorie`) REFERENCES `ccategorie` (`num_categorie`);
