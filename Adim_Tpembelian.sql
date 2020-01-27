IF NOT EXISTS (SELECT id from tpembelian where id is NOT NULL)
INSERT INTO tpembelian (id, no_bukti, tanggal, pembeli) values
(1, '200126a1', '20200126 00:00:00 AM', 1),
(2, '200126a2', '20200126 12:00:00 PM', 2),
(3, '200127a1', '20200127 00:00:00 AM', 2);
delete tpembelian where id IS NULL;
SELECT * FROM tpembelian
