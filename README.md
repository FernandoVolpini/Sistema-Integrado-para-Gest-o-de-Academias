# Sistema Integrado para Gestão de Academias
Este projeto de software para gestão de academias, criado por Cauê Dessotti Silva e Fernando Mogno Volpini com orientação de Rodrigo de Oliveira Plotze, otimiza a administração e a comunicação. A plataforma centraliza dados e aprimora o acompanhamento de treinos, visando a eficiência operacional e melhores resultados para alunos e instrutores.

# Tecnologias Utilizadas no Projeto
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
