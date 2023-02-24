![logo](../../Images/k8s/logo.png)

# **Oque e ?**

Kubernetes é um plataforma de código aberto, portável e extensiva para o gerenciamento de cargas de trabalho e serviços distribuídos em contêineres, que facilita tanto a configuração declarativa quanto a automação. Ele possui um ecossistema grande, e de rápido crescimento. Serviços, suporte, e ferramentas para Kubernetes estão amplamente disponíveis.

[informações detalhadas](https://kubernetes.io/pt-br/docs/concepts/overview/what-is-kubernetes/)

[Documentaçao](https://kubernetes.io/docs/home/)

# **Para que serve ?**

- `Descoberta de serviço e balanceamento de carga` O Kubernetes pode expor um contêiner usando o nome DNS ou seu próprio endereço IP. Se o tráfego para um contêiner for alto, o Kubernetes pode balancear a carga e distribuir o tráfego de rede para que a implantação seja estável.

- `Orquestração de armazenamento` O Kubernetes permite que você monte automaticamente um sistema de armazenamento de sua escolha, como armazenamentos locais, provedores de nuvem pública e muito mais.

- `Lançamentos e reversões automatizadas` Você pode descrever o estado desejado para seus contêineres implantados usando o Kubernetes, e ele pode alterar o estado real para o estado desejado em um ritmo controlada. Por exemplo, você pode automatizar o Kubernetes para criar novos contêineres para sua implantação, remover os contêineres existentes e adotar todos os seus recursos para o novo contêiner.

- `Empacotamento binário automático`Você fornece ao Kubernetes um cluster de nós que pode ser usado para executar tarefas nos contêineres. Você informa ao Kubernetes de quanta CPU e memória (RAM) cada contêiner precisa. O Kubernetes pode encaixar contêineres em seus nós para fazer o melhor uso de seus recursos

- `Autocorreção` O Kubernetes reinicia os contêineres que falham, substitui os contêineres, elimina os contêineres que não respondem à verificação de integridade definida pelo usuário e não os anuncia aos clientes até que estejam prontos para servir.

- `Gerenciamento de configuração e de segredos` O Kubernetes permite armazenar e gerenciar informações confidenciais, como senhas, tokens OAuth e chaves SSH. Você pode implantar e atualizar segredos e configuração de aplicações sem reconstruir suas imagens de contêiner e sem expor segredos em sua pilha de configuração

[informações detalhadas](https://kubernetes.io/pt-br/docs/concepts/overview/what-is-kubernetes/)

# **Como funciona ?**

Em sua base, o Kubernetes reúne máquinas físicas ou virtuais individuais em um cluster usando uma rede compartilhada para comunicar entre cada servidor. Esse cluster é a plataforma física onde todos os componentes, recursos, e cargas de trabalho do Kubernetes são configurados.

# **Qual e a Arquitetura ?**

![Arquitetura](../../Images/k8s/Arquitetura.jpg)

Em sua base, o Kubernetes reúne máquinas físicas ou virtuais individuais em um cluster usando uma rede compartilhada para comunicar entre cada servidor. Esse cluster é a plataforma física onde todos os componentes, recursos, e cargas de trabalho do Kubernetes são configurados.

## **Nós**

O Kubernetes executa sua carga de trabalho colocando contêineres em Pods para serem executados em Nós. Um nó pode ser uma máquina virtual ou física, dependendo do cluster. Cada nó é gerenciado pela camada de gerenciamento e contém os serviços necessários para executar Pods.

Normalmente, você tem vários nós em um cluster; em um ambiente de aprendizado ou limitado por recursos, você pode ter apenas um nó.

[Documentação](https://kubernetes.io/pt-br/docs/concepts/architecture/nodes/)

## **Comunicação entre no e control plane**

Este documento cataloga os caminhos de comunicação entre o control plane (O APIserver) e o cluster Kubernetes. A intenção é permitir que os usuários personalizem sua instalação para proteger a configuração de rede então o cluster pode ser executado em uma rede não confiável (ou em IPs totalmente públicos em um provedor de nuvem)

[Documentação](https://kubernetes.io/pt-br/docs/concepts/architecture/control-plane-node-communication/)

## **Conceitos sobre Cloud Controller Manager**

O conceito do Cloud Controller Manager (CCM) (não confundir com o binário) foi originalmente criado para permitir que o código específico de provedor de nuvem e o núcleo do Kubernetes evoluíssem independentemente um do outro. O Cloud Controller Manager é executado junto com outros componentes principais, como o Kubernetes controller manager, o servidor de API e o scheduler. Também pode ser iniciado como um addon do Kubernetes, caso em que é executado em cima do Kubernetes.

[Documentação](https://kubernetes.io/pt-br/docs/concepts/architecture/cloud-controller/)

## **Controladores**

No Kubernetes, controladores são ciclos de controle que observam o estado do seu cluster, e então fazer ou requisitar mudanças onde necessário. Cada controlador tenta mover o estado atual do cluster mais perto do estado desejado

Um controlador rastreia pelo menos um tipo de recurso Kubernetes. Estes objetos têm um campo spec que representa o estado desejado. O(s) controlador(es) para aquele recurso são responsáveis por trazer o estado atual mais perto do estado desejado.

[Documentação](https://kubernetes.io/pt-br/docs/concepts/architecture/controller/)

# **Como instalar ?**

1. Atualize o índice de pacotes apt e instale os pacotes necessários para utilizar o repositório apt do Kubernetes: sudo apt-get update sudo apt-get install -y apt-transport-https ca-certificates curl.

2. Atualize o índice de pacotes apt , instale o kubelet, o kubeadm e o kubectl, e fixe suas versões:

[Instalando Cluster Kubernetes](https://www.youtube.com/watch?v=TqMKBIinjew)

[install Kubernetes](https://stackoverflow.com/questions/58912281/install-kubernetes-on-vps-server)

# **Como funciona junto com o container ?**

- Kubernetes é uma estrutura de orquestração para contêineres do Docker que ajuda a expor contêineres como serviços para o mundo exterior. Por exemplo, você pode ter dois serviços – um serviço conteria nginx e mongoDB e outro serviço conteria nginx e redis . Cada serviço pode ter um IP ou ponto de serviço que pode ser conectado por outros aplicativos. O Kubernetes é então usado para gerenciar esses serviços

- A diferença entre os dois é que o Docker trata de empacotar aplicativos em contêiner em um único nó e o Kubernetes deve executá-los em um cluster . Como esses pacotes realizam coisas diferentes, eles geralmente são usados ​​em conjunto. Claro, Docker e Kubernetes podem ser usados ​​de forma independente.

# **Quais sao suas dependências ?**

Em um ambiente de produção, você precisa gerenciar os contêineres que executam as aplicações e garantir que não haja tempo de inatividade. Por exemplo, se um contêiner cair, outro contêiner precisa ser iniciado.

## **Docker**

Como o Kubernetes trabalha em conjunto com o docker e necessário ter domínio da ferramenta e ter os container funcionando e em bom estado para que a ferramenta possa ser usada. Para mais informações acesse o [readme](../Docker/README.MD) dela.

# **Componentes ?**

![Componentes](../../Images/k8s/Componentes.png)

> Componentes de maior importância

## **Nós**

máquinas que realizam as tarefas solicitadas, atribuídas pelo plano de controle.

## **Pod**

um ou mais containers implantados em um nó. O pod é o menor e mais simples objeto do Kubernetes.

[Rede Pods](https://www.digitalocean.com/community/tutorials/a-rede-do-kubernetes-nos-bastidores-pt)

## **Serviço**

maneira de expor como serviço de rede uma aplicação executada em um conjunto de pods. Ele dissocia as definições de trabalho dos pods.

## **Kubectl**

interface de linha de comando usada para gerenciar o cluster do Kubernetes. Veja os comandos básicos do Helm e kubectl, simplificados para iniciantes.

## **kubelet**

pequena aplicação localizada em cada nó que se comunica com o plano de controle. O kubelet assegura que os containers estejam em execução em um pod.

[Visão dos especialistas](https://www.redhat.com/pt-br/topics/containers/learning-kubernetes-tutorial#arquitetura-do-kubernetes)

[Tutorial da arquitetura](https://www.tutorialspoint.com/docker/docker_kubernetes_architecture.htm)

> Demais componentes

## **ETCD**

Este componente é um armazenamento de chave-valor altamente disponível que é usado para armazenar configuração compartilhada e descoberta de serviço . Aqui os vários aplicativos poderão se conectar aos serviços através do serviço de descoberta .

## **Flannel**

Esta é uma rede de back-end que é necessária para os contêineres.

## **Kube-apiserver**

Esta é uma API que pode ser usada para orquestrar os contêineres do Docker.

## **Kube-controller-manager**

Isso é usado para controlar os serviços do Kubernetes .

## **Kube-scheduler**

Isso é usado para agendar os contêineres nos hosts.

## **Kubelet**

Isso é usado para controlar o lançamento de contêineres por meio de arquivos de manifesto .

## **Kube-proxy**

Isso é usado para fornecer serviços de proxy de rede para o mundo exterior

# **Como usar ?**

![Interface](../../Images/k8s/Interface.png)

[Kubernetes Básico](https://kubernetes.io/pt-br/docs/tutorials/kubernetes-basics/)

[Kubernetes start](https://kubernetes.io/docs/setup/)

[Tutorial Kubernetes interativo](https://kubernetes.io/pt-br/docs/tutorials/kubernetes-basics/_print/)

# **Uso do Python ?**

- O uso do python se resume em apenas colocar os apps feitos na linguagem para rodar em produção.

[Exemplo pratico](https://kubernetes.io/blog/2019/07/23/get-started-with-kubernetes-using-python/)

# **Como se encaixa em todo o processo ?**

Kubernetes, ou "k8s", é uma plataforma open source que automatiza as operações dos containers Linux. O Kubernetes elimina grande parte dos processos manuais necessários para implantar e escalar as aplicações em containers.

[Contabo service](https://robertbrem.github.io/Microservices_with_Kubernetes/01_Setup/02_Kubernetes_setup/)

> **Onde vai para cada fluxo de dados da ferramenta ?**

Como foi dito anteriormente o Kubernetes e um orquestrador portando ele vai auxiliar no processo com suas funcionalidades.

> **De qual processo ela faz parte ?**

Gerenciamento e orquestração.

> **Como dar deploy da aplicação ?**

[Kubernetes github](https://www.youtube.com/watch?v=xHBiawlGO7s)

[Kubernetes github config](https://github.com/kubernetes/kubernetes)

[Kubernetes CI/CD Video](https://www.youtube.com/watch?v=kfCe8TmOmxI)

[Action Github](https://github.com/marketplace/actions/build-and-push-docker-images)

[DEPLOY](https://www.youtube.com/watch?v=mSeMnKX6DFw)

[Exemplo de yml](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/)

[Expose service k8s com ngrok](https://itnext.io/expose-local-kubernetes-service-on-internet-using-ngrok-2888a1118b5b)

[Expose service k8s com ngrok 2](https://github.com/abhirockzz/ngrok-kubernetes)
