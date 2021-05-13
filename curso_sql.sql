-- Etapa de criação das tabelas
-- CREATE DATABASE `vendas` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

CREATE TABLE cliente
(codigo_cliente smallint not null unique,
nome_cliente char(20), 
endereco char(30),
cidade char(15), 
CEP char(8), 
UF char(2),
CNPJ char(20),
IE char(20),
CONSTRAINT PK_Cliente Primary Key (codigo_cliente)
);

CREATE TABLE vendedores
(codigo_vendedor smallint not null,
nome_vendedor char(20),
salario_fixo decimal(15,2),
faixa_de_comissao char(1),
PRIMARY KEY (codigo_vendedor));

CREATE TABLE produto
(codigo_produto smallint not null unique,
unidade_produto char(3),
descricao_produto char(30),
val_unitario decimal(15,2),
CONSTRAINT PK_Produtos Primary Key (codigo_produto));

CREATE TABLE pedido(
numero_pedido int not null unique,
prazo_de_entrega smallint not null,
codigo_cliente smallint not null, 
codigo_vendedor smallint not null);

ALTER TABLE pedido
ADD CONSTRAINT FK_cod_cliente
FOREIGN KEY (codigo_cliente) REFERENCES cliente(codigo_cliente);

ALTER TABLE pedido
ADD CONSTRAINT FK_cod_vendedor
FOREIGN KEY (codigo_vendedor) REFERENCES vendedores(codigo_vendedor);

CREATE TABLE item_pedido
(numero_pedido int not null unique,
codigo_produto smallint not null unique,
quantidade decimal,    
CONSTRAINT PK_ITEM_DE_PEDIDO PRIMARY KEY (numero_pedido, codigo_produto)
);

ALTER TABLE item_pedido
ADD CONSTRAINT FK_num_pedido
FOREIGN KEY (numero_pedido) REFERENCES pedido(numero_pedido);

ALTER TABLE item_pedido
ADD CONSTRAINT FK_cod_produto
FOREIGN KEY (codigo_produto) REFERENCES produto(codigo_produto);

-- Etapa de inserção de dados

INSERT INTO cliente VALUES
    (720,'Ana','Rua 17 n. 19','Niterói',24358310,'RJ',12113231000134,2134),
    (870,'Flávio','Av. Pres. Vargas 10','São Paulo',22763931,'SP',2253412693879,4631),
    (110,'Jorge','Rua Caiapo 13','Curitiba',30078500,'PR',1451276498349,NULL),
    (222,'Lúcia','Rua Itabira 123 Loja 9','Belo Horizonte',22124391,'MG',2831521393488,2985),
    (830,'Maurício','Av. Paulista 1236 sl 2345','São Paulo',3012683,'SP',3281698574656,9343),
    (130,'Edmar','Rua da Praia sn','Salvador',30079300,'BA',234632842349,7121),
    (410,'Rodolfo','Largo da Lapa 27 sobrado','Rio de Janeiro',30078900,'RJ',1283512823469,7431),
    (20,'Beth','Av. Climério 45','São Paulo',25679300,'SP',3248512673268,9280),
    (157,'Paulo','Tv. Moraes c/3','Londrina',NULL,'PR',328482233242,1923),
    (180,'Lívio','Av. Beira Mar n. 1256','Florianópolis',30077500,'SC',1273657123474,NULL),
    (260,'Susana','Rua Lopes Mendes 12','Niterói',30046500,'RJ',217635712329,2530),
    (290,'Renato','Rua Meireles 123 bl.2 sl. 345','São Paulo',30225900,'SP',1327657112314,1820),
    (390,'Sebastião','Rua da Igreja 10','Uberaba',30438700,'MG',321765472133,9071),
    (234,'José','Quadra 3 bl. 3 sl. 1003','Brasília',22841650,'DF',2176357612323,2931);

    
-- Carregar a tabela VENDEDORES
    INSERT INTO vendedores VALUES
    (209,'José',1800,'C'),
    (111,'Carlos',2490,'A'),
    (11,'João',2780,'C'),
    (240,'Antônio',9500,'C'),
    (720,'Felipe',4600,'A'),
    (213,'Jonas',2300,'A'),
    (101,'Vitor',2650,'C'),
    (310,'Josias',870,'B'),
    (250,'Maria',2930,'B');

-- Carregar a tabela PRODUTO
INSERT INTO produto VALUES
    (25,'Kg','Queijo',0.97),
    (31,'BAR','Chocolate',0.87),
    (78,'L','Vinho',2),
    (22,'M','Linho',0.11),
    (30,'SAC','Açúcar',0.3),
    (53,'M','Linha',1.8),
    (13,'G','Ouro',6.18),
    (45,'M','Madeira',0.25),
    (87,'M','Cano',1.97),
    (77,'M','Papel',1.05);

-- Carregar a tabela Pedido
INSERT INTO pedido VALUES
    (121,20,410,209),
    (97,20,720,101),
    (101,15,720,101),
    (137,20,720,720),
    (148,20,720,101),
    (189,15,870,213),
    (104,30,110,101),
    (203,30,830,250),
    (98,20,410,209),
    (143,30,20,111),
    (105,15,180,240),
    (111,20,260,240),
    (103,20,260,11),
    (91,20,260,11),
    (138,20,260,11),
    (108,15,290,310),
    (119,30,390,250),
    (127,10,410,11);
    
-- Carregar a tabela ITEM_PEDIDO
INSERT INTO `item_pedido` VALUES
        (91,30,17),
        (97,77,20),
        (101,13,5),
        (104,53,32),
		(111,87,17),
        (121,25,10),
        (137,45,8),
        (138,22,10),
        (189,78,45),
        (203,31,6);
    
