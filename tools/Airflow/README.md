<img  width=600 height=200 src="../../Images/Airflow/Logo.png" ></img>

# **O que é?**

O Apache Airflow é uma plataforma de gerenciamento de fluxo de trabalho de código aberto para pipelines de engenharia de dados. Começou no Airbnb em outubro de 2014, como uma solução para gerenciar os fluxos de trabalho cada vez mais complexos da empresa.

[Documentação](https://airflow.apache.org/docs/apache-airflow/stable/)

# **Para que serve ?**

O Airflow permite a execução de diferentes tipos de tarefas através de operadores de diferentes naturezas, como o PythonOperator, para execução de scripts Python, o DockerOperator, para trabalho com contêineres do Docker ou até mesmo o BashOperator, para a execução de comandos bash.

![Diagrama](../../Images/Airflow/Diagrama%20Airflow.jpg)

# **Como funciona ?**

O objetivo do AIRFLOW é a orquestração de pipelines de tarefas agendadas por meio de scripts `Python` em conjunto com bibliotecas com instruções de sequenciamento definidas, chamados DAGs.

# **Qual é a Arquitetura ?**

![Arquitetura](../../Images/Airflow/Arquitetura.png)

# **Como instalar ?**

Como todas a aplicações do sistema, serão instalados em um contêiner Docker. Na documentação da imagem no DockerHUB é possível encontrar informações sobre esse procedimento.

[Repositório de referencia](https://github.com/NarayanaBehera/Apache-Airflow-With-Docker-)

[Video](https://www.youtube.com/watch?v=qCi7kYg8P9U&list=PL5Gz0w1wYE8mSSxoBN--A6RekoyCw74h0&index=3)

[Docker hub](https://hub.docker.com/r/bitnami/airflow)

[Airflow](https://github.com/danilosousadba/airflow)

# **Como é o funcionamento dentro do contêiner?**

O Airflow terá a funcionalidade de gerenciar todos os componentes possibilitando a consulta de informações de forma mais específica e direcionada para o que é necessário, dessa maneira é possível tem uma visão de todo o fluxo.

# **Quais são as suas dependencias ?**

O Airflow não possui dependências para o seu funcionamento, apenas é necessário que mantenha seus arquivos organizados e de fácil acesso, sendo o resto da configuração/instalação realizado pelo `docker-compose` da aplicação e pelo `dockerfile` na hora do deploy no [K8s](../k8s/README.md)

# **Componentes?**

Para mais detalhes visite esses sites:

- [Ilegra](https://ilegra.com/blog/apache-airflow-maestro-de-pipelines-de-tarefas-agendadas/)

- [Ahayasic](https://ahayasic.github.io/apache-airflow-in-a-nutshell/content/introduction_to_apache_airflow/essential_concepts_and_components/#referencias)

## **DAGs**

`Os DAGs agora serão o novo sistema de jobs por projeto `

Para criar uma DAG no Airflow, você sempre deve importar a classe DAG. Depois da classe DAG, vêm as importações de Operators. Basicamente, para cada Operator que deseja utilizar, deve-se fazer a importação correspondente.

`Aqui ele usa o S3 da amazon mas podemos usar o mesmo conceito`

- [Conexão banco](https://www.youtube.com/watch?v=fLl_7S4_P94&t=375s)

- [Primeiro DAGs](https://estevestoni.medium.com/criando-a-primeira-dag-no-airflow-em-10-minutos-5b135618fe18)

## **Web Server**

Responsável por disponbilizar a interface ao usuário.

[web server airflow](https://airflow.apache.org/docs/apache-airflow/stable/security/webserver.html)

## **Scheduler**

Responsável pelo agendamento dos fluxos de trabalho ou workflows

## **Metadata**

Um banco de dados onde serão armazenados todos os metadados relacionados ao próprio Airflow, mas também relacionados aos nossos dados, pipelines, tasks e assim por diante. Normalmente usamos o banco de dados do Postgres.

## **Executors**

Define como as tarefas serão executadas, seja com kubernetes, Celery ou até mesmo localmente.

## **Worker**

O processo/sub-processo onde as Tasks são executadas.

![Tasks](../../Images/Airflow/Tasks.png)

# **Como usar ?**

O uso do sitema vai ser feito por meio de deploy da sua maquina local para a produçao que vai ser pelo github e k8s para um contêiner docker onde vai ser convertido em dag no airflow.

[Start no docker](https://airflow.apache.org/docs/apache-airflow/stable/start/docker.html)

<details>
<summary> Configuraçoes e variaveis de ambiente docker-compose </summary>

### **Configuração**

Carregar arquivos DAG
Arquivos DAG personalizados podem ser montados em arquivos /opt/bitnami/airflow/dags.

### **Instalando módulos python adicionais**

Este contêiner suporta a instalação de módulos python adicionais no momento da inicialização. Para fazer isso, você pode montar um requirements.txtarquivo com suas necessidades específicas no caminho /bitnami/python/requirements.txt.

### **Variáveis ​​ambientais**

A instância do Airflow pode ser personalizada especificando variáveis ​​de ambiente na primeira execução. Os seguintes valores de ambiente são fornecidos para personalizar o Airflow:

### **Configuração do usuário**

- `AIRFLOW_USERNAME`: Nome de usuário do aplicativo Airflow. Padrão: usuário
- `AIRFLOW_PASSWORD`: Senha do aplicativo Airflow. Padrão: bitnami
- `AIRFLOW_EMAIL`: E-mail do aplicativo Airflow. Padrão: user@example.com

### **Configuração do fluxo de ar**

- `AIRFLOW_EXECUTOR`: Executor de fluxo de ar. Padrão: SequentialExecutor
- `AIRFLOW_FERNET_KEY`: Chave de fluxo de ar Fernet. Sem padrões.
- `AIRFLOW_SECRET_KEY`: Chave secreta do fluxo de ar. Sem padrões.
- `AIRFLOW_WEBSERVER_HOST`: Host do servidor web Airflow. Padrão: 127.0.0.1
- `AIRFLOW_WEBSERVER_PORT_NUMBER`: Porta do servidor web Airflow. Padrão: 8080
- `AIRFLOW_LOAD_EXAMPLES`: Para carregar tarefas de exemplo no aplicativo. Padrão: sim
- `AIRFLOW_BASE_URL`: URL base do servidor da Web do Airflow. Sem padrões.
- `AIRFLOW_HOSTNAME_CALLABLE`: Método para obter o nome do host. Sem padrões.
- `AIRFLOW_POOL_NAME`: Nome do conjunto. Sem padrões.
- `AIRFLOW_POOL_SIZE`: Tamanho da piscina, necessário com AIRFLOW_POOL_NAME. Sem padrões.
- `AIRFLOW_POOL_DESC`: Descrição do pool, necessária com AIRFLOW_POOL_NAME. Sem padrões.

### **Use um banco de dados existente**

- `AIRFLOW_DATABASE_HOST`: Nome do host do servidor PostgreSQL. Padrão: postgresql
- `AIRFLOW_DATABASE_PORT_NUMBER`: Porta utilizada pelo servidor PostgreSQL. Padrão: 5432
- `AIRFLOW_DATABASE_NAME`: nome do banco de dados que o Airflow usará para se conectar ao banco de dados. Padrão: bitnami_airflow
- `AIRFLOW_DATABASE_USERNAME`: usuário do banco de dados que o Airflow usará para se conectar ao banco de dados. Padrão: bn_airflow
- `AIRFLOW_DATABASE_PASSWORD`: Senha do banco de dados que o Airflow usará para se conectar ao banco de dados. Sem padrões.
- `AIRFLOW_DATABASE_USE_SSL`: Defina como sim se o banco de dados estiver usando SSL. Padrão: não
- `AIRFLOW_REDIS_USE_SSL`: Defina como sim se o Redis(R) usar SSL. Padrão: não
- `REDIS_HOST`: Nome do host para o servidor Redis(R). Padrão: redis
- `REDIS_PORT_NUMBER`: Porta usada pelo servidor Redis(R). Padrão: 6379
- `REDIS_USER`: usuário que o Airflow usará para se conectar ao Redis(R). Sem padrões.
- `REDIS_PASSWORD`: Senha que o Airflow usará para se conectar ao Redis(R). Sem padrões.
- `REDIS_DATABASE`: Número do banco de dados para o servidor Redis(R). Padrão: 1

### **Autenticação LDAP do Airflow**

- `AIRFLOW_LDAP_ENABLE`: ative a autenticação LDAP. Padrão: não
- `AIRFLOW_LDAP_URI`: URI do servidor LDAP. Sem padrões.
- `AIRFLOW_LDAP_SEARCH`: base de pesquisa LDAP. Sem padrões.
- `AIRFLOW_LDAP_UID_FIELD`: campo LDAP usado para uid. Sem padrões.
- `AIRFLOW_LDAP_BIND_USER`: nome de usuário LDAP. Sem padrões.
- `AIRFLOW_LDAP_BIND_PASSWORD`: Senha do usuário LDAP. Sem padrões.
- `AIRFLOW_USER_REGISTRATION`: Auto-registro do usuário. Padrão: Verdadeiro
- `AIRFLOW_USER_REGISTRATION_ROLE`: Função para o usuário criado. Sem padrões.
- `AIRFLOW_LDAP_ROLES_MAPPING`: Mapeamento do DN do LDAP para uma lista de funções do Airflow. Sem padrões.
- `AIRFLOW_LDAP_ROLES_SYNC_AT_LOGIN`: Substitua TODAS as funções do usuário a cada login, ou apenas no registro. Padrão: Verdadeiro
- `AIRFLOW_LDAP_USE_TLS`: Use SSL LDAP. Padrões: Falso .
- `AIRFLOW_LDAP_ALLOW_SELF_SIGNED`: Permitir certificados autoassinados em SSL LDAP. Padrão: Verdadeiro
- `AIRFLOW_LDAP_TLS_CA_CERTIFICATE`: Arquivo que armazena a CA para SSL do LDAP. Sem padrões.

- Além das variáveis ​​de ambiente anteriores, todos os parâmetros do arquivo de configuração podem ser substituídos usando variáveis ​​de ambiente com este formato: AIRFLOW**{SECTION}**{KEY}. Observe os sublinhados duplos.

### **Especificando variáveis ​​de ambiente usando o Docker Compose**

    version: '2'
        services:
        airflow:
            image: bitnami/airflow:latest
            environment:
            - AIRFLOW_FERNET_KEY=46BKJoQYlPPOexq0OhDZnIlNepKFf87WFwLbfzqDDho=
            - AIRFLOW_SECRET_KEY=a25mQ1FHTUh3MnFRSk5KMEIyVVU2YmN0VGRyYTVXY08=
            - AIRFLOW_EXECUTOR=CeleryExecutor
            - AIRFLOW_DATABASE_NAME=bitnami_airflow
            - AIRFLOW_DATABASE_USERNAME=bn_airflow
            - AIRFLOW_DATABASE_PASSWORD=bitnami1
            - AIRFLOW_PASSWORD=bitnami123
            - AIRFLOW_USERNAME=user
            - AIRFLOW_EMAIL=user@example.com

</details>

# **Uso do Python ?**

`Os scripts serão as transformações que serão construídas a partir da linguagem python`

Todos os Scripts sao feitos para fazer a orquestração de todo o sistema por meio dos DAGs podendo ultilizar dentro deles as bibliotecas do Spark, kafka e das demais bibliotecas de analise de dados e configuração.

[Exemplo script python](https://dev.to/jeancabral/primeiros-passos-com-o-apache-airflow-53oj)

# **Como se encaixa em todo o processo ?**

O Airflow juntamente com o docker faz parte de gerenciamento do sistema como um todo orquestrando tudo que tem que ser feito de forma sequencial para o processo.

- [Datalake Airflow](https://euleralencar.medium.com/people-analytcs-bootcamp-with-stack-12da7b73a489)
- [spark e airflow](https://jozimarback.medium.com/executando-jobs-apache-spark-no-apache-airflow-9eaee3fa4c84)
- [dag kafka airflow](https://medium.com/@tutorialcreation81/apache-spark-kafka-and-airflow-for-etl-pipelines-2d91e641fbdf)

> **Onde vai para cada fluxo de dados da ferramenta ?**

Isso cabe a cada ferramenta de ETL OU ELT dita o que vai acontecer com esses dados e fica a criterio do desenvolvedor

> **De qual processo ela faz parte ?**

O Airflow faz parte do processo de gerenciamento e orquestração de todo o sistema

> **Como dar deploy da aplicação ?**

O deploy sera feito pelo Kubernetes que estara conectado as demais ferramentas do processo para que tenha uma consistencia e versionamento pelo github.

[Git syc](https://medium.com/tech-grupozap/airflow-escal%C3%A1vel-com-kubernetes-git-sync-5c928103e508)

<details>
<summary> Docker Airflow MongoDB Python </summary>

[![CI status](https://github.com/puckel/docker-airflow/workflows/CI/badge.svg?branch=master)](https://github.com/puckel/docker-airflow/actions?query=workflow%3ACI+branch%3Amaster+event%3Apush)
[![Docker Build status](https://img.shields.io/docker/build/puckel/docker-airflow?style=plastic)](https://hub.docker.com/r/puckel/docker-airflow/tags?ordering=last_updated)

[![Docker Hub](https://img.shields.io/badge/docker-ready-blue.svg)](https://hub.docker.com/r/puckel/docker-airflow/)
[![Docker Pulls](https://img.shields.io/docker/pulls/puckel/docker-airflow.svg)]()
[![Docker Stars](https://img.shields.io/docker/stars/puckel/docker-airflow.svg)]()

This repository contains **Dockerfile** of [apache-airflow](https://github.com/apache/incubator-airflow) for [Docker](https://www.docker.com/)'s [automated build](https://registry.hub.docker.com/u/puckel/docker-airflow/) published to the public [Docker Hub Registry](https://registry.hub.docker.com/).

## Informations

- Based on Python (3.7-slim-buster) official Image [python:3.7-slim-buster](https://hub.docker.com/_/python/) and uses the official [Postgres](https://hub.docker.com/_/postgres/) as backend and [Redis](https://hub.docker.com/_/redis/) as queue
- Install [Docker](https://www.docker.com/)
- Install [Docker Compose](https://docs.docker.com/compose/install/)
- Following the Airflow release from [Python Package Index](https://pypi.python.org/pypi/apache-airflow)

## Installation

Pull the image from the Docker repository.

    docker pull puckel/docker-airflow

## Build

Optionally install [Extra Airflow Packages](https://airflow.incubator.apache.org/installation.html#extra-package) and/or python dependencies at build time :

    docker build --rm --build-arg AIRFLOW_DEPS="datadog,dask" -t puckel/docker-airflow .
    docker build --rm --build-arg PYTHON_DEPS="flask_oauthlib>=0.9" -t puckel/docker-airflow .

or combined

    docker build --rm --build-arg AIRFLOW_DEPS="datadog,dask" --build-arg PYTHON_DEPS="flask_oauthlib>=0.9" -t puckel/docker-airflow .

Don't forget to update the airflow images in the docker-compose files to puckel/docker-airflow:latest.

## Usage

By default, docker-airflow runs Airflow with **SequentialExecutor** :

    docker run -d -p 8080:8080 puckel/docker-airflow webserver

If you want to run another executor, use the other docker-compose.yml files provided in this repository.

For **LocalExecutor** :

    docker-compose -f docker-compose-LocalExecutor.yml up -d

For **CeleryExecutor** :

    docker-compose -f docker-compose-CeleryExecutor.yml up -d

NB : If you want to have DAGs example loaded (default=False), you've to set the following environment variable :

`LOAD_EX=n`

    docker run -d -p 8080:8080 -e LOAD_EX=y puckel/docker-airflow

If you want to use Ad hoc query, make sure you've configured connections:
Go to Admin -> Connections and Edit "postgres_default" set this values (equivalent to values in airflow.cfg/docker-compose\*.yml) :

- Host : postgres
- Schema : airflow
- Login : airflow
- Password : airflow

For encrypted connection passwords (in Local or Celery Executor), you must have the same fernet_key. By default docker-airflow generates the fernet_key at startup, you have to set an environment variable in the docker-compose (ie: docker-compose-LocalExecutor.yml) file to set the same key accross containers. To generate a fernet_key :

    docker run puckel/docker-airflow python -c "from cryptography.fernet import Fernet; FERNET_KEY = Fernet.generate_key().decode(); print(FERNET_KEY)"

## Configuring Airflow

It's possible to set any configuration value for Airflow from environment variables, which are used over values from the airflow.cfg.

The general rule is the environment variable should be named `AIRFLOW__<section>__<key>`, for example `AIRFLOW__CORE__SQL_ALCHEMY_CONN` sets the `sql_alchemy_conn` config option in the `[core]` section.

Check out the [Airflow documentation](http://airflow.readthedocs.io/en/latest/howto/set-config.html#setting-configuration-options) for more details

You can also define connections via environment variables by prefixing them with `AIRFLOW_CONN_` - for example `AIRFLOW_CONN_POSTGRES_MASTER=postgres://user:password@localhost:5432/master` for a connection called "postgres_master". The value is parsed as a URI. This will work for hooks etc, but won't show up in the "Ad-hoc Query" section unless an (empty) connection is also created in the DB

## Custom Airflow plugins

Airflow allows for custom user-created plugins which are typically found in `${AIRFLOW_HOME}/plugins` folder. Documentation on plugins can be found [here](https://airflow.apache.org/plugins.html)

In order to incorporate plugins into your docker container

- Create the plugins folders `plugins/` with your custom plugins.
- Mount the folder as a volume by doing either of the following:
  - Include the folder as a volume in command-line `-v $(pwd)/plugins/:/usr/local/airflow/plugins`
  - Use docker-compose-LocalExecutor.yml or docker-compose-CeleryExecutor.yml which contains support for adding the plugins folder as a volume

## Install custom python package

- Create a file "requirements.txt" with the desired python modules
- Mount this file as a volume `-v $(pwd)/requirements.txt:/requirements.txt` (or add it as a volume in docker-compose file)
- The entrypoint.sh script execute the pip install command (with --user option)

## UI Links

- Airflow: [localhost:8080](http://localhost:8080/)
- Flower: [localhost:5555](http://localhost:5555/)

## Scale the number of workers

Easy scaling using docker-compose:

    docker-compose -f docker-compose-CeleryExecutor.yml scale worker=5

This can be used to scale to a multi node setup using docker swarm.

## Running other airflow commands

If you want to run other airflow sub-commands, such as `list_dags` or `clear` you can do so like this:

    docker run --rm -ti puckel/docker-airflow airflow list_dags

or with your docker-compose set up like this:

    docker-compose -f docker-compose-CeleryExecutor.yml run --rm webserver airflow list_dags

You can also use this to run a bash shell or any other command in the same environment that airflow would be run in:

    docker run --rm -ti puckel/docker-airflow bash
    docker run --rm -ti puckel/docker-airflow ipython

# Simplified SQL database configuration using PostgreSQL

If the executor type is set to anything else than _SequentialExecutor_ you'll need an SQL database.
Here is a list of PostgreSQL configuration variables and their default values. They're used to compute
the `AIRFLOW__CORE__SQL_ALCHEMY_CONN` and `AIRFLOW__CELERY__RESULT_BACKEND` variables when needed for you
if you don't provide them explicitly:

| Variable            | Default value | Role                 |
| ------------------- | ------------- | -------------------- |
| `POSTGRES_HOST`     | `postgres`    | Database server host |
| `POSTGRES_PORT`     | `5432`        | Database server port |
| `POSTGRES_USER`     | `airflow`     | Database user        |
| `POSTGRES_PASSWORD` | `airflow`     | Database password    |
| `POSTGRES_DB`       | `airflow`     | Database name        |
| `POSTGRES_EXTRAS`   | empty         | Extras parameters    |

You can also use those variables to adapt your compose file to match an existing PostgreSQL instance managed elsewhere.

Please refer to the Airflow documentation to understand the use of extras parameters, for example in order to configure
a connection that uses TLS encryption.

Here's an important thing to consider:

> When specifying the connection as URI (in AIRFLOW*CONN*\* variable) you should specify it following the standard syntax of DB connections,
> where extras are passed as parameters of the URI (note that all components of the URI should be URL-encoded).

Therefore you must provide extras parameters URL-encoded, starting with a leading `?`. For example:

    POSTGRES_EXTRAS="?sslmode=verify-full&sslrootcert=%2Fetc%2Fssl%2Fcerts%2Fca-certificates.crt"

# Simplified Celery broker configuration using Redis

If the executor type is set to _CeleryExecutor_ you'll need a Celery broker. Here is a list of Redis configuration variables
and their default values. They're used to compute the `AIRFLOW__CELERY__BROKER_URL` variable for you if you don't provide
it explicitly:

| Variable         | Default value | Role                           |
| ---------------- | ------------- | ------------------------------ |
| `REDIS_PROTO`    | `redis://`    | Protocol                       |
| `REDIS_HOST`     | `redis`       | Redis server host              |
| `REDIS_PORT`     | `6379`        | Redis server port              |
| `REDIS_PASSWORD` | empty         | If Redis is password protected |
| `REDIS_DBNUM`    | `1`           | Database number                |

You can also use those variables to adapt your compose file to match an existing Redis instance managed elsewhere.

# Wanna help?

Fork, improve and PR.

</details>
