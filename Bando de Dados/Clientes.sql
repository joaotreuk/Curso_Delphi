CREATE TABLE Clientes (
	ID int IDENTITY PRIMARY KEY,
	Nome varchar(60) NOT NULL,
	Endereco varchar(60),
	Cidade varchar(50),
	Bairro varchar(40),
	Estado char(2),
	CEP varchar(10),
	Telefone varchar(14),
	Email varchar(100),
	DataNascimento date
)