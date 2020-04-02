---
layout: exercicio
modulo: 2
numero: 11
nome: "Exercício M02-E03"
title: "2.11 Aula de Git: Exercício M02-E03 | Estágio em Programação"
description: "Exercício M02-E01 de Git do curso online gratuito Estágio em
  Programação."
---

## Objetivos

- Aprender a adicionar arquivos ao repositório;
- Aprender a remover arquivos do repositório;
- Aprender a criar commits no repositório local; e
- Aprender a enviar commits para o repositório remoto.

## Instruções

1. Na raiz do repositório (`~/ep/exercicios/m2/ep-m2-repo`), crie o arquivo `a.txt`.

2. Adicione este arquivo para o próximo commit, usando o comando `git add`.

3. Crie um commit com a seguinte mensagem:

    ```
      Adicionado o arquivo a.txt
    ```

4. Na raiz do repositório (`~/ep/exercicios/m2/ep-m2-repo`), crie o arquivo `b.txt`.

5. Adicione este arquivo para o próximo commit, usando o comando `git add`.

6. Crie um commit com a seguinte mensagem:

    ```
      Segundo commit - adicionado o arquivo b.txt
    ```

7. __Remova do repositório__ o arquivo `b.txt`. Note que não basta exclui-lo do sistema de arquivos, é preciso removê-lo do controle de versão, usando o comando `git rm`.

8. Crie um commit (que remove o arquivo mencionado) com a seguinte mensagem:

    ```
      Arquivo b.txt removido
    ```

9. Usando o comando `git push`, envie os commits criados para o repositório remoto no GitHub. Tenha certeza de que a branch local chama-se `master` (você pode usar o comando `git status` para verificar) e que a branch do repositório remoto seja `origin/master`.

10. Utilize a ferramenta de correção automática do `ep` para verificar se está tudo certo.

    ```bash
      ep 2.3
    ```

    > **ATENÇÃO:** ao corrigir os exercícios, ignore warnings da gem `git`.

### Dica

Caso você cometa algum erro ao criar commits, os commandos `git checkout`, `git reset` e `git commit --amend` podem ser úteis, dependendo do caso. Pesquise como utilizá-los, caso necessário.

Esses comandos podem ajudar a resolver, por exemplo, casos de:

- Mensagem errada de commit;
- Arquivos com nomes errados;
- Arquivos adicionados ou removidos incorretamente.
