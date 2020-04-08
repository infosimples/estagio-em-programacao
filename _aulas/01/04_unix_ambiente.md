---
layout: exercicio
modulo: 1
numero: 4
nome: "Criação do seu ambiente"
title: "1.4 Aula de UNIX: Ambiente de Desenvolvimento | Estágio em Programação"
description: "Aprenda a criar um ambiente de desenvolvimento baseado em Docker
  para realizar as atividades do curso."
---

Antes de prosseguir, recomendamos que você crie seu ambiente de desenvolvimento.
Nos próximos vídeos serão feitas demonstrações de comandos e encorajamos que
você também execute esses comandos em seu ambiente. Isso vai te ajudar a
consolidar os conceitos e a se familiarizar com o ambiente UNIX.

Quando o curso online do Estágio em Programação foi criado em 2017, o ambiente
de desenvolvimento sugerido para acompanhar o curso era uma máquina virtual
em nuvem criada com o serviço Cloud9. Muita coisa mudou desde então e hoje
recomendamos que você crie um ambiente com Docker no seu computador para as
atividades deste curso.

## Git

Para preparar o ambiente deste curso, você precisa instalar o Git via linha
de comando.

> Atenção: ainda não é necessário saber o que é Git. Você vai aprender sobre Git
> no módulo 2.

Faça [download](https://git-scm.com/downloads) e instale o Git.

## Docker

Vamos usar o Docker para criar um container (ambiente parecido com uma máquina
virtual) onde vamos realizar as atividades do curso.

Faça [download](https://docs.docker.com/install/) e instale o Docker.

## EP

A ferramenta de linha de comando do Estágio em Programação (`ep`) será usada
para corrigir os exercícios que você fará ao longo do curso.

Vamos assumir que o diretório onde você vai manter seus arquivos de estudos será
`~/ep`.

Clone o repositório do `ep` com o comando abaixo:

```bash
git clone https://github.com/infosimples/estagio-em-programacao-cli.git ~/ep
```

Prepare seu container Docker com o comando abaixo:

```bash
cd ~/ep
docker build -t ep .
```

Acesse um terminal `bash` no seu container Docker com o comando abaixo:

```bash
docker run -it -v ~/ep:/root/ep ep bash
```

## Como resolver um exercício

Dentro de um terminal `bash` no seu container Docker, execute o comando abaixo
para corrigir o exercício M01-E01 (módulo 1, exercício 1):

```bash
ep 1.1
```

O diretório esperado pelo corretor para a solução do exercício 1.1 é
`~/ep/exercicios/01/01`. Esse diretório é acessível tanto no seu computador
quanto no container Docker. Então você pode desenvolver a solução do exercício
no seu computador e corrigir o exercício no container do Docker.

## Dicas para a resolução dos exercícios

Tudo que você precisa para desenvolver e corrigir os exercícios deste curso já
está pronto. Recomendamos que você:

- Leia sempre o enunciado completo antes de começar.
- É importante você ter uma visão geral do exercício antes de sair executando
  comandos ou programando.
- Muitas vezes, surgirão algumas dúvidas que estarão respondidas mais para
  frente no enunciado. Se você começar a resolver o exercício antes de ler o
  enunciado por completo, pode acabar tendo alguns problemas desnecessariamente.
- **Leia sempre o enunciado completo antes de começar** (só para não esquecer).
- Pesquise! O Google é seu amigo.

Precisamos contar uma coisa para você: apenas com o conteúdo dos vídeos, você
não vai conseguir resolver 100% dos exercícios. Isso é proposital, porque um dos
objetivos deste curso é ajudá-lo a desenvolver suas habilidades de "se virar"
usando a documentação disponível, que será muito importante quando você for um
profissional.

Alguns anos atrás, para "se virar" era necessário ler manuais de centenas de
páginas sobre comandos, ferramentas, etc. Atualmente, buscadores como o Google e
portais como o Stack Overflow facilitaram muito a nossa vida, mas você ainda
precisa saber pesquisar e encontrar o que procura.

Autonomia para resolver problemas corriqueiros é fundamental na sua carreira
como programador.
