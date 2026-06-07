# AI Agent OS

AI Agent OS 是一個多代理人認知作業系統與第二大腦知識系統。Chief Agent 負責統籌 Research、Analysis、Execution、Knowledge、Document Agents，Codex / Claude Code 作為執行層，所有重要結果會持續寫入可演化的 knowledge base。

```text
User -> Chief Agent -> Specialist Agents -> Codex / Tools -> Output -> Knowledge Base -> Chief Agent
```

## 核心目標

- 任務自動拆解
- 多 Agent 分工
- 可重用 knowledge base
- 跨 session / device 延續
- 決策可追溯
- 系統可持續演化

## Repository Structure

```text
.
|-- agents/
|   |-- chief_agent.md
|   |-- research_agent.md
|   |-- analysis_agent.md
|   |-- execution_agent.md
|   |-- knowledge_agent.md
|   `-- document_agent.md
|-- docs/
|   |-- ai_os_system_spec.md
|   `-- organization_charter.md
|-- knowledge_base/
|   |-- raw_sessions/
|   |-- processed_insights/
|   |-- decisions/
|   |-- domains/
|   |   |-- ai_infra/
|   |   |-- investing/
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

初始化本機 SQLite knowledge base：

```powershell
python scripts/init_kb.py
```

預設產生：

```text
knowledge_base/knowledge_base.sqlite
```

## Operating Model

1. User 提出任務。
2. Chief Agent 解析需求、拆解任務、分派 agents。
3. Specialist agents 並行處理研究、分析、執行、知識整理與文件產出。
4. Codex / Claude Code / tools 負責實際執行。
5. Chief Agent 整合輸出、決策與下一步。
6. Knowledge Agent 將有價值資訊寫入 knowledge base。
7. Knowledge base 回饋 Chief Agent，形成 learning loop。

## Key Documents

- `docs/ai_os_system_spec.md`: 正式中文系統規格書
- `docs/organization_charter.md`: AI Agent OS 組織章程
- `workflows/agent_loop.json`: 可自動化的核心 agent loop
- `schemas/knowledge_base.sql`: SQLite knowledge base schema

