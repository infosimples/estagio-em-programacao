---
layout: conteudo_geral
modulo: 12
numero: 2
nome: "Exercício M12-E01"
title: "12.2 Aula de UNIX: Exercício M12-E01 | Estágio em Programação"
description: "Exercício M12-E01 da parte extra de jQuery do curso online
  gratuito Estágio em Programação."
---

## Objetivos

- Praticar o uso de jQuery.

## Instruções

Você deve criar uma página Web com uma tabela que simula um orçamento de
compras como a de baixo:

{:.table.table-sm.table-bordered}
| Categoria | Item     | Preço        | Quantidade  |
|-----------|----------|--------------|-------------|
| Automóvel | GM Corsa | R$ 32.000,00 | [ _ _ _ _ ] |
| Comida    | Uva Kg   | R$ 7,50      | [ _ _ _ _ ] |

Você deve acessar o "web service" abaixo via jQuery para fazer o preenchimento
automático da tabela.

```
https://infosimples.github.io/estagio-em-programacao/assets/supplies/m11/webservice_items.json
```

Nas células da coluna **Quantidade** você deve usar um campo de texto que o
usuário poderá preencher com uma quantidade. Caso a quantidade preenchida seja
superior à quantidade em estoque, você deve emitir um alerta informando que a
quantidade foi atualizada para a quantidade disponível em estoque.
