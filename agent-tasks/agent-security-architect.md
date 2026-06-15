# [AGENT] Security Architect — Auditoria CVE + Secrets

**Responsável:** security-architect  
**Prioridade:** 🔴 CRÍTICA  
**Prazo:** 16-17 de junho de 2026  
**Estimativa:** 4-6h  
**Status:** 🟡 PENDENTE

---

## 📋 Objetivo

Auditar e mitigar CVE-2024-23342 (ecdsa), validar e rotacionar secrets necessários para execução dos workflows Ruflo em todos os repositórios.

---

## 🎯 Tarefas

### PARTE A: CVE-2024-23342 (ecdsa) Audit

#### Tarefa A.1: Mapear Cadeia de Dependência
**Estimativa:** 1h | **Due:** 16/06 08:00

```bash
# Em VetBooking backend
cd backend
pip show ecdsa
pip depgraph | grep -i ecdsa
cat requirements.txt | grep -i ecdsa

# Buscar transitivas
pipdeptree | grep ecdsa
```

**Procurar por:**
- [ ] `ecdsa` direto em `requirements.txt`?
- [ ] Libs que dependem de `ecdsa` (buscar em pipdeptree)
- [ ] Versão atual vs vulnerável

**Documentar em issue:**
```
**Cadeia de Dependência:**
- python-jose 3.x → ecdsa 0.19.1 (CVE-2024-23342)
- cryptography 42.x → (não depende)
- outras?
```

---

#### Tarefa A.2: Avaliar Alternativas
**Estimativa:** 1h | **Due:** 16/06 10:00

**Opção 1: Substituir por `cryptography` (PyCA)**
```python
# ANTES (ecdsa)
from jose import jwt

# DEPOIS (cryptography)
from cryptography.hazmat.primitives import hashes
from cryptography.hazmat.primitives.asymmetric import ec
```

**Verificar compatibilidade:**
- [ ] `python-jose` suporta backend `cryptography`?
- [ ] JWT signing/verification funciona igual?
- [ ] WebAuthn compatível?

**Opção 2: Usar `pycryptodome`**
```bash
# Alternativa lightweight
pip install pycryptodome
```

**Verificar:**
- [ ] Compatibilidade com libs existentes
- [ ] Performance vs ecdsa

**Opção 3: Aceitar Risco Temporário**
- [ ] Documentar justificativa
- [ ] Definir mitigação operacional
- [ ] Schedule para remedição

**Documentar Recomendação em issue:**
```
**Análise:**
1. ecdsa é dependência transitiva de python-jose
2. Alternativa: cryptography (melhor mantida)
3. Risco side-channel timing (Minerva attack)
4. **Recomendação:** Migrar para cryptography nos próximos 30 dias
```

---

#### Tarefa A.3: Definir Mitigação Temporária
**Estimativa:** 30min | **Due:** 16/06 12:00

Se não puder migrar imediatamente:

**Mitigação 1: Runtime Hardening**
```bash
# Limitar acesso a ecdsa operations
export PYTHONHASHSEED=0  # Reduce timing variations
```

**Mitigação 2: Reduzir Superfície**
```bash
# Usar ecdsa apenas para assinaturas de baixo valor
# Migrar autenticação JWT para `cryptography`
```

**Mitigação 3: Monitoramento**
```bash
# Adicionar alert se ecdsa for atualizado
pip install pip-audit
pip-audit --desc | grep ecdsa
```

**Documentar Plano em arquivo:** `docs/security/CVE-2024-23342-ecdsa-mitigation.md`

```markdown
# CVE-2024-23342 (ecdsa) Mitigation Plan

## Risk
Side-channel timing attack (Minerva) on ECDSA operations

## Current Status
- Vulnerable version: ecdsa==0.19.1
- No patch available upstream

## Temporary Mitigation
1. Runtime hardening (PYTHONHASHSEED)
2. Reduce surface (JWT only for non-critical)
3. Monitor for updates

## Permanent Remediation
- Timeline: 30 days
- Action: Migrate to cryptography
- Owner: security-architect
- Approval: CTO
```

---

### PARTE B: Validar e Rotacionar Secrets

#### Tarefa B.1: VetBooking — Validar Secrets
**Estimativa:** 45min | **Due:** 16/06 13:00

URL: `https://github.com/antonioneto19/vetbooking/settings/secrets/actions`

**Checklist:**

| Secret | Presente? | Validade | Status |
|--------|-----------|----------|--------|
| RUFLO_API_KEY | ? | ? | ⏳ |
| ANTHROPIC_API_KEY | ? | ? | ⏳ |
| VERCEL_TOKEN | ? | ? | ⏳ |
| SUPABASE_URL | ? | ? | ⏳ |
| SUPABASE_KEY | ? | ? | ⏳ |

**Procedimento:**
```bash
# Listar secrets (nomes apenas, sem valores)
gh secret list --repo antonioneto19/vetbooking

# Testar acesso (tentar usar em workflow)
gh workflow run "Dependency Audit" --repo antonioneto19/vetbooking
```

**Critério:**
- [ ] Todos secrets presentes (exceto opcionais)
- [ ] Sem erros de acesso em workflow
- [ ] Válidos por > 30 dias

---

#### Tarefa B.2: ClubFlow — Validar Secrets
**Estimativa:** 30min | **Due:** 16/06 13:30

URL: `https://github.com/antonioneto19/ClubFlow/settings/secrets/actions`

**Mesmos secrets de VetBooking**

```bash
gh secret list --repo antonioneto19/ClubFlow
```

---

#### Tarefa B.3: CONSULTORIA-ECOCIL — Adicionar Secrets (FALTANDO)
**Estimativa:** 30min | **Due:** 16/06 14:00

URL: `https://github.com/antonioneto19/CONSULTORIA-ECOCIL/settings/secrets/actions`

**🔴 CRÍTICA — Estes secrets estão FALTANDO:**

1. **RUFLO_API_KEY**
   - Valor: [obter de Anthropic Console ou ops]
   - Descrição: Chave de autenticação do Ruflo MCP
   - Ação: ADD

2. **ANTHROPIC_API_KEY**
   - Valor: [obter de Anthropic Console]
   - Descrição: Claude API key (Opus-4 / Sonnet-4)
   - Ação: ADD

```bash
# Adicionar via CLI
gh secret set RUFLO_API_KEY --repo antonioneto19/CONSULTORIA-ECOCIL --body "<value>"
gh secret set ANTHROPIC_API_KEY --repo antonioneto19/CONSULTORIA-ECOCIL --body "<value>"

# Validar
gh secret list --repo antonioneto19/CONSULTORIA-ECOCIL
```

**Critério:**
- [ ] Ambos secrets adicionados
- [ ] Sem erros
- [ ] Workflow consegue acessar

---

#### Tarefa B.4: bridgetech-site — Validar Secrets
**Estimativa:** 15min | **Due:** 16/06 14:30

URL: `https://github.com/antonioneto19/bridgetech-site/settings/secrets/actions`

```bash
gh secret list --repo antonioneto19/bridgetech-site
```

**Critério:**
- [ ] Secrets mínimos presentes

---

#### Tarefa B.5: Validar Acesso (Smoke Test)
**Estimativa:** 30min | **Due:** 16/06 15:00

Re-executar workflows para validar que secrets funcionam:

```bash
# VetBooking
gh workflow run "SAST (Bandit)" --repo antonioneto19/vetbooking
gh workflow run "Smoke UI" --repo antonioneto19/vetbooking

# ClubFlow
gh workflow run "Frontend CI/CD" --repo antonioneto19/ClubFlow

# CONSULTORIA-ECOCIL
gh workflow run "Ruflo Multi-Agent CI/CD" \
  --repo antonioneto19/CONSULTORIA-ECOCIL

# Monitorar
gh run list --repo antonioneto19/vetbooking --limit 3
```

**Critério:**
- [ ] Workflows rodam sem erro de secret
- [ ] Nenhum "secret not found" error

---

### PARTE C: Documentação

#### Tarefa C.1: Documentar CVE Mitigation
**Estimativa:** 1h | **Due:** 17/06 10:00

**Arquivo:** `docs/security/CVE-2024-23342-ecdsa-mitigation.md`

**Incluir:**
- [ ] Descrição técnica do CVE
- [ ] Impacto atual na Stack
- [ ] Alternativas avaliadas
- [ ] Recomendação técnica
- [ ] Mitigação temporária (se necessária)
- [ ] Timeline para remedição permanente
- [ ] Owner e aprovador

---

#### Tarefa C.2: Gerar Relatório de Secrets
**Estimativa:** 30min | **Due:** 17/06 12:00

**Arquivo:** `docs/security/secrets-audit-2026-06-17.md`

```markdown
# Secrets Audit — 17 Junho 2026

## Resumo
- Total secrets validados: 20
- Status: ✅ COMPLETO
- Repositories: 4

## VetBooking
- RUFLO_API_KEY: ✅ Válido, vencimento 2026-09-15
- ANTHROPIC_API_KEY: ✅ Válido, vencimento 2026-08-20
- ... (completo)

## CONSULTORIA-ECOCIL
- RUFLO_API_KEY: ✅ ADICIONADO em 17/06 10:30
- ANTHROPIC_API_KEY: ✅ ADICIONADO em 17/06 10:45

## Próximas Ações
- Rotação de chaves: setembro 2026
- Monitorar CVE: ecdsa mitigation
```

---

## ✅ Critérios de Sucesso

- [ ] CVE-2024-23342 mapeado com cadeia de dependência documentada
- [ ] Alternativas avaliadas e recomendação clara
- [ ] Plano de mitigação ou migração aprovado com prazo
- [ ] Todos 4 repositórios com secrets validados
- [ ] CONSULTORIA-ECOCIL com secrets adicionados (FALTANDO → COMPLETO)
- [ ] Workflows conseguem acessar secrets sem erros
- [ ] Relatórios de CVE e secrets audit anexados à issue
- [ ] Documentação atualizada em `docs/security/`

---

## 🔗 Dependências

**Bloqueadores:**
- [ ] Acesso settings de cada repositório (admin)
- [ ] Credenciais válidas do Anthropic Console
- [ ] Memory Specialist completou sincronização

**Depende de:**
- Memory Specialist (paralelo OK)

**Bloqueado por:**
- Nenhum (pode começar imediatamente)

---

## 📞 Escalation

- **Erro de credenciais:** Contatar @antonioneto19
- **CVE crítica sem mitigação:** Escalar para CTO
- **Workflow bloqueado:** Mencionar @deployer

---

## 📊 Relatório Final

Após completar todas as tarefas, comentar em issue:

```markdown
## ✅ SECURITY AUDIT COMPLETO

**CVE-2024-23342 (ecdsa):**
- Status: [MITIGATED / MIGRATED / ACCEPTED RISK]
- Timeline: [data ou "immediate"]
- Owner: [nome]

**Secrets Audit:**
- VetBooking: ✅ 5/5 validated
- ClubFlow: ✅ 5/5 validated
- CONSULTORIA-ECOCIL: ✅ 2/2 added + 3/3 validated
- bridgetech-site: ✅ validated

**Documentação:**
- ✅ CVE mitigation plan: docs/security/CVE-2024-23342-ecdsa-mitigation.md
- ✅ Secrets audit: docs/security/secrets-audit-2026-06-17.md

**Próximas Etapas:**
1. Developer inspeciona logs VetBooking #147
2. Developer implementa fixes ClubFlow/VetBooking
3. Deploy após review
```

---

**Status:** 🟡 PENDENTE  
**Owner:** security-architect  
**Atualizado:** 15/06/2026
