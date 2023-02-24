<img  width=600 height=200 src="../Images/MLops/Ciclo%20de%20vida.png" ></img>

Usaremos o conceito ea pratica de MLops para todo o processo de machine learning

# **Oque e ?**

O machine learning (ML) é uma subcategoria de inteligência artificial que se refere ao processo pelo qual os computadores desenvolvem o reconhecimento de padrões ou a capacidade de aprender continuamente ou fazer previsões com base em dados, e então, fazer ajustes sem serem especificamente programados para isso.

[Kubeflow oque e ](https://hevodata.com/learn/kubeflow-vs-airflow/)

[documentaçao](https://www.kubeflow.org/docs/)

# **Para que serve ?**

Machine learning é um ramo da inteligência artificial (IA) e da ciência da computação que se concentra no uso de dados e algoritmos para imitar a maneira como os humanos aprendem, melhorando gradualmente sua precisão.

# **Como funciona ?**

O processo de machine learn se da pela construçao de modelos como :

- Modelo de classificação
  - Como o próprio nome ja sugere serve para classificação de valores e objetos
- Modelo de regressão
  - Serve para fazer a previsão de algum valor com uma base dados com dados históricos

# **Qual e a Arquitetura ?**

![MLops](../Images/MLops/Arquitetura.png)

[Kubeflow Arquitetura Google](https://cloud.google.com/architecture/architecture-for-mlops-using-tfx-kubeflow-pipelines-and-cloud-build?hl=pt-br)

[Itau model](https://cloud.google.com/blog/products/ai-machine-learning/itau-unibanco-how-we-built-a-cicd-pipeline-for-machine-learning-with-online-training-in-kubeflow)

# **Como instalar ?**

No seu ambiente de desenvolvimento Primeiro coloque o (.env) para a vitralização do seu ambiente logo apos coloque a biblioteca que melhor ira te atender para o seu modelo em questão e fazer a sua analise. Algumas bibliotecas interessantes sao :

- `Numpy`
- `Scipy`
- `Scikit-learn`
- `Theano`
- `TensorFlow`
- `Keras`
- `PyTorch`
- `Pandas`
- `Matplotlib`
- `MLLib`

[10 melhores bibliotecas](https://www.youtube.com/watch?v=29tdx8_Q-uQ)

[Como instalar e iniciar o Kubeflow em sua máquina local](https://towardsdatascience.com/kubeflow-how-to-install-and-launch-kubeflow-on-your-local-machine-e0d7b4f7508f)

[Kubeflow Instalaçao](https://towardsdatascience.com/kubeflow-how-to-install-and-launch-kubeflow-on-your-local-machine-e0d7b4f7508f)

[Kubeflow Instalaçao](https://www.kubeflow.org/docs/components/pipelines/installation/localcluster-deployment/)

# **Como funciona dentro do container ?**

Como pudemos ver, o kubeflow fornece um conjunto de ferramentas para desenvolver o ciclo de vida de um modelo de aprendizado de máquina, em um futuro blog-tutorial aprenderemos sobre cada um dos componentes do kubeflow, bem como a geração de pipelines!

![Arquitetura](../Images/MLops/Kube%20docker.jpeg)

[kubeflow docker e kubernetes](https://towardsdatascience.com/kubeflow-how-to-install-and-launch-kubeflow-on-your-local-machine-e0d7b4f7508f)

[images do kubeflow](https://www.kubeflow.org/docs/components/notebooks/container-images/)

[Arquitetura explicada](https://cloud.google.com/blog/products/ai-machine-learning/itau-unibanco-how-we-built-a-cicd-pipeline-for-machine-learning-with-online-training-in-kubeflow)

# **Quais sao suas dependencias ?**

[Build componentes](https://www.kubeflow.org/docs/components/pipelines/sdk/component-development/)

[Kubeflow](https://www.kubeflow.org/)

# **Componentes ?**

## **MLops Componenetes**

- `Ingestão de Dados (Data Ingestion):`
  onde podemos coletar dados para serem usados no modelo

- `Treinamento de Modelo (Model Training):`
  que treina um modelo de aprendizado de máquina para resolver um problema de negócio

- `Registro de Modelo (Model Registry):`
  uma vez que o modelo foi treinado, temos que manter seu artefato que é o modelo de machine learning salvo em disco

- `Avaliação de Modelo (Model Evaluation):`
  para garantir que todas as métricas foram alcançadas neste modelo

- `Deploy (Model Serving):`
  responsável pela implantação de um modelo a ser utilizado

- `Serviço de ML (ML Service):`
  apenas uma ilustração do modelo colocado no aplicativo móvel, embutido no hardware, etc.

## **Kubeflow**

- `Painel central`
  A interface de usuário central (UI) no Kubeflow

- `Blocos de notas do Kubeflow`
  Documentação para notebooks Kubeflow

- `Kubeflow Pipelines`
  Documentação para Kubeflow Pipelines.

- `Katib`
  Documentação para Kubeflow Katib

- `Operadores de treinamento`
  Treinamento de modelos de ML no Kubeflow por meio de operadores

- `Múltiplos inquilinos`
  Isolamento multiusuário e gerenciamento de acesso de identidade (IAM)

[Componentes do MLops](https://www.zup.com.br/blog/mlops)

# **Como usar ?**

[Kubeflow](https://www.kubeflow.org/docs/components/notebooks/quickstart-guide/)

[Kubeflow API](https://www.kubeflow.org/docs/components/pipelines/reference/api/kubeflow-pipeline-api-spec/)

[Kubeflow API PIpeline](https://www.kubeflow.org/docs/components/pipelines/tutorials/api-pipelines/)

[Kubeflow pesperquitiva](https://towardsdatascience.com/kubeflow-an-mlops-perspective-17d33ac57c08)

# **Como dar deploy dar aplicação ?**

Para o modelo chegar no tableau vamos fazer a criaçao de uma API seja para conectar diretamente ou armazenamento em um banco de dados

[Kubeflow deploy github actions](https://www.youtube.com/watch?v=WrBNwibd-5A)

[Video Explicativo de MLops](https://www.youtube.com/watch?v=Z42UL_4AQvI)

[GitHub action](https://www.youtube.com/watch?v=3cLbh-k2qKk)

[GitHub action Kubeflow](https://github.com/marketplace/actions/kubeflow-compile-deploy-and-run)

[Deploy NGrok](https://www.youtube.com/watch?v=CeLJ7Q9Ld_M)

[Automaçao do kubeflow](https://www.youtube.com/watch?v=WrBNwibd-5A)

[Definiçoes do kubeflow X Airflow](https://hevodata.com/learn/kubeflow-vs-airflow/)
