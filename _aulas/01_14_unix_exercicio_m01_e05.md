---
layout: exercicio
modulo: 1
numero: 14
nome: "Exercício M01-E05"
title: "1.14 Aula de UNIX: Exercício M01-E05 | Estágio em Programação"
description: "Exercício M01-E05 de UNIX do curso online gratuito Estágio em
  Programação."
---

## Objetivos

- Praticar o uso de comandos básicos de UNIX através de um jogo de mistério.

## Enunciado

### Assassinato na Linha de Comando

```text
.OOOOOOOOOOOOOOO @@                                   @@ OOOOOOOOOOOOOOOO.
OOOOOOOOOOOOOOOO @@                                    @@ OOOOOOOOOOOOOOOO
OOOOOOOOOO'''''' @@                                    @@ ```````OOOOOOOOO
OOOOO'' aaa@@@@@@@@@@@@@@@@@@@@"""                   """""""""@@aaaa `OOOO
OOOOO,""""@@@@@@@@@@@@@@""""                                     a@"" OOOA
OOOOOOOOOoooooo,                                            |OOoooooOOOOOS
OOOOOOOOOOOOOOOOo,                                          |OOOOOOOOOOOOC
OOOOOOOOOOOOOOOOOO                                         ,|OOOOOOOOOOOOI
OOOOOOOOOOOOOOOOOO @          ASSASSINATO                  |OOOOOOOOOOOOOI
OOOOOOOOOOOOOOOOO'@           NA                           OOOOOOOOOOOOOOb
OOOOOOOOOOOOOOO'a'            LINHA                        |OOOOOOOOOOOOOy
OOOOOOOOOOOOOO''              DE                           aa`OOOOOOOOOOOP
OOOOOOOOOOOOOOb,..            COMANDO                       `@aa``OOOOOOOh
OOOOOOOOOOOOOOOOOOo                                           `@@@aa OOOOo
OOOOOOOOOOOOOOOOOOO|                                             @@@ OOOOe
OOOOOOOOOOOOOOOOOOO@                               aaaaaaa       @@',OOOOn
OOOOOOOOOOOOOOOOOOO@                        aaa@@@@@@@@""        @@ OOOOOi
OOOOOOOOOO~~ aaaaaa"a                 aaa@@@@@@@@@@""            @@ OOOOOx
OOOOOO aaaa@"""""""" ""            @@@@@@@@@@@@""               @@@|`OOOO'
OOOOOOOo`@@a                  aa@@  @@@@@@@""         a@        @@@@ OOOO9
OOOOOOO'  `@@a               @@a@@   @@""           a@@   a     |@@@ OOOO3
`OOOO'       `@    aa@@       aaa"""          @a        a@     a@@@',OOOO'
```


Aconteceu um assassinato na Cidade do Terminal, e a polícia precisa da sua ajuda.

Para descobrir o culpado, você precisará de acesso a uma linha de comando.

## Instruções

1. Crie um diretório para a resolução deste exercício, como você fez no exercício M01-E01.

2. Faça o download do jogo usando os seguintes comandos:

    ```bash
    # Cria uma variável para armazenar o caminho até o diretório do exercício.
    # Note que não é permitido colocar espaços antes ou depois do sinal de "=".
    dir_e5=~/ep/exercicios/m1/e5
    mkdir -p $dir_e5

    # Download do jogo na forma de um arquivo zip.
    wget https://github.com/deborasetton/clmystery/archive/pt-BR.zip -O $dir_e5/clmystery.zip

    # Extrai o conteúdo do zip para o diretório clmystery.
    unzip $dir_e5/clmystery.zip -d $dir_e5/clmystery

    # Renomeia o diretório do mistério.
    mv $dir_e5/clmystery/clmystery-pt-BR $dir_e5/misterio-init
    ```

3. Vá até o diretório do jogo:

    ```bash
    cd ~/ep/exercicios/m1/e5/misterio-init
    ```
4. Leia o arquivo `inicio`. Uma forma de fazer isto é com o seguinte comando:

    ```bash
    cat inicio
    ```

5. Resolva o mistério usando as instruções e pistas fornecidas. Não use um editor de texto para ler os arquivos! A ideia é aprender a usar os
comandos básicos do Unix para resolver o mistério.

    Aqui está um resumo de alguns comandos que poderão ser úteis (você também pode
    usar outros além desses):

+ `cd`: muda o diretório atual.
+ `ls`: lista arquivos existentes em um diretório.
+ `cat`: imprime o conteúdo de um ou mais arquivos.
+ `head`: imprime as primeiras linhas de um arquivo.
+ `tail`: imprime as últimas linhas de um arquivo.
+ `grep`: busca um texto em um ou mais arquivos. Por padrão, imprime na saída as linhas que continham o texto buscado.

### Dicas

- Não se esqueça de que a maioria dos comandos aceita opções para alterar o
comportamento (por exemplo, formatar a saída de um jeito diferente). Utilize
o comando `man` para saber mais sobre as opções aceitas por um comando,
e.g. `man grep`.

- Se você estiver com dificuldade em algum ponto, consulte os arquivos de
dicas, em ordem (`dica1`, `dica2`, `dica3`, etc).

### Solução

Para ver a solução, leia o arquivo `solucao`.

### Créditos

A versão original deste mistério foi escrita por [Noah Veltman](http://github.com/veltman).

### Correção do exercício

1. No diretório do exercício (`m1/e5`), crie um arquivo de texto com o nome `m1-e5.txt`.

2. Nesse arquivo, escreva a solução para o mistério, isto é, escreva o nome do assassino que você
identificou. Por exemplo, se o assassino for "Maria da Silva", o conteúdo do arquivo deverá ser:

    ```text
    Maria da Silva
    ```

3. Quando você estiver satisfeito com o seu script, utilize a ferramenta `ep`
   para executar a correção do exercício. Se você não se lembrar como fazer isso, pode consultar
   as instruções do exercício M01-E01.
