---
layout: exercicio
modulo: 1
numero: 12
nome: "Exercício M01-E03"
title: "1.12 Aula de UNIX: Exercício M01-E03 | Estágio em Programação"
description: "Exercício M01-E03 de UNIX do curso online gratuito Estágio em
  Programação."
---

## Objetivos

- Aprender a criar *shell scripts* ou, mais especificamente,
  [Bash](https://pt.wikipedia.org/wiki/Bash) scripts; e
- Aprender a usar comandos básicos para baixar conteúdo da Web;
- Aprender a usar comandos básicos de busca de palavras em um texto; e
- Aprender a fazer um shell script que recebe parâmetros.

## Conceitos novos

### Argumentos de um shell script

Um shell script pode ser chamado com argumentos. Todos os termos que você escreve depois do nome do
script ficam acessíveis dentro do script através das variáveis especiais `$1`, `$2`, etc. São
criadas tantas variáveis especiais quanto necessário, uma para cada argumento.

Por exemplo, se você criar um script chamado `meu_script.sh` com o conteúdo a seguir:

```bash
#!/bin/bash

echo "Primeiro parâmetro:" "$1"
echo "Segundo parâmetro:" "$2"
```

Em seguida, você pode chamar o script pelo terminal com dois parâmetros da seguinte forma:

```bash
# Note que os parâmetros são delimitados automaticamente por espaços em branco.
./meu_script.sh param-1 param-2
```

E a saída será:

```text
Primeiro parâmetro: param-1
Segundo parâmetro: param-2
```

**Importante:** Como os argumentos são delimitados por espaços em branco, se o seu argumento tiver
um espaço em branco, é necessário usar aspas em torno do argumento. Por exemplo:

```bash
./meu_script.sh "Parâmetro 1" "Parâmetro 2"
```

## Instruções

1. Crie um diretório para a resolução deste exercício, como você fez no exercício M01-E01.

2. No diretório do exercício (`~/ep/exercicios/m1/e3`), crie um arquivo com o nome `m1-e3.sh`.
Assim como no Exercício M01-E01, este arquivo será um shell script. Por isso, você já pode adicionar
o **shebang** na primeira linha do arquivo.

3. Escreva um *shell script* (sequência de comandos) que baixa um arquivo de uma URL (a URL deve ser
passada como primeiro parâmetro do script, e ficará armazenada na variável especial `$1`) e imprime
o número de ocorrências de um termo qualquer, passado pelo usuário como segundo parâmetro do script
(isto é, o termo de busca estará na variável especial `$2`). Use a comparação **case-insensitive**.

    Note que esse exercício é apenas uma generalização do exercício anterior, usando parâmetros ao
    invés de deixar a URL e o termo de busca especificados diretamente no código do script.

    Exemplo de execução e saída esperada:

    ![screenshot-w1-e1-2](/assets/images/aulas/m01_e03_out_example.png)

4. Teste o seu script. Para fazer isso:

      1. Apague arquivos temporários (por exemplo, o arquivo que você baixou da Web).

      2. Execute o seu script em um terminal. Valem as mesmas dicas do exercício M01-E01:
        verifique se o arquivo do script é **executável** e use o caminho até o script como se fosse o
        nome de um comando.

      3. Verifique se o seu script contou corretamente as ocorrências do termo passado.

5. Quando você estiver satisfeito com o seu script, utilize a ferramenta `ep`
   para executar a correção do exercício. Se você não se lembrar como fazer isso, pode consultar
   as instruções do exercício M01-E01.
