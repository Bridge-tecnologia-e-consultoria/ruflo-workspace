# [AGENT] Memory Specialist — Restaurar e Sincronizar Memória

**Responsável:** memory-specialist  
**Prioridade:** 🔴 CRÍTICA  
**Prazo:** 15 de junho de 2026 (HOJE)  
**Estimativa:** 2-3h  
**Status:** 🟡 PENDENTE

---

## 📋 Objetivo

Restaurar e garantir sincronização de memória vetorial/contexto entre agentes para manter histórico e estado operacional do swarm.

---

## 🎯 Tarefas

### Tarefa 1: Validar Backend de Memória
**Estimativa:** 30min | **Due:** 08:00

```bash
# Verificar conectividade ao backend agentdb-persistent
ruflo memory backend status --backend agentdb-persistent

# Validar health check
curl -X GET http://localhost:3100/health

# Verificar credenciais
echo $RUFLO_API_KEY
```

**Critério:**
- [ ] Backend respondendo (status 200)
- [ ] Credenciais válidas
- [ ] Sem timeouts

---

### Tarefa 2: Executar Memory Sync
**Estimativa:** 30min | **Due:** 09:00

```bash
# Sincronizar memória vetorial
ruflo memory sync --backend agentdb-persistent

# Esperado: sucesso ou aviso claro
```

**Critério:**
- [ ] Comando completado sem erro fatal
- [ ] Mensagem de sucesso ou aviso documentado

---

### Tarefa 3: Solucionar Erros (se houver)
**Estimativa:** 1h | **Due:** 10:00

**Possíveis Erros:**

| Erro | Causa | Solução |
|------|-------|--------|
| 401 Unauthorized | RUFLO_API_KEY expirada | Renovar em Anthropic Console |
| 403 Forbidden | Permissões insuficientes | Validar role de acesso |
| timeout | Backend lento/indisponível | Contatar ops, verificar health |
| connection refused | Backend desligado | Restart services |

**Procedimento:**
- [ ] Identificar erro específico
- [ ] Documentar em issue
- [ ] Aplicar solução
- [ ] Reexecutar sync

---

### Tarefa 4: Reconciliar Sessões Anteriores
**Estimativa:** 30min | **Due:** 11:00

```bash
# Listar sessões recuperadas
ruflo memory list --backend agentdb-persistent

# Validar contexto histórico
ruflo memory search "deployment" --backend agentdb-persistent
```

**Critério:**
- [ ] Sessões anteriores listando
- [ ] Contexto recuperável
- [ ] Search funcionando

---

### Tarefa 5: Documentar Recovery Procedures
**Estimativa:** 30min | **Due:** 12:00

**Criar arquivo:** `docs/memory-recovery.md`

```markdown
# Memory Backend Recovery Guide

## Quick Start
1. Check backend health: `ruflo memory backend status`
2. Sync memory: `ruflo memory sync --backend agentdb-persistent`
3. Validate: `ruflo memory list`

## Troubleshooting
...
```

**Incluir:**
- [ ] Pré-requisitos
- [ ] Passos de validação
- [ ] Procedimento de recovery
- [ ] Troubleshooting comum
- [ ] Escalation process

---

### Tarefa 6: Validar Acesso de 6 Agentes
**Estimativa:** 30min | **Due:** 13:00

```bash
# Validar que todos os agentes conseguem acessar memória
for agent in memory-specialist security-architect developer tester reviewer deployer; do
  echo "Testing $agent..."
  ruflo agent connect $agent --test-memory
done
```

**Critério:**
- [ ] 6/6 agentes com acesso
- [ ] Sem erros de autenticação
- [ ] Response time < 1s

---

## ✅ Critérios de Sucesso

- [ ] `ruflo memory sync --backend agentdb-persistent` retorna sucesso
- [ ] Histórico de sessões anteriores recuperado e acessível
- [ ] Todos 6 agentes conseguem ler/escrever contexto
- [ ] Procedimento de recovery documentado em `docs/memory-recovery.md`
- [ ] Nenhum erro fatal ou timeout residual

---

## 🔗 Dependências

**Bloqueadores:**
- [ ] Acesso ao backend `agentdb-persistent`
- [ ] Credenciais `RUFLO_API_KEY` válidas
- [ ] Network conectividade OK

**Depende de:**
- Nenhuma (primeira etapa do swarm)

**Bloqueado por:**
- Nenhum

---

## 📞 Escalation

Se encontrar **erro não documentado**:
1. Documentar erro em issue comment
2. Mencionar `@security-architect` (pode ser credencial)
3. Mencionar `@deployer` (pode ser infraestrutura)

---

## 🔧 Úteis

**Logs:**
```bash
# Ver logs do backend
journalctl -u agentdb-persistent -f

# Ver logs da CLI
RUFLO_DEBUG=1 ruflo memory sync
```

**Validações:**
```bash
# Testar conectividade
nc -zv localhost 3100

# Testar API
curl -H "Authorization: Bearer $RUFLO_API_KEY" \
  http://localhost:3100/sessions
```

---

## 📝 Notas

- Executar antes de spawnar outros agentes
- Se houver timeout: aumentar limites ou contatar ops
- Documentar qualquer issue residual para revisão posterior

---

**Status:** 🟡 PENDENTE  
**Owner:** memory-specialist  
**Atualizado:** 15/06/2026
