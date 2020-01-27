-- SQL Query

-- 1. Tampilkan Kode,Nama, Gaji, Nama Departemen dari tabel karyawan
USE belajar_oop
SELECT
  TK.kode AS 'Kode',
  TK.nama AS 'Nama',
  CONCAT('Rp. ', FORMAT(TK.gaji, '##,###0'), ',00') AS 'Gaji',
  TD.nama AS 'Departemen'
FROM
  tkaryawan TK INNER JOIN tdepartemen TD
ON
  TK.departemen_id = TD.id;

-- 2. Tampilkan Kode,Nama, Gaji, Nama Departemen dari tabel karyawan, urutkan berdasarkan kode karyawan
-- Sama seperti nomor 1 dengan tambahan ORDER BY tkaryawan.kode
USE belajar_oop
SELECT
  TK.kode AS 'Kode',
  TK.nama AS 'Nama',
  CONCAT('Rp. ', FORMAT(TK.gaji, '##,###0'), ',00') AS 'Gaji',
  TD.nama AS 'Departemen'
FROM
  tkaryawan TK INNER JOIN tdepartemen TD
ON
  TK.departemen_id = TD.id
ORDER BY 'Kode';

-- 3. Tampilkan Kode,Nama, Gaji, Nama Departemen dari tablle karyawan , urutkan berdasarkan nama departemen
-- Sama seperti nomor 2, ubah ORDER BY
USE belajar_oop
SELECT
  TK.kode AS 'Kode',
  TK.nama AS 'Nama',
  CONCAT('Rp. ', FORMAT(TK.gaji, '##,###0'), ',00') AS 'Gaji',
  TD.nama AS 'Departemen'
FROM
  tkaryawan TK INNER JOIN tdepartemen TD
ON
  TK.departemen_id = TD.id
ORDER BY TD.nama;

-- 4. Tampilkan kode,nama, gaji dari table karyawan yang tidak mempunyai departemen
-- Ubah INNER JOIN menjadi LEFT OUTER JOIN dan tambahkan kondisi departemen_id yg bernilai NULL
USE belajar_oop
SELECT
  TK.kode AS 'Kode',
  TK.nama AS 'Nama',
  CONCAT('Rp. ', FORMAT(TK.gaji, '##,###0'), ',00') AS 'Gaji',
  TD.nama AS 'Departemen'
FROM
  tkaryawan TK LEFT OUTER JOIN tdepartemen TD
ON
  TK.departemen_id = TD.id
WHERE
  TK.departemen_id is NULL;
  
-- 5. Tampilkan kode,nama, gaji dari table karyawan yang hanya mempunyai departemen
USE belajar_oop
SELECT
  TK.kode AS 'Kode',
  TK.nama AS 'Nama',
  CONCAT('Rp. ', FORMAT(TK.gaji, '##,###0'), ',00') AS 'Gaji',
  TD.nama AS 'Departemen'
FROM
  tkaryawan TK RIGHT OUTER JOIN tdepartemen TD
ON
  TK.departemen_id = TD.id
WHERE
  TK.departemen_id IS NOT NULL;
  
-- 6. Tampilkan 10 karyawan dengan gaji tertinggi
USE belajar_oop
SELECT TOP(10)
  Nama,
  CONCAT('Rp. ', FORMAT(Gaji, '##,###0'), ',00') AS 'Gaji'
FROM tkaryawan
ORDER BY Gaji DESC

--  7. Tampilkan total gaji per departemen urutkan berdasarkan nominal gaji (ascending)
USE belajar_oop;
SELECT
  TD.nama,
  CONCAT('Rp. ', FORMAT(SUM(TK.gaji), '##,###0'), ',00') AS 'Gaji'
FROM
  tkaryawan TK INNER JOIN tdepartemen TD
ON TK.departemen_id = TD.id
GROUP BY TD.nama;

-- 8. Tampilkan total gaji yang harus dikeluarkan perusahaan sebulan
USE belajar_oop;
SELECT
  CONCAT('Rp. ', FORMAT(SUM(TK.gaji), '##,###0'), ',00') AS 'Gaji'
FROM
  tkaryawan TK
-- 9. Tampilkan Nama Departemen, Jumlah Karyawan, Total Gaji nya kemudian urutkan berdasarkan jumlah karyawan terbanyak
USE belajar_oop;
SELECT
  TD.nama as 'Departemen',
  COUNT(TK.id) AS 'Jumlah Karyawan',
  CONCAT('Rp. ', FORMAT(SUM(TK.gaji), '##,###0'), ',00') AS 'Total Gaji'
FROM
  tkaryawan TK LEFT OUTER JOIN tdepartemen TD
ON TK.departemen_id = TD.id
GROUP BY TD.nama
ORDER BY 'Jumlah Karyawan' DESC;






