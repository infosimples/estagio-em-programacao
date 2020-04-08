---
layout: exercicio
modulo: 1
numero: 13
nome: "Exercício M01-E04"
title: "1.13 Aula de UNIX: Exercício M01-E04 | Estágio em Programação"
description: "Exercício M01-E04 de UNIX do curso online gratuito Estágio em
  Programação."
---

## Objetivos

- Aprender um pouco mais sobre alguns comandos importantes do Bash; e
- Aprender a usar estruturas de controle de fluxo condicionais, como `case` ou `if`.

## Instruções

1. Crie um diretório para a resolução deste exercício, como você fez no exercício M01-E01.

2. No diretório do exercício (`~/ep/exercicios/m1/e4`), crie um arquivo com o nome `m1-e4.sh`.
Assim como no exercício M01-E01, este arquivo será um shell script. Por isso, você já pode adicionar o **shebang**
na primeira linha do arquivo.

3. Escreva um *shell script* (sequência de comandos) que recebe como parâmetro
  o nome de um comando do Unix e imprime na tela uma breve descrição do que o comando faz.
  A descrição do comando deve ser escrita por você e deve ser de acordo com o seu entendimento
  sobre o que o comando faz. Você pode também incluir as opções mais comuns para aquele comando,
  assim como exemplos de uso.

    Seu script deverá conter as descrições simplificadas de, no mínimo, os seguintes comandos:
    `cd`, `ls`, `pwd`, `cat`, `rm`, `mv`, `chmod`, `man`, `touch` e `grep`.

    A primeira linha de cada descrição deve começar com o nome do comando seguido de dois pontos.
    Por exemplo:<br>
    "**cd: Descrição do cd...**". A figura abaixo mostra um exemplo completo de execução e da
    saída esperada:

    ![screenshot-w1-e1-2]({{ '/assets/images/aulas/m01_e04_out_example.png' | absolute_url }})

    **Dica:** para cada comando que você for descrever, leia o manual do comando, entenda
    o que ele faz e resuma em suas palavras o que acredita que ele faça. Lembre-se de que a documentação de um comando qualuqer pode ser visualizada usando o comando `man` ou ainda usando a opção `--help`. Por exemplo, para conhecer mais sobre o comando `ls`, você pode executar `man ls` ou `ls --help` no terminal.

4. Teste o seu script. Para fazer isso, execute diversas vezes o seu script em um terminal, passando
como argumento cada um dos comandos que você descreveu.

5. Quando você estiver satisfeito com o seu script, utilize a ferramenta `ep`
   para executar a correção do exercício. Se você não se lembrar como fazer isso, pode consultar
   as instruções do exercício M01-E01.
