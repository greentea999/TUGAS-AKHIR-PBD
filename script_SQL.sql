
DELIMITER $$
--
-- Prosedur
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_TABEL` (IN `TBL` VARCHAR(50), IN `COL_PK` VARCHAR(50), IN `VAL_PK` VARCHAR(50))  NO SQL
BEGIN
SET @SQL=CONCAT("DELETE FROM ",TBL," WHERE ",COL_PK,"=",VAL_PK);
PREPARE STAT FROM @SQL;
EXECUTE STAT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_TABEL` (IN `TBL` VARCHAR(50), IN `VAL` TEXT)  NO SQL
BEGIN
SET @SQL=CONCAT("INSERT INTO ",TBL," VALUES (",VAL,");");
PREPARE STAT FROM @SQL;
EXECUTE STAT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SEARCH_TABEL` (IN `TBL` VARCHAR(50), IN `KEYWORD` VARCHAR(50), IN `KOLOM` VARCHAR(50))  BEGIN
 	SET @SQL =CONCAT("SELECT * FROM ",TBL);
    IF (KEYWORD <> "*") THEN
    	SET @SQL =CONCAT(@SQL," WHERE '",KEYWORD,"' in (",KOLOM,")");
    END IF;
    PREPARE STAT FROM @SQL;
    EXECUTE STAT;
 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_TABEL` (IN `TBL` VARCHAR(50), IN `COL_PK` VARCHAR(50), IN `VAL_PK` VARCHAR(50), IN `COL_DAT` TEXT)  NO SQL
BEGIN
SET @SQL=CONCAT("UPDATE ",TBL," SET ",COL_DAT," WHERE ",COL_PK,"=",VAL_PK);
PREPARE STAT FROM @SQL;
EXECUTE STAT;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `Kode_brg` varchar(3) NOT NULL,
  `Nama_brg` varchar(30) DEFAULT NULL,
  `Stok` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
-- Kesalahan membaca data untuk tabel test.barang: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `test`.`barang`' at line 1

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembeli`
--

CREATE TABLE `pembeli` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan`
--

CREATE TABLE `penjualan` (
  `Id_Jual` varchar(3) NOT NULL,
  `Kode_brg` varchar(3) DEFAULT NULL,
  `Jml_Jual` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`Kode_brg`);

--
-- Indeks untuk tabel `pembeli`
--
ALTER TABLE `pembeli`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`Id_Jual`);
