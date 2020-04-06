---
layout: exercicio
modulo: 4
numero: 14
nome: "Exercício M04-E02"
title: "4.14 Aula de Ruby: Exercício M04-E02 | Estágio em Programação"
description: "Exercício M04-E02 de Ruby do curso online gratuito Estágio em
  Programação."
---

## Objetivos

- Aplicar conceitos básicos de Programação Orientada a Objetos (POO) usando a linguagem Ruby:
  * Herança
  * Encapsulamento
  * Polimorfismo

## Instruções

Nesse exercício, vamos criar novas classes para conseguir representar produtos de diferentes tipos na nossa loja virtual. Os 3 tipos de produtos que queremos representar são: produtos físicos comuns (roupas, móveis, etc), produtos frescos (frutas, legumes, etc) e produtos digitais (e-books, arquivos de música, etc).

Cada um destes tipos possui características específicas e, por isso, vamos precisar criar as seguintes classes: `PhysicalProduct`, `FreshProduct` e `DigitalProduct`.

### PhysicalProduct

1. Crie o diretório `~/ep/exercicios/m4/simple_store/lib/products` usando o comando `mkdir`.

2. Dentro desse diretório, crie o arquivo `physical_product.rb`.

3. Nesse arquivo, defina a classe `PhysicalProduct`, que deve herdar da classe `Product`, já que um produto físico continua sendo um produto, apenas de um tipo mais específico.

4. Essa classe não precisará de nenhum código adicional. Portanto, ela já está pronta e terá exatamente o mesmo comportamento da classe `Product`.

### FreshProduct

1. Crie o arquivo `fresh_product.rb` no diretório `~/ep/exercicios/m4/simple_store/lib/products`.

2. Nesse arquivo, defina a classe `FreshProduct`, que deve herdar da classe `Product`.

3. Defina o método `initialize` nesta classe para podermos atribuir o valor de uma nova variável de instância:

    * `@expiration_date` (data de vencimento): deve ser uma data **maior que a data de hoje**. Caso a validação falhe, utilize o código abaixo para lançar um erro e interromper a execução do programa:

    ```ruby
    fail SimpleStore::Error, 'O produto não pode estar vencido'
    ```

    **Atenção**: este método `initialize` deve atribuir o valor da nova variável **em adição às outras variáveis de `Product`** que já estavam sendo atribuídas na classe-pai. Portanto, não se esqueça de chamar o `initialize` da classe-pai também!

4. Crie um *getter* para o novo atributo desta classe (`expiration_date`).

### DigitalProduct

1. Crie o arquivo `digital_product.rb` no diretório `~/ep/exercicios/m4/simple_store/lib/products`.

2. Nesse arquivo, defina a classe `DigitalProduct`, que deve herdar da classe `Product`.

3. Novamente, sobrescreva o método `initialize` nesta classe para atribuir o valor de duas variáveis adicionais de instância:

    * `@expiration_date` (data de vencimento): deve ser uma data **maior que a data de hoje**. Caso a validação falhe, utilize o código:

    ```ruby
    fail SimpleStore::Error, 'O produto não pode estar vencido'
    ```

    * `@url`: deve ser uma string **iniciada por "http"**. Caso a validação falhe, utilize o código:

    ```ruby
    fail SimpleStore::Error, 'A URL do produto deve ser válida'
    ```

4. Crie dois *getters* para os novos atributos desta classe (`expiration_date` e `url`).

### Product

1. Altere o método `Product#generate_control_code` para que a geração do código do produto utilize a constante `SimpleStore::PRODUCT_TYPES`, agora que temos outros tipos de produtos além de `Product`.

    **Dica**: Perceba que as chaves o hash `SimpleStore::PRODUCT_TYPES` são exatamente os nomes das diferentes classes que você criou. Isso significa que você poderia utilizar algum método de Ruby para obter a classe de um objeto e usar o nome da classe para acessar o hash.

### Observações

- O argumento `expiration_date` será informado na forma de uma string com o formato: `'AAAA-MM-DD'`. Por exemplo:

    ```ruby
    args = {
      ...
      'expiration_date' => '2016-07-20' # 20 de Julho de 2017
      ...
    }
    ```

    Seu código nas classes `FreshProduct` e `DigitalProduct` deverá encontrar uma maneira de transformar este valor, que é uma string, em um objeto do tipo `Date`, para que você consiga validar a data informada. Consulte a documentação da classe `Date` para pesquisar como fazer isso.

### Testando seu código

Você pode testar o seu código usando as mesmas duas formas que utilizou no exercício M04-E01.

### Correção do exercício

- Quando você estiver satisfeito com a sua resposta, utilize a ferramenta `ep` para executar a correção do exercício.

    ```bash
    ep 4.2
    ```
