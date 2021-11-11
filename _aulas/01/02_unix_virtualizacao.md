---
layout: video
modulo: 1
numero: 2
nome: "Virtualização e Docker"
title: "1.2 Aula de UNIX: Virtualização e Docker | Estágio em Programação"
description: "Aprenda como utilizar ambientes virtualizados no seu trabalho
  como programador."
youtube_id: "KKDKxRmwamg"
---

## Docker

Quando o curso online do Estágio em Programação foi criado em 2017, Docker ainda
era uma tecnologia relativamente nova e imatura. Portanto, não tínhamos um vídeo
preparado para este tema. Vamos explicar mais sobre Docker nesta seção.

**Docker** é uma plataforma que permite a execução de aplicações em ambientes
isolados, com diferentes Sitemas Operacionais. Diferentemente de uma tecnologia
tradicional de virtualização, o Docker utiliza o mesmo kernel do Sistema
Operacional hospedeiro, tendo assim um desempenho muito melhor por não precisar
virtualizar hardware.

Chamamos de **contâiner** cada conjunto de aplicação + OS sendo executado no
Docker.

Recomendamos que você siga [este tutorial](https://docs.docker.com/get-started/)
, existente no site oficial do Docker.

No tutorial, você vai chegar em um momento em qeu é solicitado que você execute
o seguinte comando:
```bash
docker run -dp 80:80 docker/getting-started
```
Peço que execute o seguinte comando no lugar do anterior:
```bash
docker run -p 8080:80 docker/getting-started
```
Assim não criamos problemas de aplicações executando em background. Você vai
poder acessar o resto do tutorial ao entrar na URL [http://localhost:8080](http://localhost:8080)

## Kubernetes

Kubernetes é sistema de "orquestramento de contâiners", desenvolvido no Google.
Ele permite que um conjunto de contâiners possa trabalhar num cluster de
computadores, permitindo deploys e escalabilidade rápidos e eficientes.
