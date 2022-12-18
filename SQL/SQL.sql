-- Criando o banco de dados (DDL)
CREATE database erp;

-- Setando o BD para uso
USE erp;

-- Criando a Tabela vendedor (DDL)
CREATE TABLE tbvdd (
  cdvdd SMALLINT NOT NULL, 
  nmvdd VARCHAR(20),
  sxvdd SMALLINT, -- 1 M e 0 F
  perccomissao DECIMAL(19,2),
  matfunc SMALLINT NOT NULL UNIQUE,
); -- DROP TABLE tbvdd

-- Criando as chaves primárias (DDl)
ALTER TABLE tbvdd ADD PRIMARY KEY (cdvdd);

-- Consultando dados (DQL)
SELECT * FROM tbvdd;

-- Inserindo dados tbvdd (DML)
INSERT INTO tbvdd VALUES (1, 'Vendedor 1', 1, 1, 1);
INSERT INTO tbvdd VALUES (2, 'Vendedor 2', 0, 1, 2);
INSERT INTO tbvdd VALUES (3, 'Vendedor 3', 1, 1, 3);
INSERT INTO tbvdd VALUES (4, 'Vendedor 4', 0, 1, 4);
INSERT INTO tbvdd VALUES (5, 'Vendedor 5', 0, 1, 5);
INSERT INTO tbvdd VALUES (6, 'Vendedor 6', 1, 1, 6);
INSERT INTO tbvdd VALUES (7, 'Vendedor 7', 1, 1, 7);
INSERT INTO tbvdd VALUES (8, 'Vendedor 8', 0, 1, 8);
INSERT INTO tbvdd VALUES (9, 'Vendedor 9', 1, 1, 9);
INSERT INTO tbvdd VALUES (10, 'Vendedor 10', 1, 1, 10);


-- Criando tabela Dependentes (DDL)
CREATE TABLE tbdep (
  cddep SMALLINT primary key,
  nmdep VARCHAR(20) NULL,
  dtnasc DATETIME NOT NULL,
  sxdep VARCHAR(2),
  inepescola VARCHAR(10),
  matfunc SMALLINT NOT NULL,
  CONSTRAINT FK_Dep_Vdd FOREIGN KEY (matfunc) REFERENCES tbvdd (cdvdd)
 ); -- DROP TABLE tbdep

-- Inserindo dados tbvdd (DML)
INSERT INTO tbdep VALUES (1, 'Dependente 1', '2010-02-01', 'M', '12345', 1);
INSERT INTO tbdep VALUES (2, 'Dependente 2', '2006-10-04', 'M', '1234345', 3);
INSERT INTO tbdep VALUES (3, 'Dependente 3', '2007-22-05', 'F', '1234345', 3);

-- Consultando dados (DQL)
SELECT * FROM tbdep;

-- Criando a tabela de produto (DDL)
CREATE TABLE tbpro (
  cdpro SMALLINT NOT NULL primary key,
  nmpro VARCHAR(50) NULL,
  tppro VARCHAR(1) NULL,
  undpro VARCHAR(2) NULL,
  slpro SMALLINT NULL,
  stpro VARCHAR(50) NULL,
); -- DROP TABLE tbpro

-- Inserindo dados tbpro (DML)
INSERT INTO tbpro VALUES (1, 'Produto A', 'A', 'KG', 50, 'Ativo');
INSERT INTO tbpro VALUES (2, 'Produto B', 'A', 'KG', 60, 'Ativo');
INSERT INTO tbpro VALUES (3, 'Produto V', 'B', 'KG', 10, 'Ativo');
INSERT INTO tbpro VALUES (4, 'Produto D', 'A', 'KG', 20, 'Ativo');
INSERT INTO tbpro VALUES (5, 'Produto E', 'A', 'KG', 30, 'Ativo');

-- Consultando dados (DQL)
SELECT * FROM tbpro;

-- Criando a tabela de vendas (DDL)
CREATE TABLE tbven (
  cdven SMALLINT NOT NULL primary key,
  dtven DATETIME NULL,
  cdcli SMALLINT NULL,
  nmcli VARCHAR(50) NULL,
  agecli SMALLINT NULL,
  clacli SMALLINT NULL DEFAULT 1,
  sxcli VARCHAR(1) NULL,
  cidcli VARCHAR(45) NULL,
  estcli VARCHAR(45) NULL,
  paicli VARCHAR(45) NULL,
  qtven INT NULL,
  vruven DECIMAL(18,2) NULL,
  vrtven DECIMAL(29,2) NULL,
  canal VARCHAR(12) NULL,
  stven SMALLINT NULL,
  cdpro SMALLINT NOT NULL,
  cdvdd SMALLINT NOT NULL,
  deleted SMALLINT NULL,
); -- DROP TABLE tbven

-- ADICIONANDO FOREIGN KEY - RELACIONAMENTO COM VENDEDOR
ALTER TABLE erp..tbven ADD CONSTRAINT "fk_vendas_vendedor" FOREIGN KEY (cdvdd) REFERENCES tbvdd (cdvdd);

-- ADICIONANDO FOREIGN KEY - RELACIONAMENTO COM PRODUTO
ALTER TABLE erp..tbven ADD CONSTRAINT "fk_vendas_produto" FOREIGN KEY (cdpro) REFERENCES tbpro (cdpro);

select * from tbven;

-- Inserindo dados tbven (DML)
INSERT INTO tbven VALUES (1, '2010-05-01', 1, 'Cliente A', 30, 3, 'M', 'Floripa', 'SC', 'Brazuca', 1, 40, 55, 136, 2 ,1, 1, 0);
INSERT INTO tbven VALUES (2, '2010-05-01', 2, 'Cliente BA', 30, 3, 'F', 'Flor', 'RS', 'Brazuca', 1, 40, 55, 136, 2, 2, 2, 0);
INSERT INTO tbven VALUES (3, '2010-05-01', 3, 'ClienteBCA', 30, 3, 'M', 'Teste', 'RS', 'Brazuca', 1, 40, 60, 136, 2, 3, 1, 0);
