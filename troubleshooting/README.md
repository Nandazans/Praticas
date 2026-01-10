dns-problems.md
# Problemas de DNS

## Descrição
Falhas de resolução de nomes em ambiente Windows.

## Sintomas
- Sites não carregam
- Internet funciona apenas por IP

## Diagnóstico
- ping 8.8.8.8
- nslookup google.com

## Solução
- ipconfig /flushdns
- Alterar DNS para 8.8.8.8 ou 1.1.1.1

## Escalonamento
Encaminhar para N2 se persistir.
