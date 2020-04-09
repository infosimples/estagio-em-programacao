---
layout: exercicio
modulo: 6
numero: 16
nome: "Exercício M06-E01"
title: "6.16 Aula de SQL: Exercício M06-E01 | Estágio em Programação"
description: "Exercício M06-E01 de Bancos de Dados e SQL do curso online
  gratuito Estágio em Programação."
---

## Objetivos

- Aprender a escrever queries em SQL usando todas as cláusulas básicas (`SELECT`, `WHERE`,
`GROUP BY`, `ORDER BY`, `JOIN`) apresentadas na parte teórica.

## Configuração do banco de dados ecommerce\_sample no MySQL

Para a resolução dos exercícios, vamos usar um banco de dados de uma aplicação fictícia de e-commerce, chamado _ecommerce\_sample_, que tem uma estrutura (tabelas, colunas, etc) muito parecida com a estrutura que foi usada nos vídeos, mas **não é idêntica**—existem mais tabelas, mais colunas e mais dados.

Antes de começar, precisamos importar o banco de dados, como foi feito nos vídeo *MySQL na prática*. Para fazer isso, siga os passos abaixo.

1. Vamos criar um container Docker que roda o servidor de MySQL e vamos conectar o nosso container
`ep` na mesma rede dele.

    > Antigamente, neste curso, era usada uma máquina virtual Ubuntu que podia rodar diversos
    > processos simultaneamente. Então, neste passo, nós simplesmente rodávamos algo como
    > `sudo service mysql start` para iniciar o MySQL. Uma boa prática de Docker é iniciar um
    > container separado para cada processo que você for rodar, e por isso vamos criar um container
    > separado que terá como responsabilidade exclusiva a execução do servidor de MySQL.

    1. Crie uma rede que será compartilhada entre os containers

    ```bash
    docker network create epnet
    # o nome da rede é epnet. Quando terminar o curso, você pode removê-la com o comando:
    # docker network rm epnet
    ```

    2. Crie um [container de MySQL](https://hub.docker.com/_/mysql):

    ```bash
    docker run -d -p 3306:3306 --name epsql --network epnet -e MYSQL_ALLOW_EMPTY_PASSWORD=yes mysql:5.7
    # o nome do container de servidor de MySQL que criamos é epsql. Esse nome também é o hostname
    # desse servidor que será acessível por qualquer container conectado na rede epnet.
    ```

    3. Recrie o container `ep` do Estágio em Programação se conectando à rede `epnet`

    ```bash
    docker run -it -v ~/ep:/root/ep --network epnet ep bash
    ```

    **Dica**: você pode verificar todos os containers em execução com o comando `docker ps`. Você
    pode parar um container com o comando `docker stop CONTAINER_ID` e pode remover um container com
    o comando `docker rm CONTAINER_ID`.

2. Baixe o arquivo `.sql` com a definição do banco de dados para a sua VM com o comando abaixo.

    ```bash
    mkdir -p ~/ep/exercicios/m6/

    curl https://infosimples.github.io/estagio-em-programacao/assets/supplies/m06/ecommerce_sample.zip -o ~/ep/exercicios/m6/ecommerce_sample.zip

    unzip ~/ep/exercicios/m6/ecommerce_sample.zip -d ~/ep/exercicios/m6/

    rm ~/ep/exercicios/m6/ecommerce_sample.zip
    ```

3. Em seguida, vamos importá-lo para o servidor de MySQL:

    ```bash
    mysql -h epsql -u root < ~/ep/exercicios/m6/ecommerce_sample.sql
    ```

4. Agora o banco de dados já está no MySQL. Certifique-se disso abrindo o cliente do MySQL no terminal e listando os bancos de dados disponíveis:

    ```bash
    # Este comando deve ser executado no terminal.
    mysql -h epsql -u root

    # Este comando deve ser executado dentro do MySQL.
    SHOW databases;
    ```

  O comando `SHOW databases` deverá listar, entre outros bancos de dados, o banco *ecommerce_sample*.

## Exercícios

1. Crie o diretório `~/ep/exercicios/m6` para a resolução dos exercícios deste módulo.

2. Obtenha o arquivo com os exercícios executando o comando abaixo:

    ```bash
    curl https://infosimples.github.io/estagio-em-programacao/assets/supplies/m06/m06-e01.rb -o ~/ep/exercicios/m6/m06-e01.rb
    ```

3. Abra este arquivo no seu editor de código:

    ```
    ~/ep/exercicios/m6/m06-e01.rb
    ```

    Os exercícios são os métodos da classe `MySQLExercises1` que começam com `q_`. Assim, o primeiro exercício é `q_about_query_method`, o segundo é `q_how_many_tables`, e assim por diante. Os comentários dentro dos métodos explicam como você deve resolver cada exercício.

    A maioria dos exercícios vão envolver criar uma query SQL para responder a uma pergunta sobre os dados do banco *ecommerce_sample*, que nós já importamos. Para criar e testar as suas queries, você pode usar qualquer um dos métodos que nós apresentamos nos vídeos: 1) linha de comando do MySQL, 2) interface gráfica ou 3) linha de comando do Ruby (com a gem `mysql2`). A forma de usar cada um destes métodos está resumida abaixo.

4. Ao final, use o comando `ep 6.1` para corrigir seu exercício.

## Acesso ao MySQL

### Método 1: Cliente de linha de comando do MySQL

Execute o comando abaixo em um terminal:

```bash
mysql -h epsql -u root ecommerce_sample
```

Este comando inicia o cliente do MySQL e já seleciona o banco que vamos usar (*ecommerce_sample*). Você pode testar se está tudo OK executando a query abaixo. Note que incluímos o `LIMIT 1` nesta query para retornar apenas uma linha no resultado. Sem o `LIMIT`, o comando iria imprimir todos os produtos, que são muitos.

```sql
SELECT * FROM products LIMIT 1;
```

### Método 2: Interface gráfica

Existem diversos clientes que permitem acessar bancos de dados MySQL com interface gráfica.

Para usuários de macOS, nossa recomendação é o [Sequel Pro](https://www.sequelpro.com/).

Para usuários de outros sistemas operacionais, não temos experiência suficiente para recomendar um
cliente. Entretanto, temos algumas sugestões.

1. [MySQL Workbench](https://www.mysql.com/products/workbench/): é um cliente multiplataforma que
foi desenvolvido pela própria MySQL.

2. Conheça opções de Windows
[nesta questão do Stack Overflow](https://stackoverflow.com/questions/6817551/sequel-pro-alternative-for-windows).

3. Conheça opções de GNU/Linux
[nesta questão do Stack Overflow](https://stackoverflow.com/questions/7759725/linux-alternatives-to-sequel-pro-gui-based-sql-navigator).

**IMPORTANTE**: Esses clientes rodam no seu Sistema Operacional e não dentro de algum container
Docker. Ao iniciar o container de MySQL, nós expusemos a porta do MySQL com a opção `-p 3306:3306`.
Ao usar um desses clientes no seu SO, você deve configurar o acesso com as opções abaixo:

```
host: localhost
port: 3306
database: ecommerce_sample
user: root
pass:
```

### Método 3: Cliente de Ruby usando a gem mysql2

1. Abra o interpretador de Ruby dentro do container Docker `ep`:

    ```bash
    irb
    ```

2. Dentro do interpretador, use o comando `require` para importar o código da biblioteca (gem) que vamos usar:

    ```ruby
    require 'mysql2'
    ```

3. Crie um novo cliente para se conectar ao MySQL que está rodando na sua VM:

    ```ruby
    client = Mysql2::Client.new(host: 'epsql', username: 'root', database: 'ecommerce_sample')
    ```

4. Use o método `query` do cliente para executar queries. Este método retorna um objeto que, por sua vez, tem diversos métodos para acessar os resultados de uma query. Por exemplo:

    ```ruby
    result = client.query("SELECT COUNT(*) FROM products")
    result.entries
    ```
