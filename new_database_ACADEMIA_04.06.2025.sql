-- A tabela tb_usuario funciona como uma entidade base (ou superclasse) que armazena informações comuns a todos os indivíduos que interagem com o sistema da academia, como nome, e-mail, senha e tipo de usuário.
-- Um usuário não pode ser simultaneamente um aluno com detalhes de aluno e um instrutor com detalhes de instrutor através dessas tabelas de especialização (a menos que você crie registros separados para cada papel, o que geralmente não é o caso para a mesma pessoa física).
CREATE TABLE tb_usuario (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(32) NOT NULL
);


--Da mesma forma, um registro em tb_instrutor obrigatoriamente corresponde a um único registro em tb_usuario (que tem tipo_usuario = 'instrutor'). Todo instrutor é um usuário, mas com atributos adicionais específicos de instrutor.
CREATE TABLE tb_instrutor (
    id_usuario INT PRIMARY KEY,
    numero_cref VARCHAR(20) UNIQUE,
    data_contratacao DATE,
    CONSTRAINT fk_instrutor_usuario FOREIGN KEY (id_usuario) REFERENCES tb_usuario(id) ON DELETE CASCADE
);

-- Um registro em tb_aluno obrigatoriamente corresponde a um único registro em tb_usuario (que tem tipo_usuario = 'aluno'). Ou seja, todo aluno é um usuário, mas com atributos adicionais específicos de aluno.
CREATE TABLE tb_aluno (
    id_usuario INT PRIMARY KEY,
    telefone VARCHAR(20),
    endereco VARCHAR(255),
    cpf VARCHAR(14) UNIQUE,
    CONSTRAINT fk_aluno_usuario FOREIGN KEY (id_usuario) REFERENCES tb_usuario(id) ON DELETE CASCADE
);


-- Registros para saber a divisão de treino de um aluno, com isso facilita na aquisição de novos aparelhos e para a manutenção de equipamentos danificados da academia.
CREATE TABLE grupos_musculares (
    id_grupo SERIAL PRIMARY KEY,
    nome_grupo VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE equipamentos (
    id_equipamento SERIAL PRIMARY KEY,
    nome_equipamento VARCHAR(100) NOT NULL,
    descricao_exercicio TEXT,
    id_grupo_fk INTEGER,
    CONSTRAINT fk_grupo
        FOREIGN KEY(id_grupo_fk)
        REFERENCES grupos_musculares(id_grupo)
);
   
