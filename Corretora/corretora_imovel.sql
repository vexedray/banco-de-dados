CREATE DATABASE corretora_aluguel;
USE corretora_aluguel;
CREATE TABLE cliente (
id_cliente INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
cpf VARCHAR(11) NOT NULL,
telefone VARCHAR(15),
email VARCHAR(100)
);

CREATE TABLE proprietario (
id_proprietario INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
cpf  VARCHAR(11) NOT NULL,
telefone VARCHAR(15),
email VARCHAR(100)
);

CREATE TABLE imobiliaria (
id_imobiliaria INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
cnpj VARCHAR(14)  NOT NULL,
telefone VARCHAR(15),
email VARCHAR(100)
);

CREATE TABLE corretor (
id_corretor INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
cpf VARCHAR(11)  NOT NULL,
telefone VARCHAR(15),
email VARCHAR(100),
creci VARCHAR(20) NOT NULL,
id_imobiliaria INT NOT NULL,
FOREIGN KEY (id_imobiliaria) REFERENCES imobiliaria(id_imobiliaria)
);

CREATE TABLE imovel (
id_imovel INT AUTO_INCREMENT PRIMARY KEY,
endereco VARCHAR(255) NOT NULL,
tipo ENUM('apartamento', 'casa', 'comercial') NOT NULL,
valor_aluguel DECIMAL(10, 2) NOT NULL,
status ENUM('disponivel', 'alugado') DEFAULT 'disponivel',
id_proprietario INT NOT NULL,
FOREIGN KEY (id_proprietario) REFERENCES proprietario(id_proprietario)
);

CREATE TABLE contrato (
id_contrato INT AUTO_INCREMENT PRIMARY KEY,
id_imovel INT NOT NULL,
id_cliente INT NOT NULL,
id_corretor INT NOT NULL,
id_imobiliaria INT NOT NULL,
id_proprietario INT NOT NULL,
data_inicio DATE NOT NULL,
data_termino DATE,
valor_mensal DECIMAL(10, 2) NOT NULL,
status ENUM('ativo', 'encerrado') DEFAULT 'ativo',
FOREIGN KEY (id_imovel) REFERENCES imovel(id_imovel),
FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
FOREIGN KEY (id_corretor) REFERENCES corretor(id_corretor),
FOREIGN KEY (id_imobiliaria) REFERENCES imobiliaria(id_imobiliaria),
FOREIGN KEY (id_proprietario) REFERENCES proprietario(id_proprietario)
);

CREATE TABLE pagamento (
id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
id_contrato INT NOT NULL,
data_pagamento DATE NOT NULL,
valor_pago DECIMAL(10, 2) NOT NULL,
status ENUM('pago', 'atrasado') NOT NULL,
FOREIGN KEY (id_contrato) REFERENCES contrato(id_contrato)
);

    
INSERT INTO cliente (nome, cpf, telefone, email) VALUES 
('João Silva', '12345678901', '48999999999', 'joao.silva@email.com'),
('Maria Oliveira', '98765432100', '48988888888', 'maria.oliveira@email.com');

INSERT INTO proprietario (nome, cpf, telefone, email) VALUES 
('Carlos Santos', '11122233344', '48977777777', 'carlos.santos@email.com'),
('Ana Souza', '44455566677', '48966666666', 'ana.souza@email.com');

INSERT INTO imobiliaria (nome, cnpj, telefone, email) VALUES 
('Imobiliária Tubarão', '12345678000199', '4835345678', 'contato@imobiliariatubarao.com'),
('Alugue Fácil', '98765432000188', '4830123456', 'suporte@aluguefacil.com');

INSERT INTO corretor (nome, cpf, telefone, email, creci, id_imobiliaria) VALUES 
('Ricardo Lima', '22233344455', '48955555555', 'ricardo.lima@email.com', 'CRECI12345', 1),
('Paula Mendes', '55566677788', '48944444444', 'paula.mendes@email.com', 'CRECI54321', 2);

INSERT INTO imovel (endereco, tipo, valor_aluguel, status, id_proprietario) VALUES 
('Rua das Flores, 123', 'apartamento', 1200.00, 'disponivel', 1),
('Avenida Central, 456', 'casa', 1800.00, 'alugado', 2);

INSERT INTO contrato (id_imovel, id_cliente, id_corretor, id_imobiliaria, id_proprietario, data_inicio, data_termino, valor_mensal, status) VALUES 
(1, 1, 1, 1, 1, '2024-01-01', '2024-12-31', 1200.00, 'ativo'),
(2, 2, 2, 2, 2, '2023-05-01', '2024-04-30', 1800.00, 'encerrado');

INSERT INTO pagamento (id_contrato, data_pagamento, valor_pago, status) VALUES 
(1, '2024-02-01', 1200.00, 'pago'),
(2, '2023-06-01', 1800.00, 'pago'),
(1, '2023-08-01', 1800.00, 'atrasado');




	-- 1. Listar imóveis disponíveis
	SELECT * FROM imovel WHERE status = 'disponivel';

	-- 2. Consultar contratos ativos
	SELECT * FROM contrato WHERE status = 'ativo';

	-- 3. Total de pagamentos recebidos por contrato
	SELECT id_contrato, SUM(valor_pago) AS total_recebido
	FROM pagamento
	GROUP BY id_contrato;

	-- 4. Listar pagamentos atrasados
	SELECT * FROM pagamento WHERE status = 'atrasado';

	-- 5. Relatório de contratos com imóveis, clientes, proprietários, corretores, e imobiliárias
	SELECT 
		c.id_contrato, 
		i.endereco AS imovel, 
		cl.nome AS cliente, 
		p.nome AS proprietario, 
		co.nome AS corretor, 
		im.nome AS imobiliaria, 
		c.data_inicio, 
		c.valor_mensal
	FROM contrato c
	JOIN imovel i ON c.id_imovel = i.id_imovel
	JOIN cliente cl ON c.id_cliente = cl.id_cliente
	JOIN proprietario p ON c.id_proprietario = p.id_proprietario
	JOIN corretor co ON c.id_corretor = co.id_corretor
	JOIN imobiliaria im ON c.id_imobiliaria = im.id_imobiliaria
	WHERE c.status = 'ativo';

	-- 6 Listar imóveis que possuem contratos ativos e ainda não foram pagos
	SELECT 
    i.id_imovel, 
    i.endereco, 
    i.tipo, 
    c.id_contrato, 
    cl.nome AS cliente, 
    c.data_inicio, 
    c.data_termino,
    c.valor_mensal,
    p.status AS pagamento_status
FROM imovel i
JOIN contrato c ON i.id_imovel = c.id_imovel
JOIN cliente cl ON c.id_cliente = cl.id_cliente
LEFT JOIN pagamento p ON c.id_contrato = p.id_contrato
WHERE c.status = 'ativo' 
  AND (p.id_contrato IS NULL OR p.status = 'atrasado');

    
    -- 7. Listar todos os corretores que trabalham em uma determinada imobiliária
SELECT 
    c.nome AS corretor, 
    i.nome AS imobiliaria 
FROM corretor c
JOIN imobiliaria i ON c.id_imobiliaria = i.id_imobiliaria
WHERE i.nome = 'Imobiliária Tubarão';

-- 8. Consultar os imóveis alugados e os respectivos clientes
SELECT 
    i.endereco AS imovel, 
    cl.nome AS cliente 
FROM contrato c
JOIN imovel i ON c.id_imovel = i.id_imovel
JOIN cliente cl ON c.id_cliente = cl.id_cliente
WHERE i.status = 'alugado';

-- 9. Quantidade de contratos por corretor
SELECT 
    co.nome AS corretor, 
    COUNT(c.id_contrato) AS total_contratos
FROM contrato c
JOIN corretor co ON c.id_corretor = co.id_corretor
GROUP BY co.nome;

-- 10. Valor total de aluguel gerado por cada proprietário
SELECT 
    p.nome AS proprietario, 
    SUM(c.valor_mensal) AS total_aluguel
FROM contrato c
JOIN proprietario p ON c.id_proprietario = p.id_proprietario
GROUP BY p.nome;


-- 11. Listar corretores e a quantidade de imóveis que gerenciaram contratos
SELECT 
    co.nome AS corretor, 
    COUNT(DISTINCT c.id_imovel) AS imoveis_gerenciados
FROM contrato c
JOIN corretor co ON c.id_corretor = co.id_corretor
GROUP BY co.nome;

