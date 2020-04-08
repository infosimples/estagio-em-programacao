---
layout: exercicio
modulo: 4
numero: 19
nome: "Exercício M04-E03"
title: "4.19 Aula de Classes e Objetos: Exercício M04-E03 | Estágio em Programação"
description: "Exercício M04-E03 de Programação Orientada a Objetos (POO) do
  curso online gratuito Estágio em Programação."
---

## Objetivos

- Aplicar conceitos básicos de Programação Orientada a Objetos (POO) usando a linguagem Ruby:
  * Mixins

## Instruções

Neste exercício, queremos implementar a seguinte regra de negócio: produtos frescos e produtos digitais possuem uma data de validade, que fica armazenada na variável de instância `@expiration_date`. Sabendo disso, queremos dar um desconto para produtos que estão próximos da data de vencimento, para tentar dar vazão ao nosso estoque.

1. Para fazer isso, você deverá implementar os seguintes métodos do módulo `DiscountEligible`:

      * `days_to_expire`

      * `discount_amount`

      * `discounted_price`

    Este módulo já está parcialmente implementado (veja o arquivo `discount_eligible.rb`), e os métodos que você precisa implementar estão descritos neste arquivo.

2. Em seguida, você precisará alterar as classes `FreshProduct` e `DigitalProduct` para que elas incluam a funcionalidade implementada no módulo `DiscountEligible`.

### Testando seu código

Você pode testar o seu código usando as mesmas duas formas que utilizou no exercício M04-E01.

### Correção do exercício

- Quando você estiver satisfeito com a sua resposta, utilize a ferramenta `ep` para executar a correção do exercício.

    ```bash
    ep 4.3
    ```
