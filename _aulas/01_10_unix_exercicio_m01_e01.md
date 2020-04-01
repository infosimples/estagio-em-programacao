---
layout: exercicio
modulo: 1
numero: 10
nome: "Exercício M01-E01"
title: "1.10 Aula de UNIX: Exercício M01-E01 | Estágio em Programação"
description: "Exercício M01-E01 de UNIX do curso online gratuito Estágio em
  Programação."
---

## Objetivos

- Aprender a criar *shell scripts* ou, mais especificamente,
  [Bash](https://pt.wikipedia.org/wiki/Bash) scripts; e
- Aprender a usar comandos básicos para a criação de arquivos e diretórios.

## Instruções

1. Em primeiro lugar, precisamos criar um diretório para resolver este
exercício. Já que este passo irá se repetir para os outros exercícios do curso,
podemos já definir uma convenção que servirá para todos os módulos e exercícios:
    - Vamos usar o diretório em `~/ep/exercicios`.

    - Para cada módulo **X** (01, 02, 03, ...), vamos criar o diretório
    `~/ep/exercicios/mX`. Por exemplo: se você está começando agora os exercícios
    do módulo **m1**, crie o diretório `~/ep/exercicios/m1` usando o seguinte
    comando dentro do container Docker:

        ```bash
        mkdir -p ~/ep/exercicios/m1
        ```

    - Para cada exercício **Y** (01, 02, 03, ...), vamos criar o diretório
    `~/ep/exercicios/mX/eY`. Por exemplo: se você está começando agora o
    exercício **m1** do módulo **e1**, crie o diretório `~/ep/exercicios/m1/e1`
    usando o seguinte comando:

        ```bash
        mkdir -p ~/ep/exercicios/m1/e1
        ```

    Depois deste passo, você deverá ter criado o diretório
    `~/ep/exercicios/m1/e1`, o que pode ser verificado usando o comando `ls`.

2. Dentro do diretório do exercício (`m1/e1`), crie um arquivo de solução
chamado `m1-e1.sh`. Lembre-se de que você pode criar arquivos pelo terminal
usando o comando `touch`.

3. Abra o arquivo `m1-e1.sh` com o editor de texto de sua preferência.
Em seguida, adicione o seguinte conteúdo a este arquivo:

    ```bash
    #!/usr/bin/env bash

    # Este arquivo é um shell script vazio.
    #
    # A primeira linha deste arquivo (começando com "#!") é conhecida como 'shebang',
    # e indica que o conteúdo deste arquivo deve ser interpretado pelo executável
    # 'bash'. Se o arquivo contivesse comandos em Python, por exemplo, o shebang
    # correto seria '#!/usr/bin/env python', e assim por diante para outras
    # linguagens.
    #
    # Linhas que começam com '#' são apenas comentários.
    # No restante deste arquivo, você pode escrever linhas de comando que serão
    # executadas como se você as executasse diretamente no seu terminal.
    ```

4. Leia o conteúdo que foi adicionado ao arquivo com atenção.

5. Neste arquivo, escreva um *shell script*, isto é, uma sequência de comandos,
   que cria os diretórios e arquivos mostrados na figura abaixo.
    <br>
    <br>
    <br>
    ![screenshot-w1-e1-2]({{ '/assets/images/aulas/m01_e01_fs_tree.png' | absolute_url }})
    <br>
    <br>
    <br>
    **Dica 1:** por exemplo, se o objetivo do seu *shell script* fosse
    simplesmente imprimir a mensagem "Olá, mundo", ele poderia ser algo assim:

    ```bash
    #!/usr/bin/env bash

    echo "Olá, mundo"
    ```

    **Dica 2:** cuidado com os caminhos utilizados no script! Neste exercício,
    utilize apenas caminhos absolutos para evitar possíveis problemas.

5. Teste o seu script. Para fazer isso:

    1. Apague todos os arquivos e/ou diretórios temporários (de teste) que você
    talvez tenha criado no passo anterior;

    2. Execute o seu script em um terminal. Para fazer isso, supondo que o seu
    script realmente seja um arquivo executável (veja a dica abaixo)
    simplesmente use o caminho até o script como se fosse o nome de um comando,
    como nos exemplos abaixo:

        ```bash
        # Esta forma de executar o script funciona sempre, independentemente do seu
        # diretório atual, porque o caminho é absoluto.
        ~/ep/exercicios/m1/e1/m1-e1.sh

        # Esta outra forma usa um caminho relativo. Ela funciona se você passar
        # o caminho relativo correto, como neste exemplo.
        cd ~/ep/exercicios/m1/e1
        ./m1-e1.sh
        ```

        **Dica**: certifique-se de que o arquivo é um executável, isto é, que o
        seu usuário tem a **permissão de execução** para este arquivo (lembre-se
        do comando `chmod`).

    3. Verifique se o seu script criou os arquivos e diretórios corretamente.
    Por exemplo: de acordo com a figura, o diretório 'fer' deve ser um link
    simbólico para o diretório 'fernando'. Isso pode ser verificado com o
    comando `ls`:

        ![screenshot-w1-e1-2]({{ '/assets/images/aulas/m01_e01_ls_out.png' | absolute_url }})

6. Quando você estiver satisfeito com o seu script, utilize a ferramenta `ep`
   para executar a correção do exercício:

    ```bash
    ep 1.1
    ```
