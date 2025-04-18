
--Questão 01. Crie uma tabela pessoa com os campos ID, nome, sobrenome e idade.
-- Crie uma cláusula de checagem para o campo idade, impedindo que valores menores que 0 sejam adicionados.


CREATE TABLE Pessoa (
ID int primary key,
NOME VARCHAR(15),
SOBRENOME VARCHAR (50), 
AGE int check(age > 0) -- definindo que a idade deve ser maior que 0 para ser registrada
);

--consultando a tabela Pessoa
select top 10 * from Pessoa;


--Questão 02. Altere a tabela pessoa e crie
--uma restrição utilizando a especificação unique ( A1, A2, …, Am) para os campos ID, nome e sobrenome.

ALTER TABLE Pessoa
ADD CONSTRAINT INS_UNI UNIQUE(ID, NOME, SOBRENOME);

--Altere a coluna idade da tabela pessoa e garanta que ela não receba valores nulos.
ALTER TABLE Pessoa 
ALter column AGE int not null


--. Crie uma tabela endereco com os campos ID e rua.
--- Adicione o campo endereco na tabela pessoa e 
--crie uma integridade referencial a partir deste campo com a tabela endereco.

-- Essa e a tabela pai 
-- criando a column endereco na tabela pessoa, nesse caso e o nome da rua
ALTER TABLE Pessoa
ADD ID_ENDERECO VARCHAR(50)

-- consultando
SELECT TOP 10 * FROM PESSOA

-- Criando a tabela endereço com id e rua
CREATE TABLE ENDERECO(
    ID_endereco VARCHAR(50) PRIMARY KEY,  -- Id é a chave primária nessa tabela
    Rua VARCHAR(50) NOT NULL,
    CONSTRAINT fk_endereco_pessoa 
        FOREIGN KEY (ID_endereco) -- id _endereco da tabela endereco
        REFERENCES Pessoa(ID_endereco) -- Se conecta com a chave estrangeira id endereco da tabela pessoa
        ON DELETE CASCADE  
        ON UPDATE CASCADE
);

--  ON DELETE CASCADE, isso significa que, se um registro id_endereco na tabela referenciada (Pessoa)
--- for excluído, todos os registros (id_endereco) na tabela Endereco que fazem referência 
--ao registro excluído também serão excluídos automaticamente.

-- ON UPDATE CASCADE, isso significa que, se o valor de id_endereco na tabela referenciada (Pessoa)
--for atualizado, todos os registros da tabela que contém o id_endereco na tabela endereco
--serão atualizados automaticamente para refletir essa mudança.

--consultando a tabela endereco
SELECT TOP 10 * FROM ENDERECO

-- verificando tipos de dados das duas colunas
SP_COLUMNS Pessoa;
SP_COLUMNS Pessoa;