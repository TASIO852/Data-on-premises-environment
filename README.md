# **Cloud ☁**

<img  width=900 height=200
 src="Images/Pre%C3%A7os%20do%20cloud/Cloud.png" ></img>

# **Tecnologias que serão utilizadas 🤖**

`Componentes do data lake house. Para mais detalhes das ferramentas so clicar nos links`

## **Gerenciamento**

- [Docker](tools/Docker/README.MD)
- [Airflow](tools/Airflow/README.md)

## **Transformação**

- [Spark](tools/Spark/README.md)

## **Extração**

- [Kafka](tools/Kafka/README.md)

## **Deploy**

- [Kubernetes](tools/k8s/README.md)
- [Jenkins](tools/Jenkins/README.md)
- [Kubeflow ML](Machine%20learn/README.md)

## **Databases**

- [Mongodb (No-Sql)](Databases/MongoDB/README.md)
- [Postgres (Relacional Database)](Databases/PostgreSQL/README.md)
- [DBMaker (Relacional Database)](Databases/DBmaker/README.md)

## `Ferramentas de controle de trabalho`

- GitHub
- VSCode
- Jira

# **Orçamento da cloud 💰**

Duas maquinas Linux ubuntu server para melhor performance e armazenamento.

</br>

![Linux](Images/Pre%C3%A7os%20do%20cloud/Nuvem_Linux.jpg)

</br>

Preço que atualmente estamos pagando: $59,99

</br>

![Windows](Images/Pre%C3%A7os%20do%20cloud/Windows_pre%C3%A7o.jpg)

</br>

Em resumo poderíamos comprar duas maquinas Linux que seria a melhor escolha em todos os quesitos técnicos e de custo que também ja temos o escopo do projeto pronto

# **Diagramação da Arquitetura 📉**

![Modelo](Mappings/Model/Modelo%20com%20uma%20maquina.jpg)

# **Configuraçao Cloud From @brenodesouzaa**

[Start server contabo](https://contabo.com/blog/first-steps-with-contabo/)

- Mudança de usuario para `timedados`. Para funcionar em ambinete remoto

        adduser timedados
        usermod -aG sudo,adm timedados && su timedados

- Instalaçao do gnome

        sudo apt-get update && sudo apt-get upgrade
        sudo apt-get insttall ubuntu-gnome-desktop
        sudo reboot

- Voltar para o command line

        sudo systemctl set-default multi-user
        sudo reboot

- Apagar o `ubuntu-gnome-desktop`

        sudo apt-get remove ubuntu-gnome-desktop
        sudo apt-get autoremove

        sudo apt-get remove ubuntu-gnome-desktop
        sudo apt-get remove gnome-shell

        sudo apt-get remove --auto-remove ubuntu-gnome-desktop

        sudo apt-get purge ubuntu-gnome-desktop
        sudo apt-get purge --auto-remove ubuntu-gnome-desktop

- Distro diferente

        sudo apt install lxqt

- Gnome novamente

        sudo systemctl start gdm3

- Ver todos os aplicativos e programas

        sudo dpkg -l

- lista pacotes

        sudo apt-get list –-installed

        sudo apt remove *bluez*

[Ubunto server](https://ubuntu.com/download/server)

[Remover ubuntu-gnome-desktop](https://sobrelinux.info/questions/32749/how-can-i-remove-gnome-desktop-environment-without-messing-unity-de-ubuntu-16)

[Video Completo](https://www.youtube.com/watch?v=_NnxgAQsJkE)

[Video resumido](https://www.youtube.com/watch?v=OEK86061KEU)

[Backup server](https://contabo.com/blog/linux-server-backup-using-rclone/)

## **Versionamento semântico 1.0.0**

- 1 (Major) – controle de compatibilidade. Informa que existem funcionalidades/códigos incompatíveis com as versões anteriores.

- 0 (Minor) – controle de funcionalidade. Informa que novas funcionalidades foram adicionadas ao código.

- 0 (Patch) – controle de correção de bugs. Informa que um ou mais erros foram identificados e corrigidos.

## **Extras**

- Tirar telinha colorida que aparece na Instalaçao

        sudo rm /usr/share/polkit-1/actions/org.freedesktop.color.policy

- Mudar conexão SSH e porta do servidor para ter mais segurança com os dados

        sudo sed -i 's/3389/53579/g' /etc/xrdp/xrdp.ini

        sudo sed -i 's/#Port 22/Port 53572/g' /etc/ssh/sshd_config

        sudo ufw allow 53572 && sudo ufw allow 53579 && sudo ufw enable & sudo ufw status numbered

[config https vps](https://www.hostinger.com.br/tutoriais/install-docker-ubuntu)

## **Comandos docker para container**

### **Iniciar container mongo**

        docker run --name mongo-teste -d mongo:tag

        docker exec -it mongo_test mongo
        docker run -it -p 27017:27017 --name mongo_test mongo:latest mongo
        docker run -d -p 27017:27017 --name mongo_test mongo:latest:

### **Iniciar container postgres**

        docker exec -it doc_db_1 psql -U postgres -W postgres

### **Comando docker para usar o command line**

        docker exec -it <id container> /bin/sh

[kafka spark docker](https://hashnode.com/post/streaming-data-from-kafka-topic-to-spark-using-spark-structured-streaming-in-a-docker-environment-v20-ckzg86cr00btxlws1104rbwyz)

# **Fluxo de Ação 🛠**

Todas as ferramentas foram configuradas de acordo com as imagens que estão no docker-hub. tendo cada uma seu links e documentação apenas siga o passo a passo que tem no site de cada imagem links abaixo :

- **Ferramentas docker**

**Todas elas e muito mais podem ser encontradas no [Docker Hub](https://hub.docker.com/)**

- A peça central de toda a configuração e vincular as demais ferramentas ao **docker** e ao **airflow** juntamente com os **scripts python** que estão no ambiente do vscode ajudando no vinculo fazendo a parte de ETL e ELT.
- Tudo isso muito bem centralizado no ambiente de desenvolvimento do VSCode com suas respectivas extensões
- vinculo entre as ferramentas e pelo dockerfile e pelo docker-compose pelas suas configurações

[Estrutura de cluster](https://medium.com/data-arena/aprendendo-a-estruturar-um-cluster-hadoop-com-docker-4098adfa8604)

## **Sequencia de passos para o funcionamento**

**_ETL process_**

kafka >> spark >> Postgres >> Tableau

**_ELT process_**

kafka >> Mongo >> spark >> Tableau

## **Fluxo interno de cada Ambiente**

- `Ambiente ML` :
  Faz o modelo no vscode >> Sobe o Jupyter para o anaconda >> treina o modelo >> sobe para o mongo >> Jupyter/spark >> tableau

- `Ambiente ETL` :
  Puxa os dados do DBMaker >> Trata com Pyspark >> Joga para o Postgres >> Sobe para tableau

- `Ambiente ELT` :
  Puxa os das fontes de dados >> Joga no mongoDB >> Tratamento com Pyspark >> sobe para o tableau

- `Ambiente de Gerenciamento` :
  Docker rodando >> Airflow fazendo as Tasks >> Dados indo para seus provedores >> Ambientes acima em atuação >> Tableau

- `Ambiente de Desenvolvimento` :
  O Formato desse ambiente fica a critério de cada desenvolvedor

<span style="color:red">Mais informações sobre a arquitetura [README](Mappings/README.md)</span>.

# **Modelagem de dimensões 🟠**

O projeto de modelagem consiste na criação de uma fonte de dados contendo tabelas referenciais diversas com o único intuito de realizar todo o processo transformacional de maneira adequada para o esperado pelos analistas de dados.

# **Mapeamento do DBMaker 🔴**

- As tabelas do `DBMaker` funciona por tema cada `tabela` pode ter de 2 a 3 temas para tratar como assunto e fazer relacionamentos
- A maioria das tabelas vai ter sempre uma versão na filial `02` e na matriz `01`
- Seguindo a mesma logica as `colunas` também seguem esse padrão para poder realizar relacionamentos (e muito mais fácil achar oque voce quer pela coluna)
- Cada tabela vai ter uma tema `central` que sera o principal a ser trabalhado
- Existe também a existência de tabelas de `dimensão` e `medida` a diferença e que as tabelas de medida tem valores para analise e vao ser muito maiores eas de dimensão apenas valores para relacionar com as de medida e vao ser menores
- As vezes existe tabelas `centrais` que tem dados de varias tabelas que tem varias datas e as vezes com filial e matriz juntas (esse tipo geralmente esta ligado ao `dbcontrol2016001`)
- Tem a existência também de tabelas que foram testes e nao servem mais para nada (lixo)

`O mapeamento sera feito por projeto para ter uma visão de componentes individuais sera referenciado a tabela de cada tema referente ao projeto para saber oque usar em cada escopo e pelo oque e composto cada projeto tendo uma ideia da regra do negocio quanto do código`

# **Tabelas & temas & legendas & regras**🟢

- Consulta do schema do banco de dados

        select * from information_schema.columns

- Matriz

        select * from dbcontrol2016001

- Filial

        select * from dbcontrol3601002

# **Tabela & regras de referencia** 🔵

- Tabelas que tem varias datas e sao relacionadas sera colocado a inicial e **\*\*** para poder marcar e sera colocado se ela tem uma versão na matriz e na filial
- Temas ou tabelas com ``na frente sao de`dimensão`
- Itens que estão com `*` na frente ainda nao estão bem definidos mas temos uma ideia do que seja
- Se a tabela tiver data em seu nome utilize dentro do `etl` e dos seus testes apenas tabelas ate 2 anos de registro (ex: 2021 e 2022)
- Itens com `#` na frente sao os que estão sem visualização

# **Lógica e funcionamento ⚪**

<details>
<summary> Temas das tabelas </summary>

- MOV - Movimentação do financeiro
- N - Numero
- C - Código
- ROM - Romaneio
- CLI - Cliente
- CAD - Cadastro
- CC - Centro de custo `*`
- CCU - Centro de custo ``
- CFOR - Fornecedor
- CH - Cheques
- DV - Devolvidos
- CG - Centro de gastos `*`
- CF - Custo fiscal
- LF - Livro fiscal
- CT - Contabilidade `*`
- BAI - Baixa
- COM - Comissão
- LIN - Linha
- GRP - Grupo
- MAR - Marcas
- IT - Itens
- DESP - Despesa
- PED - Pedido
- CR - Contas a receber
- CP - Contas a pagar
- ARQ - Arquivo
- AD - Adicionar `*`
- TB - Tabela `*`
- TAB - Tabela `*`
- NC - Numero contábil `*`
- CON - Concorrência `*`
- TIP - Tipo
- NR - Numero
- TR - Troca `*`
- VIST - Visita (do que ?) `*`
- LAN - Lançamento
- CTRL - Control
- GER - Gerencial
- GE - Gênero ou gerencia de outras empresas e fornecedores `*`
- GEN - Gênero ou gerencia de outras empresas e fornecedores `*`
- PAU - Paulo
- CG - Contas gastas
- CON - Concorrência
- MET - Meta `*`
- SEQ - Sequencia `*`
- NPED - Numeros dos pedidos
- VD - Vendas
- REC - Recebimento
- PG - Pago
- CIT - Cidade
</details>

<details>
<summary> Temas das colunas </summary>

- VD - Vendas
- F - Final
- LAN - Lançamento
- PRD - Produto
- CPE - Contexto
- CRC - Contas a receber
- LE - (estoque)\*\*
- ROM - Romaneio
- CX - Caixa
- LF - Livro fiscal
- SLD - Saldo dia
- KAR - Estoque
- MEN - Mensal
- CTR - Control
- NLOT - Número do lote
- PFM - Fiscalização mensal `*`

</details>

# **Tabelas de cada projeto 🟣**

<details>
<summary> Projeto logística </summary>

## Romaneio

`Pode ser usada no financeiro,contabil e comercial`

    dbcontrol2016001.ccrom01 - Romaneio matriz
    dbcontrol3601002

    dbcontrol3601002.ccrom02 - Romaneio filial

    dbcontrol2016001.croma01 - Romaneio placa
    dbcontrol3601002

    dbcontrol3601001.croma02 - Romaneio placa
    dbcontrol3601002

    dbcontrol2016001.cadvei01 - Dados dos veiculos
    dbcontrol3601002

    dbcontrol3601002.nrorom01 - Número romaneio
    dbcontrol3601002.nrorom02 - Numero romaneio

    dbcontrol3601002.proma01  - Produtos
    dbcontrol3601002.proma02  - Produtos

    dbcontrol3601002.cidades - Cidades literalmente

    dbcontrol3601002.paroco01 - Relacionado a comodato
    dbcontrol3601002.paroco02 - Relacionado a comodato

    dbcontrol3601002.barmov01 - Bar ou bairro movimentaçao

    dbcontrol3601002.rocli01  - Romaneio por grupo de produto

    dbcontrol3601002.marfre01 - Marca frete

    dbcontrol3601002.gegenci2 - Possivelmente comodato

### Estoque

    dbcontrol2016001.sd******  - Estoque nao confirmado
    dbcontrol3601002

    dbcontrol2016001.sl******  - Estoque nao confirmado
    dbcontrol3601002

    dbcontrol2016001.gscprd01 - Grupo de produtos ````
    dbcontrol3601002

    dbcontrol2016001.sldcpd01 - Estoque geral
    dbcontrol3601002

    dbcontrol3601001.sldcpd02 - Estoque geral
    dbcontrol3601002

    dbcontrol2016001.itkard01 - Items de estoque
    dbcontrol3601002

    dbcontrol3601002.itkard02 - Items de estoque

    dbcontrol3601002.itpncp01 - Item produto numero/código
    dbcontrol3601002.itpncp02 - Item produto numero/código

    dbcontrol2016001.desp01 - Dimensão deposito
    dbcontrol3601002

    dbcontrol3601002.desp01 - Dimensão deposito
    dbcontrol3601002.desp02 - Dimensão deposito

    dbcontrol3601002.prd7alfa - Produto em falta

    dbcontrol2016001.ls****** - Contem itens dos pedidos
    dbcontrol3601002

    dbcontrol3601002.cevest01 - Cerveja em estoque
    dbcontrol3601002.cevest02 - Cerveja em estoque

    dbcontrol3601002.tipcev01 - Tipo de cerveja
    dbcontrol3601002.tipcev02 - Tipo de cerveja

    dbcontrol3601002.cpkard02 - Contas a pagar

### Cadastro

    dbcontrol3601002.vdcadpro - Produtos
    dbcontrol3601002.vdcadweb - Cadastro portal de vendas

### Produtos

`Pode ser usada em todos os projetos`

    dbcontrol2016001.cadprd01 - Produtos ````

    dbcontrol2016001.marprd01 - Marca
    dbcontrol3601002

    dbcontrol2016001.catprd01 - Categoria
    dbcontrol3601002

    dbcontrol3601002.sabor01 - Sabor dos produtos

    dbcontrol2016001.linhap01 - Linha
    dbcontrol3601002

    dbcontrol2016001.grpfam01 - Familia
    dbcontrol3601002

    dbcontrol3601002.cadfam01 - Familia

    dbcontrol3601002.grpprd01 - Grupo de produtos

    dbcontrol3601002.unmedida - Unidade de medida

### Pedido

    dbcontrol3601002.motcanpd - Motivo cancelamento de operação ou pedidos

    dbcontrol2016001.ppedit01 - Tabela com somente pedidos
    dbcontrol3601002

    dbcontrol2016001.vdpedipp - Itens com valores
    dbcontrol3601002

    dbcontrol2016001.vdprdcbo - Venda de combo
    dbcontrol3601002

    dbcontrol2016001.npedpt01 - Pedidos
    dbcontrol3601002

    dbcontrol3601001.npedpt02 - Pedidos
    dbcontrol3601002

</details>
<details>
<summary> Projeto administrativo </summary>

### Fonte desconhecida

    dbcontrol2016001.ap******  - Comodato | Apuramento
    dbcontrol3601002

### Custo logística

`Pode ser usa em todos os projetos`

    dbcontrol3601001.it****** - Entra os itens do pedido
    dbcontrol3601002

### Vendas romaneio

    dbcontrol3601002.clcvte01 - Saida de caixas

</details>

<details>
<summary> Projeto financeiro </summary>

### Cadastros

`Pode ser usa em todos os projetos`

    dbcontrol2016001.cadbai01 - Cadastro de baixa
    dbcontrol3601002

    dbcontrol3601002.cadbai02 - Cadastro de baixa filial

    dbcontrol2016001.cadmov01 - Cadastro movimentação
    dbcontrol3601002

    dbcontrol3601002.cadmov02 - Cadastro movimentação

    dbcontrol2016001.recpgb01 - Contas pagar gerente baixa
    dbcontrol3601002

    dbcontrol2016001.recpgm01 - Contas pagar movimentação baixa motorista
    dbcontrol3601002

    dbcontrol3601002.grpbai01 - Grupo baixa

### Fornecedores

    dbcontrol2016001.cfor01 - Dados dos fornecedores
    dbcontrol3601002

    dbcontrol2016001.cfor01 - Dados dos fornecedores
    dbcontrol3601002

    dbcontrol2016001.cfor012 - Dados dos fornecedores

    dbcontrol3601002.cfor00 - Código do fornedor

    dbcontrol3601002.cforcp00 - Código do fornedor

    dbcontrol3601002.cforcp01 - Código do fornedor

    dbcontrol3601002.tipfor01 - Tipo de fornecedor
    dbcontrol3601002.tipfor02 - Tipo de fornecedor

### Cheques

    dbcontrol2016001.chdepo01 - Cheques depositados
    dbcontrol3601002

    dbcontrol3601002.chdepo02 - Cheques devolvidos

    dbcontrol2016001.chdvv01 - Cheques devolvidos
    dbcontrol3601002.chdvv02 - Cheques devolvidos

    dbcontrol3601002.chdev01 - Cheques devolvidos
    dbcontrol3601002.chdev02 - Cheques devolvidos

### Tarifas e taxas

`Pode ser usado no contabil`

    dbcontrol2016001.ni******  - Tarifas gerais fiscais do financeiro parte das taxas do contábil
    dbcontrol3601002

    dbcontrol2016001.le******  - Valores gerais
    dbcontrol3601002

    dbcontrol2016001.vdobjina - Inadimplencia
    dbcontrol3601002

    dbcontrol3601002.cdaliq01 - Código da alicota
    dbcontrol3601002.cdaliq02 - Código da alicota

### Controle

    dbcontrol3601002.boleti01 - Boletim de visitas
    dbcontrol3601002.boleti02 - Boletim de visitas

### Movimentações

    dbcontrol3601002.entbol02 - Entrada boleto

    dbcontrol3601002.cevbxs01 - Baixa da cerveja
    dbcontrol3601002.cevbxs02 - Baixa da cerveja

    dbcontrol3601002.recpgb02 - Recebimento
    dbcontrol3601002.recpgm02 - Recebimento

    dbcontrol3601002.pg****** - Pagamento

### Vendas

    dbcontrol3601002.vdprba01  - Baixa
    dbcontrol3601002.vdprgp01  - Agrupamento
    dbcontrol3601002.vdprve01  - Vendas

### Ocorrências

    dbcontrol3601002.alinea01 - Devoluçao cheques
    dbcontrol3601002.alinea02 - Devoluçao cheques

</details>

<details>
<summary> Projeto contabilidade </summary>

### Contas contábil

    dbcontrol3601002.cadniv01 - Niveis de conta
    dbcontrol3601002.cadniv02 - Niveis de conta

    dbcontrol2016001.ct****** - Contabilidade
    dbcontrol3601002

    dbcontrol2016001.ct0301 - Níveis de conta e datas
    dbcontrol3601002

    dbcontrol2016001.ct0302 - Conta contábil linha

### Centro de custo

    dbcontrol2016001.ct14ccu - Centro de custo
    dbcontrol3601002

### Grupos fiscais

    dbcontrol2016001.grufis01 - Só tem 1 linha
    dbcontrol3601002

### Números contabil

    dbcontrol2016001.nc****** - Valores e tarifas fiscais
    dbcontrol3601002

### Contas a pagar

    dbcontrol3601002.pedcp01 - Pedidos contas a pagar
    dbcontrol3601002.pedcp02 - Pedidos contas a pagar

### Produtos

    dbcontrol2016001.cpkard01 - Estoque conntas a pagar
    dbcontrol3601002

    dbcontrol2016001.ppedcp01 - Pedidos e produtos com valores da contabilidade
    dbcontrol3601002

    dbcontrol3601002.vdkarede - Rede
    dbcontrol3601002.vdkarlan - Lançamento

### Pedidos

    dbcontrol3601002.pedcp01 - Pedidos
    dbcontrol3601002.pedcp02 - Pedidos

</details>

<details>
<summary> Projeto comercial </summary>

### Vendedores

    dbcontrol3601002.comisj01 - Comissao
    dbcontrol3601002.comiso01 - Comissao

    dbcontrol3601002.concor02 - Concorrencia

### Clientes

    dbcontrol2016001.cadcli01 - Dados dos clientes
    dbcontrol3601002

    dbcontrol2016001.ccat01 - Canal
    dbcontrol3601002

    dbcontrol2016001.vdclho01 - Redes
    dbcontrol3601002

    dbcontrol2016001.vdgecl01 - Cliente genero
    dbcontrol3601002

    dbcontrol3601002.grpcan01 - Grupo canal

    dbcontrol3601002.rshow01  - Não entendi

### Ocorrências

    dbcontrol3601002.pastac19 - Pergunta a cris oque e

    dbcontrol3601002.cadoco - Ocorencias de venda
    dbcontrol3601002.cadoco01 - Ocorencias de venda

#### Vendas fonecedor

    dbcontrol2016001.vdclif01 - Fornecedor

### Pedidos especificos

    dbcontrol2016001.vdpedflc - Pedidos
    dbcontrol3601002

    dbcontrol2016001.nroped01 - Numero do ultimo pedido do mes
    dbcontrol3601002

    dbcontrol3601002.nroped02 - Numero do pedido
    dbcontrol3601002.nrpedr02 - Numero do pedido

    dbcontrol2016001.pesqvd01 - Pesquisa vendedores
    dbcontrol3601002

    dbcontrol3601002.cevped01 - Cerveja pedido
    dbcontrol3601002.cevped02 - Cerveja pedido

    dbcontrol3601002.pedms01 - Pedido de demissao ?
    dbcontrol3601002.pedms02 - Pedido de demissao ?

    dbcontrol3601002.pedmsg01 - Pedido de demissao ?
    dbcontrol3601002.pedmsg02 - Pedido de demissao ?

    dbcontrol3601002.ppedit02 - Item
    dbcontrol3601002.pedit01  - Item
    dbcontrol3601002.pedit02  - Item
    dbcontrol3601002.peditx02 - Item

### Pesquisas

    dbcontrol3601002.pesqme01 - Mercado
    dbcontrol3601002.pesqme02 - Mercado
    dbcontrol3601002.pesqpr01 - Produto
    dbcontrol3601002.pesqpr02 - Produto
    dbcontrol3601002.pesqvd02 - Vendedor

### Comissão dos vendedores

`Pode ser usado no rh contabil e finanças`

    dbcontrol2016001.fx## ## - Comissao
    dbcontrol3601002

### Produtos modelo

    dbcontrol2016001.plamet01 - Paletes vendidos
    dbcontrol3601002

    dbcontrol3601002.vdprdcan - Canal

    dbcontrol2016001.vdprdmod - Modelo

</details>

<details>
<summary> Projeto RH </summary>

### Vendedores registro

    dbcontrol3601002.vdvenc02 - Registro
    dbcontrol3601002.vdvenlog - Registro
    dbcontrol3601002.vdventcb - Registro

    dbcontrol3601002.cadven01 - Cadastro
    dbcontrol3601002.cadven02 - Vendas cadastro

### Cargos

    dbcontrol2016001.ct07ge2 - Contas
    dbcontrol3601002

### Terceirizados

    dbcontrol2016001.cadtra01 - Motorista cargos e atributos
    dbcontrol3601002

### Control

    dbcontrol2016001.ctrlkdyy - Flags dia control
    dbcontrol3601002.voncad02 - Controle control
    dbcontrol3601002.voncad01 - Controle control
    dbcontrol3601002.usuban01 - Usuario banido

</details>
