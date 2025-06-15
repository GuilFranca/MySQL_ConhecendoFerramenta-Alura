USE insight_places;

CREATE TABLE proprietarios(
	proprietario_id VARCHAR (255) PRIMARY KEY,
    nome VARCHAR (255),
    cpf_cnpj VARCHAR (20),
    contato VARCHAR (255)
);

-- SELECT * FROM proprietarios;

-- DROP TABLE crientes;

CREATE TABLE clientes (
	cliente_id VARCHAR (255) PRIMARY KEY,
    nome VARCHAR (255),
    cpf VARCHAR (255),
    contato VARCHAR (255)
);

CREATE TABLE enderecos (
	endereco_id VARCHAR (255) PRIMARY KEY,
    rua VARCHAR (255),
    numero INT,
    bairro VARCHAR (255),
    cidade VARCHAR (255),
    estado VARCHAR (2),
    cep VARCHAR (10)
);

CREATE TABLE hospedagens (
	hospedagem_id VARCHAR (255) PRIMARY KEY,
    tipo VARCHAR (255),
    endereco_id VARCHAR (255),
    proprietario_id VARCHAR (255),
    ativo BOOL,
    
    FOREIGN KEY (endereco_id) REFERENCES enderecos (endereco_id),
    FOREIGN KEY (proprietario_id) REFERENCES proprietarios (proprietario_id)
    );
    
    -- DROP TABLE alugueis;
    
    CREATE TABLE alugueis (
		aluguel_id VARCHAR (255) PRIMARY KEY,
        cliente_id VARCHAR (255),
        hospedagem_id VARCHAR (255),
        data_inicio DATE,
        data_fim DATE,
        preco_total DECIMAL(10, 2),
        
        FOREIGN KEY (cliente_id) REFERENCES clientes (cliente_id),
        FOREIGN KEY (hospedagem_id) REFERENCES hospedagens (hospedagem_id)
    );
    
    CREATE TABLE avaliacoes (
		avaliacao_id VARCHAR (255) PRIMARY KEY,
        cliente_id VARCHAR (255),
        hospedagem_id VARCHAR (255),
        nota INT,
        comentario TEXT,
        
        FOREIGN KEY (cliente_id) REFERENCES clientes (cliente_id),
        FOREIGN KEY (hospedagem_id) REFERENCES hospedagens (hospedagem_id)
    );