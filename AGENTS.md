# OpenCode Agents

This file defines available agents and skills for OpenCode.

## Invokeable Agents

| Agent | File | Description |
|-------|------|-------------|
| architect | agents/architect.md | System architecture design |
| build-error-resolver | agents/build-error-resolver.md | Fix build errors |
| database-reviewer | agents/database-reviewer.md | Database optimization |
| doc-updater | agents/doc-updater.md | Documentation updates |
| planner | agents/planner.md | Implementation planning |
| refactor-cleaner | agents/refactor-cleaner.md | Dead code cleanup |
| rust-build-resolver | agents/rust-build-resolver.md | Rust build errors |
| rust-reviewer | agents/rust-reviewer.md | Rust code review |
| security-reviewer | agents/security-reviewer.md | Security analysis |

## Skills (Knowledge Base)

Skills loaded from `.agents/skills/`:

### Consolidated Skills

| Skill | Description |
|-------|-------------|
| code-quality | Merged coding standards + code review |
| testing | Merged TDD + E2E + expect patterns |

### Essential Skills

| Skill | Source | Description |
|-------|--------|-------------|
| typescript | lobehub/lobehub | TypeScript patterns, types, generics |
| typescript-advanced-types | wshobson/agents | Advanced TypeScript types |
| git-workflow | agno-agi/agno | Git commands, conventions, PR workflow |
| shell-commands | local | Cross-platform shell scripting |
| debugging | local | Debugging techniques, logging |
| database | local | SQL, ORM patterns, query optimization |
| security | local | Auth, validation, common vulnerabilities |
| performance | local | Caching, optimization, efficiency |
| python-performance-optimization | wshobson/agents | Python performance patterns |

### Domain Skills

| Skill | Source | Description |
|-------|--------|-------------|
| frontend-patterns | affaan-m/everything-claude-code | React, state management |
| frontend-design | anthropics/skills | Frontend design patterns |
| backend-patterns | affaan-m/everything-claude-code | Server patterns, APIs |
| nodejs-backend-patterns | wshobson/agents | Node.js backend patterns |
| api-design | affaan-m/everything-claude-code | REST API design |
| bun-runtime | affaan-m/everything-claude-code | Bun-specific patterns |
| mcp-server-patterns | affaan-m/everything-claude-code | MCP server development |
| organization-best-practices | better-auth/skills | Project organization |
| shadcn | shadcn/ui | shadcn/ui components |
| coding-standards | affaan-m/everything-claude-code | Code quality standards |

### Auth Skills

| Skill | Source | Description |
|-------|--------|-------------|
| better-auth-best-practices | better-auth/skills | Authentication |
| two-factor-authentication | better-auth/skills | 2FA implementation |
| email-and-password | better-auth/skills | Email/password auth |
| create-auth-skill | better-auth/skills | Building auth skills |

### Testing Skills

| Skill | Source | Description |
|-------|--------|-------------|
| testing | local | TDD and testing patterns |
| e2e-testing | affaan-m/everything-claude-code | E2E testing |
| e2e-testing-patterns | wshobson/agents | E2E testing patterns |
| webapp-testing | anthropics/skills | Web app testing |
| test-driven-development | obra/superpowers | TDD methodology |

### Workflow Skills

| Skill | Source | Description |
|-------|--------|-------------|
| brainstorming | obra/superpowers | Creative work and feature design |
| writing-plans | obra/superpowers | Implementation planning |
| subagent-driven-development | obra/superpowers | Multi-agent task execution |
| executing-plans | obra/superpowers | Plan execution with checkpoints |
| dispatching-parallel-agents | obra/superpowers | Parallel task execution |
| verification-before-completion | obra/superpowers | Pre-commit verification |
| verification-loop | affaan-m/everything-claude-code | Verification patterns |
| finishing-a-development-branch | obra/superpowers | PR/merge workflow |
| receiving-code-review | obra/superpowers | Handle code review feedback |
| requesting-code-review | obra/superpowers | Request code reviews |
| writing-skills | obra/superpowers | Create and maintain skills |
| using-git-worktrees | obra/superpowers | Isolated branch development |

### Specialized Skills

| Skill | Source | Description |
|-------|--------|-------------|
| agent-browser | vercel-labs/agent-browser | Browser automation |
| chrome-devtools | chromedevtools/chrome-devtools-mcp | Chrome DevTools debugging |
| expect | millionco/expect | Adversarial testing |
| systematic-debugging | obra/superpowers | Debugging patterns |

## Usage

Invoke agents by mentioning in prompt:

- "Use architect to design the new feature"
- "Run security-reviewer on this code"
- "Consult testing skill for TDD patterns"

Skills are auto-loaded and provide domain-specific knowledge.
