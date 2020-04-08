---
layout: exercicio
modulo: 5
numero: 11
nome: "Exercício M05-E03"
title: "5.11 Aula de REGEX: Exercício M05-E03 | Estágio em Programação"
description: "Exercício M05-E03 de Expressões Regulares (REGEX) do curso online
  gratuito Estágio em Programação."
---

## Objetivos

- Treinar manipulações básicas de arquivos em Ruby; e
- Utilizar expressões regulares para analisar arquivos relativamente grandes.

## Enunciado do desafio

DDoS (*Distributed Denial of Service*) é o nome dado a um método de ataque que visa deixar um servidor indisponível através de uma sobrecarga de tráfego vinda de múltiplas fontes.

Você trabalha em uma empresa que suspeita que um de seus servidores está sofrendo um ataque deste tipo. Você recebeu o arquivo de log deste servidor e deverá analisá-lo para tentar identificar se existe qualquer indício de ataque.

Um arquivo de log contém, por exemplo, informações sobre as requisições recebidas. Neste caso, cada linha do arquivo de log refere-se a uma requisição diferente recebida pelo servidor.

Um trecho do arquivo está representado abaixo.

```
2016-06-26 23:57:17 - 243.171.198.248: ERRO | lib/docs/passwords.txt (USUÁRIO BLOQUEADO)
2016-06-26 23:58:00 - 253.251.79.74: OK | docs/linux.iso
2016-06-26 23:58:33 - 110.57.184.189: ALERTA | drivers/sheets.dll
```

Cada linha contém:

- A data e a hora da requisção.
- O endereço IP que fez a requisição.
- O status gerado pelo servidor (OK, ALERTA ou ERRO).
- O caminho completo do arquivo acessado.
- No caso de erro, é apresentado o motivo do erro no final da linha, entre parênteses.

## Instruções

1. Crie o diretório para a resolução deste exercício:

    ```bash
      mkdir -p ~/ep/exercicios/m5/e3
    ```

2. No diretório do exercício (`~/ep/exercicios/m5/e3`), crie um arquivo com o nome `m5-e3.txt`.

3. Baixe o arquivo `log-do-servidor.log` para o diretório do exercício, usando o comando abaixo.

    ```bash
    curl https://infosimples.github.io/estagio-em-programacao/assets/supplies/m05/log-do-servidor.log -o ~/ep/exercicios/m5/e3/log-do-servidor.log
    ```

4. Faça um script em Ruby (você pode usar o IRB ou criar um arquivo Ruby com o seu script) **que utiliza expressões regulares** para responder às perguntas abaixo:
    - Existe algum IP que fez um número mais elevado de requisições do que os demais?
    - Quantas requisições com status ALERTA ou ERRO, originadas de quaisquer IPs, existem no log?
    - Qual o nome do arquivo (sem o caminho, somente o nome) acessado na requisção feita em 21/07/2016 às 00:17:50?
    - Qual o motivo do erro da requisição feita em 31/07/2016 às 06:11:20?

5. Você deverá colocar as respostas no arquivo `m5-e3.txt`, uma por linha, nas quatro primeiras linhas do arquivo. **Exemplo** de como deve ficar o arquivo de solução:

    ```
    000.000.000.000
    15
    exemplo.txt
    EXEMPLO DE MENSAGEM DE ERRO
    ```

6. Utilize a ferramenta de correção automática do `ep` para verificar se está tudo certo.

    ```bash
      ep 5.3
    ```

## Dicas

- Não tente usar um editor de texto para analisar o arquivo pois possivelmente ele travará devido ao tamanho do arquivo.

- Você pode usar comandos do terminal, como `head` ou `tail`, para olhar partes do log sem travar o computador.

- O script não deve carregar o conteúdo inteiro do arquivo em memória, pois isso pode fazer o seu programa travar. Pense em uma forma mais eficiente.

- Você precisará usar alguma estrutura de dados para contabilizar as requisições de cada IP. A sugestão é usar um hash.
