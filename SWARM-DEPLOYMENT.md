# 🤖 SWARM DEPLOYMENT — Orquestração de Agentes Ruflo

**Data:** 15 de junho de 2026  
**Topology:** Hierarchical (max 6 agentes)  
**Período:** 2-3 semanas  
**Objetivo:** Resolver 30+ issues críticas entre VetBooking, ClubFlow, CONSULTORIA-ECOCIL e bridgetech-site

---

## 📊 Estrutura do Swarm

```
Ruflo Swarm (hierarchical)
├─ [ORCHESTRATOR] — você (este documento)
├─ [TIER 1 — Foundation]
│  ├─ Memory Specialist (restaurar contexto)
│  └─ Security Architect (auditar + secrets)
├─ [TIER 2 — Execution]
│  ├─ Developer (bug fixes)
│  ├─ Tester (validação E2E)
│  └─ Reviewer (code quality)
└─ [TIER 3 — Deployment]
   └─ Deployer (CI/CD + produção)
```

---

## 🎯 Agentes e Responsabilidades

### 🧠 AGENT 1: Memory Specialist

**Status:** 🟡 PRÉ-REQUISITO  
**Priority:** 🔴 CRÍTICA  
**Estimativa:** 2-3h  
**Prazo:** HOJE (15/06)

**Objetivo:**  
Restaurar e sincronizar memória vetorial entre agentes para que todos tenham contexto histórico necessário.

**Tarefas:**
- [ ] Validar backend `agentdb-persistent` (conectividade e health)
- [ ] Executar `ruflo memory sync --backend agentdb-persistent`
- [ ] Solucionar erros 401/403/timeout se ocorrerem
- [ ] Reconciliar sessões anteriores e contexto histórico
- [ ] Documentar procedimentos de recovery
- [ ] Validar que todos os 6 agentes conseguem acessar memória

**Dependências:** Nenhuma (executar primeiro)

**Bloqueadores:** 
- Acesso ao backend de memória necessário
- Credenciais `RUFLO_API_KEY` válidas

**Critérios de Sucesso:**
- ✅ `ruflo memory sync` retorna sucesso
- ✅ Agentes conseguem listar histórico de sessões
- ✅ Contexto anterior recuperado e disponível
- ✅ Procedimento de recovery documentado em `docs/memory-recovery.md`

---

### 🔐 AGENT 2: Security Architect

**Status:** 🟡 PRÉ-REQUISITO (em paralelo com Memory)  
**Priority:** 🔴 CRÍTICA  
**Estimativa:** 4-6h  
**Prazo:** 16/06 (amanhã)

**Objetivo:**  
Auditar vulnerabilidades (CVE-2024-23342), validar e rotacionar secrets necessários para pipelines CI/CD.

**Tarefas:**

#### 2.1 — CVE-2024-23342 (ecdsa)
- [ ] Mapear cadeia de dependência: `ecdsa` é direto ou transitivo?
- [ ] Identificar quais libs dependem de `ecdsa`
- [ ] Avaliar alternativas (cryptography, pycryptodome)
- [ ] Definir mitigação temporária
- [ ] Documentar decisão arquitetural com risco residual

#### 2.2 — Validar/Rotacionar Secrets
- [ ] **VetBooking:** RUFLO_API_KEY, ANTHROPIC_API_KEY, VERCEL_TOKEN, SUPABASE_*
- [ ] **ClubFlow:** Mesmos secrets
- [ ] **CONSULTORIA-ECOCIL:** Adicionar RUFLO_API_KEY + ANTHROPIC_API_KEY (FALTANDO)
- [ ] **bridgetech-site:** Validar

---

### 💻 AGENT 3: Developer

**Status:** 🟢 EXECUÇÃO (após Memory + Security)  
**Priority:** 🔴 CRÍTICA  
**Estimativa:** 8-12h  
**Prazo:** 17-18/06

**Objetivo:**  
Corrigir falhas críticas em CI/CD (VetBooking #147) e E2E (ClubFlow #39), priorizar Issue #122 (tenant isolation).

**Tarefas:**

#### 3.1 — VetBooking Issue #147: Ruflo Multi-Agent CI Falhando
- [ ] Inspecionar logs dos últimos runs com failure
- [ ] Buscar padrão de erro específico
- [ ] Re-executar workflow após Security valida secrets

#### 3.2 — VetBooking Issue #122: Tenant Isolation (IntegrationSecret)
- [ ] Adicionar `clinic_id` FK ao modelo IntegrationSecret
- [ ] Criar migration Alembic com backfill
- [ ] Atualizar endpoints FastAPI com validação clinic
- [ ] Implementar testes cross-clinic

#### 3.3 — ClubFlow Issue #39: E2E Queue Ordering (89+ execuções)
- [ ] Adicionar `ORDER BY created_at ASC` em todas as queries
- [ ] Garantir inserção com `position` explícita
- [ ] Reproduzir e validar testes localmente

---

### 🧪 AGENT 4: Tester

**Status:** 🟢 EXECUÇÃO (após Developer PR)  
**Priority:** 🔴 CRÍTICA  
**Estimativa:** 6-8h  
**Prazo:** 18-19/06

**Objetivo:**  
Validar E2E e regression testing após correções do Developer.

**Tarefas:**
- [ ] Reexecutar suites Playwright afetados
- [ ] Verificar estabilidade staging Supabase
- [ ] Garantir seeds idempotentes
- [ ] Gerar relatório de regressão

---

### 👀 AGENT 5: Reviewer

**Status:** 🟢 EXECUÇÃO (paralelo com Tester)  
**Priority:** 🔴 CRÍTICA  
**Estimativa:** 4-6h  
**Prazo:** 18-19/06

**Objetivo:**  
Revisar PRs e garantir qualidade de código antes de merge.

**Tarefas:**
- [ ] Code review com checklist segurança/testes/performance
- [ ] Revisar PRs: Tenant Isolation, Queue Ordering, Security
- [ ] Aprovar PRs prontas para merge

---

### 🚀 AGENT 6: Deployer

**Status:** 🟢 EXECUÇÃO (após Reviewer aprova)  
**Priority:** 🔴 CRÍTICA  
**Estimativa:** 3-4h  
**Prazo:** 19-20/06

**Objetivo:**  
Estabilizar pipelines CI/CD e garantir deploys automáticos.

**Tarefas:**
- [ ] Validar workflows Ruflo e gatilhos
- [ ] Validar integração com Vercel/K8s
- [ ] Re-executar workflows e monitorar
- [ ] Smoke tests pós-deploy

---

## 📅 Cronograma de Execução

```
SEGUNDA (17/06) — Foundation
├─ Memory Specialist: Sync + Recovery
├─ Security Architect: CVE audit + Secrets (paralelo)
└─ Developer: Log inspection VetBooking

TERÇA (18/06) — Development
├─ Developer: Fix E2E queries + tenant isolation
├─ Tester: Começar validação
├─ Reviewer: Pronto para revisar

QUARTA (19/06) — Integration
├─ Developer: PR #122 finalizada
├─ Tester: E2E validation completa
├─ Reviewer: Aprovações PRs críticas
└─ Deployer: Preparar pipelines

QUINTA (20/06) — Production
├─ Deployer: Merge + monitoring
├─ Deployer: Workflows + deploys
└─ All: Validação final

SEMANA 2 (23-27/06) — Maintenance
├─ Contínuo: Monitoring e health checks
├─ Weekly: Auditorias de segurança
└─ Business-as-usual: Code review rotina
```

---

## 🔗 Dependências Entre Agentes

```
Memory Specialist
        ▼
Security Architect
        ▼
   ┌────┴────┐
   ▼         ▼
Developer   Tester
   └────┬────┘
        ▼
     Reviewer
        ▼
    Deployer
```

---

## 📝 Escalation e Comunicação

- **Daily standup:** EOD (17:00)
- **Weekly review:** Sexta-feira 14:00
- **Escalation:** Imediato (bloqueadores críticos)

---

## ✅ Aprovação

**Orquestrador:** antonioneto19  
**Data:** 15/06/2026  
**Status:** 🟡 PENDENTE EXECUÇÃO

*Ruflo Workspace v3.6 — Deployment Swarm — 15/06/2026*
