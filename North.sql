﻿DROP SCHEMA public CASCADE;
CREATE SCHEMA public;

GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO public;
COMMENT ON SCHEMA public IS 'standard public schema';



-- CREATE TABLE Categorias
-- (
--   id int,
--   nome character varying(50),
--   descricao character varying(50),
--   figura character varying(50),
--   CONSTRAINT categorias_pkey PRIMARY KEY (id)
-- );
-- 
-- COPY categorias 
-- FROM '/home/rafael/ifpb/intEmpresarial/dataAnaliseNorthWind/NorthwindCsv/Categorias.csv' DELIMITER ';' CSV HEADER;

--select * from categorias;


-- CREATE TABLE Clientes
-- (
--   id character varying(50),
--   nomeEmpresa character varying(50),
--   nomeContato character varying(50),
--   cargoContato character varying(50),
--   endereco character varying(50),
--   cidade character varying(50),
--   regiao character varying(50),
--   cep character varying(50),
--   pais character varying(50),
--   telefone character varying(50),
--   fax character varying(50),
--   vazia character varying(50),
--   siglaPais character varying(50),
--   CONSTRAINT clientes_pkey PRIMARY KEY (id)
-- );
-- 
-- COPY clientes 
-- FROM '/home/rafael/ifpb/intEmpresarial/dataAnaliseNorthWind/NorthwindCsv/Clientes.csv' DELIMITER ';' CSV HEADER;
-- 
-- select * from clientes;

-- drop table itens;
-- 
-- CREATE TABLE itens
-- (
--   numPedido int,
--   codProd int,
--   precoUnit money,
--   qntProd int,
--   descontoItem money,
--   CONSTRAINT itens_pkey PRIMARY KEY (numPedido,codProd)
-- );
-- 
-- COPY itens 
-- FROM '/home/rafael/ifpb/intEmpresarial/dataAnaliseNorthWind/NorthwindCsv/itens.csv' DELIMITER ';' CSV HEADER;
-- 
-- UPDATE itens SET precoUnit = precoUnit/100;
-- 
-- UPDATE itens SET descontoitem = descontoitem/1000000000;
-- 
-- select * from itens;

-- CREATE TABLE fornecedores
-- (
--   id int,
--   nomeEmpresa varchar(50),
--   nomeContato varchar(50),
--   cargoContato varchar(50),
--   endereco varchar(50),
--   cidade varchar(50),
--   regiao varchar(50),
--   cep varchar(50),
--   pais varchar(50),
--   telefone varchar(50),
--   fax varchar(50),
--   homepage varchar(50),
--   CONSTRAINT fornecedores_pkey PRIMARY KEY (id)
-- );
-- 
-- COPY fornecedores 
-- FROM '/home/rafael/ifpb/intEmpresarial/dataAnaliseNorthWind/NorthwindCsv/Fornecedores.csv' DELIMITER ';' CSV HEADER;
-- 
-- select * from fornecedores;

-- CREATE TABLE funcionarios
-- (
--   id int,
--   sobrenome varchar(50),
--   nome varchar(50),
--   cargo varchar(50),
--   tratamento varchar(50),
--   nascimento varchar(50),
--   admissao varchar(50),
--   endereco varchar(50),
--   cidade varchar(50),
--   regiao varchar(50),	
--   cep varchar(50),
--   pais varchar(50),
--   telefone varchar(50),
--   ramal int,
--   foto varchar(50),
--   observacoes text,
--   supervisor int,
--   CONSTRAINT funcionarios_pkey PRIMARY KEY (id)
-- );
-- 
-- COPY funcionarios 
-- FROM '/home/rafael/ifpb/intEmpresarial/dataAnaliseNorthWind/NorthwindCsv/Funcionarios.csv' DELIMITER ';' CSV HEADER;
-- 
-- UPDATE funcionarios SET nascimento = TO_DATE(nascimento,'DD/MM/YYYY');
-- 
-- UPDATE funcionarios SET admissao = TO_DATE(admissao,'DD/MM/YYYY');
-- 
-- ALTER TABLE funcionarios
-- ALTER COLUMN nascimento TYPE date USING nascimento::date;
-- ALTER TABLE funcionarios
-- ALTER COLUMN admissao TYPE date USING nascimento::date;
-- 
-- select * from funcionarios;

CREATE TABLE pedidos
(
  id int,
  idCliente varchar(50),
  idFuncionario int,
  dataDoPedido varchar(50),
  dataDeEntrega varchar(50),
  dataDeEntrega2 varchar(50),
  dataDeEnvio varchar(50),
  via int,
  frete money,
  nomeDestinatario varchar(50),
  enderecoDestinatario varchar(50),
  cidadeDestino varchar(50),
  regiaoDestino varchar(50),
  cepDestino varchar(50),
  paisDestino varchar(50),
  CONSTRAINT pedidos_pkey PRIMARY KEY (id)
);

COPY pedidos 
FROM '/home/rafael/ifpb/intEmpresarial/dataAnaliseNorthWind/NorthwindCsv/Pedidos.csv' DELIMITER ';' CSV HEADER;

UPDATE pedidos SET dataDoPedido = TO_DATE(dataDoPedido,'DD/MM/YYYY');
UPDATE pedidos SET dataDaEntrega = TO_DATE(dataDaEntrega,'DD/MM/YYYY');
UPDATE pedidos SET dataDaEntrega2 = TO_DATE(dataDaEntrega2,'DD/MM/YYYY');
UPDATE pedidos SET dataDeEnvio = TO_DATE(dataDeEnvio,'DD/MM/YYYY');

ALTER TABLE pedidos
ALTER COLUMN dataDoPedido TYPE date USING dataDoPedido::date;
ALTER TABLE pedidos
ALTER COLUMN dataDaEntrega TYPE date USING dataDaEntrega::date;
ALTER TABLE pedidos
ALTER COLUMN dataDaEntrega2 TYPE date USING dataDaEntrega2::date;
ALTER TABLE pedidos
ALTER COLUMN dataDeEnvio TYPE date USING dataDeEnvio::date;
 
select * from pedidos;
