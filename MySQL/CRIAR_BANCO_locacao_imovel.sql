-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 06-Jan-2021 às 23:17
-- Versão do servidor: 10.4.16-MariaDB
-- versão do PHP: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `locacao_imovel`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `imovel`
--

CREATE TABLE `imovel` (
  `id` int(2) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `img` varchar(50) NOT NULL,
  `tamanho` int(4) NOT NULL,
  `quarto` int(2) NOT NULL,
  `banheiro` int(2) NOT NULL,
  `vaga` int(2) NOT NULL,
  `aluguel` double NOT NULL,
  `condominio` double NOT NULL,
  `bairro` varchar(30) NOT NULL,
  `localizacao` varchar(30) NOT NULL,
  `proprietario` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `imovel`
--

INSERT INTO `imovel` (`id`, `nome`, `img`, `tamanho`, `quarto`, `banheiro`, `vaga`, `aluguel`, `condominio`, `bairro`, `localizacao`, `proprietario`) VALUES
(1, 'Casa', 'assets/pexels-julia-kuzenkov-1974596.jpg', 130, 3, 2, 1, 400, 0, 'Jd Sao Miguel', 'Braganca Paulista', 'alissa@email.com'),
(2, 'Apartamento', 'assets/pexels-tobias-bjørkli-2119713.jpg', 54, 3, 2, 2, 500, 250, 'Centro', '', ''),
(3, 'Kitnet', 'assets/pexels-jeffrey-czum-2394446.jpg', 20, 1, 1, 0, 300, 150, 'Centro', 'Atibaia', 'alissa2@email.com'),
(4, 'Apartamento', 'assets/pexels-athena-3684943.jpg', 30, 2, 1, 0, 1800, 150, 'Santa Luzia', '', ''),
(5, 'Casa', 'assets/casa.jpg', 100, 3, 2, 3, 2000, 200, 'Pq dos Estados', '', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `localizacao`
--

CREATE TABLE `localizacao` (
  `id` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `localizacao`
--

INSERT INTO `localizacao` (`id`, `nome`) VALUES
(1, 'Bragrança Paulista'),
(2, 'Atibaia'),
(4, 'Jundiaí'),
(5, 'São Paulo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `login`
--

CREATE TABLE `login` (
  `nome` varchar(200) NOT NULL,
  `email` varchar(50) NOT NULL,
  `senha` text NOT NULL,
  `tipo` int(1) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `login`
--

INSERT INTO `login` (`nome`, `email`, `senha`, `tipo`, `id`) VALUES
('admin', 'admin@admin.com', '12345', 0, 1),
('Alissa', 'alissa@email.com', '54321', 2, 7),
('alo', 'aaa', '123', 1, 6),
('João', 'joao@email.com', 'teste', 1, 12),
('Maria', 'maria@email.com', 'teste', 1, 13),
('teste', 'teste@teste', 'teste', 2, 15);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `imovel`
--
ALTER TABLE `imovel`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `localizacao`
--
ALTER TABLE `localizacao`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `unica` (`email`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `imovel`
--
ALTER TABLE `imovel`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de tabela `localizacao`
--
ALTER TABLE `localizacao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
