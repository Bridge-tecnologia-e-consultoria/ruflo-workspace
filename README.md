# Ruflo Workspace — Super Estrutura de IA Multi-Agente
## Bridge Tecnologia e Consultoria | antonioneto19

> **Ruflo v3.6** — Plataforma de meta-agentes para Claude Code, Codex e GitHub.
> 100+ agentes especializados | 314 ferramentas MCP | Memória vetorial | CI/CD automatizado

![Status](https://img.shields.io/badge/Status-Ativo-brightgreen) ![Versão](https://img.shields.io/badge/Versão-3.6-blue) ![Projetos](https://img.shields.io/badge/Projetos-7-orange) ![Agentes](https://img.shields.io/badge/Agentes-100%2B-purple)

---

## 📋 Visão Geral

O **Ruflo Workspace** é a superestrutura central de IA multiagente da **Liderança Tech / Bridge Tecnologia**, gerenciando todos os projetos ativos com automação de CI/CD, revisão de código, segurança e implantação via swarms de agentes Claude.

**Última atualização:** 14 de junho de 2026
**Proprietário:** Antonio Neto (`antonioneto19`) — antonio@liderancatech.com

---

## 🚀 Projetos Integrados

| Projeto | Repositório | Stack | Agentes Ruflo | CI/CD | Secrets |
|---|---|---|---|---|---|
| **VetBooking** | `antonioneto19/vetbooking` | FastAPI + Next.js 15 + PostgreSQL + Redis + K8s | 7 agentes | ✅ Ativo | ANTHROPIC_API_KEY ✅ |
| **bridgetech-site** | `antonioneto19/bridgetech-site` | Next.js + Netlify | Code Review + Quality Gate | ✅ Ativo | ANTHROPIC_API_KEY ✅ |
| **CONSULTORIA-ECOCIL** | `antonioneto19/CONSULTORIA-ECOCIL` | HTML/JS + IA | Multi-Agent CI/CD | ✅ Ativo | ANTHROPIC_API_KEY ✅ |
| **ClubFlow** | `antonioneto19/ClubFlow` | React + Supabase + Vercel | 6 agentes | ✅ Configurado | ANTHROPIC_API_KEY |
| **PetSkin** | `antonioneto19/landing-page-Petskin-cursos-dra-cristiane-freitas` | HTML/JS + Vercel | Agente análise | ✅ Configurado | — |
| **Bridge Command Center** | `antonioneto19/bridge-command-center` | GPT + Automação | Orquestração | ✅ Configurado | — |
| **Laconelli Brand** | `antonioneto19/laconelli-brand` | Next.js + E-commerce | Agente design | 🔧 Em setup | — |

---

## 🌳 Worktree — Estrutura de Espaços de Trabalho

```
ruflo-workspace/ (raiz — branch: main)
├── .github/
│   └── workflows/
│       └── ruflo-agents.yml       # Workflow CI/CD principal Ruflo
├── .ruflo/
│   └── config.json                # Config central: projetos, agentes, MCP
├── README.md                      # Este arquivo
├── CLAUDE.md                      # Instruções para Claude Code / Codex
├── SECRETS-GUIDE.md               # Guia de secrets por repositório
└── BUGFIX-REPORT.md               # Relatório de bugs e correções

# Worktrees vinculados (projetos externos)
├── [worktree] vetbooking/         → antonioneto19/vetbooking (branch: main)
├── [worktree] bridgetech-site/    → antonioneto19/bridgetech-site (branch: main)
├── [worktree] ecocil/             → antonioneto19/CONSULTORIA-ECOCIL (branch: main)
├── [worktree] clubflow/           → antonioneto19/ClubFlow (branch: main)
├── [worktree] petskin/            → antonioneto19/landing-page-Petskin... (branch: main)
└── [worktree] laconelli/          → antonioneto19/laconelli-brand (branch: main)
```

---

## 🤖 Agentes e Swarms

### Topologia de Agentes por Projeto

**VetBooking** (7 agentes)
```
Security Architect → Developer + Tester → Developer (Construção) → Agente de Implantação
```

**bridgetech-site** (2 agentes)
```
Ruflo Code Review & Quality Gate → Ruflo Sincronização
```

**CONSULTORIA-ECOCIL** (3 agentes)
```
Security → Build → Deploy
```

**ClubFlow** (6 agentes)
```
archetypal → reviewer → deployer → memory-specialist → tester → security-architect
```

### Comandos Principais

```bash
# Inicializar swarm
ruflo swarm init --topology hierarchical --max-agents 6

# Lançar agente específico
ruflo agent spawn architect
ruflo agent spawn developer
ruflo agent spawn security-architect
ruflo agent spawn memory-specialist

# Executar pipeline completo
ruflo swarm run

# Memória
ruflo memory list
ruflo memory search "padrão buscado"

# Análise e segurança
ruflo analyze
ruflo security-scan
ruflo optimize

# Deploy
ruflo deploy
```

### Comandos de Barra (Claude Code)
```
/ruflo swarm      → Inicia swarm de agentes
/ruflo agent      → Gerencia agente individual
/ruflo memory     → Acessa memória vetorial
/ruflo hooks      → Configura hooks pre-commit
/ruflo analyze    → Analisa código do projeto
/ruflo security-scan → Varredura de vulnerabilidades
/ruflo optimize   → Otimização de performance
/ruflo deploy     → Deploy automatizado
```

---

## ⚙️ CI/CD — GitHub Actions

### Arquivo: `ruflo-agents.yml`

**Gatilhos automáticos:**
- `push → main`: Segurança + Build + Deploy
- `pull_request`: Segurança + Testes
- `workflow_dispatch`: Execução manual com parâmetro de agente
- `schedule`: Execução diária automática

**Jobs por projeto:**

| Projeto | Jobs Configurados |
|---|---|
| VetBooking | Security Architect + Developer + Tester + Build + Deploy |
| bridgetech-site | Code Review & Quality Gate + Sincronização |
| CONSULTORIA-ECOCIL | Security + Build + Deploy |
| ClubFlow | Security + Build + E2E + Deploy |

---

## 🔐 Secrets Configurados

| Secret | Repositório | Status | Atualizado |
|---|---|---|---|
| `ANTHROPIC_API_KEY` | VetBooking | ✅ Ativo | 14/06/2026 |
| `ANTHROPIC_API_KEY` | bridgetech-site | ✅ Ativo | 14/06/2026 |
| `ANTHROPIC_API_KEY` | CONSULTORIA-ECOCIL | ✅ Ativo | 14/06/2026 |
| `OPENAI_API_KEY` | VetBooking | ✅ Ativo | Existente |
| `VERCEL_TOKEN` | VetBooking | ✅ Ativo | Existente |

> ⚠️ **Segurança:** Nunca insira valores de secrets em código, commits ou chats. Configure sempre via GitHub Settings → Secrets and variables → Actions.
> 
> 💰 **Budget:** GitHub Actions limitado a $5,00 com bloqueio automático. Rotação de chaves: setembro/2026.

---

## 🛠️ Ferramentas MCP (314 disponíveis)

| Categoria | Ferramentas |
|---|---|
| **Swarm** | `mcp__ruv-swarm__agent_spawn`, `mcp__ruv-swarm__swarm_init`, `mcp__ruv-swarm__task_orchestrate` |
| **Memória** | `mcp__ruv-swarm__memory_store`, `mcp__ruv-swarm__memory_search`, `mcp__ruv-swarm__memory_list` |
| **Coordenação** | `mcp__ruv-swarm__agent_coordinate`, `mcp__ruv-swarm__pipeline_run` |
| **Neural** | `mcp__ruv-swarm__neural_train`, `mcp__ruv-swarm__neural_predict` |
| **Segurança** | `mcp__ruv-swarm__cve_scan`, `mcp__ruv-swarm__security_audit` |
| **Deploy** | `mcp__ruv-swarm__deploy_trigger`, `mcp__ruv-swarm__rollback` |

---

## 📊 Status dos Workflows (14/06/2026)

| Projeto | Último Workflow | Status | Execução |
|---|---|---|---|
| **CONSULTORIA-ECOCIL** | CI/CD Multiagente Ruflo #6 | 🟡 Em fila | Manual — 14/06/2026 |
| **VetBooking** | Ruflo Multi-Agent CI/CD #8 | 🟢 Em andamento | Manual — 14/06/2026 |
| **bridgetech-site** | Ruflo Multi-Agent CI/CD #2 | 🟢 Em andamento | Manual — 14/06/2026 |

---

## 📁 Configuração MCP Central (`.ruflo/config.json`)

```json
{
  "versão": "1.0.0",
  "workspace": "espaço de trabalho ruflo",
  "proprietário": "antonioneto19",
  "mcp": { "servidor": { "hospedar": "localhost", "porta": 3100 } },
  "secretsBackend": "github-secrets",
  "projetos": [
    "antonioneto19/vetbooking",
    "antonioneto19/bridgetech-site",
    "antonioneto19/CONSULTORIA-ECOCIL",
    "antonioneto19/ClubFlow",
    "antonioneto19/landing-page-Petskin-cursos-dra-cristiane-freitas",
    "antonioneto19/bridge-command-center",
    "antonioneto19/laconelli-brand"
  ]
}
```

---

## 🔗 Links Rápidos

- [VetBooking Actions](https://github.com/antonioneto19/vetbooking/actions)
- [bridgetech-site Actions](https://github.com/antonioneto19/bridgetech-site/actions)
- [CONSULTORIA-ECOCIL Actions](https://github.com/antonioneto19/CONSULTORIA-ECOCIL/actions)
- [ClubFlow Actions](https://github.com/antonioneto19/ClubFlow/actions)
- [Anthropic Console — Chaves API](https://platform.claude.com/settings/keys)
- [SECRETS-GUIDE.md](./SECRETS-GUIDE.md)
- [CLAUDE.md](./CLAUDE.md)

---

*Ruflo Workspace v3.6 — Bridge Tecnologia e Consultoria — Atualizado em 14/06/2026*
