# Estrutura dos códigos do projeto

Api de conexão com banco >> kafka producer >> servidor kafka >> kafka consumer >> Api conexão pyspark >> Worker de cada projeto no spark >> Processamento com Pyspark >> Api Postgres >> Postgres >> Tableau

1. projeto da internet
2. projeto da documentação feito por min
<!-- 3. projeto feito por min do zero -->

## Kafka producer

- Bibliotecas
- conexão com o container da etapa
- coleta dos dados

## Worker spark && Kafka consumer (orientado a projeto)

- Bibliotecas
- conexão com o container da etapa anterior
- dados do broker e topic
- transformações e processamento dos dados
- api para conexão com o banco de dados

        ./bin/spark-shell --conf "spark.mongodb.input.uri=mongodb://127.0.0.1/test.myCollection?readPreference=primaryPreferred" \
        --conf "spark.mongodb.output.uri=mongodb://127.0.0.1/test.myCollection" \
        --packages org.mongodb.spark:mongo-spark-connector_2.12:3.0.1

        sudo chmod 777 jars_dir && \
        docker exec -it spark-master \
        spark-submit \
        --packages "org.apache.spark:spark-sql-kafka-0-10_2.12:3.3.0" \
        --master "spark://spark:7077" \
        --class Streaming \
        --conf spark.jars.ivy=/opt/bitnami/spark/ivy \
        ivy/spark-streaming-with-kafka_2.12-1.0.jar

## airflow DAG e Operator

Os scripts estao em cada pasta de seus projetos e faram um apontamento para o dag de sua instancia

## Spark master

O master ea configuração do sistema para cada etapa do processo e das ferramentas nele utilidades

# **executar comanodos da documentaçao ainda**

**airflow**
**kafka**
cria topico (kafka-topics --create --topic words --bootstrap-server localhost:29092)
**postgresql**
**spark**
minikube

`Depois`

nginx
ngrok
jenkins
DBMaker
Kubeflow

## fazer o network entre os container ou cluster no minikube

docker network connect ETL

- ETL
- ELT
- ML

airflow
**kafka**
mongo
**postgresql**
**spark**
minikube

`Depois`

nginx
ngrok
**jenkins**
DBMaker
**Kubeflow**