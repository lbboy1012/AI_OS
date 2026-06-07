PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS agents (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    role TEXT NOT NULL,
    mission TEXT NOT NULL,
    responsibilities TEXT NOT NULL,
    output_format TEXT NOT NULL,
    created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS sessions (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    summary TEXT,
    raw_path TEXT,
    summary_path TEXT,
    status TEXT NOT NULL DEFAULT 'active',
    started_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ended_at TEXT
);

CREATE TABLE IF NOT EXISTS session_agents (
    session_id INTEGER NOT NULL,
    agent_id INTEGER NOT NULL,
    PRIMARY KEY (session_id, agent_id),
    FOREIGN KEY (session_id) REFERENCES sessions(id) ON DELETE CASCADE,
    FOREIGN KEY (agent_id) REFERENCES agents(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS sources (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    source_type TEXT NOT NULL,
    uri TEXT,
    local_path TEXT,
    description TEXT,
    created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS knowledge_items (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    category TEXT NOT NULL,
    body TEXT NOT NULL,
    confidence REAL NOT NULL DEFAULT 0.8,
    status TEXT NOT NULL DEFAULT 'active',
    source_id INTEGER,
    session_id INTEGER,
    created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (source_id) REFERENCES sources(id) ON DELETE SET NULL,
    FOREIGN KEY (session_id) REFERENCES sessions(id) ON DELETE SET NULL,
    CHECK (confidence >= 0.0 AND confidence <= 1.0)
);

CREATE TABLE IF NOT EXISTS decisions (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    decision TEXT NOT NULL,
    rationale TEXT NOT NULL,
    session_id INTEGER,
    status TEXT NOT NULL DEFAULT 'accepted',
    decided_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (session_id) REFERENCES sessions(id) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS tasks (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    description TEXT,
    owner_agent_id INTEGER,
    session_id INTEGER,
    status TEXT NOT NULL DEFAULT 'todo',
    priority INTEGER NOT NULL DEFAULT 3,
    created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (owner_agent_id) REFERENCES agents(id) ON DELETE SET NULL,
    FOREIGN KEY (session_id) REFERENCES sessions(id) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS tags (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS knowledge_item_tags (
    knowledge_item_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL,
    PRIMARY KEY (knowledge_item_id, tag_id),
    FOREIGN KEY (knowledge_item_id) REFERENCES knowledge_items(id) ON DELETE CASCADE,
    FOREIGN KEY (tag_id) REFERENCES tags(id) ON DELETE CASCADE
);

CREATE VIRTUAL TABLE IF NOT EXISTS knowledge_search USING fts5(
    title,
    body,
    category,
    content='knowledge_items',
    content_rowid='id'
);

CREATE TRIGGER IF NOT EXISTS knowledge_items_ai AFTER INSERT ON knowledge_items BEGIN
    INSERT INTO knowledge_search(rowid, title, body, category)
    VALUES (new.id, new.title, new.body, new.category);
END;

CREATE TRIGGER IF NOT EXISTS knowledge_items_ad AFTER DELETE ON knowledge_items BEGIN
    INSERT INTO knowledge_search(knowledge_search, rowid, title, body, category)
    VALUES ('delete', old.id, old.title, old.body, old.category);
END;

CREATE TRIGGER IF NOT EXISTS knowledge_items_au AFTER UPDATE ON knowledge_items BEGIN
    INSERT INTO knowledge_search(knowledge_search, rowid, title, body, category)
    VALUES ('delete', old.id, old.title, old.body, old.category);
    INSERT INTO knowledge_search(rowid, title, body, category)
    VALUES (new.id, new.title, new.body, new.category);
END;

INSERT OR IGNORE INTO agents (name, role, mission, responsibilities, output_format) VALUES
('Chief Agent', 'orchestrator', 'Decompose user tasks, assign agents, aggregate outputs, and manage learning loops.', 'task decomposition; assignment; aggregation; priority decisions; knowledge persistence planning', 'Task Plan + Agent Assignment + Priority'),
('Research Agent', 'research', 'Gather and compare external or internal information with traceable sources.', 'web research; technical research; industry analysis; competitor analysis; source comparison', 'Research Report + Key Insights + Source Links'),
('Analysis Agent', 'analysis', 'Perform structured reasoning, comparison, scoring, model building, and risk assessment.', 'logical reasoning; comparative analysis; scoring; evaluation models; risk assessment; trade-off analysis', 'Analysis Result + Scores + Reasoning Trace'),
('Knowledge Agent', 'knowledge', 'Convert raw sessions and outputs into structured long-term memory.', 'summarization; deduplication; tagging; categorization; traceability; knowledge promotion', 'Markdown Knowledge Base + tags + categories'),
('Execution Agent', 'execution', 'Implement code, run tools, create artifacts, and verify results.', 'code; scripts; analysis; automation; tool calling; artifact generation', 'Result + Logs + Artifacts'),
('Document Agent', 'documentation', 'Turn agent outputs into structured documents and reports.', 'reports; summaries; markdown specs; PPT outlines; user-facing docs', 'Structured Document / Report');

INSERT OR IGNORE INTO tags (name) VALUES
('agent-team'),
('knowledge-base'),
('session-memory'),
('analysis'),
('execution-layer'),
('learning-loop'),
('decision'),
('research'),
('documentation');
