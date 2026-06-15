# 📋 AGENT TASKS — Issues de Acompanhamento

Este diretório contém templates de issues para cada agente do Ruflo Swarm.

## 🤖 Agentes

### 1️⃣ Memory Specialist
**File:** `agent-memory-specialist.md`
- Restaurar sincronização de memória vetorial
- Reconciliar sessões anteriores
- Documentar recovery procedures

**Links:**
- Issue: `#ruflo-agent-memory-specialist`
- Prazo: 15/06 (HOJE)

---

### 2️⃣ Security Architect
**File:** `agent-security-architect.md`
- Auditar CVE-2024-23342 (ecdsa)
- Validar secrets em 4 repositórios
- Adicionar secrets CONSULTORIA-ECOCIL

**Links:**
- Issue: `#ruflo-agent-security-architect`
- Prazo: 16-17/06
- VetBooking Issues: #12, #23

---

### 3️⃣ Developer
**File:** `agent-developer.md`
- VetBooking #147: Ruflo Multi-Agent CI falhando
- VetBooking #122: Tenant Isolation (IntegrationSecret)
- ClubFlow #39: E2E Queue Ordering

**Links:**
- Issue: `#ruflo-agent-developer`
- Prazo: 17-19/06

---

### 4️⃣ Tester
**File:** `agent-tester.md`
- Validação E2E dos fixes do Developer
- Regression testing
- Relatório de validação

**Links:**
- Issue: `#ruflo-agent-tester`
- Prazo: 18-19/06

---

### 5️⃣ Reviewer
**File:** `agent-reviewer.md`
- Code review de PRs críticas
- Checklist segurança/testes/performance
- Aprovação para merge

**Links:**
- Issue: `#ruflo-agent-reviewer`
- Prazo: 18-19/06

---

### 6️⃣ Deployer
**File:** `agent-deployer.md`
- Estabilizar CI/CD pipelines
- Garantir deploys automáticos
- Validar sistemas em produção

**Links:**
- Issue: `#ruflo-agent-deployer`
- Prazo: 19-20/06

---

## 📊 Status Consolidado

**Status Geral:** 🟡 PENDENTE EXECUÇÃO (15/06/2026)

| Agente | Tasks | Status | Due |
|--------|-------|--------|-----|
| Memory Specialist | 6 | ⏳ PENDING | 15/06 |
| Security Architect | 10 | ⏳ PENDING | 17/06 |
| Developer | 15 | ⏳ PENDING | 19/06 |
| Tester | 8 | ⏳ PENDING | 19/06 |
| Reviewer | 7 | ⏳ PENDING | 19/06 |
| Deployer | 10 | ⏳ PENDING | 20/06 |
| **TOTAL** | **56** | **⏳ 0%** | **20/06** |

---

## 🔄 Fluxo de Execução

```
Memory Specialist (Tier 1)
        ↓
Security Architect (Tier 1)
        ↓
   ┌────┴────┐
   ↓         ↓
Developer   Tester (Tier 2)
   └────┬────┘
        ↓
    Reviewer (Tier 2)
        ↓
   Deployer (Tier 3)
```

---

## 📝 Como Usar

1. **Criar Issue:** Copiar conteúdo de `agent-*.md` para nova issue no repositório correspondente

2. **Atualizar Status:** Usar checkboxes para marcar progresso

3. **Documentar Bloqueadores:** Comentar em issue com atualizações

4. **Escalate se Necessário:** Mencionar próximo agente ou owner

5. **Fechar Issue:** Após todas as tasks completadas e critério de sucesso validado

---

## 🚨 Escalation

- **🔴 CRÍTICA:** Slack + GitHub mention + comment
- **🟠 ALTA:** GitHub comment + status update
- **🟡 MÉDIA:** Status update em SWARM-STATUS.md

---

## 📞 Contacts

| Role | Handle | Especialidade |
|------|--------|--------------|
| Orquestrador | @antonioneto19 | Overall coordination |
| Memory Specialist | memory-specialist | Vector DB, Sync |
| Security Architect | security-architect | CVE, Secrets |
| Developer | developer | Fixes, Features |
| Tester | tester | E2E, QA |
| Reviewer | reviewer | Code Quality |
| Deployer | deployer | CI/CD, Prod |

---

**Última Atualização:** 15/06/2026  
**Próxima Atualização:** 16/06/2026  
**Owner:** antonioneto19
