CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE IF NOT EXISTS artistas(
	id INT AUTO_INCREMENT NOT NULL,
  nome VARCHAR(30) NOT NULL,
  CONSTRAINT PRIMARY KEY(id)
);

INSERT INTO artistas (nome)
VALUES
	('Beyoncé'),
	('Queen'),
	('Elis Regina'),
	('Baco Exu do Blues'),
	('Blind Guardian'),
	('Nina Simone');

CREATE TABLE IF NOT EXISTS albuns(
	id INT AUTO_INCREMENT NOT NULL,
	title VARCHAR(50) NOT NULL,
	ano_lancamento YEAR,
	artista_id INT,
	CONSTRAINT PRIMARY KEY (id),
	CONSTRAINT FOREIGN KEY (artista_id) REFERENCES artistas (id)
);

INSERT INTO albuns (title, ano_lancamento, artista_id)
VALUES
	('Renaissance', 2022, 1),
	('Jazz', 1978, 2),
	('Hot Space', 1982, 2),
	('Falso Brilhante', 1998, 3),
	('Vento de Maio', 2001, 3),
	('QVVJFA?', 2003, 4),
	('Somewhere Far Beyond', 2007, 5),
	('I Put A Spell On You', 2012, 6);

CREATE TABLE IF NOT EXISTS musicas(
	id INT AUTO_INCREMENT NOT NULL,
	title VARCHAR(50) NOT NULL,
	duracao SMALLINT NOT NULL,
	album_id INT NOT NULL,
	CONSTRAINT PRIMARY KEY (id),
	CONSTRAINT FOREIGN KEY (album_id) REFERENCES albuns (id)
);

INSERT INTO musicas(title, duracao, album_id)
VALUES
	("BREAK MY SOUL", 279, 1),
	("VIRGO’S GROOVE", 369, 1),
	("ALIEN SUPERSTAR", 116, 1),
	("Don’t Stop Me Now", 203, 2),
	("Under Pressure", 152, 3),
	("Como Nossos Pais", 105, 4),
	("O Medo de Amar é o Medo de Ser Livre", 207, 5),
	("Samba em Paris", 267, 6),
	("The Bard's Song", 244, 7),
	("Feeling Good", 100, 8);

CREATE TABLE IF NOT EXISTS planos (
	id INT AUTO_INCREMENT NOT NULL,
	modalidade VARCHAR(20) NOT NULL,
	valor DECIMAL(4, 2) NOT NULL,
	CONSTRAINT PRIMARY KEY (id)
);

INSERT INTO planos (modalidade, valor)
VALUES
	('Gratuito', 0.00),
	('Familiar', 7.99),
	('Universitário', 5.99),
	('Pessoal', 6.99);

CREATE TABLE IF NOT EXISTS users(
	id INT AUTO_INCREMENT NOT NULL,
  usuario VARCHAR(30) NOT NULL,
  idade TINYINT(3),
  data_assinatura DATETIME NOT NULL,
  plano_id INT NOT NULL,
  CONSTRAINT PRIMARY KEY (id),
  CONSTRAINT FOREIGN KEY (plano_id) REFERENCES planos(id)
);

INSERT INTO users(usuario, idade, data_assinatura, plano_id)
VALUES
	('Barbara Liskov', 82, '2019-10-20', 1),
	('Robert Cecil Martin', 58, '2017-01-06', 1),
	('Ada Lovelace', 37, '2017-12-30', 2),
	('Martin Fowler', 46, '2017-01-17', 2),
	('Sandi Metz', 58, '2019-04-29', 2),
	('Paulo Freire', 19, '2019-02-14', 3),
	('Bell Hooks', 26, '2019-01-05', 3),
	('Christopher Alexander', 85, '2019-06-05', 4),
	('Judith Butler', 45, '2020-05-13', 4),
	('Jorge Amado', 58, '2017-02-17', 4);

CREATE TABLE IF NOT EXISTS historico(
  musica_id INT NOT NULL,
  data_reproducao DATETIME NOT NULL,
  usuario_id INT NOT NULL,
  CONSTRAINT PRIMARY KEY (musica_id, usuario_id),
  CONSTRAINT FOREIGN KEY (musica_id) REFERENCES musicas(id),
  CONSTRAINT FOREIGN KEY (usuario_id) REFERENCES users(id)
);

INSERT INTO historico(musica_id, data_reproducao, usuario_id)
VALUES
	(8, "2022-02-28 10:45:55", 1),
	(2, "2020-05-02 05:30:35", 1),
	(10, "2020-03-06 11:22:33", 1),
	(10, "2022-08-05 08:05:17", 2),
	(7, "2020-01-02 07:40:33", 2),
	(10, "2020-11-13 16:55:13", 3),
	(2, "2020-12-05 18:38:30", 3),
	(8, "2021-08-15 17:10:10", 4),
	(8, "2022-01-09 01:44:33", 5),
	(5, "2020-08-06 15:23:43", 5),
	(7, "2017-01-24 00:31:17", 6),
	(1, "2017-10-12 12:35:20", 6),
	(4, "2011-12-15 22:30:49", 7),
	(4, "2012-03-17 14:56:41", 8),
	(9, "2022-02-24 21:14:22", 9),
	(3, "2015-12-13 08:30:22", 10);

CREATE TABLE IF NOT EXISTS usuario_segue (
	usuario_id INT NOT NULL,
  artista_id INT NOT NULL,
  CONSTRAINT PRIMARY KEY (usuario_id, artista_id),
  CONSTRAINT FOREIGN KEY (usuario_id) REFERENCES users(id),
  CONSTRAINT FOREIGN KEY (artista_id) REFERENCES artistas(id)
);

INSERT INTO usuario_segue(usuario_id, artista_id)
	VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (4, 4),
  (5, 5),
  (5, 6),
  (6, 6),
  (6, 1),
  (7, 6),
  (9, 3),
  (10, 2);