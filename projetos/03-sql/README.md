# Projeto 03 | SQL para análise de chamados

**Tipo:** exercício com dados fictícios  
**Nível:** SQL básico  
**Banco sugerido:** SQLite.

## Objetivo

Criar uma base simples de chamados de suporte e praticar consultas para responder perguntas operacionais: volume por status, chamados prioritários, tempo de resolução e sistemas com maior número de ocorrências.

Os registros são inventados e não representam clientes ou operações reais.

## Arquivos

- `consultas.sql`: criação das tabelas, inserção dos dados e consultas.
- `chamados.csv`: cópia dos registros fictícios para leitura ou importação.

## Como executar

1. Abra um cliente SQL compatível com SQLite.
2. Crie um banco de testes vazio.
3. Execute `consultas.sql` em sequência.
4. Observe os resultados e compare as consultas.

## Exercícios propostos

1. Quantos chamados existem por status?
2. Quais chamados estão classificados como alta prioridade?
3. Qual sistema possui mais chamados?
4. Quais chamados foram resolvidos e quanto tempo levaram?
5. Quais registros ainda estão abertos?

## O que este exercício demonstra

- Criação e leitura de tabelas.
- Uso de `SELECT`, `WHERE`, `JOIN`, `GROUP BY` e `ORDER BY`.
- Organização de dados operacionais.
- Transformação de perguntas de suporte em consultas.

## Próxima evolução

Depois de executar as consultas, acrescente uma consulta própria, a pergunta que ela responde, uma captura dos resultados com dados fictícios e uma explicação curta de cada resultado.

**Status:** script preparado para execução. Não declarar domínio prático antes de executar, validar e explicar as consultas.
