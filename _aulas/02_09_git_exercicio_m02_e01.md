---
layout: exercicio
modulo: 2
numero: 9
nome: "Exercício M02-E01"
title: "2.9 Aula de Git: Exercício M02-E01 | Estágio em Programação"
description: "Exercício M02-E01 de Git do curso online gratuito Estágio em
  Programação."
---

## Objetivos

- Aprender a criar um repositório Git no [GitHub](https://www.github.com); e
- Aprender a clonar o repositório na máquina local.

## Instruções

1. Crie o diretório para a resolução dos exercícios do módulo 2:

    ```bash
      mkdir -p ~/ep/exercicios/m2
    ```

2. Nesta aula, não será necessário criar outros diretórios específicos para cada um dos exercícios
dentro do diretório criado no passo anterior. Isso é devido ao fato de todos os exercícios se
baserem em repositório Git, ou seja, em um único diretório.

3. Crie uma conta no [GitHub](https://www.github.com), caso você ainda não tenha uma.

4. Através da interface web do GitHub, crie um novo repositório na sua conta com o nome
`ep-m2-repo`.

5. Agora, você irá clonar o repositório remoto criado no Github para o seu ambiente. O diretório do
repositório Git deve ser clonado dentro do diretório destinado aos exercícios do módulo 2. Então,
após clonar o respositório, deve existir o seguinte diretório no seu sistema de arquivos:

    ```bash
      ~/ep/exercicios/m2/ep-m2-repo
    ```

6. Para clonar o repositório, deverá ser usado o comando `git clone`. Você pode usar esse comando
fornecendo dois parâmetros:
  - O endereço (URL) do repositório remoto (que pode ser encontrado no Github); e
  - O nome diretório a ser criado localmente para receber o repositório.

    Então, use o comando da seguinte forma:

    ```bash
      git clone <repositorio> <diretorio>
    ```

    **Dica:** para fazer o clone do GitHub, utilize a opção __HTTPS__ ao invés de __SSH__. Isso vai
    facilitar o acesso ao repositório de dentro e de fora do container Docker. Nós recomendamos que
    todos os comandos de git sejam executados de fora do container, ou seja, do terminal do seu
    sistema operacional.

7. Utilize a ferramenta de correção automática do `ep` para verificar se está tudo certo.

    ```bash
      ep 2.1
    ```

    > **ATENÇÃO:** ao corrigir os exercícios, ignore warnings da gem `git`.
