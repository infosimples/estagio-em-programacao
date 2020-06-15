---
layout: conteudo_geral
modulo: 15
numero: 2
nome: "Scraping - Ferramentas - Parte 1"
title: "15.2 [Extra] Scraping | Estágio em Programação"
description: "Aprenda sobre Scraping do curso online
  gratuito Estágio em Programação."
---

## Web Browsers (Navegadores)

O [Google Chrome](http://www.google.com/chrome) e o [Mozilla Firefox](http://www.mozilla.org/en-US/firefox/new/) são dois navegadores de internet
gratuitos e de código aberto (no caso do Firefox) ou semi-aberto (no caso do
Chrome). A utilização de qualquer um destes navegadores é uma das mais
importantes ferramentas de apoio para a criação de scrapers, visto que ambos
possuem as seguintes características:

  * Podem ser instalados nos sistemas operacionais mais comumente utilizados;
  * Possuem opções flexíveis de customização;
  * Servem como plataforma base para a execução de outras ferramentas mais avançadas e específicas utilizadas na criação de um scraper.

Há uma infinidade de add-ons disponíveis gratuitamente para estes navegadores, com funcionalidades que facilitam enormemente a produção de um software que manipula dados da internet.

### Developer Tools

Tanto o Firefox quanto o Chrome possuem ferramentas que se integram de tal maneira aos navegadores que permitem visualização, edição, debug e monitoramento de HTML, CSS, JavaScript e tráfego de rede em tempo de carregamento de qualquer página web.

A funcionalidade de inspeção de código HTML permite identificar e entender a estrutura de uma página ou parte da página de maneira muito simples, simplesmente indicando com o mouse a área da página que deve ser inspecionada.

Além disso, existe um console no qual é possível inserir código JavaScript que é executado diretamente na página aberta.

Outra funcionalidade muito útil para a criação de scrapers é o monitoramento do tráfego de rede. Estas ferramentas capturam todas as requisições que o navegador faz através da rede e as apresenta de forma muito completa, agrupando amigavelmente os tipos de arquivos que foram recebidos (imagens, CSS, JavaScript, HTML, etc). Nesta área é possível visualizar o endereço completo para onde uma requisição foi feita, qual o método HTTP utilizado (GET, POST, etc), quais os parâmetros enviados, quais os cabeçalhos (headers) da requisição e qual a resposta do servidor, entre outras informações.

Este painel é útil para quando é necessário saber como o site interage com o servidor em background (muitas vezes sem o usuário perceber), quais os parâmetros precisam ser enviados para cada requisição, etc.

<img src="{{ '/assets/images/aulas/m15_developer_tools.png' | absolute_url }}" alt="Developer Tools exemplo" style="width: 600px;">

### Edit This Cookie

O Edit This Cookie é um plugin para Chrome que permite alterar o conteúdo de um cookie. Ele é útil quando se deseja alterar a sessão do seu usuário em uma aplicação ou atributos gravados em cookie. Ele também é útil para reiniciar a sessão atual, removendo todos os cookies atrelados a ela. Existe uma versão similar deste plugin para o Firefox, denominado Cookie Editor.