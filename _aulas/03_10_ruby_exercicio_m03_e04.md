---
layout: exercicio
modulo: 3
numero: 10
nome: "Exercício M03-E04"
title: "3.10 Aula de Ruby: Exercício M03-E04 | Estágio em Programação"
description: "Exercício M03-E04 de Ruby do curso online gratuito Estágio em
  Programação."
---

## Objetivos

- Familiarizar-se com **Ruby** e o **IRB**;
- Escrever funções.

## Instruções

1. Crie um diretório para a resolução deste exercício, como você fez no
exercício M01-E01.

2. No diretório do exercício (`~/ep/exercicios/m3/e4`), crie um
arquivo com o nome `m3-e4.rb`.

3. Nesse arquivo, você deve escrever 4 funções:

    **factorial**: recebe como parâmetro um inteiro não negativo e retorna o
    [fatorial](https://pt.wikipedia.org/wiki/Fatorial) desse número;

    **reverse**: recebe como parâmetro uma cadeia de caracteres (`String`) e
    retorna essa cadeia invertida. Por exemplo, `reverse('abc')` retorna
    `'cba'`.

    **sort**: recebe como parâmetro uma lista (`Array`) de inteiros e retorna
    uma lista ordenada. Por exemplo, `sort([3, 1, 2])` retorna `[1, 2, 3]`.

    **upcase**: recebe como parâmetro uma cadeia de caracteres (`String`) e
    retorna essa cadeia com todos os caracteres maiúsculos. Por exemplo,
    `upcase('banana')` retorna `'BANANA'`. **Dica:** você pode utilizar um Hash
    para converter letras minúsculas para maiúsculas.

    > **Nota**: Ruby já disponibiliza as funções `reverse`, `sort` e `upcase`.
    Por questões de aprendizado você deve implementar seu próprio algoritmo.

    > **Dica:** Você pode utilizar o **IRB** para testar as expressões e
    > localizar os valores que devem ser preenchidos. Para abrir o **IRB**
    > utilize o comando `irb` no terminal do seu container Docker. Para fechá-lo
    > e retornar ao terminal, utilize o comando `quit` ou `exit`.


4. Quando você estiver satisfeito com o seu script, utilize a ferramenta `ep`
para executar a correção do exercício.
