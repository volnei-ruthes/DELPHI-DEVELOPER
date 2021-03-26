-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 26-Mar-2021 às 16:40
-- Versão do servidor: 10.4.18-MariaDB
-- versão do PHP: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `id16469039_volneisistema`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `clie_id` int(11) NOT NULL,
  `clie_nome` varchar(100) NOT NULL,
  `clie_endereco` varchar(100) NOT NULL,
  `clie_bairro` varchar(100) NOT NULL,
  `clie_cidade` varchar(50) NOT NULL,
  `clie_uf` varchar(50) NOT NULL,
  `clie_rg` varchar(30) NOT NULL,
  `clie_cpf` varchar(30) NOT NULL,
  `clie_tel` varchar(20) NOT NULL,
  `clie_email` varchar(100) NOT NULL,
  `clie_dtnasc` date NOT NULL,
  `clie_dtcad` date NOT NULL,
  `clie_situacao` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`clie_id`, `clie_nome`, `clie_endereco`, `clie_bairro`, `clie_cidade`, `clie_uf`, `clie_rg`, `clie_cpf`, `clie_tel`, `clie_email`, `clie_dtnasc`, `clie_dtcad`, `clie_situacao`) VALUES
(3, 'carlas', 'rua america', 'bortot', 'pato branco', 'pr', '343434', '34343434334', '3434343434', 'jj', '1990-01-01', '2021-03-25', 'ativo'),
(4, 'carla', 'rua america', 'bortot', 'pato branco', 'pr', '343434', '34343434334', '3434343434', 'jj', '1990-01-01', '2021-03-25', 'ativo');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`clie_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `clie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
