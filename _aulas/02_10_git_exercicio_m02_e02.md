---
layout: exercicio
modulo: 2
numero: 10
nome: "Exercício M02-E02"
title: "2.10 Aula de Git: Exercício M02-E02 | Estágio em Programação"
description: "Exercício M02-E02 de Git do curso online gratuito Estágio em
  Programação."
---

## Objetivos

- Aprender a configurar o nome e o email do usuário no Git; e
- Entender que é possível existir uma configuração global do Git e outras configurações específicas
por repositório.

## Instruções

1. Quando um commit é criado, o nome e o email do autor do commit ficam associados a ele. Você deve
ter percebido isso quando usamos o comando `git log`, como destacado na imagem abaixo:

    ![screenshot-m2-e1-1]({{ '/assets/images/aulas/m02_e02_commit_author.png' | absolute_url }})

2. O Git não tira essa informação da cartola. É necessário que o nome e o email do programador sejam
configurados no ambiente para o que o Git registre corretamente essas informações nos commits. Essa
configuração é feita com o comando `git config`.

3. É possível fazer dois tipos de configurações:
    - **Configuração específica do repositório**: o nome e o email ficam salvos apenas para um
    repositório. Se o programador trabalha em mais de um projeto e, portanto, tem mais de um
    repositório no seu ambiente, é possível configurar nomes e emails diferentes em cada
    repositório.
    - **Configuração global**: é uma configuração geral do Git, que é utilizada caso não exista uma
    configuração específica para o repositório. No dia a dia, é comum que apenas a configuração
    global seja realizada.

4. O comando `git config` pode receber dois argumentos: o nome de uma variável e o valor desejado
para ela. Então, para alterar uma __configuração global__, use o comando:

    ```bash
      git config --global <variavel> <valor_desejado>
    ```

    E para alterar uma __configuração específica do repositório__, use o comando:

    ```bash
      git config <variavel> <valor_desejado>
    ```

    **Importante:** no caso de configuração específica, é necessário executar o comando dentro do
    diretório do repositório.

5. Abra o terminal do seu sistema operacional.

6. Configure o __nome de usuário global__ do Git como `Global User Name`. A variável que armazena o
nome de usuário é `user.name`.

7. Configure o __email de usuário global__ do Git como `global_user@email.com`. A variável que
armazena o email do usuário é `user.email`.

8. Entre no diretório do repositório local (`~/ep/exercicios/m2/ep-m2-repo`).

9. Configure com o seu nome o __nome do usuário específico__ do repositório. A variável que armazena
o nome de usuário é `user.name`

10. Configure com o seu email o __email do usuário específico__ do repositório. A variável que
armazena o email do usuário é `user.email`.

11. Utilize a ferramenta de correção automática do `ep` para verificar se está tudo certo.

    ```bash
      ep 2.2
    ```
