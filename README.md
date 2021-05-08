# Estudando Docker

## Imagem e Container

Uma instância de uma imagem é chamada de contêiner. Você tem uma imagem, que é um conjunto de camadas que você descreve. Se você iniciar esta imagem, terá um contêiner em execução dessa imagem. Você pode ter muitos contêineres em execução da mesma imagem.

Você pode ver todas as suas imagens docker imagesenquanto você pode ver seus contêineres em execução com docker ps(e você pode ver todos os contêineres com docker ps -a).

Portanto, uma instância em execução de uma imagem é um contêiner.

O comando ```docker run -it node``` baixa a imagem do node (se não estiver instalada ) e acessa ela pelo terminal.

As imagens são disponibilizadas no [Docker Hub](https://hub.docker.com/)

É possível determinar uma flag para a imagem.
Como por exemplo: docker run -it node:latest (utiliza a última versão do NodeJS)

## Comandos

* docker ps:  lista todos os containers ativos,

* docker ps -a: lista todos os container ativos e parados

* docker run -d [imagem] - executado em modo detached, ou seja, em segundo plano.

* docker stop [id_do_container] - para um container que está sendo executado em segundo plano. O ID pode ser obtido a partir do comando docker ps

* docker rm [CONTAINER_ID] - remove um container
* docker rmi [IMAGE] - remove uma imagem
* docker start [CONTAINER_ID] - reinicia container parado
* docker --name: nomeia uma imagem. Exemplo: docker run node --name nodejs
* docker logs [CONTAINER] - mostra os logs da aplicação
## Mapeando portas

Um exemplo com a porta 80 de um container para uma porta 8080 do host tem o seguinte comando:


docker run -it -p 8080:80 nginx
docker run -it -p <porta_do_host>:<porta_do_container> nginx

Com o comando acima temos a porta 8080 acessível no Docker host que repassa todas as conexões para a porta 80 dentro do container. Ou seja, não é possível acessar a porta 80 no endereço IP do host, pois essa porta está acessível apenas dentro do container que é isolada a nível de rede, como já dito anteriormente.

## Construindo imagens

Para construir uma imagem é necessário ter um Dockerfile
O comando é o seguinte: 

```docker build -t meu_back_end .```

Para lista imagens: docker images

Feito isso execute 

```docker run -p 3000:3000 -d [nome ou id da imagem]```

Limpar docker: docker system prune

## Binding volume 

docker container run -d --name nginx -v $(pwd)/index.html:/usr/share/index.html -p 81:80 nginx [imagem]