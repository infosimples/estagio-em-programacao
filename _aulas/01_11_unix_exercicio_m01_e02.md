---
layout: exercicio
modulo: 1
numero: 11
nome: "Exercício M01-E02"
title: "1.11 Aula de UNIX: Exercício M01-E02 | Estágio em Programação"
description: "Exercício M01-E02 de UNIX do curso online gratuito Estágio em
  Programação."
---

## Objetivos

- Aprender a criar *shell scripts* ou, mais especificamente,
  [Bash](https://pt.wikipedia.org/wiki/Bash) scripts; e
- Aprender a usar comandos básicos para baixar conteúdo da Web; e
- Aprender a usar comandos básicos de busca de palavras em um texto.

## Instruções

1. Crie um diretório para a resolução deste exercício, como você fez no
Exercício 1.

2. No diretório do exercício (`~/ep/exercicios/m1/e2`), crie um arquivo com o
nome `m1-e2.sh`. Assim como no Exercício 1, este arquivo será um shell script.
Por isso, você já pode adicionar o **shebang** na primeira linha do arquivo.

3. Escreva um *shell script* (sequência de comandos) que baixa o arquivo HTML da
URL [http://www.tldp.org/LDP/intro-linux/html/intro-linux.html](http://www.tldp.org/LDP/intro-linux/html/intro-linux.html)
e escreve na tela as seguintes linhas:

    ```text
    Linux: X
    linux: Y
    linux (case-insensitive): Z
    ```

    Em que:
      - X = número de ocorrências do termo "Linux"
      - Y = número de ocorrências do termo "linux"
      - Z = número de ocorrências do termo "linux" não importando se as letras
        estão em maiúsculo ou minúsculo (isto é, *case-insensitive*)

    A contagem Z deve incluir a contagem feita em X e em Y e deve acrescentar
    ainda termos como "liNux" em que há uma mistura entre letras maiúsculas e
    minúsculas. Esse tipo de comparação entre palavras em que não importa se as
    letras são maiúsculas ou minúsculas chamamos de comparação
    *case-insensitive*.

    **Dica 1:** para baixar uma página da Web, você pode utilizar o comando
    `wget`, que recebe uma URL como parâmetro e salva a página em um arquivo. O
    nome do arquivo pode ser controlado usando a opção `-O`.

    **Dica 2:** lembre-se de que os comandos podem ser utilizados com opções.
    Estas opções podem ser visualizadas usando o comando `man` ou ainda usando a
    opção `--help`. Por exemplo, para conhecer mais sobre o comando `wget`, você
    pode executar `man wget` ou `wget --help` no terminal.

5. Teste o seu script. Para fazer isso:

    1. Apague arquivos temporários (por exemplo, o arquivo que você baixou da
    Web).

    2. Execute o seu script em um terminal. Valem as mesmas dicas do [Exercício 1](m01-e01.html):
    verifique se o arquivo do script é **executável** e use o caminho até o script como se fosse o
    nome de um comando.

    3. Verifique se o seu script contou corretamente os números dos termos pedidos.
    O resultado deverá ser parecido com o exemplo abaixo. Note que os números aqui são apenas
    exemplos, e não o resultado esperado.

        ```text
        Linux: 243
        linux: 20
        linux (case-insensitive): 271
        ```
6. Quando você estiver satisfeito com o seu script, utilize a ferramenta `ep-cli`
   para executar a correção do exercício. Se você não se lembrar como fazer isso, pode consultar
   as instruções do [Exercício 1](m01-e01.html) ou executar `ep-cli --help` no terminal.

7. Quando você tiver finalizado o exercício, utilize a ferramenta `ep-cli`
   para enviar o resultado. Se você não se lembrar como fazer isso, pode consultar
   as instruções do [Exercício 1](m01-e01.html) ou executar `ep-cli --help` no terminal.
