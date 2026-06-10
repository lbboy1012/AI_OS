> ⚠️ **版本說明(2026-06-10):** 此 repo 是 **Codex 規劃版**的 AI_OS(多 agent + 主題分資料夾)。
> 另有一套 **Claude Code 規劃版**(狀態分層:raw → candidate → knowledge)在 private repo **`AI-OS-Family`**。
> **兩方案的正式比較 / merge 尚未進行,兩版都還沒定案。** 完整來龍去脈與搬遷清單見
> `AI-OS-Family` 的 `decisions/2026-06-10-two-repos-lineage.md`。

# AI Agent OS

AI Agent OS is a multi-agent cognitive operating system with a second-brain knowledge base. Chief Agent coordinates Research, Analysis, Investment, Execution, Knowledge, and Document Agents. Codex / Claude Code acts as the execution layer, while important outputs are persisted into the evolving knowledge base.

```text
User -> Chief Agent -> Specialist Agents -> Codex / Tools -> Output -> Knowledge Base -> Chief Agent
```

## Core Goals

- Break down tasks automatically
- Assign work across specialist agents
- Preserve reusable knowledge across sessions and devices
- Keep decisions traceable
- Separate reasoning from execution
- Evolve through repeated work and reviews

## Repository Structure

```text
.
|-- agents/
|   |-- chief_agent.md
|   |-- research_agent.md
|   |-- analysis_agent.md
|   |-- investment_agent.md
|   |-- execution_agent.md
|   |-- knowledge_agent.md
|   `-- document_agent.md
|-- docs/
|   |-- ai_os_system_spec.md
|   `-- organization_charter.md
|-- projects/
|   `-- investment_research/
|-- knowledge_base/
|   |-- raw_sessions/
|   |-- processed_insights/
|   |-- decisions/
|   |-- domains/
|   |   |-- ai_infra/
|   |   |-- investing/
|   |   |   |-- company_memos/
|   |   |   |-- thesis/
|   |   |   `-- trade_reviews/
|   |   `-- semiconductors/
|   |-- entities/
|   |-- experiments/
|   `-- sessions/
|       |-- raw_chat_logs/
|       `-- summarized_sessions/
|-- schemas/
|   `-- knowledge_base.sql
|-- scripts/
|   `-- init_kb.py
`-- workflows/
    `-- agent_loop.json
```

## Quick Start

Initialize the local SQLite knowledge base:

```powershell
python scripts/init_kb.py
```

Default output:

```text
knowledge_base/knowledge_base.sqlite
```

## Operating Model

1. User submits a task.
2. Chief Agent decomposes the task and assigns agents.
3. Specialist agents work on research, analysis, investment framing, execution, knowledge, and documentation.
4. Codex / Claude Code / tools perform concrete execution.
5. Chief Agent aggregates results, decisions, and next steps.
6. Knowledge Agent persists valuable information into the knowledge base.
7. The knowledge base feeds future decisions and forms a learning loop.

## Investment Workflow

Investment work should produce decision support, not automatic trading instructions.

```text
Investment question
-> Chief Agent
-> Research Agent gathers facts
-> Analysis Agent evaluates valuation, scenarios, and risks
-> Investment Agent frames thesis, position sizing, entry/exit conditions, and review rules
-> Document Agent produces an investment memo
-> Knowledge Agent persists memo, decisions, and review tasks
```

## Research Projects

- `projects/investment_research/`: separate investment and personal finance research project for AI equities, Taiwan equities, US Treasuries, bond ETFs, dividend ETFs, portfolio policy, and investment memos.

## Key Documents

- `docs/ai_os_system_spec.md`: Chinese AI OS system specification
- `docs/organization_charter.md`: AI Agent OS organization charter
- `projects/investment_research/README.md`: Investment research project overview
- `agents/investment_agent.md`: Investment strategy and portfolio discipline agent
- `knowledge_base/domains/investing/investment_framework.md`: Investment analysis framework
- `knowledge_base/domains/investing/portfolio_policy.md`: Personal portfolio policy template
- `workflows/agent_loop.json`: Core agent loop
- `schemas/knowledge_base.sql`: SQLite knowledge base schema
