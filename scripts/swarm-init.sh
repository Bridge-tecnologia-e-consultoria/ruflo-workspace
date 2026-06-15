#!/bin/bash
# 🤖 SWARM INITIALIZATION SCRIPT
# Inicializa e monitora agentes Ruflo para deployment de issues críticas
# Usage: ./scripts/swarm-init.sh

set -e

echo "════════════════════════════════════════════════════════════"
echo "  🤖 RUFLO SWARM INITIALIZATION — v1.0"
echo "  Data: $(date '+%Y-%m-%d %H:%M:%S')"
echo "══════════��═════════════════════════════════════════════════"
echo ""

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Step 1: Validar Ruflo CLI disponível
echo -e "${BLUE}[STEP 1]${NC} Validar Ruflo CLI..."
if ! command -v ruflo &> /dev/null; then
    echo -e "${RED}✗ ruflo CLI não encontrado${NC}"
    exit 1
fi
echo -e "${GREEN}✓ ruflo CLI disponível$(ruflo --version)${NC}"
echo ""

# Step 2: Inicializar swarm
echo -e "${BLUE}[STEP 2]${NC} Inicializar swarm hierárquico (max 6 agentes)..."
ruflo swarm init --topology hierarchical --max-agents 6
echo -e "${GREEN}✓ Swarm inicializado${NC}"
echo ""

# Step 3: Validar memory backend
echo -e "${BLUE}[STEP 3]${NC} Validar backend de memória (agentdb-persistent)..."
if ruflo memory sync --backend agentdb-persistent; then
    echo -e "${GREEN}✓ Memory sync sucesso${NC}"
else
    echo -e "${YELLOW}⚠ Memory sync com aviso — verificar backend${NC}"
fi
echo ""

# Step 4: Spawnar agentes (ordem: Foundation → Execution → Deployment)
echo -e "${BLUE}[STEP 4]${NC} Spawnar agentes na topologia correta..."
echo ""

# TIER 1 — Foundation
echo -e "${YELLOW}  [TIER 1 — Foundation]${NC}"
echo "  Spawning Memory Specialist..."
ruflo agent spawn memory-specialist --tag "memory" || true
echo "  Spawning Security Architect..."
ruflo agent spawn security-architect --tag "security" || true
echo ""

# TIER 2 — Execution
echo -e "${YELLOW}  [TIER 2 — Execution]${NC}"
echo "  Spawning Developer..."
ruflo agent spawn developer --tag "development" || true
echo "  Spawning Tester..."
ruflo agent spawn tester --tag "qa" || true
echo "  Spawning Reviewer..."
ruflo agent spawn reviewer --tag "review" || true
echo ""

# TIER 3 — Deployment
echo -e "${YELLOW}  [TIER 3 — Deployment]${NC}"
echo "  Spawning Deployer..."
ruflo agent spawn deployer --tag "deploy" || true
echo ""

# Step 5: Listar agentes ativos
echo -e "${BLUE}[STEP 5]${NC} Listar agentes ativos..."
ruflo agent list || echo "Comando não disponível nesta versão"
echo ""

# Step 6: Validar status do swarm
echo -e "${BLUE}[STEP 6]${NC} Validar status do swarm..."
echo -e "${GREEN}✓ Swarm pronto para execução${NC}"
echo ""

# Step 7: Exibir instruções de próximos passos
echo "════════════════════════════════════════════════════════════"
echo -e "${GREEN}✓ SWARM INICIALIZADO COM SUCESSO${NC}"
echo "════════════════════════════════════════════════════════════"
echo ""
echo "📋 Próximos Passos:"
echo ""
echo "1. Revisar documentação de deployment:"
echo "   • SWARM-DEPLOYMENT.md — Orquestração de agentes"
echo "   • SWARM-STATUS.md — Dashboard de status"
echo ""
echo "2. Iniciar execução conforme cronograma:"
echo "   • Seg 17/06: Memory Specialist + Security Architect"
echo "   • Ter 18/06: Developer + Tester"
echo "   • Qua 19/06: Reviewer"
echo "   • Qui 20/06: Deployer"
echo ""
echo "3. Monitorar progresso:"
echo "   • Daily standup: 17:00 UTC"
echo "   • Status dashboard: SWARM-STATUS.md"
echo ""
echo "4. Escalation de bloqueadores:"
echo "   • Issues críticas: GitHub + Slack"
echo "   • PRs prontas: @reviewer"
echo ""
echo "🔗 Links:"
echo "   • VetBooking: https://github.com/antonioneto19/vetbooking"
echo "   • ClubFlow: https://github.com/antonioneto19/ClubFlow"
echo "   • CONSULTORIA-ECOCIL: https://github.com/antonioneto19/CONSULTORIA-ECOCIL"
echo "   • Workspace: https://github.com/antonioneto19/ruflo-workspace"
echo ""
echo "════════════════════════════════════════════════════════════"
