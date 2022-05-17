-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  mar. 17 mai 2022 à 20:55
-- Version du serveur :  10.1.38-MariaDB
-- Version de PHP :  7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `amergency`
--

-- --------------------------------------------------------

--
-- Structure de la table `allergie`
--

CREATE TABLE `allergie` (
  `id` int(11) NOT NULL,
  `num_dossier` int(11) NOT NULL,
  `num_med` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `dose`
--

CREATE TABLE `dose` (
  `id` int(11) NOT NULL,
  `num_med` int(11) NOT NULL,
  `num_ord` int(11) NOT NULL,
  `posologie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `maladie`
--

CREATE TABLE `maladie` (
  `num_mal` int(11) NOT NULL,
  `nom_mal` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `maladie_diagnostiquees`
--

CREATE TABLE `maladie_diagnostiquees` (
  `id` int(11) NOT NULL,
  `num_trait` int(11) NOT NULL,
  `num_mal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `medecin`
--

CREATE TABLE `medecin` (
  `mat_med` int(11) NOT NULL,
  `nom_med` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `medecin_traitant`
--

CREATE TABLE `medecin_traitant` (
  `id` int(11) NOT NULL,
  `num_trait` int(11) NOT NULL,
  `mat_med` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `medicament`
--

CREATE TABLE `medicament` (
  `num_med` int(11) NOT NULL,
  `nom_med` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `ordonnance`
--

CREATE TABLE `ordonnance` (
  `num_ord` int(11) NOT NULL,
  `date_ord` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `mat_med` int(11) NOT NULL,
  `num_dossier` int(11) NOT NULL,
  `num_rdv` int(11) NOT NULL,
  `num_trait` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `ordonnance_du_rdv`
--

CREATE TABLE `ordonnance_du_rdv` (
  `id` int(11) NOT NULL,
  `num_rdv` int(11) NOT NULL,
  `num_ord` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `patient`
--

CREATE TABLE `patient` (
  `num_dossier` int(11) NOT NULL,
  `nom_patient` varchar(255) NOT NULL,
  `sexe_patient` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `rendezvous`
--

CREATE TABLE `rendezvous` (
  `num_rdv` int(11) NOT NULL,
  `date_rdv` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `num_trait` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `soin`
--

CREATE TABLE `soin` (
  `code_soin` int(11) NOT NULL,
  `lib_soin` varchar(255) NOT NULL,
  `cout_soin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `soins_du_jours`
--

CREATE TABLE `soins_du_jours` (
  `id` int(11) NOT NULL,
  `num_rdv` int(11) NOT NULL,
  `cod_soin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `traitement`
--

CREATE TABLE `traitement` (
  `num_trait` int(11) NOT NULL,
  `date_trait` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `num_dossier` int(11) NOT NULL,
  `mat_med` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `allergie`
--
ALTER TABLE `allergie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `num_dossier` (`num_dossier`),
  ADD KEY `num_med` (`num_med`);

--
-- Index pour la table `dose`
--
ALTER TABLE `dose`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dose_medicament_num_med` (`num_med`),
  ADD KEY `dose_ordonnance_num_ord` (`num_ord`);

--
-- Index pour la table `maladie`
--
ALTER TABLE `maladie`
  ADD PRIMARY KEY (`num_mal`);

--
-- Index pour la table `maladie_diagnostiquees`
--
ALTER TABLE `maladie_diagnostiquees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `num_trait` (`num_trait`),
  ADD KEY `num_mal` (`num_mal`);

--
-- Index pour la table `medecin`
--
ALTER TABLE `medecin`
  ADD PRIMARY KEY (`mat_med`);

--
-- Index pour la table `medecin_traitant`
--
ALTER TABLE `medecin_traitant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `num_trait` (`num_trait`),
  ADD KEY `mat_med` (`mat_med`);

--
-- Index pour la table `medicament`
--
ALTER TABLE `medicament`
  ADD PRIMARY KEY (`num_med`);

--
-- Index pour la table `ordonnance`
--
ALTER TABLE `ordonnance`
  ADD PRIMARY KEY (`num_ord`),
  ADD KEY `mat_med` (`mat_med`),
  ADD KEY `num_dossier` (`num_dossier`),
  ADD KEY `num_rdv` (`num_rdv`),
  ADD KEY `num_trait` (`num_trait`);

--
-- Index pour la table `ordonnance_du_rdv`
--
ALTER TABLE `ordonnance_du_rdv`
  ADD PRIMARY KEY (`id`),
  ADD KEY `numrdv` (`num_rdv`),
  ADD KEY `numord` (`num_ord`);

--
-- Index pour la table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`num_dossier`);

--
-- Index pour la table `rendezvous`
--
ALTER TABLE `rendezvous`
  ADD PRIMARY KEY (`num_rdv`),
  ADD KEY `num_trait` (`num_trait`);

--
-- Index pour la table `soin`
--
ALTER TABLE `soin`
  ADD PRIMARY KEY (`code_soin`);

--
-- Index pour la table `soins_du_jours`
--
ALTER TABLE `soins_du_jours`
  ADD PRIMARY KEY (`id`),
  ADD KEY `numrdv` (`num_rdv`),
  ADD KEY `codsoin` (`cod_soin`);

--
-- Index pour la table `traitement`
--
ALTER TABLE `traitement`
  ADD PRIMARY KEY (`num_trait`),
  ADD KEY `num_dossier` (`num_dossier`),
  ADD KEY `mat_med` (`mat_med`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `allergie`
--
ALTER TABLE `allergie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `dose`
--
ALTER TABLE `dose`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `maladie`
--
ALTER TABLE `maladie`
  MODIFY `num_mal` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `maladie_diagnostiquees`
--
ALTER TABLE `maladie_diagnostiquees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `medecin`
--
ALTER TABLE `medecin`
  MODIFY `mat_med` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `medecin_traitant`
--
ALTER TABLE `medecin_traitant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `medicament`
--
ALTER TABLE `medicament`
  MODIFY `num_med` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ordonnance`
--
ALTER TABLE `ordonnance`
  MODIFY `num_ord` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ordonnance_du_rdv`
--
ALTER TABLE `ordonnance_du_rdv`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `patient`
--
ALTER TABLE `patient`
  MODIFY `num_dossier` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `rendezvous`
--
ALTER TABLE `rendezvous`
  MODIFY `num_rdv` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `soin`
--
ALTER TABLE `soin`
  MODIFY `code_soin` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `soins_du_jours`
--
ALTER TABLE `soins_du_jours`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `traitement`
--
ALTER TABLE `traitement`
  MODIFY `num_trait` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `allergie`
--
ALTER TABLE `allergie`
  ADD CONSTRAINT `allergie_medicament_num_med` FOREIGN KEY (`num_med`) REFERENCES `medicament` (`num_med`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `allergie_patient_num_dossier` FOREIGN KEY (`num_dossier`) REFERENCES `patient` (`num_dossier`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `dose`
--
ALTER TABLE `dose`
  ADD CONSTRAINT `dose_medicament_num_med` FOREIGN KEY (`num_med`) REFERENCES `medicament` (`num_med`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `dose_ordonnance_num_ord` FOREIGN KEY (`num_ord`) REFERENCES `ordonnance` (`num_ord`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `maladie_diagnostiquees`
--
ALTER TABLE `maladie_diagnostiquees`
  ADD CONSTRAINT `maladie_diagnostiquees_maladie_num_mal` FOREIGN KEY (`num_mal`) REFERENCES `maladie` (`num_mal`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `maladie_diagnostiquees_traitement_num_trait` FOREIGN KEY (`num_trait`) REFERENCES `traitement` (`num_trait`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `medecin_traitant`
--
ALTER TABLE `medecin_traitant`
  ADD CONSTRAINT `medecin_traitant_medecin_mat_med` FOREIGN KEY (`mat_med`) REFERENCES `medecin` (`mat_med`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `medecin_traitant_traitement_num_trait` FOREIGN KEY (`num_trait`) REFERENCES `traitement` (`num_trait`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `ordonnance`
--
ALTER TABLE `ordonnance`
  ADD CONSTRAINT `ordonnance_medecin_mat_med` FOREIGN KEY (`mat_med`) REFERENCES `medecin` (`mat_med`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ordonnance_patient_num_dossier` FOREIGN KEY (`num_dossier`) REFERENCES `patient` (`num_dossier`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ordonnance_rendezvous_num_rdv` FOREIGN KEY (`num_rdv`) REFERENCES `rendezvous` (`num_rdv`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ordonnance_traitement_num_trait` FOREIGN KEY (`num_trait`) REFERENCES `traitement` (`num_trait`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `ordonnance_du_rdv`
--
ALTER TABLE `ordonnance_du_rdv`
  ADD CONSTRAINT `ordonnance_du_rdv_ordonnance_num_ord` FOREIGN KEY (`num_ord`) REFERENCES `ordonnance` (`num_ord`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ordonnance_du_rdv_rendezvous_numrdv` FOREIGN KEY (`num_rdv`) REFERENCES `rendezvous` (`num_rdv`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `rendezvous`
--
ALTER TABLE `rendezvous`
  ADD CONSTRAINT `rendezvous_traitement_num_trait` FOREIGN KEY (`num_trait`) REFERENCES `traitement` (`num_trait`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `soins_du_jours`
--
ALTER TABLE `soins_du_jours`
  ADD CONSTRAINT `soins_du_jours_rendezvous_num_rdv` FOREIGN KEY (`num_rdv`) REFERENCES `rendezvous` (`num_rdv`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `soins_du_jours_soin_cod_soin` FOREIGN KEY (`cod_soin`) REFERENCES `soin` (`code_soin`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `traitement`
--
ALTER TABLE `traitement`
  ADD CONSTRAINT `traitement_medecin_mat_med` FOREIGN KEY (`mat_med`) REFERENCES `medecin` (`mat_med`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `traitement_patient_num_dossier` FOREIGN KEY (`num_dossier`) REFERENCES `patient` (`num_dossier`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
