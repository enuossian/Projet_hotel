-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 08 sep. 2023 à 16:17
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `projethotel`
--

-- --------------------------------------------------------

--
-- Structure de la table `chambre`
--

CREATE TABLE `chambre` (
  `id` int(11) NOT NULL,
  `titre` varchar(255) NOT NULL,
  `description_courte` varchar(255) NOT NULL,
  `description_longue` longtext NOT NULL,
  `photo` varchar(255) NOT NULL,
  `prix_journalier` double NOT NULL,
  `date_enregistrement` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `chambre`
--

INSERT INTO `chambre` (`id`, `titre`, `description_courte`, `description_longue`, `photo`, `prix_journalier`, `date_enregistrement`) VALUES
(7, 'CHAMBRE PREMIÈRE', 'Un lit king size ou deux lits jumeaux, Lit escamotable, canapé-lit ou lit d\'enfant sur demande.\r\n50 – 60 m² (538 – 651 sq. ft.)\r\n3 adultes ou 2 adultes et 1 enfant', 'LITS\r\nUn lit king size ou deux lits jumeaux, Lit escamotable, canapé-lit ou lit d\'enfant sur demande\r\n\r\nCAPACITÉ\r\n3 adultes, ou 2 adultes et 1 enfant\r\n\r\nTAILLE\r\n50 – 60 m² (538 – 651 sq. ft.)\r\n1er au 8e étage\r\nPLAN DE L\'ESPACE\r\nSALLE DE BAIN\r\nSalle de bain en marbre entièrement équipée vasque simple ou double\r\n\r\nVUES\r\nAvenue George V, cour en marbre ou avenue Pierre 1er de Serbie\r\n\r\nDÉCOR\r\nUne décoration de style Louis XVI dans une palette de couleurs fraîches et légères\r\n\r\nFONCTIONNALITÉS UNIQUES\r\nDressing (selon disponibilités)\r\nTerrasse (selon disponibilités)', '1694004709-pexel1-jog.webp', 200, '2023-09-06 14:49:43'),
(8, 'CHAMBRE DOUBLE', 'Un lit king size ou deux lits jumeaux, Lit d\'enfant disponible sur demande\r\n38 – 50 m² (414 – 538 sq. ft.)\r\n2 adultes', 'LITS\r\nUn lit king size ou deux lits jumeaux, Lit d\'enfant disponible sur demande\r\n\r\nCAPACITÉ\r\n2 adultes\r\n\r\nTAILLE\r\n38 – 50 m² (414 – 538 sq. ft.). 1er au 8e étage\r\n\r\nPLAN DE L\'ESPACE\r\nSALLE DE BAIN\r\nSalle de bain en marbre entièrement équipée vasque simple ou double\r\n\r\nVUES\r\nAvenue Pierre 1er de Serbie, cour en marbre ou avenue George V\r\n\r\nDÉCOR\r\nUne décoration de style Louis XVI dans une palette de couleurs fraîches et légères\r\n\r\nFONCTIONNALITÉS UNIQUES\r\nBaignoire immersion et douche séparée', '1694005389-pexel2.jpg', 300, '2023-09-06 15:03:09'),
(9, 'CHAMBRE TRIPLE', 'Un lit king size ou deux lits jumeaux, Lit d\'enfant disponible sur demande\r\n37 – 40 m² (398 – 430 sq. ft.)\r\n2 adultes', 'LITS\r\nUn lit king size ou deux lits jumeaux, Lit d\'enfant disponible sur demande\r\n\r\nCAPACITÉ\r\n2 adultes\r\n\r\nTAILLE\r\n38 – 50 m² (414 – 538 sq. ft.). 1er au 8e étage\r\n\r\nPLAN DE L\'ESPACE\r\nSALLE DE BAIN\r\nSalle de bain en marbre entièrement équipée vasque simple ou double\r\n\r\nVUES\r\nAvenue Pierre 1er de Serbie, cour en marbre ou avenue George V\r\n\r\nDÉCOR\r\nUne décoration de style Louis XVI dans une palette de couleurs fraîches et légères\r\n\r\nFONCTIONNALITÉS UNIQUES\r\nBaignoire immersion et douche séparée', '1694005687-pexels-max-rahubovskiy-6480210.jpg', 350, '2023-09-06 15:06:19');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `id` int(11) NOT NULL,
  `chambre_id` int(11) NOT NULL,
  `date_arrivee` date NOT NULL,
  `date_depart` date NOT NULL,
  `prix_total` double NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `telephone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `date_enregistrement` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230906080833', '2023-09-06 10:08:50', 67);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `slider`
--

CREATE TABLE `slider` (
  `id` int(11) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `date_enregistrement` datetime NOT NULL,
  `ordre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `slider`
--

INSERT INTO `slider` (`id`, `photo`, `date_enregistrement`, `ordre`) VALUES
(1, '1693994861-slide01.jpg', '2023-09-06 12:07:41', 1),
(2, '1693994907-slide02.jpg', '2023-09-06 12:08:27', 2);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) NOT NULL,
  `roles` longtext NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `civilite` varchar(255) NOT NULL,
  `date_enregistrement` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `nom`, `prenom`, `civilite`, `date_enregistrement`) VALUES
(1, 'naissounem@gmail.com', '[\"ROLE_ADMIN\"]', 'Enuossian13!', 'M', 'Naissoune', 'femme', '2023-09-06 11:37:47');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `chambre`
--
ALTER TABLE `chambre`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_6EEAA67D9B177F54` (`chambre_id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `chambre`
--
ALTER TABLE `chambre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `FK_6EEAA67D9B177F54` FOREIGN KEY (`chambre_id`) REFERENCES `chambre` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
