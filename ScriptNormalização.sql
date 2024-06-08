
CREATE TABLE Veiculo (
    Placa VARCHAR(10) PRIMARY KEY,
    Veiculo VARCHAR(50),
    Cor VARCHAR(20),
    Diaria DECIMAL(10, 2)
);
CREATE TABLE Cliente (
    CPF VARCHAR(14) PRIMARY KEY,
    Cliente VARCHAR(100),
    Nascimento DATE
);

CREATE TABLE Locacao (
    Cod_Locacao INT PRIMARY KEY,
    Placa VARCHAR(10),
    CPF VARCHAR(14),
    Dias INT,
    Total DECIMAL(10, 2),
    FOREIGN KEY (Placa) REFERENCES Veiculo(Placa),
    FOREIGN KEY (CPF) REFERENCES Cliente(CPF)
);

