-- A tabela tb_usuario funciona como uma entidade base (ou superclasse) que armazena informações comuns a todos os indivíduos que interagem com o sistema da academia, como nome, e-mail, senha e tipo de usuário.
-- Um usuário não pode ser simultaneamente um aluno com detalhes de aluno e um instrutor com detalhes de instrutor através dessas tabelas de especialização (a menos que você crie registros separados para cada papel, o que geralmente não é o caso para a mesma pessoa física).
-- Tabela central que armazena dados de autenticação e informações comuns a todos os usuários do sistema.
CREATE TABLE tb_usuario (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha_hash VARCHAR(255) NOT NULL, -- Hash da senha (ex: bcrypt)
    tipo_usuario VARCHAR(20) NOT NULL,
    data_criacao TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_tipo_usuario CHECK (tipo_usuario IN ('Aluno', 'Instrutor'))
);
COMMENT ON TABLE tb_usuario IS 'Tabela central que armazena dados de autenticação e informações comuns a todos os usuários do sistema.';
COMMENT ON COLUMN tb_usuario.senha_hash IS 'Hash da senha do usuário, gerado por um algoritmo seguro como bcrypt.';


-- Um registro em tb_aluno obrigatoriamente corresponde a um único registro em tb_usuario (que tem tipo_usuario = 'aluno'). Ou seja, todo aluno é um usuário, mas com atributos adicionais específicos de aluno.
CREATE TABLE tb_aluno (
    -- A chave primária (PK) é também uma chave estrangeira (FK) para tb_usuario,
    -- garantindo uma relação de 1 para 1. Todo aluno é um usuário.
    id_usuario INT PRIMARY KEY,
    cpf VARCHAR(14) UNIQUE NOT NULL, -- CPF é um documento essencial para o aluno.
    telefone VARCHAR(20),
    endereco VARCHAR(255),

    CONSTRAINT fk_aluno_usuario FOREIGN KEY (id_usuario) REFERENCES tb_usuario(id) ON DELETE CASCADE
);

COMMENT ON TABLE tb_aluno IS 'Tabela de especialização com informações específicas de alunos.';
COMMENT ON COLUMN tb_aluno.id_usuario IS 'Referencia o ID da tabela tb_usuario, criando uma relação de herança.';


--Da mesma forma, um registro em tb_instrutor obrigatoriamente corresponde a um único registro em tb_usuario (que tem tipo_usuario = 'instrutor'). Todo instrutor é um usuário, mas com atributos adicionais específicos de instrutor.
CREATE TABLE tb_instrutor (
    id_usuario INT PRIMARY KEY,
    cref VARCHAR(20) UNIQUE NOT NULL, -- Código de registro profissional
    data_contratacao DATE NOT NULL DEFAULT CURRENT_DATE,

    CONSTRAINT fk_instrutor_usuario 
        FOREIGN KEY (id_usuario) 
        REFERENCES tb_usuario(id) 
        ON DELETE CASCADE
);

COMMENT ON TABLE tb_instrutor IS 'Tabela de especialização com informações específicas de instrutores.';
COMMENT ON COLUMN tb_instrutor.cref IS 'Código de registro profissional do instrutor (CREF).';
COMMENT ON COLUMN tb_instrutor.data_contratacao IS 'Data em que o instrutor foi contratado.';



-- Registros para saber a divisão de treino de um aluno, com isso facilita na aquisição de novos aparelhos e para a manutenção de equipamentos danificados da academia.
-- Estrutura para organizar os exercícios e equipamentos da academia.
CREATE TABLE tb_grupo_muscular ( -- Nome da tabela mais descritivo.
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL UNIQUE
);

COMMENT ON TABLE tb_grupo_muscular IS 'Tabela de lookup para os principais grupos musculares (ex: Peito, Costas, Perna).';

-- Registros para saber a divisão de treino de um aluno, com isso facilita na aquisição de novos aparelhos e para a manutenção de equipamentos danificados da academia.
CREATE TABLE tb_equipamento (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao_uso TEXT, -- Descrição de como utilizar o equipamento ou executar o exercício.
    id_grupo_muscular INT,
    -- Se um grupo muscular for deletado, o equipamento não precisa ser.
    -- Ele pode ser reassociado a outro grupo ou ficar sem grupo temporariamente.
    CONSTRAINT fk_equipamento_grupo
        FOREIGN KEY(id_grupo_muscular)
        REFERENCES tb_grupo_muscular(id)
        ON DELETE SET NULL
);

COMMENT ON TABLE tb_equipamento IS 'Catálogo de todos os equipamentos e exercícios disponíveis na academia.';


-- Tabelas adicionadas para atender à sua necessidade de gerenciar a "divisão de treino de um aluno".
CREATE TABLE tb_plano_treino (
    id SERIAL PRIMARY KEY,
    id_aluno INT NOT NULL,
    id_instrutor INT, -- O instrutor que montou o treino (pode ser nulo).
    nome_plano VARCHAR(100) NOT NULL, -- Ex: 'Treino A', 'Adaptação', 'Hipertrofia - Peito/Tríceps'.
    data_inicio DATE NOT NULL,
    data_fim DATE,
    ativo BOOLEAN DEFAULT TRUE,

    CONSTRAINT fk_plano_aluno FOREIGN KEY (id_aluno) REFERENCES tb_aluno(id_usuario) ON DELETE CASCADE,
    CONSTRAINT fk_plano_instrutor FOREIGN KEY (id_instrutor) REFERENCES tb_instrutor(id_usuario) ON DELETE SET NULL
);

COMMENT ON TABLE tb_plano_treino IS 'Define um plano de treino específico para um aluno, criado por um instrutor.';


-- Tabela de junção para detalhar os exercícios de cada plano.
CREATE TABLE tb_plano_exercicio (
    id SERIAL PRIMARY KEY,
    id_plano_treino INT NOT NULL,
    id_equipamento INT NOT NULL, -- Referencia o exercício/equipamento da tb_equipamento.
    ordem INT, -- Ordem de execução do exercício no treino.
    series VARCHAR(10), -- Ex: '3', '4'.
    repeticoes VARCHAR(10), -- Ex: '10-12', '15'.
    tempo_descanso_seg INT, -- Tempo de descanso em segundos entre as séries.
    observacoes TEXT, -- Observações específicas do instrutor para este exercício.

    CONSTRAINT fk_plano_exercicio_plano FOREIGN KEY (id_plano_treino) REFERENCES tb_plano_treino(id) ON DELETE CASCADE,
    CONSTRAINT fk_plano_exercicio_equipamento FOREIGN KEY (id_equipamento) REFERENCES tb_equipamento(id) ON DELETE CASCADE
);


COMMENT ON TABLE tb_plano_exercicio IS 'Detalha cada exercício que compõe um plano de treino, incluindo séries, repetições, etc.';


COMMENT ON TABLE tb_usuario IS 'Armazena dados de login e informações básicas de todos os usuários do sistema. A senha é armazenada como um hash bcrypt.';
