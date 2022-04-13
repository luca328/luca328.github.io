-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 13 avr. 2022 à 06:13
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gsb_visties`
--

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
('DoctrineMigrations\\Version20211122155814', '2021-11-22 15:58:34', 76),
('DoctrineMigrations\\Version20211122161732', '2021-11-22 16:17:59', 354),
('DoctrineMigrations\\Version20211122162512', '2021-11-22 16:25:22', 109),
('DoctrineMigrations\\Version20211122162924', '2021-11-22 16:30:33', 74),
('DoctrineMigrations\\Version20211124104940', '2021-11-24 10:50:52', 462),
('DoctrineMigrations\\Version20220323094824', '2022-03-23 09:50:44', 864);

-- --------------------------------------------------------

--
-- Structure de la table `motif`
--

DROP TABLE IF EXISTS `motif`;
CREATE TABLE IF NOT EXISTS `motif` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mot_libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `praticien`
--

DROP TABLE IF EXISTS `praticien`;
CREATE TABLE IF NOT EXISTS `praticien` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pra_nom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pra_prenom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pra_tel` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pra_mail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pra_rue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pra_code_postal` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pra_ville` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pra_coef_notoriete` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `praticien`
--

INSERT INTO `praticien` (`id`, `pra_nom`, `pra_prenom`, `pra_tel`, `pra_mail`, `pra_rue`, `pra_code_postal`, `pra_ville`, `pra_coef_notoriete`) VALUES
(1, 'Kerluke', 'Andy', '815-832-2617', 'Aubrey79@hotmail.com', '135 rue des mirtilles', '83110', 'sanary', 0),
(2, 'Senger', 'Phyllis', '884-995-3600', 'Loma_DuBuque88@yahoo.com', '135 rue des mirtilles', '83110', 'sanary', 0),
(3, 'Bernhard', 'Sylvan', '458-511-1672', 'Dolores.Zieme85@gmail.com', '135 rue des mirtilles', '83110', 'sanary', 0);

-- --------------------------------------------------------

--
-- Structure de la table `praticien_visiteur`
--

DROP TABLE IF EXISTS `praticien_visiteur`;
CREATE TABLE IF NOT EXISTS `praticien_visiteur` (
  `praticien_id` int(11) NOT NULL,
  `visiteur_id` int(11) NOT NULL,
  PRIMARY KEY (`praticien_id`,`visiteur_id`),
  KEY `IDX_497AEEC72391866B` (`praticien_id`),
  KEY `IDX_497AEEC77F72333D` (`visiteur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `praticien_visiteur`
--

INSERT INTO `praticien_visiteur` (`praticien_id`, `visiteur_id`) VALUES
(1, 13),
(2, 13);

-- --------------------------------------------------------

--
-- Structure de la table `visites`
--

DROP TABLE IF EXISTS `visites`;
CREATE TABLE IF NOT EXISTS `visites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vst_praticien_id` int(11) DEFAULT NULL,
  `vst_motif_id` int(11) DEFAULT NULL,
  `vst_visiteur_id` int(11) DEFAULT NULL,
  `vst_datetime` datetime DEFAULT NULL,
  `vst_commentaire` longtext COLLATE utf8mb4_unicode_ci,
  `vst_datevisite` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_470D3983F210BF63` (`vst_praticien_id`),
  KEY `IDX_470D398330E71ABC` (`vst_motif_id`),
  KEY `IDX_470D3983452CCA99` (`vst_visiteur_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `visites`
--

INSERT INTO `visites` (`id`, `vst_praticien_id`, `vst_motif_id`, `vst_visiteur_id`, `vst_datetime`, `vst_commentaire`, `vst_datevisite`) VALUES
(5, 1, NULL, 2, NULL, 'test', '2022-03-14 17:21:22');

-- --------------------------------------------------------

--
-- Structure de la table `visiteur`
--

DROP TABLE IF EXISTS `visiteur`;
CREATE TABLE IF NOT EXISTS `visiteur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vis_nom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vis_prenom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vis_tel` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_4EA587B8E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `visiteur`
--

INSERT INTO `visiteur` (`id`, `email`, `roles`, `password`, `vis_nom`, `vis_prenom`, `vis_tel`) VALUES
(2, 'Deondre60@yahoo.com', '[]', '$2y$13$c.bIAzujgW0DyE1W6lPlEeilwah5RTUO1gz4/.7ID7BmHIHnDRZX2', NULL, NULL, NULL),
(3, 'Jeffrey32@gmail.com', '[]', '$2y$13$oLYEx0mWuDxLk884DgCNruxOdvUOWP3eo6x86p3SSQLYctqt8MjBa', NULL, NULL, NULL),
(4, 'Celestine37@hotmail.com', '[]', '$2y$13$MN1Sj7.5V6KY7I1fl1yWCOR4m3tpBDVw9WtRIFThKDsg5bjhKhami', NULL, NULL, NULL),
(5, 'Alvera21@hotmail.com', '[]', '$2y$13$He2XWwyFc1u3W908J.c/XubApZ.Q9BdPNVS/ybOgaMLzsDAb3ZcrK', NULL, NULL, NULL),
(6, 'Ariane.Spinka@gmail.com', '[]', '$2y$13$Xww7FyG3ApNSMRHOWgFuK.QRekfmlPsUiGIUPn2x2rSz/Xgob0bFy', NULL, NULL, NULL),
(7, 'Linwood.Hartmann@hotmail.com', '[]', '$2y$13$YJic7i/.WqqlSu5yGeOSyOJGla7s1DpfIEHgGfG2rF0lbc4F1sqoq', NULL, NULL, NULL),
(8, 'Ivah.Hills@hotmail.com', '[]', '$2y$13$hXrBCLp8wAnnrFmuTJpdOOWqs4QLOsc5NpOSM3Hmati45QFqvKaMe', NULL, NULL, NULL),
(9, 'Eulalia61@hotmail.com', '[]', '$2y$13$B2nOvd3D.9xUnZqEwdtqueBTvDaRbpK91IXPyJErHY7STInr/Qupm', NULL, NULL, NULL),
(10, 'Aida.Stracke72@yahoo.com', '[]', '$2y$13$xCVxpZEujowXrNWOao9wkuxsQQWdMSJ/8qNKsYJifIZ92WoBAztSe', NULL, NULL, NULL),
(11, 'Maria.Carter78@hotmail.com', '[]', '$2y$13$RdKTjMmZ/3SCsspkYo5UjOZR0bl3aSGSxitfoIDOM7y8mrZ/raCEa', NULL, NULL, NULL),
(12, 'Abbey5@gmail.com', '[]', '$2y$13$b0bXI.bFRvZ2ZWEjEkaSG.MatAKmIhAA7262wKr4ht4Of0xkg/Xuq', NULL, NULL, NULL),
(13, 'Francesca31@hotmail.com', '[]', '$2y$13$rTc96zLq8kGk1OUo.ZFGDOCTOzEEKb5R5U27ujquMnQJC9IAsaCfe', 'test', 'Francesca', '0635846826');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `praticien_visiteur`
--
ALTER TABLE `praticien_visiteur`
  ADD CONSTRAINT `FK_497AEEC72391866B` FOREIGN KEY (`praticien_id`) REFERENCES `praticien` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_497AEEC77F72333D` FOREIGN KEY (`visiteur_id`) REFERENCES `visiteur` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `visites`
--
ALTER TABLE `visites`
  ADD CONSTRAINT `FK_470D398330E71ABC` FOREIGN KEY (`vst_motif_id`) REFERENCES `motif` (`id`),
  ADD CONSTRAINT `FK_470D3983452CCA99` FOREIGN KEY (`vst_visiteur_id`) REFERENCES `visiteur` (`id`),
  ADD CONSTRAINT `FK_470D3983F210BF63` FOREIGN KEY (`vst_praticien_id`) REFERENCES `praticien` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
