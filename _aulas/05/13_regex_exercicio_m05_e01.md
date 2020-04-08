---
layout: exercicio
modulo: 5
numero: 13
nome: "Exercício M05-E01"
title: "5.13 Aula de REGEX: Exercício M05-E01 | Estágio em Programação"
description: "Exercício M05-E01 de Expressões Regulares (REGEX) do curso online
  gratuito Estágio em Programação."
---

## Objetivos

- Utilizar expressões regulares para manipular strings em memória.

## Instruções

1. Crie o diretório para a resolução deste exercício:

    ```bash
      mkdir -p ~/ep/exercicios/m5/e1
    ```

2. No diretório do exercício (`~/ep/exercicios/m5/e1`), crie um arquivo com o nome `m5-e1.rb`.

3. Abra o arquivo criado no passo anterior e defina uma classe com o nome `M5E1`. Seguindo os passos abaixo, você fará definições de constantes e métodos no escopo desta classe.

4. Nesta classe, defina uma constante com o nome `NOTICIAS` para armazenar o conteúdo abaixo como uma string. Cuidado com as quebras de linha e com eventuais espaços no início das linhas.

    **Ignore os quadrados vermelhos em volta de alguns dos caracteres.**

    ```
    09:55 - [política] Prefeito da Krakosia é eleito o melhor para economia
    10:14 - [cotidiano] Cachorro salva dono de assalto
    11:01 - [esporte] Seleção local de golfe se classifica para mundial
    11:36 - [esporte] João da Silva Sauro é cortado da seleção de golfe
    13:19 - [economia] Desemprego sobe para 12% no último mês
    14:55 - [política] Lei de incentivo ao esporte é aprovada no senado às 10:20
    16:13 - [economia] Cotação do dólar sobe 5% em uma semana
    19:26 - [esporte] Liga nacional de basquete tem recorde de público
    ```

    **Dica:** Uma forma de declarar uma string de múltiplas linhas, é usando o caracter de quebra de linha `\n`, como no exemplo abaixo:

    ```ruby
        str = "Primeira linha da string\n" +
              "Segunda linha da string\n" +
              "Terceira linha da string"
    ```

5. Defina um método de instância com o nome `format_news`. **Utilizando uma expressão regular**, este método deve pegar o conteúdo da constante `NOTICIAS` e formatá-lo para que cada linha fique da forma abaixo. Use uma regex para capturar o tema, a manchete e o horário de cada notícia e depois construa a nova formatação. O método deve retornar uma string com o mesmo número de linhas da string original, todas com a nova formatação.

    ```
    política: Prefeito da Krakosia é eleito o melhor para economia (09:55)
    ```

6. Defina um método de instância com o nome `find_economy_dollar_news`. **Utilizando expressões regulares**, este método deve encontrar quantas notícias do tema *economia* falam sobre o *dólar*. Este método deve retornar um número inteiro.

7. Defina um método de instância com o nome `find_times`. **Utilizando expressões regulares**, este método deve coletar os horários das notícias e retornar uma lista (`Array`, `[]`) de strings com os horários. A ordem dos horários deve ser a mesma da string original de notícias.

8. Utilize a ferramenta de correção automática do `ep` para verificar se está tudo certo.

    ```bash
      ep 5.1
    ```
