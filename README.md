# MBD-RPG
Bem-vindo ao meu projeto! Este repositório contém uma modelagem de banco de dados completa para um jogo de RPG hipotético.

<p align="center">
  <img src="https://github.com/Felipeacandido/MBD-RPG/assets/161148912/010d3c46-dcbd-48d1-9ac0-551ff68ddc87" alt="IMG mbd">
</p>


<br>


## 1 - Cenário: Sistema de Banco de Dados para um RPG Online

Em um mundo de fantasia, habitado por uma variedade de raças, criaturas e heróis, surge a necessidade de um sistema de banco de dados robusto para gerenciar todas as informações vitais para a experiência dos jogadores. Este RPG online permite que os jogadores criem e controlem seus próprios personagens, interajam em um vasto mundo aberto e participem de missões épicas em grupo. Vamos explorar as entidades, atributos e relacionamentos essenciais desse sistema:

1. **Entidade: Jogador**
   - Atributos:
     - ID_Jogador (Chave Primária)
     - Nome
     - Email
     - Senha
     - Data de Registro
     - Nível

2. **Entidade: Personagem**
   - Atributos:
     - ID_Personagem (Chave Primária)
     - Nome
     - Raça
     - Classe
     - Nível
     - Experiência
     - Pontos de Vida
     - Pontos de Mana
     - Habilidades (multivalorado)
     - Localização (Composto: latitude e longitude)
       

3. **Entidade: Missão**
   - Atributos:
     - ID_Missão (Chave Primária)
     - Nome
     - Descrição
     - Recompensa
     - Nível Mínimo (Derivado)
     - Concluída

4. **Entidade: Grupo**
   - Atributos:
     - ID_Grupo (Chave Primária)
     - Nome
     - Líder (Chave Estrangeira para Jogador)
     - Data de Criação
     - Número de Membros (Derivado)

5. **Entidade: Item**
   - Atributos:
     - ID_Item (Chave Primária)
     - Nome
     - Descrição
     - Tipo
     - Valor
     - Peso

**Relacionamentos:**
- **Jogador (1) : Personagem (N)**
  - Um jogador pode ter vários personagens, mas cada personagem pertence a apenas um jogador.

- **Personagem (1) : Missão (N)**
  - Um personagem pode participar de várias missões, mas cada missão pode ser realizada por vários personagens.

- **Jogador (1) : Grupo (N)**
  - Um jogador pode liderar ou participar de vários grupos, mas cada grupo tem apenas um líder e pode conter vários membros.

- **Personagem (N) : Item (N)**
  - Um personagem pode possuir vários itens e um item pode estar em posse de vários personagens.

Este sistema de banco de dados permite uma gestão eficaz dos jogadores, seus personagens, suas interações com missões e outros jogadores em grupos, bem como o inventário de itens.

## 2 - Modelagem Conceitual
<br>

Este diagrama representa o modelo conceitual de um sistema de gerenciamento de um jogo multiplayer online. No centro do modelo, temos entidades como Jogador, Personagem, Grupo, Missão e Item, todas interligadas por seus relacionamentos.
<br>

![Modelagem Conceitual](https://github.com/Felipeacandido/MBD-RPG/assets/161148912/81d99828-b916-4134-bd8c-afa806081a4f)
<br>

Este modelo proporciona uma visão clara e estruturada das entidades e seus relacionamentos, facilitando o desenvolvimento e a manutenção do sistema de jogo.

## 3 - Modelagem Lógica
Este modelo lógico detalha a estrutura do banco de dados, especificando as chaves primárias e estrangeiras para garantir a integridade referencial e o correto relacionamento entre as entidades do sistema.
<br>

![Modelo Lógico](https://github.com/Felipeacandido/MBD-RPG/assets/161148912/59939460-bb4e-43b5-b715-07a4bec57622)

<br>


## 4 - Modelagem Física

Este projeto implementa a modelagem física de um banco de dados para um RPG online utilizando SQL Server. Abaixo mostra como as tabelas foram criadas e as relações entre elas.

**Tabela Jogador:**
~~~sql
CREATE TABLE Jogador (
    ID_Jogador        INT         PRIMARY KEY IDENTITY,
    Nome              VARCHAR(20) NOT NULL,
    Email             VARCHAR(40) NOT NULL,
    Senha             VARCHAR(20) NOT NULL,
    Data_de_Registro  DATE        NOT NULL,
    Nivel             INT
);
~~~

**Tabela Missao:**
~~~sql
CREATE TABLE Missao (
    ID_Missao    INT           PRIMARY KEY IDENTITY,
    Nome         VARCHAR(20)   NOT NULL,
    Descricao    VARCHAR(1999) NOT NULL,
    Recompensa   VARCHAR(300),
    Nivel        INT,
    Concluida    INT
);
~~~

**Tabela Item:**
~~~sql
CREATE TABLE Item (
    ID_Item     INT           PRIMARY KEY IDENTITY,
    Nome        VARCHAR(20)   NOT NULL,
    Descricao   VARCHAR(999)  NOT NULL,
    Tipo        VARCHAR(30),
    Valor       INT,
    Peso        FLOAT
);
~~~

**Tabela Habilidades:**
~~~sql
CREATE TABLE Habilidades (
    ID_Habilidades INT         PRIMARY KEY IDENTITY,
    Nome           VARCHAR(50)
);
~~~

**Tabela Personagem:**
~~~sql
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
~~~

**Tabela Grupo:**
~~~sql
CREATE TABLE Grupo (
    ID_Grupo           INT         PRIMARY KEY IDENTITY,
    Nome               VARCHAR(20) NOT NULL,
    Numero_de_Membros  INT,
    Data_de_Criacao    DATE,
    Experiencia        FLOAT,
    Lider              INT         FOREIGN KEY REFERENCES Jogador(ID_Jogador)
);
~~~

**Tabela Joga:**
~~~sql
CREATE TABLE Joga (
    fk_Missao_ID       INT         FOREIGN KEY REFERENCES Missao(ID_Missao),
    fk_Personagem_ID   INT         FOREIGN KEY REFERENCES Personagem(ID_Personagem)
);
~~~

**Tabela Participar:**
~~~sql
CREATE TABLE Participar (
    fk_Jogador_ID      INT         FOREIGN KEY REFERENCES Jogador(ID_Jogador),
    fk_Grupo_ID        INT         FOREIGN KEY REFERENCES Grupo(ID_Grupo)
);
~~~

**Tabela Possuir:**
~~~sql
CREATE TABLE Possuir (
    fk_Personagem_ID   INT         FOREIGN KEY REFERENCES Personagem(ID_Personagem),
    fk_Item_ID         INT         FOREIGN KEY REFERENCES Item(ID_Item)
);
~~~

## 5 - Inserção de Dados

Para realizar a inserção de dados em cada tabela, é recomendado utilizar códigos que sigam uma estrutura similar a está. 
<br>

~~~sql
INSERT INTO Jogador (Nome, Email, Senha, Data_de_Registro, Nivel) VALUES
('Danoone','noonefps@gmail.com','123321','2003-03-28', 1),
...
INSERT INTO Missao (Nome, Descricao, Recompensa, Nivel, Concluida) VALUES
('Missão 1', 'Descrição da Missão 1', 'Recompensa 1', 1, 0),
...
INSERT INTO Item (Nome, Descricao, Tipo, Valor, Peso) VALUES
('Item 1', 'Descrição do Item 1', 'Tipo 1', 10, 1.1),
...
INSERT INTO Habilidades (Nome) VALUES
('Habilidade 1'),
...
INSERT INTO Personagem (Nome, Raca, Classe, Experiencia, Pontos_de_vida, Pontos_de_mana, Longitude, Latitude, fk_Habilidades, fk_Jogador_ID) VALUES
('Personagem 1', 'Raça 1', 'Classe 1', 100.0, 100, 50, 10.123456, 20.123456, 1, 1),
...
INSERT INTO Grupo (Nome, Numero_de_Membros, Data_de_Criacao, Experiencia, Lider) VALUES
('Grupo 1', 5, '2022-01-01', 100.0, 1),
...
INSERT INTO Joga (fk_Missao_ID, fk_Personagem_ID) VALUES
(1, 1),
...
INSERT INTO Participar (fk_Jogador_ID, fk_Grupo_ID) VALUES
(1, 1),
...
INSERT INTO Possuir (fk_Personagem_ID, fk_Item_ID) VALUES
(1, 1),
...
~~~

<br>
Esta abordagem garante consistência e organização nos dados inseridos, facilitando a manutenção e o entendimento do sistema como um todo.

## 6 - CRUD
CRUD é um acrônimo para as operações básicas de gestão de dados em qualquer sistema de banco de dados: Create (Criar), Read (Ler), Update (Atualizar) e Delete (Deletar). Estas quatro ações fundamentais representam as interações primárias que os usuários e sistemas têm com qualquer conjunto de dados. Na prática, CRUD é aplicado para garantir que os aplicativos possam executar operações essenciais de armazenamento, recuperação, modificação e remoção de dados de maneira eficaz. Por exemplo:

<br>

**1-Create**
Adcionar Dados as tabelas.
~~~sql
INSERT INTO Jogador (Nome, Email, Senha, Data_de_Registro, Nivel) VALUES
('Danoone','noonefps@gmail.com','123321','2003-03-28', 1),
('Alice' ,'alice@example.com','alicepass','2022-01-01', 2),
('Bob','bob@example.com','bobpass','2022-02-02', 3),
('Carol','carol@example.com','carolpass','2022-03-03', 4),
('Dave','dave@example.com','davepass','2022-04-04', 5);
~~~
![Create](https://github.com/Felipeacandido/MBD-RPG/assets/161148912/e0dfd956-1bd1-4867-853c-193e86c71c4e)


<br>

**2-Read**
Ler os dados inseridos nas tabelas.
~~~sql
SELECT * FROM Jogador;
~~~
![Read](https://github.com/Felipeacandido/MBD-RPG/assets/161148912/2cba060e-dfc0-4a9c-bcfe-218a9936de65)


<br>

**3-Update**
Modificar dados das tabelas.
~~~sql
UPDATE Jogador SET Email = REPLACE(Email, '@example.com', '@gmail.com')
WHERE Email LIKE '%@example.com';
~~~
![Update](https://github.com/Felipeacandido/MBD-RPG/assets/161148912/a084be65-f9b8-4c26-8534-342fc2c3ce1a)


<br>

**4-Delete**
Deletar dados inseridos nas tabelas.
~~~sql
DELETE FROM Jogador WHERE Nome LIKE 'C%' OR Nome LIKE 'A%';
~~~
![Delete](https://github.com/Felipeacandido/MBD-RPG/assets/161148912/62d68264-15cd-4e20-b302-d8c3e9e0ad86)


<br>

## 7 - Relatórios
Essas consultas demonstram a relação entre as tabelas do seu banco de dados e como realizar seleção, filtro e ordenação dos dados.

**1-Consulta para exibir todos os jogadores com os personagens que possuem e as habilidades associadas:**
~~~sql
SELECT j.Nome AS Nome_Jogador, p.Nome AS Nome_Personagem, h.Nome AS Habilidade FROM Jogador j
JOIN Personagem p ON j.ID_Jogador = p.fk_Jogador_ID
JOIN Habilidades h ON p.fk_Habilidades = h.ID_Habilidades;
~~~

![Resultado 1](https://github.com/Felipeacandido/MBD-RPG/assets/161148912/db09aaa5-a127-4adc-80be-981bd3cbc51e)

Esta consulta seleciona o nome de cada jogador, o nome de cada personagem associado a esse jogador e a habilidade associada a cada personagem.

<br>

**2-Consulta para exibir todas as missões concluídas por cada jogador:**
~~~sql
SELECT p.Nome AS Nome_Personagem, m.Nome AS Nome_Missao FROM Personagem p
JOIN Joga j ON p.ID_Personagem = j.fk_Personagem_ID
JOIN Missao m ON j.fk_Missao_ID = m.ID_Missao;
~~~

![Resultado 2](https://github.com/Felipeacandido/MBD-RPG/assets/161148912/5770c6b5-68c8-498b-a919-9ecd450f57a3)

Esta consulta mostra o nome de cada jogador e o nome de cada missão concluída por esse jogador.

<br>

**3-Consulta para exibir todos os grupos liderados por cada jogador:**
~~~sql
SELECT j.Nome AS Nome_Jogador, g.Nome AS Nome_Grupo FROM Jogador j
JOIN Grupo g ON j.ID_Jogador = g.Lider;
~~~

![Resultado 3](https://github.com/Felipeacandido/MBD-RPG/assets/161148912/e28f277e-3b5c-4b23-bcfe-bd0559acadd8)

Esta consulta mostra o nome de cada jogador e o nome de cada grupo liderado por esse jogador.

<br>

**4-Consulta para exibir todos os itens possuídos por cada personagem:**
~~~sql
SELECT p.Nome AS Nome_Personagem, i.Nome AS Nome_Item FROM Personagem p
JOIN Possuir po ON p.ID_Personagem = po.fk_Personagem_ID
JOIN Item i ON po.fk_Item_ID = i.ID_Item;
~~~

![Resultado 4](https://github.com/Felipeacandido/MBD-RPG/assets/161148912/7c925d9c-33ce-4e43-ba7c-d826d92c8b93)

Esta consulta mostra o nome de cada personagem e o nome de cada item que ele possui.

<br>

**5-Consulta para exibir os jogadores em ordem decrescente de nível:**
~~~sql
SELECT * FROM Jogador ORDER BY Nivel DESC;
~~~

![Resultado 5](https://github.com/Felipeacandido/MBD-RPG/assets/161148912/08b2861b-b0f3-485e-a6be-1971ff03fb6f)

Esta consulta exibe todos os jogadores ordenados por nível, do maior para o menor.

<br>

**6-Consulta para exibir os personagens em ordem crescente de experiência:**
~~~sql
SELECT * FROM Personagem ORDER BY Experiencia ASC;
~~~

![Resultado 6](https://github.com/Felipeacandido/MBD-RPG/assets/161148912/fd112ba9-e10f-404a-a87d-b18c4a2d2574)

Esta consulta mostra todos os personagens ordenados por experiência, do menor para o maior.

<br>

**7-Consulta para exibir as missões em ordem alfabética de nome:**
~~~sql
SELECT * FROM Missao ORDER BY Nome ASC;
~~~

![Resultado 7](https://github.com/Felipeacandido/MBD-RPG/assets/161148912/41ce440c-441a-46b0-8ac1-80e34f604197)

Esta consulta exibe todas as missões ordenadas por nome em ordem alfabética.

<br>

**8-Consulta para exibir os grupos em ordem decrescente de número de membros:**
~~~sql
SELECT * FROM Grupo ORDER BY Numero_de_Membros DESC;
~~~

![Resultado 8](https://github.com/Felipeacandido/MBD-RPG/assets/161148912/596436f4-7f0c-4487-bb0e-b113e23ff893)

Esta consulta mostra todos os grupos ordenados pelo número de membros, do maior para o menor.

<br>

**9-Consulta para exibir os itens em ordem crescente de valor:**
~~~sql
SELECT * FROM Item ORDER BY Valor ASC;
~~~

![Resultado 9](https://github.com/Felipeacandido/MBD-RPG/assets/161148912/1a10cbd7-da54-40b0-aa5f-8970546e802c)

Esta consulta exibe todos os itens ordenados por valor, do menor para o maior.

<br>

**10-Consulta para exibir os personagens em ordem alfabética de nome de jogador associado:**
~~~sql
SELECT p.Nome AS Nome_Personagem, j.Nome AS Nome_Jogador FROM Personagem p
JOIN Jogador j ON p.fk_Jogador_ID = j.ID_Jogador ORDER BY j.Nome ASC;
~~~

![Resultado 10](https://github.com/Felipeacandido/MBD-RPG/assets/161148912/a5147fc2-8bc5-4fbc-ac76-293791efaee5)

Esta consulta mostra os personagens ordenados por nome de jogador associado em ordem alfabética.

## Conclusão

Este projeto foi desenvolvido como parte de um trabalho acadêmico, com o objetivo de criar uma modelagem de banco de dados completa para um jogo de RPG hipotético. Durante o desenvolvimento do MBD-RPG, apliquei os conhecimentos adquiridos ao longo do curso, explorando diferentes aspectos da modelagem de dados, desde o planejamento inicial até a implementação final.
