# Desafio Programa de Full Cycle de Aceleração (PFA) - Desafio 1

O desafio era criar uma aplicação, utilizando qualquer linguagem, que fizesse uma listagem simples dos nomes dos módulos do curso Full Cycle. Essas informações seriam coletadas de um banco de dados MySQL que estaria rodando em um container.

Além disso, teríamos que utilizar também um container com o NGINX para receber as solicitações HTTP na porta 8080 da máquina host e encaminhá-las ao container da aplicação.

Não deveríamos utilizar o Docker-compose para fazer esse desafio.

Todos as imagens utilizadas neste desafio estão dentro do docker hub:
> https://hub.docker.com/repository/docker/ferraresipedro/pfa-des-01-db
> https://hub.docker.com/repository/docker/ferraresipedro/pfa-des-01-bk
> https://hub.docker.com/repository/docker/ferraresipedro/pfa-des-01-sv

Para testar e executar esse desafio, basta seguir os passos abaixo
___

# Pré-Requisitos
A máquina utilizada para testar esse a resolução desse desafio deve possuir tanto o Git quando o Docker instalados.
Com ambas as Ferramentas 

## Clone da Aplicação Completa

O primeiro passo é fazer um clone da aplicação na máquina local e navegar dentro do diretório da aplicação.

## Criando a network

Com a aplicação clonada e com o terminal dentro do diretório dala, a primeira coisa a ser feita é criar a network que será utilizada para fazer a comunicação dos containers com o comando:

```
$ docker network create pfa_desafio_01
```

## Bando de Dados

Baixe a imagem com o seguinte comando:

```
$ docker pull ferraresipedro/pfa-des-01-db
```

Com a imagem na máquina, vamos executar nosso container com base na imagem com o seguinte comando:

```
$ docker run --network=pfa_desafio_01 -e MYSQL_ROOT_PASSWORD=root --name database -d --rm ferraresipedro/pfa-des-01-db
```

Agora vamos criar nossa base de dados que iremos utilizar em nosso container com o comando:

```
$ docker exec -i database mysql -u root --password=root -e 'CREATE DATABASE `desafio_01_fc`;'
```

Por fim, vamos popular nosso banco de dados com o seguinte comando:
```
$ docker exec -i database mysql -u root --password=root < ./database/scripts.sql
```

Lembrando que é importante esperar o serviço do bando de dados subir corretamente. Como estamos rodando o container *desatachado*, para verificar se está tudo ok podemos utilizar o comando `docker logs database` para exibir os logs do container do Banco de Dados.


## Aplicação

dentro do diretório raiz da aplicação, vamos navegar primeiro para o diretório backend e dentro do diretório vamos instalar as dependencias da aplicação:

```
$ cd backend
$ npm install
```

Após a instalação, vamos voltar para o diretório principal da aplicação:

```
$ cd ..
```

Novamente dentro do diretório raiz da aplicação, vamos baixar a imagem do docker hub:

```
$ Pulling from ferraresipedro/pfa-des-01-bk
```

Com a imagem na máquina, vamos executar o container com o comando:

```
$ docker run --network=pfa_desafio_01 -v $(pwd)/backend:/usr/src/desafio_pfa_01 --name backend -d --rm ferraresipedro/pfa-des-01-bk
```

Por fim, vamos inicar nossa aplicação com o comando:

```
$ docker exec backend node index.js
```

## NGIX

Vamos baixar a imagen do Nginx com o seguinte comando:
```
$ docker pull ferraresipedro/pfa-des-01-sv
```

Com a imagem na máquina, vamos executar o container com o comando:

```
$ docker run --network=pfa_desafio_01 -p 8080:80 --name server -d --rm ferraresipedro/pfa-des-01-sv
```

## Testando no Navegador

Agora que temos todos os nossos serviços e containers de pé, basta abrir o navegador e digitar `localhost:8080` no barra de navegação. Se tudo estiver ok, teremos o seguinte resultado:

![Resultado do Desafio]