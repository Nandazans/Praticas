# Projeto 02 | Active Directory: consultas em laboratório

**Tipo:** laboratório didático  
**Nível:** fundamentos de consulta  
**Escopo:** leitura de informações; nenhuma alteração em contas ou permissões.

## Objetivo

Praticar consultas de usuários e grupos do Active Directory usando PowerShell, entendendo quais informações podem apoiar uma triagem de suporte.

Este material não afirma experiência de administração de domínio em produção. Execute as consultas somente em domínio de laboratório autorizado.

## Pré-requisitos

- Máquina Windows integrada a um domínio de laboratório.
- Módulo PowerShell `ActiveDirectory` disponível (RSAT).
- Permissão de leitura no diretório.
- Conta autorizada.

Verifique a disponibilidade do módulo:

```powershell
Get-Module -ListAvailable ActiveDirectory
```

Carregue o módulo:

```powershell
Import-Module ActiveDirectory
```

## Consultas de exemplo

Consultar uma conta pelo login:

```powershell
Get-ADUser -Identity "usuario.teste" -Properties Enabled,LockedOut,LastLogonDate |
    Select-Object SamAccountName,Enabled,LockedOut,LastLogonDate
```

Listar usuários habilitados:

```powershell
Get-ADUser -Filter 'Enabled -eq $true' |
    Select-Object Name,SamAccountName
```

Consultar os membros de um grupo:

```powershell
Get-ADGroupMember -Identity "GRP-SUPORTE-LAB" |
    Select-Object Name,ObjectClass,SamAccountName
```

Consultar grupos de uma conta:

```powershell
Get-ADPrincipalGroupMembership -Identity "usuario.teste" |
    Select-Object Name,GroupScope,GroupCategory
```

## Roteiro de prática

1. Criar um domínio de laboratório seguindo documentação oficial da Microsoft ou utilizar ambiente de treinamento autorizado.
2. Criar contas e grupos fictícios no laboratório.
3. Executar as consultas.
4. Comparar resultados com o cadastro esperado.
5. Registrar comandos, resultados e interpretação sem dados reais.

## Relação com o suporte

As consultas podem ajudar a investigar:
- A conta existe no diretório?
- A conta está habilitada?
- O indicador de bloqueio está ativo?
- A conta pertence ao grupo esperado?

Interprete os resultados conforme as políticas do ambiente. Por exemplo, `LastLogonDate` não deve ser tratado como prova absoluta de atividade em tempo real.

## Segurança

- Não executar comandos de desbloqueio, redefinição de senha, criação ou exclusão de usuários neste exercício.
- Não consultar diretórios de empresas sem autorização.
- Não publicar nomes, grupos, domínios, e-mails ou informações reais.
- Em produção, seguir o processo de aprovação e controle de acesso da organização.

## Evidências para acrescentar após executar

- Versão do Windows/PowerShell utilizada.
- Confirmação de que o módulo foi carregado.
- Captura de tela com dados exclusivamente fictícios.
- Exemplo de consulta e breve explicação do resultado.

**Status:** roteiro de laboratório. As consultas ainda precisam ser executadas e documentadas no ambiente de estudo.
