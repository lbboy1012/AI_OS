# Investment Research Project

This project separates investment and personal finance research from the core AI Agent OS architecture. It is designed to be maintained as a long-term research workspace using the AI OS agent team.

## Purpose

- Research US stocks, Taiwan stocks, US Treasuries, bond ETFs, and income-oriented ETFs
- Identify companies with real AI-era earnings power instead of pure market hype
- Build stable, lower-risk allocation plans using stocks and bonds
- Maintain watchlists, investment memos, decision logs, and review notes
- Keep research traceable and reusable across sessions

## Scope

Included:

- AI infrastructure equities
- Profitable large-cap technology companies
- Taiwan AI supply chain companies
- US Treasury ETFs
- Investment-grade bond ETFs
- Dividend and quality equity ETFs
- Portfolio policy and risk-control rules

Excluded by default:

- Day trading
- Leveraged ETFs
- Options strategies
- Crypto speculation
- Unverified social-media tips
- Automatic trading

## Current Research Tracks

| Track | File | Purpose |
| --- | --- | --- |
| Project Charter | `project_charter.md` | Defines investment research principles and boundaries |
| Workflow | `research_workflow.md` | Defines how agents should process an investment topic |
| AI Equity Watchlist | `ai_equity_watchlist.md` | Tracks AI-era companies for deeper research |
| Stable Income Allocation | `stable_income_allocation.md` | Tracks low-risk stock/bond allocation ideas |
| Research Log | `research_log.md` | Records prior conclusions and follow-up work |
| Memo Template | `templates/investment_memo.md` | Standard format for future investment memos |

## Agent Flow

```text
User topic
-> Chief Agent creates task plan
-> Research Agent gathers data
-> Analysis Agent evaluates valuation, risk, and scenarios
-> Investment Agent creates decision-support memo
-> Knowledge Agent persists reusable findings
-> Document Agent creates readable summary
```

## Safety Rule

All outputs are decision support only and are not financial advice. Final investment decisions remain with the user.

