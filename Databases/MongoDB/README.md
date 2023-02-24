<img  width=800 height=150 src="../../Images/Mongo/Logo.png" ></img>

# **Oque e ?**

- É um banco de dados opensource, de alta performance e flexível, sendo considerado o principal banco de dados NoSQL. Os banco de dados NoSQL apresentam algumas vantagens sobre os outros tipos, principalmente quando precisamos de escalabilidade, flexibilidade, bom desempenho e facilidade para consultas.

- O MongoDB é orientado a documentos, ou seja, os dados são armazenados como documentos, ao contrário de bancos de dados de modelo relacional, onde trabalhamos com registros em linhas e colunas. Os documentos podem ser descritos como dados no formato de chave-valor, no caso, utilizando o formato JSON (JavaScript Object Notation).

[Video sobre mongo](https://www.youtube.com/watch?v=4dTI1mVLX3I)

[Documentation](https://www.mongodb.com/docs/)

# **Para que serve ?**

O MongoDB é um banco de dados orientado a documentos que possui código aberto (open source) e foi projetado para armazenar uma grande escala de dados, além de permitir que se trabalhe de forma eficiente com grandes volumes.

[Vantagens e desvantagens](https://www.treinaweb.com.br/blog/o-que-e-mongodb)

# **Como funciona ?**

- Por ser um banco orientado a documentos, um servidor MongoDB guarda todos os dados de uma dada entidade em um arquivo, formatado em uma sintaxe JSON-like. Autossuficiente, ele contém toda a informação de que possa precisar, evitando assim a necessidade de JOINs complicados na hora de fazer queries.

- Ainda que essa autossuficiência possa representar uma eficiência maior ao realizar queries, isso acaba demandando mais espaço em disco para guardar os dados. Contudo, tendo em vista que armazenamento é mais barato que poder computacional, projetos que utilizam bancos orientados a documentos têm um custo operacional menor. E, mesmo assim, o MongoDB oferece o processo de sharding, que possibilita o armazenamento dos dados ao longo de várias máquinas, garantindo uma alta escalabilidade horizontal.

# **Qual e a Arquitetura ?**

Basicamente temos a aplicação no servidor interagindo diretamente com os clientes, e quando a aplicação precisa de alguma informação ou precisa guardar alguma informação ela se comunica com o mongoDB que fica em um estado de listening para requests em andamento e ela responde apropriadamente quando esses requests estão completos.

![Arquitetura](../../Images/Mongo/Arquitetura%20bi.png)

[Alternativas de uso](https://imasters.com.br/mongodb/mongodb-e-business-inteligence)

# **Como instalar ?**

- Instalar as dependências
- Configurar o MongoDB como um contêiner no Docker
- Configure a plataforma Docker com docker-compose
- Crie um arquivo docker-compose para criar o contêiner MongoDB

[Seguir as instruções do Artigo](https://www.bmc.com/blogs/mongodb-docker-container/)

[Conexao Tableau](https://www.mongodb.com/docs/bi-connector/master/connect/tableau/)

[Video alternativo](https://www.youtube.com/watch?v=DbKPeaVHwdE&t=325s)

# **Como funciona dentro do container ?**

![infraestrutura](../../Images/Mongo/Docker_infra.png)

[Container mongo](https://hub.docker.com/_/mongo)

[Github documentation do docker hub](https://github.com/docker-library/mongo)

[Test app](https://earthly.dev/blog/mongodb-docker/)

[Documentasao](https://www.mongodb.com/compatibility/docker)

# **Quais sao suas dependencias ?**

Para o Ubuntu precisa ter algumas libs instaladas :

    sudo apt instalar gnupg

    echo "deb http://security.ubuntu.com/ubuntu impish-security main" | sudo tee /etc/apt/sources.list.d/impish-security.list
    sudo apt update
    sudo apt install libssl1.1

[Artigo completo de Instalaçao](https://www.bmc.com/blogs/mongodb-docker-container/)

# **Componentes ?**

Fazendo um parelelo com oque agente conhece seria assim o resultado:

![COmponentes](../../Images/Mongo/Componentes.png)

## **Collections**

As collections tem um conceito similar ao de tables no Mysql, a collection representa um conjunto de informações armazenadas em comum, essas informações são bem mais "completas", uma vez que os bancos de dados não relacionais possuem uma junção de informações muito maior que os relacionais.

## **Documents**

Cada elemento dentro da collection é considerado um document, e a soma de TODOS os documents dentro da mesma estrutura de dados formam a collection, segue um exemplo de um document, usando o mesmo exemplo de criação de um blog.

## **Campos ou fields**

Também conhecidos como chaves, é a representação nomeada no qual atribuímos algum valor a elas. Similar ao conceito de column no Mysql.

## **Embedded documents**

Similar aos Joins do Mysql, são documentos que para serem "acessados" geralmente usamos as funções de pipeline do aggregate (será explicado no decorrer da série) para se obter algum tipo de retorno.

# **Como usar ?**

[Slide](../../src/Docs/Slide%20sobre%20mongo.pdf)

# **Uso do Python ?**

Como e um arquivo json que agente manipula ele no python seria a mesma logica do dicionario para manipular os dados.

[PyMongo lib](https://www.w3schools.com/python/python_mongodb_getstarted.asp)

[Documentaçao](https://www.mongodb.com/languages/python)

# **Como se encaixa em todo o processo ?**

[Conectar mongo a kafka](https://www.youtube.com/watch?v=ZC0sjS4bVpo)

> **Onde vai para cada fluxo de dados da ferramenta ?**

De acordo com o diagrama tem apenas 2 destinos

kafka >> mongo >> spark

> **De qual processo ela faz parte ?**

Da parte de armazenamento dos dados tratados de um data store

> **Como dar deploy da aplicação ?**

Depende de onde esta vindo e para onde vai os dados isso fica a critetio do desenvolvedor

[kafka](../../tools/Kafka/README.md)

[Saprk](../../tools/Spark/README.md)

[Airflow](../../tools/Airflow/README.md)
