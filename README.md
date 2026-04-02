# OpenCode Devkit

A comprehensive development toolkit for OpenCode agents with built-in commands, skills, and agent workflows.

## Features

- **Agents** - Specialized agents for architecture, code review, debugging, and more
- **Skills** - Domain-specific knowledge bases for TypeScript, testing, security, etc.
- **Commands** - Reusable CLI commands
- **Rules** - Code quality and linting rules

## Project Structure

```bash
opencode-devkit/
├── agents/           # Invokeable agent definitions
├── .agents/
│   └── skills/       # Domain-specific knowledge bases
├── commands/         # CLI commands
├── rules/            # Linting rules
├── tools/            # Utility tools
├── plugins/          # OpenCode plugins
└── dist/             # Compiled output
```

## Available Agents

| Agent                 | Purpose                       |
|-----------------------|-------------------------------|
| architect             | System architecture design    |
| build-error-resolver  | Fix build errors              |
| database-reviewer     | Database optimization         |
| doc-updater           | Documentation updates         |
| planner               | Implementation planning       |
| refactor-cleaner      | Dead code cleanup             |
| rust-build-resolver   | Rust build errors             |
| rust-reviewer         | Rust code review              |
| security-reviewer     | Security analysis             |

## Available Skills (44 total)

### Essential Skills

- `typescript` - TypeScript patterns (lobehub/lobehub)
- `typescript-advanced-types` - Advanced TypeScript types (wshobson/agents)
- `git-workflow` - Git commands and PR workflow (agno-agi/agno)
- `shell-commands` - Cross-platform shell scripting
- `debugging` - Debugging techniques
- `database` - SQL and ORM patterns
- `security` - Security best practices
- `performance` - Optimization patterns
- `python-performance-optimization` - Python performance (wshobson/agents)

### Domain Skills

- `frontend-patterns` - React and state management
- `frontend-design` - Frontend design patterns (anthropics/skills)
- `backend-patterns` - Server-side patterns
- `nodejs-backend-patterns` - Node.js backend (wshobson/agents)
- `api-design` - REST API design
- `bun-runtime` - Bun-specific patterns
- `mcp-server-patterns` - MCP server development
- `organization-best-practices` - Project organization (better-auth/skills)
- `shadcn` - shadcn/ui components
- `coding-standards` - Code quality standards

### Auth Skills

- `better-auth-best-practices` - Authentication (better-auth/skills)
- `two-factor-authentication` - 2FA (better-auth/skills)
- `email-and-password` - Email/password auth (better-auth/skills)
- `create-auth-skill` - Building auth skills (better-auth/skills)

### Testing Skills

- `testing` - TDD and testing patterns
- `e2e-testing` - E2E testing
- `e2e-testing-patterns` - E2E testing patterns (wshobson/agents)
- `webapp-testing` - Web app testing (anthropics/skills)
- `test-driven-development` - TDD (obra/superpowers)

### Workflow Skills

- `brainstorming` - Feature design (obra/superpowers)
- `writing-plans` - Implementation planning (obra/superpowers)
- `subagent-driven-development` - Multi-agent workflows (obra/superpowers)
- `executing-plans` - Plan execution (obra/superpowers)
- `dispatching-parallel-agents` - Parallel task execution (obra/superpowers)
- `verification-before-completion` - Pre-commit verification (obra/superpowers)
- `verification-loop` - Verification patterns
- `finishing-a-development-branch` - PR/merge workflow (obra/superpowers)
- `receiving-code-review` - Handle code review (obra/superpowers)
- `requesting-code-review` - Request code reviews (obra/superpowers)
- `writing-skills` - Create and maintain skills (obra/superpowers)
- `using-git-worktrees` - Isolated branch development (obra/superpowers)

### Specialized Skills

- `agent-browser` - Browser automation (vercel-labs/agent-browser)
- `chrome-devtools` - Chrome DevTools debugging
- `expect` - Adversarial testing (millionco/expect)
- `systematic-debugging` - Debugging patterns (obra/superpowers)

## Installation

```bash
bun install
bun run build
```

## Development

```bash
bun run dev      # Watch mode
bun run build    # Build
bun run typecheck # Type check
bun run lint     # Lint
```

## License

MIT
