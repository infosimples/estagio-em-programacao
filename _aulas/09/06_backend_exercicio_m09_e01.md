---
layout: exercicio
modulo: 9
numero: 6
nome: "Exercício M09-E01"
title: "9.6 Aula de Backend: Exercício M09-E01 | Estágio em Programação"
description: "Exercício M09-E01 de Backend (Ruby on Rails) do curso online
  gratuito Estágio em Programação."
---

Na parte prática deste módulo, você irá desenvolver os conceitos dos vídeos na criação de um blog em
Ruby on Rails. Nós sugerimos que você assista aos próximos vídeos enquanto resolve os exercícios.

## Objetivos

- Criar um Blog com **Ruby on Rails**.

## Dica

Preparamos um
[repositório no GitHub](https://github.com/estagioemprogramacao/store) para
servir como referência para resolver o exercício desta aula.

Você pode visualizar todos os commits no link abaixo:

[https://github.com/estagioemprogramacao/store/commits/master](https://github.com/estagioemprogramacao/store/commits/master)

Navegue do commit mais antigo para o mais recente. Este aqui é o mais antigo:

[https://github.com/estagioemprogramacao/store/commit/8025d3c50390814042525d40ce50a01494c68dea](https://github.com/estagioemprogramacao/store/commit/8025d3c50390814042525d40ce50a01494c68dea)

Repare que colocamos instruções na mensagem de commit:

```
Criação da aplicação Store

Comandos:
rails new store --database=mysql --skip-test
```

> As versões de Ruby, Rails e outras gems podem ficar defasadas com o tempo. Uma
> sugestão é você tentar fazer este exercício com as versões mais recentes
> dessas ferramentas.

## Preparação dos containers com Docker

Para fazer o exercício, sugerimos que você rode ao mesmo tempo 3 containers de
Docker. Esses containers vão compartilhar um volume de disco e uma rede. Você
pode abrir cada container em uma aba/janela diferente do seu terminal.

1. Crie um volume chamado `epbundles` no Docker (onde gems de Ruby serão instaladas)

    ```bash
    docker volume create epbundles
    ```

2. Crie uma rede chamada `epnet` no Docker (caso não tenha criado nos exercícios do módulo 06)

    ```bash
    docker network create epnet
    ```

### Container 1 - MySQL

Assim como fizemos nos exercícios do módulo 06, vamos criar um container de
servidor de MySQL:

```bash
docker run -p 3306:3306 --name epsql --network epnet -e MYSQL_ALLOW_EMPTY_PASSWORD=yes mysql:5.7
```

### Container 2 - Terminal bash para Rails

A ideia é usar este container para criar o projeto Rails, instalar gems, rodar
comandos ou o console Rails. Também usaremos para corrigir o exercício com o
comando `ep 9.1`.

```bash
docker run --network epnet -it -e BUNDLE_PATH=/bundles -v ~/ep:/root/ep -v epbundles:/bundles ep bash
```

Por exemplo, para criar a sua aplicação você pode rodar algo parecido com os
comandos abaixo nesse container:

```bash
mkdir -p ~/ep/exercicios/m9
gem install rails
cd ~/ep/exercicios/m9
rails new blog --database=mysql --skip-test --skip-spring --skip-action-mailer --skip-action-mailbox --skip-action-cable --skip-javascript
cd ~/ep/exercicios/m9/blog
rake db:create db:migrate
```

### Container 3 - Servidor Rails

Depois de criar a aplicação `blog`, você poderá iniciar um container rodando um
servidor Rails com o comando abaixo:

```bash
docker run --name epserver --network epnet -it -p 3000:3000 -w=/root/ep/exercicios/m9/blog -e BUNDLE_PATH=/bundles -v ~/ep:/root/ep -v epbundles:/bundles ep rails server --binding 0.0.0.0
```

Basta acessar o endereço abaixo no seu navegador para acessar a aplicação:

[http://localhost:3000/](http://localhost:3000/)

> O servidor Rails automaticamente recarrega alterações feitas na maioria dos
> arquivos da sua aplicação. Então não é necessário reiniciar o servidor Rails a
> todo momento. Algumas alterações, por exemplo de arquivos YAML da pasta
> config, exigem que o servidor Rails seja reiniciado.

## Instruções

1. Crie uma aplicação **Rails** chamada `blog` que usa o banco de dados `mysql`
no diretório `~/ep/exercicios/m9`.

    > **Dica:** primeiro, assista à aula **Rails: criação de uma loja online**
    para entender como criar sua aplicação.

    ```bash
    # Não esqueça de editar o arquivo config/database.yml
    # Substitua:
    host: localhost
    # Por:
    host: epsql
    ```

2. Inicie o **Container 3** que roda o servidor Rails da nossa aplicação.

3. Crie uma página inicial para o Blog que lista todos os artigos. Para cada um,
deve aparecer o `title` (título), o `author` (nome do autor) e a `category`
(categoria).

    > **Dica:** primeiro, assista ao vídeo **Rails: página inicial da loja**. O
    corretor deste exercício não analisa estilos, então você não precisa se
    preocupar com o visual do seu Blog.

4. Crie o CRUD de `Article` (Artigo).

    Os atributos de um artigo são: `title` (título), `author` (nome do autor),
    `category` (categoria) e `content` (conteúdo/texto do artigo).

    Todos os atributos são campos de texto. O campo `content` precisa ser maior,
    os outros podem ser menores.

    Deve ser possível acessar o CRUD de artigos no caminho `/articles`. Para criar
    um artigo novo, por exemplo, será acessado o caminho `/articles/new`.

    > **Dica:** primeiro, assista ao vídeo **Rails: CRUD de produtos**. O corretor
    tentará criar, editar e remover artigos do seu Blog.

5. Atualize a página inicial do seu Blog com artigos de verdade, aqueles que
você criou no CRUD de artigos. Crie uma página de artigo no caminho
`/artigo/:id` e adicione as validações abaixo nos atributos do seu artigo:

    `title`: deve ser presente e ter de 3 a 100 caracteres;

    `author`: deve ser presente e ter de 2 a 20 caracteres;

    `category`: deve ser presente e ter de 2 a 20 caracteres;

    `content`: deve ser presente e ter no máximo 1.000 caracteres.

    Adicione apenas estas validações.

    > **Dica:** primeiro, assista ao vídeo **Rails: colocando produtos na loja**.

6. Crie uma página que lista todos os artigos de uma determinada categoria. A
página deverá abrir num caminho do tipo `/categoria?c=Tecnologia`.

    > **Dica:** primeiro, assista ao vídeo **Rails: corrigindo categorias e busca**.

7. Crie um contador de visualizações de páginas do seu Blog. Ao abrir o CRUD de
artigos (`/articles`), deve existir o seguinte texto na página:
`O blog teve x visitas`, em que `x` é o total de visitas do Blog.

    > **Dica:** primeiro, assista ao vídeo **Rails: quantidade de visualizações**.

8. Corrija seu exercício usando o comando `ep 9.1` no terminal do **Container 2**.
