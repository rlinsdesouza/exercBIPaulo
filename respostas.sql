-- UTILS
SELECT * FROM categorias;
SELECT * FROM clientes;
SELECT * FROM fornecedores;
SELECT * FROM funcionarios;
SELECT * FROM itens;
SELECT * FROM pedidos;
SELECT * FROM produtos;
SELECT * FROM transportadoras;

-- questao 1
 
-- select * from itens;
SELECT SUM((precounit*qntprod)-(descontoitem*qntprod))
FROM itens 
WHERE numpedido IN (
	SELECT id FROM pedidos
	WHERE datadopedido BETWEEN '2016-01-01' AND '2018-12-31'
);

-- questao 2
 
SELECT p.id, p.idcliente, SUM( (precounit*qntprod)-(descontoitem*qntprod))
FROM pedidos p JOIN itens i ON p.id = i.numpedido
GROUP BY p.id, i.codprod
HAVING p.datadopedido BETWEEN '2017-01-01' AND '2017-12-31'
ORDER BY p.id;

-- Query modificada da Questão 2
SELECT c.nomeempresa, SUM(precounit*qntprod - descontoitem*qntprod) as sumValorVendas
FROM clientes c
JOIN pedidos p ON p.idcliente = c.id
JOIN itens i ON p.id = i.numpedido
WHERE p.datadopedido BETWEEN '2017-01-01' AND '2017-12-31'
GROUP BY c.nomeempresa
ORDER BY sumValorVendas DESC;

-- Questão 3

SELECT nomeprod, SUM(i.qntprod) as sumQtd
FROM produtos pr
JOIN itens i ON pr.id = i.codprod
JOIN pedidos pe ON i.numpedido = pe.id
WHERE pe.datadopedido BETWEEN '2016-01-01' AND '2016-12-31'
GROUP BY nomeprod
ORDER BY sumQtd DESC;

-- Tentativa de usar o MAX para apresentar só um, porém não funciona com o GROUP BY
-- SELECT nomeprod, MAX(sumQtd) AS max
-- FROM (
-- 	SELECT nomeprod, SUM(i.qntprod) as sumQtd
-- 	FROM produtos pr
-- 	JOIN itens i ON pr.id = i.codprod 
-- 	GROUP BY nomeprod
-- 	ORDER BY sumQtd DESC
-- ) sumQtdProd
-- GROUP BY nomeprod

-- Questão 4

SELECT CONCAT(f.nome, ' ', f.sobrenome) as nomecompleto, SUM(precounit * qntprod - descontoitem*qntprod) AS sumVendas
FROM pedidos pe
JOIN itens i ON pe.id = i.numpedido
JOIN funcionarios f ON f.id = pe.idfuncionario
WHERE pe.datadopedido BETWEEN '2017-01-01' AND '2017-12-31'
GROUP BY nomecompleto
ORDER BY sumVendas DESC;

-- Questão 5

SELECT c.nome, SUM(i.qntprod) as sumQtd  FROM categorias c
JOIN produtos pr ON c.id = pr.idcateg
JOIN itens i ON pr.id = i.codprod
JOIN pedidos pe ON i.numpedido = pe.id
WHERE pe.datadopedido BETWEEN '2018-01-01' AND '2018-12-31'
GROUP BY c.nome
ORDER BY sumQtd DESC;

-- Questão 6
SELECT DISTINCT CONCAT(f.nome, ' ', f.sobrenome) as nomecompleto FROM categorias c
JOIN produtos pr ON c.id = pr.idcateg
JOIN itens i ON pr.id = i.codprod
JOIN pedidos pe ON i.numpedido = pe.id
JOIN funcionarios f ON pe.idfuncionario = f.id
WHERE pe.datadopedido BETWEEN '2017-01-01' AND '2017-12-31'
AND pe.paisdestino = 'Brasil'
AND c.nome = 'Bebidas';

-- Questão 7
SELECT cl.nomeempresa, SUM(precounit * qntprod - descontoitem*qntprod) as sumValorVendas
FROM clientes cl
JOIN pedidos pe ON pe.idcliente = cl.id
JOIN itens i ON i.numpedido = pe.id
JOIN produtos pr ON pr.id = i.codprod
JOIN categorias ct ON cT.id = pr.idcateg
WHERE pe.datadopedido BETWEEN '2016-01-01' AND '2016-12-31'
AND ct.nome = 'Grãos/Cereais'
GROUP BY cl.nomeempresa
ORDER BY sumValorVendas DESC;

-- Questão 8
SELECT pr.nomeprod, SUM(i.qntprod) as sumVendas
FROM produtos pr
JOIN itens i ON i.codprod = pr.id
JOIN pedidos pe ON pe.id = i.numpedido
JOIN categorias ct ON cT.id = pr.idcateg
WHERE pe.datadopedido BETWEEN '2017-01-01' AND '2017-12-31'
AND ct.nome = 'Bebidas'
GROUP BY pr.nomeprod
ORDER BY sumVendas DESC;
