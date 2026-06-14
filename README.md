# Ruflo Workspace — Super Estrutura de IA Multi-Agente
## Bridge tecnologia e consultoria | antonioneto19

> **Ruflo v3.6** — Plataforma de meta-agentes para Claude Code, Codex e GitHub.
> 100+ agentes especializados | 314 ferramentas MCP | Memória vetorial | CI/CD automatizado

---

## Projetos Configurados

| Projeto | Repositório | Stack | Status Ruflo |
|---------|------------|-------|-------------|
| **ClubFlow** | antonioneto19/ClubFlow | React + Supabase + Vercel | CLAUDE.md + CI/CD |
| **VetBooking** | antonioneto19/VetBooking | FastAPI + Next.js + Docker | CLAUDE.md + CI/CD |
| **PetSkin** | antonioneto19/landing-page-Petskin-... | HTML/JS + Vercel | CLAUDE.md |
| **Alphaville CFTV** | Liderança Tech | Dashboard HTML | Configurado |

---

## Instalação Global (Uma vez por máquina)

### 1. Instalar Ruflo CLI
```bash
# Opção A: NPX (recomendado)
npx ruflo@latest init wizard

# Opção B: Instalação global
npm install -g ruflo@latest

# Opção C: Script POSIX
curl -fsSL https://cdn.jsdelivr.net/gh/ruvnet/ruflo@main/scripts/install.sh | bash
```

### 2. Configurar MCP no Claude Code (global)
```bash
claude mcp add ruflo -- npx ruflo@latest mcp start
```

### 3. Verificar instalação
```bash
ruflo --version
ruflo status
```

---

## Configuração por Projeto

### ClubFlow
```bash
cd ~/projetos/ClubFlow
npx ruflo init
claude mcp add ruflo -- npx ruflo@latest mcp start
```

### VetBooking
```bash
cd ~/projetos/VetBooking
npx ruflo init
claude mcp add ruflo -- npx ruflo@latest mcp start
```

### PetSkin
```bash
cd ~/projetos/landing-page-Petskin
npx ruflo init
claude mcp add ruflo -- npx ruflo@latest mcp start
```

---

## Comandos Essenciais Ruflo

### Agentes e Swarms
```bash
# Inicializar swarm hierarquico
ruflo swarm init --topology hierarchical --max-agents 6

# Lançar agente específico
ruflo agent spawn architect
ruflo agent spawn developer
ruflo agent spawn tester
ruflo agent spawn security-architect

# Pipeline completo
ruflo swarm run "analyze and improve the codebase"
```

### Memória e Aprendizado
```bash
# Ver memórias do projeto
ruflo memory list

# Buscar padrões aprendidos
ruflo memory search "supabase rls"

# Exportar base de conhecimento
ruflo memory export --format json > knowledge-base.json
```

### Hooks Automáticos
```bash
# Instalar hooks no repositório
ruflo hooks install

# Ver hooks ativos
ruflo hooks list

# Hook de pre-commit (roda testes)
ruflo hooks enable pre-commit
```

### Codex Integration
```bash
# Executar tarefa via Codex
ruflo codex run "fix all TypeScript errors in src/"

# Codex com agente específico
ruflo codex run --agent security-architect "audit auth flows"
```

---

## Slash Commands no Claude Code

Após `npx ruflo init`, os seguintes comandos ficam disponíveis:

```
/ruflo swarm          # Iniciar swarm de agentes
/ruflo agent          # Gerenciar agentes individuais
/ruflo memory         # Acesso à memória do projeto
/ruflo hooks          # Gerenciar hooks
/ruflo status         # Status do sistema
/ruflo analyze        # Análise completa do projeto
/ruflo security-scan  # Varredura de segurança
/ruflo optimize       # Otimização de performance
/ruflo deploy         # Pipeline de deploy
```

---

## Ferramentas MCP Disponivãis (314 total)

### Categorias Principais
- **Swarm:** `mcp__ruv-swarm__swarm_init`, `mcp__ruv-swarm__agent_spawn`
- **Memória:** `mcp__ruv-swarm__memory_store`, `mcp__ruv-swarm__memory_query`
- **Coordenação:** `mcp__ruv-swarm__send_message`, `mcp__ruv-swarm__task_assign`
- **Neural:** `mcp__ruv-swarm__reasoning_bank`, `mcp__ruv-swarm__sona_patterns`
- **Segurança:** `mcp__ruv-swarm__ai_defence`, `mcp__ruv-swarm__cve_scan`
- **Deploy:** `mcp__ruv-swarm__deploy_trigger`, `mcp__ruv-swarm__health_check`

---

## Topologias de Swarm Recomendadas por Projeto

### ClubFlow (React + Supabase)
```json
{
  "topology": "hierarchical",
  "maxAgents": 6,
  "consensus": "raft",
  "agents": ["architect", "developer", "tester", "reviewer", "security-architect", "deployer"]
}
```

### VetBooking (FastAPI + Docker)
```json
{
  "topology": "hierarchical",
  "maxAgents": 7,
  "consensus": "raft",
  "agents": ["architect", "developer", "tester", "security-architect", "performance-engineer", "deployer", "memory-specialist"]
}
```

### PetSkin (Landing Page)
```json
{
  "topology": "hierarchical",
  "maxAgents": 4,
  "consensus": "raft",
  "agents": ["developer", "reviewer", "performance-engineer", "deployer"]
}
```

---

## GitHub Actions Workflows Configurados

| Repositório | Workflow | Agentes |
|-------------|---------|--------|
| ClubFlow | `ruflo-agents.yml` | Security + Build + E2E + Deploy |
| VetBooking | `ruflo-agents.yml` | Security + Backend + Frontend + Docker |

### Triggers Automáticos
- **Push to main:** Security scan + Build + Deploy
- **Pull Request:** Security scan + Tests
- **Workflow dispatch:** Manual com task customizada

---

## Variáveis de Ambiente Necessárias

### ClubFlow (GitHub Secrets)
```
VITE_SUPABASE_URL=...
VITE_SUPABASE_ANON_KEY=...
E2E_ADMIN_EMAIL=...
E2E_ADMIN_PASSWORD=...
```

### VetBooking (GitHub Secrets)
```
DATABASE_URL=...
REDIS_URL=...
SECRET_KEY=...
NEXT_PUBLIC_API_URL=...
```

---

## Recursos úteis

- **Ruflo GitHub:** https://github.com/ruvnet/ruflo
- **Web UI:** https://flo.ruv.io
- **Goal Planning:** https://goal.ruv.io
- **Claude Code docs:** https://docs.anthropic.com/claude-code
- **MCP Protocol:** https://modelcontextprotocol.io

---

## Mantenedor

**Antonio Neto** | Liderança Tech | Rio Grande do Norte, Brasil
- GitHub: [@antonioneto19](https://github.com/antonioneto19)
- Email: antonio@liderancatech.com

---
*Configurado em Junho 2026 | Ruflo v3.6 | Claude Code + Codex Integration*
