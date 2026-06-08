# Guia de Configuração de Secrets — Ruflo Workspace

> **IMPORTANTE**: Nunca insira valores reais de secrets em arquivos de código, commits, logs, ou chats.
> Todos os secrets devem ser configurados SOMENTE via interface de Secrets do GitHub.

## Visão Geral de Segurança

Este guia detalha como configurar corretamente os secrets para ativar os workflows Ruflo em todos os repositórios. O budget de Actions está configurado em **$5,00** com bloqueio automático, garantindo zero surpresas financeiras.

## Secrets Necessários por Categoria

### 1. Ruflo Core
| Secret | Descrição | Onde obter |
|---|---|---|
| `RUFLO_API_KEY` | Chave de API do Ruflo | https://ruflo.ai/dashboard |

### 2. Anthropic / Claude
| Secret | Descrição | Onde obter |
|---|---|---|
| `ANTHROPIC_API_KEY` | Chave de API do Claude | https://console.anthropic.com |

> **Custo estimado Anthropic**: Com o roteamento configurado (haiku para tarefas simples, sonnet para desenvolvimento, opus para arquitetura), o custo por execução completa do swarm é estimado em $0.10–0.30. O agendamento diurnos (seg-sex) mantém o custo mensal controlado.

### 3. Vercel Deploy
| Secret | Descrição | Onde obter |
|---|---|---|
| `VERCEL_TOKEN` | Token de acesso pessoal | https://vercel.com/account/tokens |

> **Atenção**: O Vercel Pro é $20/mês por usuário. O plano Hobby gratuito funciona para projetos pessoais. Não crie projetos Vercel extras desnecessários.

### 4. Supabase (por projeto)
| Secret | Descrição | Onde obter |
|---|---|---|
| `SUPABASE_URL` | URL do projeto Supabase | Supabase Dashboard > Settings > API |
| `SUPABASE_KEY` | Chave anon/service_role | Supabase Dashboard > Settings > API |
| `SUPABASE_SERVICE_ROLE_KEY` | Chave service_role (apenas CI/CD) | Supabase Dashboard > Settings > API |

> **Custo Supabase**: Plano Free inclui 500MB DB, 1GB storage, 50MB transfer. Projetos pagos só se necessário. Não pause projetos ativos sem aviso.

### 5. Stripe (ClubFlow, PetSkin)
| Secret | Descrição | Onde obter |
|---|---|---|
| `STRIPE_SECRET_KEY` | Chave secreta Stripe | https://dashboard.stripe.com/apikeys |
| `STRIPE_WEBHOOK_SECRET` | Secret do webhook | Stripe Dashboard > Webhooks |

> **ATENÇÃO FINANCEIRA**: A chave `STRIPE_SECRET_KEY` em modo live dá acesso a transações reais. Use SOMENTE chaves de teste nos workflows de CI/CD. Nunca use chaves live em Actions.

## Como Configurar Secrets no GitHub

### Para um repositório individual:
1. Acesse o repositório no GitHub
2. Clique em **Settings** (aba superior direita)
3. No menu lateral, clique em **Secrets and variables** > **Actions**
4. Clique em **New repository secret**
5. Insira o nome exato (ex: `RUFLO_API_KEY`) e o valor
6. Clique em **Add secret**

### Links diretos para configurar secrets:

| Repositório | Link de Secrets |
|---|---|
| ClubFlow | https://github.com/antonioneto19/ClubFlow/settings/secrets/actions |
| VetBooking | https://github.com/antonioneto19/VetBooking/settings/secrets/actions |
| PetSkin | https://github.com/antonioneto19/landing-page-Petskin-cursos-dra-cristiane-freitas/settings/secrets/actions |
| Bridge-Command-Center | https://github.com/antonioneto19/Bridge-Command-Center/settings/secrets/actions |
| CONSULTORIA-ECOCIL | https://github.com/antonioneto19/CONSULTORIA-ECOCIL/settings/secrets/actions |
| laconelli-brand | https://github.com/antonioneto19/laconelli-brand/settings/secrets/actions |

## Checklist de Configuração (por repositório)

```
[ ] RUFLO_API_KEY configurado
[ ] ANTHROPIC_API_KEY configurado
[ ] VERCEL_TOKEN configurado (se faz deploy Vercel)
[ ] SUPABASE_URL configurado (se usa Supabase)
[ ] SUPABASE_KEY configurado (se usa Supabase)
[ ] STRIPE_SECRET_KEY configurado (SOMENTE chave TEST para CI/CD)
[ ] STRIPE_WEBHOOK_SECRET configurado (se testa webhooks)
```

## Regras de Segurança Obrigatórias

1. **NUNCA** commite secrets no código — use sempre `${{ secrets.NOME_SECRET }}`
2. **NUNCA** use chaves Stripe live em Actions — apenas chaves `sk_test_*`
3. **NUNCA** exporte secrets para logs — adicione `::add-mask::` se necessario
4. Faça **rotação de chaves** a cada 90 dias ou após qualquer comprometimento suspeito
5. Use **secrets de repositório** (não de organização) para máximo controle
6. Revise quem tem acesso ao repositório (Settings > Collaborators)

## Proteção de Custos

### GitHub Actions
- **Budget atual**: $5,00/mês com bloqueio automático
- **Inclusão no plano Pro**: 3.000 minutos gratuitos/mês em runners Linux
- **Custo por minuto excedente**: $0.008 (Linux)
- **Status atual**: $0,00 cobrado (dentro do incluso)

### Como verificar consumo:
1. Acesse: https://github.com/settings/billing/usage
2. Filtre por produto: Actions
3. Verifique coluna "Billed" (deve ser $0 enquanto dentro do plano)

### Alertas configurados:
- **Included usage alerts**: Ativo
- **Budget de $5,00**: Bloqueia uso automaticamente

## Rotação de Chaves (Calendário)

| Próxima Rotação | Secret | Repositórios |
|---|---|---|
| Set/2026 | ANTHROPIC_API_KEY | Todos |
| Set/2026 | RUFLO_API_KEY | Todos |
| Set/2026 | VERCEL_TOKEN | ClubFlow, VetBooking, PetSkin, BRIDGE, LACONELLI |
| Set/2026 | STRIPE_SECRET_KEY | ClubFlow, PetSkin |
