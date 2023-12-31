/*
PROJETO 
GESTÃO DE VENDAS DE LOJA DE INSTRUMENTOS 
CONSTRAINTS  
*/

USE LOJA_MUSICAL
GO

--PKs

ALTER TABLE PRODUTOS ADD CONSTRAINT PK_ID_PRODUTOS 
PRIMARY KEY(ID_PRODUTO)
GO
ALTER TABLE MARCAS ADD CONSTRAINT PK_MARCA
PRIMARY KEY(ID_MARCA)
GO
ALTER TABLE CATEGORIAS ADD CONSTRAINT PK_CATEGORIA
PRIMARY KEY(ID_CATEGORIA)
GO
ALTER TABLE PEDIDO_VENDA ADD CONSTRAINT PK_COMP_COD_VENDA_COD_SEQ
PRIMARY KEY(COD_VENDA, COD_SEQ)
GO
ALTER TABLE VENDAS ADD CONSTRAINT PK_COD_VENDA 
PRIMARY KEY(COD_VENDA)
GO
ALTER TABLE VENDEDORES ADD CONSTRAINT PK_ID_VENDEDOR
PRIMARY KEY(ID_VENDEDOR)
GO
ALTER TABLE CLIENTES ADD CONSTRAINT PK_ID_CLIENTE 
PRIMARY KEY(ID_CLIENTE)
GO
--FKs

ALTER TABLE PRODUTOS ADD CONSTRAINT FK_MARCA_PRODUTO 
FOREIGN KEY(ID_MARCA) REFERENCES MARCAS(ID_MARCA)
GO
ALTER TABLE PRODUTOS ADD CONSTRAINT FK_CATEGORIA_PRODUTO
FOREIGN KEY(ID_CATEGORIA) REFERENCES CATEGORIAS(ID_CATEGORIA)
GO
ALTER TABLE PEDIDO_VENDA ADD CONSTRAINT FK_VENDEDORES_PEDIDO_VENDA 
FOREIGN KEY(ID_VENDEDOR) REFERENCES VENDEDORES(ID_VENDEDOR)
GO
ALTER TABLE PEDIDO_VENDA ADD CONSTRAINT FK_CLIENTES_PEDIDO_VENDA
FOREIGN KEY(ID_CLIENTE) REFERENCES CLIENTES(ID_CLIENTE)
GO
ALTER TABLE VENDAS ADD CONSTRAINT FK_CLIENTES_VENDA 
FOREIGN KEY(ID_CLIENTE) REFERENCES CLIENTES(ID_CLIENTE)
GO
ALTER TABLE VENDAS ADD CONSTRAINT FK_VENDEDORES_VENDA 
FOREIGN KEY(ID_VENDEDOR) REFERENCES VENDEDORES(ID_VENDEDOR)
GO

--CHECK

ALTER TABLE PRODUTOS ADD CONSTRAINT CHK_VALOR 
CHECK(VALOR > 0)
GO
ALTER TABLE PEDIDO_VENDA ADD CONSTRAINT CHK_STATUS_PEDIDO
CHECK(STATUS_PEDIDO IN ('CANCELADO','PENDENTE','APROVADO'))
GO
ALTER TABLE CLIENTES ADD CONSTRAINT CHK_CPF 
CHECK(LEN(CPF) = 11)
GO
ALTER TABLE CLIENTES ADD CONSTRAINT CHK_FONE
CHECK(LEN(FONE) = 11)
GO
ALTER TABLE VENDEDORES ADD CONSTRAINT CHK_SALARIO 
CHECK(SALARIO >= 1300)

--DEFAULT

ALTER TABLE PEDIDO_VENDA ADD CONSTRAINT DF_DATA_PEDIDO
DEFAULT(GETDATE()) FOR DATA_PEDIDO

ALTER TABLE VENDAS ADD CONSTRAINT DF_DATA_VENDA 
DEFAULT(GETDATE()) FOR DATA_VENDA



