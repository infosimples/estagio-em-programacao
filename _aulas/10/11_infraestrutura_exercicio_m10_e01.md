---
layout: exercicio
modulo: 10
numero: 11
nome: "Exercício M10-E01"
title: "10.11 Aula de Infraestrutura: Exercício M10-E01 | Estágio em Programação"
description: "Exercício M10-E01 de infraestrutura web do curso online gratuito
    Estágio em Programação."
---

## Objetivos

- Fazer deploy de uma aplicação Ruby on Rails no Heroku.

## Instruções

1. Crie o diretório para a resolução deste exercício:

    ```bash
      mkdir -p ~/ep/exercicios/m10/e1
    ```

2. Faça um clone do repositório da aplicação `md5_generator` que está disponível no GitHub no endereço abaixo:

    [https://github.com/estagioemprogramacao/md5_generator](https://github.com/estagioemprogramacao/md5_generator)

3. Crie uma conta no [Heroku](https://www.heroku.com), caso você ainda não tenha uma.

4. Através da interface web do Heroku, crie um novo app na sua conta. Atribua a ele o nome que você quiser.

5. Realize a instalação do cliente de linha de comando do Heroku (Heroku CLI).

6. Usando o Heroku CLI, adicione o Heroku como um *remote* do seu repositório Git local.

7. Publique a aplicação no Heroku. Para isso, você deverá fazer um push do repositório para o Heroku usando o Git.

8. Realize a migração do banco de dados. Você precisará usar novamente o Heroku CLI e rodar a rake task de migração de banco de dados do Rails.

9. Abra o link que o Heroku gerou para a sua aplicação e verifique se ela está funcionando.

10. No diretório do exercício (`~/ep/exercicios/m10/e1`), crie um
arquivo com o nome `m10-e1.txt` e coloque na primeira linha dele a URL completa do seu app no Heroku.

11. Corrija o exercício usando o comando `ep 10.1`.
