CREATE DATABASE MDBRPG;

USE MDBRPG;

CREATE TABLE Jogador (
    ID_Jogador        INT         PRIMARY KEY IDENTITY,
    Nome              VARCHAR(20) NOT NULL,
    Email             VARCHAR(40) NOT NULL,
    Senha             VARCHAR(20) NOT NULL,
    Data_de_Registro  DATE        NOT NULL,
    Nivel             INT
);

CREATE TABLE Missao (
    ID_Missao    INT           PRIMARY KEY IDENTITY,
    Nome         VARCHAR(20)   NOT NULL,
    Descricao    VARCHAR(1999) NOT NULL,
    Recompensa   VARCHAR(300),
    Nivel        INT,
    Concluida    INT
);

CREATE TABLE Item (
    ID_Item     INT           PRIMARY KEY IDENTITY,
    Nome        VARCHAR(20)   NOT NULL,
    Descricao   VARCHAR(999)  NOT NULL,
    Tipo        VARCHAR(30),
    Valor       INT,
    Peso        FLOAT
);

CREATE TABLE Habilidades (
    ID_Habilidades INT         PRIMARY KEY IDENTITY,
    Nome           VARCHAR(50)
);

CREATE TABLE Personagem (
    ID_Personagem     INT           PRIMARY KEY IDENTITY,
    Nome              VARCHAR(20)   NOT NULL,
    Raca              VARCHAR(38)   NOT NULL,
    Classe            VARCHAR(300),
    Experiencia       DECIMAL(38,3),
    Pontos_de_vida    INT,
    Pontos_de_mana    INT,
    Longitude         DECIMAL(30,15),
    Latitude          DECIMAL(30,15),
    fk_Habilidades    INT           FOREIGN KEY REFERENCES Habilidades(ID_Habilidades),
    fk_Jogador_ID     INT           FOREIGN KEY REFERENCES Jogador(ID_Jogador)
);

CREATE TABLE Grupo (
    ID_Grupo           INT         PRIMARY KEY IDENTITY,
    Nome               VARCHAR(20) NOT NULL,
    Numero_de_Membros  INT,
    Data_de_Criacao    DATE,
    Experiencia        FLOAT,
    Lider              INT         FOREIGN KEY REFERENCES Jogador(ID_Jogador)
);

CREATE TABLE Joga (
    fk_Missao_ID       INT         FOREIGN KEY REFERENCES Missao(ID_Missao),
    fk_Personagem_ID   INT         FOREIGN KEY REFERENCES Personagem(ID_Personagem)
);

CREATE TABLE Participar (
    fk_Jogador_ID      INT         FOREIGN KEY REFERENCES Jogador(ID_Jogador),
    fk_Grupo_ID        INT         FOREIGN KEY REFERENCES Grupo(ID_Grupo)
);

CREATE TABLE Possuir (
    fk_Personagem_ID   INT         FOREIGN KEY REFERENCES Personagem(ID_Personagem),
    fk_Item_ID         INT         FOREIGN KEY REFERENCES Item(ID_Item)
);

SELECT * FROM Personagem;
SELECT * FROM Grupo;
SELECT * FROM Missao;
SELECT * FROM Item;
SELECT * FROM Joga;
SELECT * FROM Participar;
SELECT * FROM Habilidades;
SELECT * FROM Possuir;
SELECT * FROM Jogador;


INSERT INTO Jogador (Nome, Email, Senha, Data_de_Registro, Nivel) VALUES
('Danoone','noonefps@gmail.com','123321','2003-03-28', 1),
('Alice' ,'alice@example.com','alicepass','2022-01-01', 2),
('Bob','bob@example.com','bobpass','2022-02-02', 3),
('Carol','carol@example.com','carolpass','2022-03-03', 4),
('Dave','dave@example.com','davepass','2022-04-04', 5),
('Eve','eve@example.com','evepass','2022-05-05', 6),
('Frank','frank@example.com','frankpass','2022-06-06', 7),
('Grace','grace@example.com','gracepass','2022-07-07', 8),
('Heidi','heidi@example.com','heidipass','2022-08-08', 9),
('Ivan','ivan@example.com','ivanpass','2022-09-09', 10),
('John', 'john@example.com', 'johnpass', '2023-01-01', 11),
('Sarah', 'sarah@example.com', 'sarahpass', '2023-02-02', 12),
('Tom', 'tom@example.com', 'tompass', '2023-03-03', 13),
('Jerry', 'jerry@example.com', 'jerrypass', '2023-04-04', 14),
('Anna', 'anna@example.com', 'annapass', '2023-05-05', 15),
('Mike', 'mike@example.com', 'mikepass', '2023-06-06', 16),
('Chris', 'chris@example.com', 'chrispass', '2023-07-07', 17),
('Pat', 'pat@example.com', 'patpass', '2023-08-08', 18),
('Taylor', 'taylor@example.com', 'taylorpass', '2023-09-09', 19),
('Alex', 'alex@example.com', 'alexpass', '2023-10-10', 20);

INSERT INTO Missao (Nome, Descricao, Recompensa, Nivel, Concluida) VALUES
('Missão 1', 'Descrição da Missão 1', 'Recompensa 1', 1, 0),
('Missão 2', 'Descrição da Missão 2', 'Recompensa 2', 2, 0),
('Missão 3', 'Descrição da Missão 3', 'Recompensa 3', 3, 0),
('Missão 4', 'Descrição da Missão 4', 'Recompensa 4', 4, 0),
('Missão 5', 'Descrição da Missão 5', 'Recompensa 5', 5, 0),
('Missão 6', 'Descrição da Missão 6', 'Recompensa 6', 6, 0),
('Missão 7', 'Descrição da Missão 7', 'Recompensa 7', 7, 0),
('Missão 8', 'Descrição da Missão 8', 'Recompensa 8', 8, 0),
('Missão 9', 'Descrição da Missão 9', 'Recompensa 9', 9, 0),
('Missão 10', 'Descrição da Missão 10', 'Recompensa 10', 10, 0),
('Missão 11', 'Descrição da Missão 11', 'Recompensa 11', 11, 0),
('Missão 12', 'Descrição da Missão 12', 'Recompensa 12', 12, 0),
('Missão 13', 'Descrição da Missão 13', 'Recompensa 13', 13, 0),
('Missão 14', 'Descrição da Missão 14', 'Recompensa 14', 14, 0),
('Missão 15', 'Descrição da Missão 15', 'Recompensa 15', 15, 0),
('Missão 16', 'Descrição da Missão 16', 'Recompensa 16', 16, 0),
('Missão 17', 'Descrição da Missão 17', 'Recompensa 17', 17, 0),
('Missão 18', 'Descrição da Missão 18', 'Recompensa 18', 18, 0),
('Missão 19', 'Descrição da Missão 19', 'Recompensa 19', 19, 0),
('Missão 20', 'Descrição da Missão 20', 'Recompensa 20', 20, 0);

INSERT INTO Item (Nome, Descricao, Tipo, Valor, Peso) VALUES
('Item 1', 'Descrição do Item 1', 'Tipo 1', 10, 1.1),
('Item 2', 'Descrição do Item 2', 'Tipo 2', 20, 2.2),
('Item 3', 'Descrição do Item 3', 'Tipo 3', 30, 3.3),
('Item 4', 'Descrição do Item 4', 'Tipo 4', 40, 4.4),
('Item 5', 'Descrição do Item 5', 'Tipo 5', 50, 5.5),
('Item 6', 'Descrição do Item 6', 'Tipo 6', 60, 6.6),
('Item 7', 'Descrição do Item 7', 'Tipo 7', 70, 7.7),
('Item 8', 'Descrição do Item 8', 'Tipo 8', 80, 8.8),
('Item 9', 'Descrição do Item 9', 'Tipo 9', 90, 9.9),
('Item 10', 'Descrição do Item 10', 'Tipo 10', 100, 10.0),
('Item 11', 'Descrição do Item 11', 'Tipo 11', 110, 11.1),
('Item 12', 'Descrição do Item 12', 'Tipo 12', 120, 12.2),
('Item 13', 'Descrição do Item 13', 'Tipo 13', 130, 13.3),
('Item 14', 'Descrição do Item 14', 'Tipo 14', 140, 14.4),
('Item 15', 'Descrição do Item 15', 'Tipo 15', 150, 15.5),
('Item 16', 'Descrição do Item 16', 'Tipo 16', 160, 16.6),
('Item 17', 'Descrição do Item 17', 'Tipo 17', 170, 17.7),
('Item 18', 'Descrição do Item 18', 'Tipo 18', 180, 18.8),
('Item 19', 'Descrição do Item 19', 'Tipo 19', 190, 19.9),
('Item 20', 'Descrição do Item 20', 'Tipo 20', 200, 20.0);

INSERT INTO Habilidades (Nome) VALUES
('Habilidade 1'),
('Habilidade 2'),
('Habilidade 3'),
('Habilidade 4'),
('Habilidade 5'),
('Habilidade 6'),
('Habilidade 7'),
('Habilidade 8'),
('Habilidade 9'),
('Habilidade 10'),
('Habilidade 11'),
('Habilidade 12'),
('Habilidade 13'),
('Habilidade 14'),
('Habilidade 15'),
('Habilidade 16'),
('Habilidade 17'),
('Habilidade 18'),
('Habilidade 19'),
('Habilidade 20');

INSERT INTO Personagem (Nome, Raca, Classe, Experiencia, Pontos_de_vida, Pontos_de_mana, Longitude, Latitude, fk_Habilidades, fk_Jogador_ID) VALUES
('Personagem 1', 'Raça 1', 'Classe 1', 100.0, 100, 50, 10.123456, 20.123456, 1, 1),
('Personagem 2', 'Raça 2', 'Classe 2', 200.0, 200, 60, 11.123456, 21.123456, 2, 2),
('Personagem 3', 'Raça 3', 'Classe 3', 300.0, 300, 70, 12.123456, 22.123456, 3, 3),
('Personagem 4', 'Raça 4', 'Classe 4', 400.0, 400, 80, 13.123456, 23.123456, 4, 4),
('Personagem 5', 'Raça 5', 'Classe 5', 500.0, 500, 90, 14.123456, 24.123456, 5, 5),
('Personagem 6', 'Raça 6', 'Classe 6', 600.0, 600, 100, 15.123456, 25.123456, 6, 6),
('Personagem 7', 'Raça 7', 'Classe 7', 700.0, 700, 110, 16.123456, 26.123456, 7, 7),
('Personagem 8', 'Raça 8', 'Classe 8', 800.0, 800, 120, 17.123456, 27.123456, 8, 8),
('Personagem 9', 'Raça 9', 'Classe 9', 900.0, 900, 130, 18.123456, 28.123456, 9, 9),
('Personagem 10', 'Raça 10', 'Classe 10', 1000.0, 1000, 140, 19.123456, 29.123456, 10, 10),
('Personagem 11', 'Raça 11', 'Classe 11', 1100.0, 1100, 150, 20.123456, 30.123456, 11, 11),
('Personagem 12', 'Raça 12', 'Classe 12', 1200.0, 1200, 160, 21.123456, 31.123456, 12, 12),
('Personagem 13', 'Raça 13', 'Classe 13', 1300.0, 1300, 170, 22.123456, 32.123456, 13, 13),
('Personagem 14', 'Raça 14', 'Classe 14', 1400.0, 1400, 180, 23.123456, 33.123456, 14, 14),
('Personagem 15', 'Raça 15', 'Classe 15', 1500.0, 1500, 190, 24.123456, 34.123456, 15, 15),
('Personagem 16', 'Raça 16', 'Classe 16', 1600.0, 1600, 200, 25.123456, 35.123456, 16, 16),
('Personagem 17', 'Raça 17', 'Classe 17', 1700.0, 1700, 210, 26.123456, 36.123456, 17, 17),
('Personagem 18', 'Raça 18', 'Classe 18', 1800.0, 1800, 220, 27.123456, 37.123456, 18, 18),
('Personagem 19', 'Raça 19', 'Classe 19', 1900.0, 1900, 230, 28.123456, 38.123456, 19, 19),
('Personagem 20', 'Raça 20', 'Classe 20', 2000.0, 2000, 240, 29.123456, 39.123456, 20, 20);

INSERT INTO Grupo (Nome, Numero_de_Membros, Data_de_Criacao, Experiencia, Lider) VALUES
('Grupo 1', 5, '2022-01-01', 100.0, 1),
('Grupo 2', 6, '2022-02-02', 200.0, 2),
('Grupo 3', 7, '2022-03-03', 300.0, 3),
('Grupo 4', 8, '2022-04-04', 400.0, 4),
('Grupo 5', 9, '2022-05-05', 500.0, 5),
('Grupo 6', 10, '2022-06-06', 600.0, 6),
('Grupo 7', 11, '2022-07-07', 700.0, 7),
('Grupo 8', 12, '2022-08-08', 800.0, 8),
('Grupo 9', 13, '2022-09-09', 900.0, 9),
('Grupo 10', 14, '2022-10-10', 1000.0, 10),
('Grupo 11', 15, '2023-01-11', 1100.0, 11),
('Grupo 12', 16, '2023-02-12', 1200.0, 12),
('Grupo 13', 17, '2023-03-13', 1300.0, 13),
('Grupo 14', 18, '2023-04-14', 1400.0, 14),
('Grupo 15', 19, '2023-05-15', 1500.0, 15),
('Grupo 16', 20, '2023-06-16', 1600.0, 16),
('Grupo 17', 21, '2023-07-17', 1700.0, 17),
('Grupo 18', 22, '2023-08-18', 1800.0, 18),
('Grupo 19', 23, '2023-09-19', 1900.0, 19),
('Grupo 20', 24, '2023-10-20', 2000.0, 20);

INSERT INTO Joga (fk_Missao_ID, fk_Personagem_ID)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20);

INSERT INTO Participar (fk_Jogador_ID, fk_Grupo_ID)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20);

INSERT INTO Possuir (fk_Personagem_ID, fk_Item_ID)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20);

DELETE FROM Jogador WHERE Nome LIKE 'C%' OR Nome LIKE 'A%';

SELECT * FROM Jogador

UPDATE Jogador SET Email = REPLACE(Email, '@example.com', '@gmail.com')
WHERE Email LIKE '%@example.com';

SELECT j.Nome AS Nome_Jogador, p.Nome AS Nome_Personagem, h.Nome AS Habilidade
FROM Jogador j
JOIN Personagem p ON j.ID_Jogador = p.fk_Jogador_ID
JOIN Habilidades h ON p.fk_Habilidades = h.ID_Habilidades;

UPDATE Joga
SET fk_Missao_ID = 1
WHERE fk_Personagem_ID IN (1, 2);

UPDATE Joga
SET fk_Missao_ID = 2
WHERE fk_Personagem_ID IN (3, 4);

UPDATE Joga
SET fk_Missao_ID = 3
WHERE fk_Personagem_ID IN (5, 6);

UPDATE Joga
SET fk_Missao_ID = 4
WHERE fk_Personagem_ID IN (7, 8);

UPDATE Joga
SET fk_Missao_ID = 5
WHERE fk_Personagem_ID IN (9, 10);

SELECT p.Nome AS Nome_Personagem, m.Nome AS Nome_Missao
FROM Personagem p
JOIN Joga j ON p.ID_Personagem = j.fk_Personagem_ID
JOIN Missao m ON j.fk_Missao_ID = m.ID_Missao;

SELECT j.Nome AS Nome_Jogador, g.Nome AS Nome_Grupo
FROM Jogador j
JOIN Grupo g ON j.ID_Jogador = g.Lider;

SELECT p.Nome AS Nome_Personagem, i.Nome AS Nome_Item
FROM Personagem p
JOIN Possuir po ON p.ID_Personagem = po.fk_Personagem_ID
JOIN Item i ON po.fk_Item_ID = i.ID_Item;

SELECT *
FROM Jogador
ORDER BY Nivel DESC;

SELECT *
FROM Personagem
ORDER BY Experiencia ASC;

SELECT *
FROM Missao
ORDER BY Nome ASC;

SELECT *
FROM Grupo
ORDER BY Numero_de_Membros DESC;

SELECT *
FROM Item
ORDER BY Valor ASC;

SELECT p.Nome AS Nome_Personagem, j.Nome AS Nome_Jogador
FROM Personagem p
JOIN Jogador j ON p.fk_Jogador_ID = j.ID_Jogador
ORDER BY j.Nome ASC;


