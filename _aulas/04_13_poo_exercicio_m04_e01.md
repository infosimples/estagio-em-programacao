---
layout: exercicio
modulo: 4
numero: 13
nome: "Exercício M04-E01"
title: "4.13 Aula de Ruby: Exercício M04-E01 | Estágio em Programação"
description: "Exercício M04-E01 de Ruby do curso online gratuito Estágio em
  Programação."
---

## Objetivos

- Aplicar conceitos básicos de Programação Orientada a Objetos (POO) usando a linguagem Ruby:
  * Classes
  * Métodos e variáveis de instância
  * Encapsulamento com getters e setters (accessors)
  * Constantes

## Instruções

Nos exercícios deste módulo, você irá modificar e extender o código de um sistema de
e-commerce simplificado de uma loja fictícia, a **SimpleStore**.

### Configuração do projeto

1. Crie o diretório `~/ep/exercicios/m4` para a resolução dos exercícios deste módulo.

2. Baixe o código da SimpleStore com os comandos abaixo:

    ```bash
    curl https://infosimples.github.io/estagio-em-programacao/assets/supplies/m04/simple_store.zip -o ~/ep/exercicios/m4/simple_store.zip

    unzip ~/ep/exercicios/m4/simple_store.zip -d ~/ep/exercicios/m4/

    rm ~/ep/exercicios/m4/simple_store.zip
    ```

3. Verifique se o projeto foi baixado corretamente executando o seguinte comando no terminal:

    ```bash
    tree ~/ep/exercicios/m4/simple_store
    ```

    A saída deverá ser parecida com a figura abaixo:
    <br>
    <br>
    ![m04_e01_tree_out]({{ '/assets/images/aulas/m04_e01_tree_out.png' | absolute_url }})
    <br>

4. Configure as gems de Ruby do projeto executando os comandos abaixo:

    ```bash
    cd ~/ep/exercicios/m4/simple_store
    bundle install
    ```

### Exercícios

<div class="alert alert-warning"><strong>IMPORTANTE 1:</strong> Leia todas as instruções até o final antes de começar a executar os passos solicitados, pois dúvidas em um passo poderão estar esclarecidas nas instruções dos passos seguintes.</div>

<div class="alert alert-warning"><strong>IMPORTANTE 2:</strong> Para resolver os exercícios, você vai precisar se familiarizar com o código que recebeu. Portanto, depois de ler o enunciado e antes de começar, explore os arquivos que já existem e tente entender a estrutura do projeto.</div>

1. Crie uma nova classe, com nome `Product`, no projeto. Para fazer isso, siga os seguintes passos:

    1. Crie um arquivo chamado `product.rb` dentro do diretório `~/ep/exercicios/m4/simple_store/lib`.

    2. Defina uma classe chamada `Product` nesse arquivo.

2. Nesta classe, defina o método `initialize`. Este método deverá ter um único parâmetro: um hash (isto é, o método irá receber um objeto da classe Hash).

3. Dentro do `initialize`, inicialize as seguintes variáveis de instância: `@title`, `@price`, `@manufacturer`, `@barcode` e `@code`. Os valores para estas variáveis serão passados no hash que o método irá receber.

    1. Você pode assumir que as chaves do hash serão strings iguais aos nomes das variáveis de instância. Por exemplo: chave `'barcode'` para a variável de instância `@barcode`. As exceções são as variáveis `@manufacturer` e `@code`, e estão explicadas a seguir.

    2. A variável `@manufacturer` é uma exceção à regra acima. Para essa variável, você utilizará a chave `'manufacturer_code'` do hash para obter o código do fabricante. Em seguida, precisará acessar a constante `SimpleStore::AUTHORIZED_MANUFACTURERS` e usar o código obtido para então obter o **nome** do fabricante e armazenar este nome na variável `@manufacturer`.

    3. A variável `@code` deve conter um código único que identifica o produto. Este código deverá ser obtido chamando o método `Product#generate_control_code` com os valores das outras características do produto, conforme descrito mais abaixo.

4. Cada variável de instância possui regras de validação, usadas para definir se um determinado valor é válido. Portanto, antes de inicializar cada variável de instância, você deverá fazer as seguintes verificações:

    * `title` (título do produto): **não pode ser nulo nem vazio**. Caso a validação falhe, use o seguinte trecho de código para lançar um erro e interromper a execução do programa:

    ```
      fail SimpleStore::Error, "O título do produto não pode ser vazio"
    ```

    * `price` (preço): deve ser **um valor numérico maior ou igual a zero**. Caso a validação falhe, use o código:

    ```
    fail SimpleStore::Error, "O preço do produto deve ser >= 0.0"
    ```

    * `manufacturer` (fabricante): o código do fabricante informado deve estar incluído na lista de **fabricantes autorizados** (ver constante `SimpleStore::AUTHORIZED_MANUFACTURERS`). Caso a validação falhe, use o código:

    ```
    fail SimpleStore::Error, "O fabricante não está autorizado"
    ```

    * `barcode` (código de barras): sem validação.

    * `code` (código do produto): sem validação.

    > Note que colocar o código que realiza estas validações diretamente no método `initialize` não é uma boa organização do código. Portanto, você deverá definir os _setters_ apropriados para cada variável, e fazer a verificação dentro de cada _setter_.

5. Defina *getters* para cada variável de instância. Você pode definir esses
  métodos explicitamente ou, de maneira mais concisa, usar o método `attr_reader` do Ruby.

6. Defina e implemente um método **privado** chamado `generate_control_code` que retorna a string que será usada como um
  "identificador único" de produto (isto é, não podem existir dois produtos na nossa loja com o mesmo código). Esta string deve ser construída a partir de outros atributos do produto, da seguinte forma:

    ```ruby
    "{PRODUCT_TYPE_CODE}--{MANUFACTURER_CODE}--{BARCODE}"
    # Por exemplo, um código válido é: "0--2--abcdef".
    ```

    * Veja as constantes `SimpleStore::PRODUCT_TYPES` e `SimpleStore::AUTHORIZED_MANUFACTURERS` para descobrir como conseguir estes códigos.

    * Neste exercício, `PRODUCT_TYPE_CODE` deverá ser sempre o código correspondente ao tipo `:Product`, ou seja, ainda não vamos usar os diferentes tipos de produto existentes.

### Testando o seu código

#### Testando no IRB

Você pode testar o seu código no `irb` (interpretador de Ruby) da seguinte forma:

1. Abra um terminal e vá até o diretório `~/ep/exercicios/m4/simple_store`.
2. Execute o comando `bundle exec irb` para iniciar o interpretador.
3. Dentro do console execute: `load 'irb_helper.rb'`.
4. Agora, você está dentro de um terminal Ruby que já conhece as classes e objetos do projeto. Você pode usar este ambiente para testar o seu código, conforme os exemplos abaixo:

```text
2.3.0 :001 > Product.new()
SimpleStore::Error: O título do produto não pode ser vazio
2.3.0 :002 > Product.new('title' => 'Teste', 'barcode' => 'aaa111', 'manufacturer_code' => 0, 'price' => 10.50)
=> #<Product:0x007f986a0b71d8 @title="Teste", @price=10.5, @manufacturer_code=0, @manufacturer="OReillyMedia", @barcode="aaa111", @code="0--0--aaa111">
```
**OBSERVAÇÃO**: o código do projeto é carregado uma única vez, quando você carrega o arquivo `irb_helper.rb`. Por isso, sempre que você alterar qualquer arquivo do projeto, precisará salvar os arquivos e abrir o irb novamente, para que as modificações tenham efeito no terminal.

#### Testando pelo terminal

Outra forma de testar o código é executar a aplicação da "loja virtual" no terminal, executando o seguinte comando, supondo que o seu diretório atual seja `~/ep/exercicios/m4/simple_store`. No entanto, esta forma só estará 100% funcional após a implementação dos 3 exercícios.

```text
bundle exec ruby -e "load 'cli.rb'".
```

### Correção do exercício

- Quando você estiver satisfeito com a sua resposta, utilize a ferramenta `ep` para executar a correção do exercício.

    ```bash
    ep 4.1
    ```
