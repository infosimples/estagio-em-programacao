---
layout: exercicio
modulo: 14
numero: 5
nome: "Exercício M14-E01"
title: "14.5 Aula de UNIX: Exercício M14-E01 | Estágio em Programação"
description: "Exercício M14-E01 da parte extra de Ruby on Rails do curso online
  gratuito Estágio em Programação."
---

## Objetivos

- Desenvolver uma aplicação web completa com Ruby on Rails;
- Ao concluir, consideramos que você está pronto para começar seu estágio em
  programação.

## Instruções

Você vai criar uma rede social onde usuários podem entrar e publicar mensagens.
Qualquer usuário pode ver todas as mensagens publicadas por qualquer usuário.

1. Crie uma aplicação Rails chamada **social**

2. Esta aplicação deve ter uma tela simples de login/cadastro como esta:

    <div class="row">
      <div class="col-6 offset-1 bg-light p-3">
        <form>
          <div class="form-group">
            <label for="exampleInputUsername">Usuário</label>
            <input type="text" class="form-control" id="exampleInputUsername">
          </div>
          <div class="form-group">
            <label for="exampleInputPassword1">Senha</label>
            <input type="password" class="form-control" id="exampleInputPassword1">
          </div>
          <button type="submit" class="btn btn-primary">Submit</button>
          <br>
          <a href="#">Crie uma conta</a>
        </form>
      </div>
    </div>

3. Crie uma área interna para usuários que fizeram login:

    <div class="row">
      <div class="col-6 offset-1 bg-light p-3">
        <div>
          <a href="#" class="text-secondary">Últimos posts</a> | <a href="#">Meus posts</a> | <a href="#">Sair</a>
        </div>
        <br>
        <form class="form-inline">
          <div class="form-group mx-sm-3 mb-2">
            <input type="text" class="form-control" placeholder="Sua mensagem...">
          </div>
          <button type="submit" class="btn btn-primary mb-2">Postar</button>
        </form>
        <br>
        <div class="text-center bg-secondary text-white p-3">
          ... apresentar os últimos posts ...
        </div>
      </div>
    </div>

### Regras de negócio

- Uma mensagem deve ter no mínimo 20 caracteres e no máximo 100 caracteres
- Ao clicar em "Sair", o usuário volta para a página de login
- A senha do usuário não pode ser armazenada em texto no banco de dados.
  [Leia aqui](https://blog.yarsalabs.com/storing-passwords-in-databases/) para entender melhor o que você deveria fazer.
