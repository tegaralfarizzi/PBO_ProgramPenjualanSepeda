-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 02, 2024 at 07:26 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tokoSepeda`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` varchar(100) NOT NULL,
  `nama_barang` varchar(200) NOT NULL,
  `kategori` enum('Sepeda','Aksesoris','Ban','Frame') NOT NULL,
  `jumlah_stok` int(100) NOT NULL,
  `harga` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `kategori`, `jumlah_stok`, `harga`) VALUES
('B0002', 'helm', 'Aksesoris', 6, 50000),
('B0003', 'Sepeda Lipat', 'Sepeda', 8, 2000000);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`username`, `password`) VALUES
('admin1', '12345'),
('admin2', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` varchar(100) NOT NULL,
  `nama_pelanggan` varchar(200) NOT NULL,
  `no_telepon` varchar(200) NOT NULL,
  `alamat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama_pelanggan`, `no_telepon`, `alamat`) VALUES
('P0001', 'widda', '085972861830', 'bekasi'),
('P0002', 'silmi', '081384427133', 'karawang'),
('P0003', 'tegar', '0000000', 'bogor'),
('P0004', 'nabil', '0000000', 'cikarang');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` varchar(100) NOT NULL,
  `tanggal` date NOT NULL,
  `id_barang` varchar(100) NOT NULL,
  `id_pelanggan` varchar(100) NOT NULL,
  `nama_pelanggan` varchar(100) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `jumlah` int(100) NOT NULL,
  `total_harga` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `tanggal`, `id_barang`, `id_pelanggan`, `nama_pelanggan`, `nama_barang`, `jumlah`, `total_harga`) VALUES
('T0002', '2024-05-31', 'B0001', 'P0010', 'test', 'Sepeda gunung', 5, 7500000),
('T0003', '2024-06-01', 'B0001', 'P0010', 'test', 'Sepeda gunung', 5, 7500000),
('T0004', '2024-06-01', 'B0001', 'P0011', 'nabil', 'Sepeda gunung', 2, 3000000),
('T0005', '2024-06-01', 'B0001', 'P0011', 'nabil', 'Sepeda gunung', 1, 1500000),
('T0006', '2024-06-01', 'B0001', 'P0011', 'nabil', 'Sepeda gunung', 1, 1500000),
('T0007', '2024-06-01', 'B0002', 'P0001', 'widda', 'helm', 2, 100000),
('T0008', '2024-06-01', 'B0002', 'P0001', 'widda', 'helm', 2, 100000),
('T0009', '2024-06-02', 'B0001', 'P0002', 'silmi', 'Sepeda gunung', 1, 1500000),
('T0010', '2024-06-02', 'B0001', 'P0002', 'silmi', 'Sepeda gunung', 2, 3000000),
('T0011', '2024-06-02', 'B0001', 'P0003', 'tegar', 'Sepeda gunung', 3, 4500000),
('T0012', '2024-06-02', 'B0001', '', 'tegar', 'Sepeda gunung', 1, 1500000),
('T0013', '2024-06-02', 'B0003', 'P0001', 'widda', 'Sepeda Lipat', 2, 4000000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_barang` (`id_barang`,`id_pelanggan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
