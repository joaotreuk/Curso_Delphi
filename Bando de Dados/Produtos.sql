CREATE TABLE Produtos(
	ID int IDENTITY PRIMARY KEY,
	Nome varchar(60),
	Descricao varchar(255),
	Valor decimal(18, 5) DEFAULT 0.00000,
	Quantidade decimal(18, 5) DEFAULT 0.00000,
	IDCategoria int REFERENCES Categorias(ID)
)