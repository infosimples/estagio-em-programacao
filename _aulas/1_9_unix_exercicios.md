---
layout: aula
modulo: 1
numero: 9
nome: "Exercícios"
title: "1.9 Aula de UNIX: Exercícios | Estágio em Programação"
description: "Faça exercícios avalie seus conhecimentos como programador em
  UNIX."
---

Na parte prática deste módulo, você irá desenvolver os conceitos dos vídeos em
**5 exercícios**:

1. **Shell script 1:** criação de arquivos
2. **Shell script 2:** download de arquivos e pesquisa de termos
3. **Shell script 3:** download de arquivos com passagem de parâmetros
4. **Shell script 4:** mini-manual de comandos básicos do Unix
5. **Jogo do mistério da linha de comando**

Veja como resolver os exercícios na página
[Preparação para os exercícios](https://gist.github.com/barbolo/a0e6b8fc993e8661c142113a6c7f5044#file-estagio-programacao-preparacao-exercicios-md).

Caso você já tenha executado os passos para a configuração do `ep-cli` descritos
no link acima, por favor, atualize o `ep-cli` executando os seguintes comandos
no seu terminal:

```bash
ep-cli-update
source ~/.ep/cli/install/bashrc
```

Caso o seu ep-cli comece a imprimir a mensagem de erro abaixo:

```
bash: cd: /home/ubuntu/.ep/cli: No such file or directory
```

Execute os comandos abaixo no seu terminal:

```bash
curl -o /tmp/cli-restore.sh http://api.estagioemprogramacao.com/downloads/cli/restore
chmod +x /tmp/cli-restore.sh
source /tmp/cli-restore.sh
```

