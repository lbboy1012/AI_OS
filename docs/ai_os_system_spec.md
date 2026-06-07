# AI Agent 作業系統（AI OS）系統規格書

## 1. 系統定位

本系統是一個「多代理人（Multi-Agent）認知作業系統 + 第二大腦知識系統」。

目標是建立一個可持續演化的 AI 工作系統，整合：

- 知識累積
- 多 Agent 推理與分工
- Codex / Claude Code 執行能力
- 長期記憶（Knowledge Base）
- 可追溯決策系統

## 2. 核心系統架構

```text
使用者輸入
    ↓
Chief Agent（總控代理）
    ↓
任務解析與拆解系統
    ↓
Agent 任務分派系統
    ↓
[研究 / 分析 / 執行 / 知識 / 文件 Agent]
    ↓
Codex / 工具執行層
    ↓
結果輸出
    ↓
寫入記憶系統（Knowledge Base）
    ↓
回饋至 Chief Agent（形成閉環）
```

## 3. 記憶與知識系統（第二大腦）

### 3.1 資料儲存結構

```text
knowledge_base/
|-- raw_sessions/            # 原始對話與輸入紀錄
|-- processed_insights/      # 壓縮後的洞察
|-- domains/                 # 分領域知識
|   |-- ai_infra/
|   |-- semiconductors/
|   `-- investing/
|-- entities/                # 公司 / 技術 / 概念
|   |-- companies.md
|   `-- technologies.md
|-- decisions/               # 歷史決策紀錄
|   `-- decision_log.md
`-- experiments/             # 測試與實驗結果
```

### 3.2 記憶系統原則

- 所有對話必須保留原始紀錄（raw sessions）
- 所有有價值資訊需轉換為結構化知識
- 所有決策必須可追溯
- 知識可持續更新與重組
- 不允許「只存在於對話中」的資訊

## 4. Agent 系統設計

### 4.1 Chief Agent（總控代理）

職責：

- 解讀使用者需求
- 任務拆解
- Agent 分派
- 整合輸出結果
- 優先級管理

輸出：

```text
任務計畫 + Agent 分工 + 執行順序
```

### 4.2 Research Agent（研究代理）

職責：

- 外部資訊搜尋
- 產業與技術研究
- 競品與市場分析

輸出：

```text
研究報告 + 關鍵資訊 + 來源整理
```

### 4.3 Analysis Agent（分析代理）

職責：

- 邏輯推理
- 比較分析
- 評估模型建立
- 風險判斷

輸出：

```text
分析結果 + 評分 + 推論過程
```

### 4.4 Execution Agent（執行代理）

職責：

- 程式碼執行
- 工具呼叫（Codex / CLI / API）
- 自動化任務執行

輸出：

```text
執行結果 + log + artifact
```

### 4.5 Knowledge Agent（知識代理）

職責：

- 將對話與研究轉為知識
- 去重與壓縮資訊
- 更新 knowledge base

輸出：

```text
Markdown 知識文件 + 標籤 + 類別
```

### 4.6 Document Agent（文件代理）

職責：

- 生成報告
- Markdown / PPT / 結構化文件
- 對外可讀版本整理

輸出：

```text
正式報告 / 文件 / 總結
```

## 5. 任務處理流程

1. 使用者提出問題或任務。
2. Chief Agent 判斷任務類型、拆解子任務、決定需要哪些 Agent。
3. 任務分派給 Research / Analysis / Execution / Knowledge / Document Agents。
4. 各 Agent 並行執行。
5. Chief Agent 去重、排序、綜合判斷並生成最終輸出。
6. 重要結果寫入 raw_sessions、processed_insights、decisions、entities 或其他對應知識區。
7. 結果回饋至 Chief Agent，用於未來決策優化。

## 6. 系統演化機制

- 每次任務都會更新知識庫
- Agent 行為會依歷史資料優化
- 可動態新增新的 Agent，例如 Investment Agent、Market Timing Agent、Data Pipeline Agent
- 工作流程可隨系統成熟度演進

## 7. 設計原則

### 原則一：記憶優先（Memory First）

所有資訊必須可儲存、可追溯、可更新。

### 原則二：推理與執行分離

```text
思考（Agent） != 執行（Codex / Tools）
```

### 原則三：模組化認知系統

每個 Agent 是一個獨立認知功能。

### 原則四：系統可演化

流程不固定，可新增 Agent，也可優化流程。

### 原則五：所有輸出可重建

任何結果都必須可追溯來源，且可重建過程。

## 8. 系統一句話定義

本系統是一個多代理認知作業系統，透過 Chief Agent 統籌 Research / Analysis / Execution / Knowledge / Document Agents，並以 Codex 作為執行層，所有結果持續寫入可演化的第二大腦知識庫（GitHub / 本地儲存），形成可自我進化的 AI 公司型操作系統。

