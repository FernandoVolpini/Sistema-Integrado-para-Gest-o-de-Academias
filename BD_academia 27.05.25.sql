-- A tabela tb_usuario funciona como uma entidade base (ou superclasse) que armazena informações comuns a todos os indivíduos que interagem com o sistema da academia, como nome, e-mail, senha e tipo de usuário.
-- Um usuário não pode ser simultaneamente um aluno com detalhes de aluno e um instrutor com detalhes de instrutor através dessas tabelas de especialização (a menos que você crie registros separados para cada papel, o que geralmente não é o caso para a mesma pessoa física).
CREATE TABLE tb_usuario (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(32) NOT NULL, 
    tipo_usuario VARCHAR(20) NOT NULL CHECK (tipo_usuario IN ('administrador', 'instrutor', 'aluno')),
    data_cadastro TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    ativo BOOLEAN DEFAULT TRUE
);

--Da mesma forma, um registro em tb_instrutor obrigatoriamente corresponde a um único registro em tb_usuario (que tem tipo_usuario = 'instrutor'). Todo instrutor é um usuário, mas com atributos adicionais específicos de instrutor.
CREATE TABLE tb_instrutor (
    id_usuario INT PRIMARY KEY,
    numero_cref VARCHAR(20) UNIQUE,
    data_contratacao DATE,
    horario_trabalho_descricao TEXT,
    CONSTRAINT fk_instrutor_usuario FOREIGN KEY (id_usuario) REFERENCES tb_usuario(id) ON DELETE CASCADE
);


-- Um registro em tb_aluno obrigatoriamente corresponde a um único registro em tb_usuario (que tem tipo_usuario = 'aluno'). Ou seja, todo aluno é um usuário, mas com atributos adicionais específicos de aluno.
CREATE TABLE tb_aluno (
    id_usuario INT PRIMARY KEY,
    data_nascimento DATE,
    telefone VARCHAR(20),
    endereco VARCHAR(255),
    cpf VARCHAR(14) UNIQUE,  -- Formato do CPF ficará assim (ex: XXX.XXX.XXX-XX) 
    observacoes_medicas TEXT,
    data_matricula_inicial DATE DEFAULT CURRENT_DATE,
    status_geral_aluno VARCHAR(30) DEFAULT 'ativo' CHECK (status_geral_aluno IN ('ativo', 'inativo', 'pendente_documentacao', 'bloqueado', 'trancado')),
    CONSTRAINT fk_aluno_usuario FOREIGN KEY (id_usuario) REFERENCES tb_usuario(id) ON DELETE CASCADE
);

-- A tb_matricula é o coração da gestão de relacionamento entre os alunos, colaboradores e os serviços pagos da academia, registrando cada "contrato" ou período de adesão a um plano.CREATE TABLE tb_matricula (
    id SERIAL PRIMARY KEY,
    id_aluno INT NOT NULL,
    id_plano INT NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    status VARCHAR(30) NOT NULL CHECK (status IN ('ativa', 'vencida', 'cancelada', 'pendente_pagamento', 'trancada')),
    dia_vencimento_preferencial INT CHECK (dia_vencimento_preferencial BETWEEN 1 AND 31),
    data_cadastro TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_matricula_aluno FOREIGN KEY (id_aluno) REFERENCES tb_usuario(id) ON DELETE RESTRICT,
);


-- Registros para saber a divisão de treino de um aluno, com isso facilita na aquisição de novos aparelhos e para a manutenção de equipamentos danificados da academia.
CREATE TABLE tb_exercicio (
   id SERIAL PRIMARY KEY,
   nome_exercicio VARCHAR(100) NOT NULL UNIQUE,
   grupo_muscular VARCHAR(100) NOT NULL,
);


-- Essa tabela gera um controle de fluxo de alunos e colaboradores da academia
CREATE TABLE tb_grade_horario (
	id SERIAL PRIMARY KEY,
	dia_semana INT NOT NULL CHECK (dia_semana BETWEEN 0 AND 6), -- 0 para Domingo, 1 para Segunda, ..., 6 para Sábado
	horario_inicio TIME NOT NULL,
	horario_fim TIME NOT NULL,
	CONSTRAINT chk_horario CHECK (horario_fim > horario_inicio) -- Garante que o horário de fim é após o de início
);

