# Projeto 01 | Troubleshooting de aplicação

**Tipo:** estudo de caso simulado  
**Nível:** fundamentos de suporte N1/N2

## Cenário

Um usuário informa que não consegue acessar uma aplicação corporativa. A página abre, mas a operação de consulta apresenta erro. Outros usuários relatam funcionamento normal.

Este cenário é fictício e foi criado para praticar a organização do diagnóstico.

## Objetivo

- Delimitar o impacto.
- Coletar informações antes de alterar configurações.
- Verificar conectividade e resolução de nomes.
- Registrar evidências.
- Definir quando resolver ou escalar o chamado.

## Perguntas iniciais

1. Qual mensagem de erro aparece? Registrar o texto exato.
2. Quando o problema começou?
3. O erro ocorre com um usuário ou com vários?
4. Acontece em outro navegador ou estação?
5. O usuário consegue acessar outros sistemas?
6. Houve alteração recente de senha, rede, VPN ou perfil?

## Verificações iniciais

Executar apenas testes autorizados no ambiente de laboratório ou conforme procedimento da empresa.

| Verificação | Exemplo | O que observar |
|---|---|---|
| Configuração IP | `ipconfig /all` | Endereço IP, gateway e DNS |
| Resolução DNS | `nslookup host-lab.exemplo` | Se o nome resolve |
| Conectividade | `ping host-lab.exemplo` | Se há resposta; ausência de resposta não prova, isoladamente, falha do servidor |
| Porta do serviço | `Test-NetConnection host-lab.exemplo -Port 443` | Resultado de `TcpTestSucceeded` |
| Reprodução | Repetir a operação | Mensagem e comportamento consistentes |

Substitua o host pelo nome fictício configurado no laboratório. Não execute testes contra sistemas sem autorização.

## Árvore de diagnóstico

- **Falha de DNS:** registrar servidor DNS consultado, nome testado e resultado; encaminhar conforme responsabilidade da equipe de rede.
- **Falha de conectividade ou porta:** registrar origem, destino, horário e resultado; escalar para rede ou infraestrutura.
- **Conectividade normal, mas erro na aplicação:** registrar horário, etapa da operação, mensagem e passos para reproduzir; escalar para sustentação.
- **Problema restrito a um usuário ou equipamento:** comparar com um usuário/equipamento funcional, sem acessar dados além do necessário.

Um teste isolado não determina a causa raiz. A conclusão deve se apoiar em evidências e validação da equipe responsável.

## Modelo de registro do chamado

- **Título:** Erro ao realizar consulta na aplicação
- **Impacto:** usuário único / grupo / área / indisponibilidade geral
- **Início:** data e horário
- **Sintoma:** mensagem exata apresentada
- **Passos para reproduzir:** sequência objetiva
- **Testes realizados:** comando, horário e resultado
- **Evidências:** captura sem dados pessoais ou sensíveis
- **Ação executada:** somente o que foi efetivamente realizado
- **Escalonamento:** equipe acionada e informações encaminhadas
- **Validação:** confirmar com o usuário se o serviço voltou a funcionar

## Critério de encerramento

Encerrar somente após validar a solução com o usuário ou registrar formalmente o motivo pelo qual o chamado foi concluído/transferido, conforme o processo adotado.

## O que este exercício demonstra

Raciocínio estruturado de troubleshooting, coleta e organização de evidências, comunicação entre suporte e equipes especializadas e registro técnico reproduzível.

**Limitação:** cenário didático. Não há alegação de resolução de incidente real.
