# RELATÓRIO TÉCNICO 
• Integrantes: 
Cauê Dessotti Silva /
Fernando Mogno Volpini 

# Sistema Integrado para Gestão de Academias:
Este projeto de software para gestão de academias, criado por Cauê Dessotti Silva e Fernando Mogno Volpini com orientação de Rodrigo de Oliveira Plotze, otimiza a administração e a comunicação. A plataforma centraliza dados e aprimora o acompanhamento de treinos, visando a eficiência operacional e melhores resultados para alunos e instrutores.

# Objetivos Específicos:
Para alcançar o objetivo geral, o projeto se concentrará no desenvolvimento das seguintes funcionalidades detalhadas:
•	Gerenciamento Centralizado de Usuários: Implementar um módulo de cadastro que permita o registro completo de todas as pessoas vinculadas à academia. O sistema fará a distinção clara entre dois perfis de acesso fundamentais:
o	Aluno: Identificado unicamente pelo seu Cadastro de Pessoa Física (CPF), este perfil terá acesso às suas informações pessoais e, principalmente, aos seus planos de treino.
o	Instrutor: Identificado pelo seu registro no Conselho Regional de Educação Física (CREF), este perfil terá permissões para cadastrar, consultar e gerenciar os planos de treino dos alunos sob sua supervisão.
•	Estruturação de Planos de Treino: Desenvolver uma funcionalidade robusta para a criação e visualização de rotinas de treinamento. O sistema permitirá que os instrutores montem os treinos de forma estruturada, detalhando os exercícios e a divisão específica dos grupos musculares (ex: Treino A - Peito e Tríceps, Treino B - Costas e Bíceps, etc.).
•	Acesso Facilitado à Informação: Prover uma interface intuitiva onde os alunos possam consultar de maneira rápida e clara qual o treino programado para o dia, os exercícios que o compõem e os respectivos grupos musculares trabalhados. Isso visa aumentar a autonomia do aluno e garantir a correta execução do plano de treino estipulado pelo instrutor.
•	Segurança e Diferenciação de Acesso: Garantir que cada tipo de usuário tenha acesso apenas às funcionalidades e informações pertinentes ao seu perfil, utilizando o CPF e o CREF como chaves de diferenciação e segurança para o login e as permissões dentro do software.

# Público-Alvo:
O software foi concebido para atender às necessidades de diferentes grupos dentro do ecossistema de uma academia, sendo eles:
Academias de Pequeno e Médio Porte: Estabelecimentos que buscam uma solução digital para modernizar sua gestão, abandonar controles manuais (como planilhas ou fichas de papel) e oferecer um serviço mais profissional e organizado aos seus clientes. A plataforma oferece um controle mais eficiente sobre quem são seus alunos e instrutores ativos.
Instrutores de Educação Física: Profissionais que atuam na academia e necessitam de uma ferramenta prática para otimizar seu tempo na criação, gestão e acompanhamento dos programas de treino de múltiplos alunos. O sistema facilita a organização do trabalho e a comunicação das rotinas de exercício.
Alunos de Academia: Praticantes de musculação e outras modalidades que desejam ter clareza e acesso facilitado ao seu plano de treino diário. O software atende à necessidade de saber exatamente o que treinar a cada dia, promovendo maior engajamento, independência e aderência ao programa de treinamento.

# Tecnologias Utilizadas no Projeto:
Este projeto foi desenvolvido utilizando um conjunto de tecnologias robustas e amplamente conhecidas no mercado de desenvolvimento de software, focadas na linguagem Java para a construção de uma aplicação de desktop com acesso a um banco de dados relacional.

# Linguagem e Ambiente de Desenvolvimento
Java com NetBeans IDE
O Java foi a linguagem de programação central do projeto, escolhida por sua portabilidade e forte ecossistema. Todo o código foi desenvolvido seguindo o paradigma de Programação Orientada a Objetos (POO), utilizando classes (Java Class) para modelar as entidades e a lógica de negócio do sistema. O ambiente de desenvolvimento integrado (IDE) utilizado foi o Apache NetBeans, uma ferramenta poderosa que oferece recursos como editor de código inteligente, depurador e ferramentas de design de interface.

# Interface Gráfica (GUI) 
Java Swing (JFrame)
Para a criação das telas e da interação com o usuário, foi utilizado o Java Swing, por meio dos componentes JFrame. Essa tecnologia permite construir interfaces gráficas de usuário (GUI) de forma visual e intuitiva diretamente no NetBeans, facilitando o design de janelas, botões, campos de texto e outros elementos visuais.

# Banco de Dados e Persistência
PostgreSQL e pgAdmin
O PostgreSQL foi o sistema de gerenciamento de banco de dados (SGBD) escolhido, conhecido por sua confiabilidade e recursos avançados. Para administrar o banco, criar tabelas e executar consultas, foi utilizada a ferramenta pgAdmin, que é a plataforma de gerenciamento padrão para o PostgreSQL.

# Linguagem SQL e Scripts
A linguagem SQL (Structured Query Language) foi empregada para todas as operações de manipulação de dados, como inserção, consulta, atualização e exclusão. Os scripts para a criação das tabelas e a definição da estrutura inicial do banco de dados foram executados diretamente do NetBeans, otimizando o fluxo de trabalho.

# Arquitetura de Acesso a Dados
Padrão DAO (Data Access Object)
A arquitetura de acesso aos dados foi implementada utilizando o padrão de projeto DAO. Esse padrão organiza e isola a lógica de persistência do restante da aplicação, criando uma camada responsável exclusivamente pela comunicação com o banco de dados. Isso torna o código mais limpo, organizado e fácil de manter.

# Conexão via JDBC (Java Database Connectivity)
A comunicação entre a aplicação Java e o banco de dados PostgreSQL foi estabelecida por meio do JDBC. Essa API padrão do Java permite que a aplicação execute comandos SQL no banco de dados, possibilitando a gravação e a leitura das informações de forma segura e eficiente através de um driver de conexão específico.
