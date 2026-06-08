# Investment Research Workflow

## 1. User Input

Example:

```text
Analyze AI-related US stocks, Taiwan stocks, and US bonds for stable long-term investment.
```

## 2. Chief Agent Decomposition

Chief Agent should classify the task:

- Equity research
- Bond / income allocation
- Portfolio construction
- Watchlist update
- Investment memo
- Decision review

## 3. Research Agent

Collect:

- Latest price and valuation data
- Company revenue, earnings, margins, and guidance
- Segment exposure to AI
- Balance sheet and cash flow quality
- ETF yield, duration, expense ratio, and holdings
- Macro context such as Treasury yields and Fed policy

## 4. Analysis Agent

Evaluate:

- Business quality
- Earnings power
- Valuation risk
- Drawdown risk
- Scenario analysis
- Peer comparison
- Expected return vs risk

## 5. Investment Agent

Produce:

- Investment thesis
- Buy/watch/avoid category
- Position sizing range
- Entry conditions
- Add conditions
- Trim / exit conditions
- Review date

## 6. Knowledge Agent

Persist:

- Raw research session
- Processed insight
- Company memo
- Watchlist update
- Decision log
- Review task

## 7. Document Agent

Create a readable summary for the user:

- Brief conclusion
- Candidate list
- Risks
- Watch prices or conditions
- Next action

## Required Memo Format

Use `templates/investment_memo.md` for individual stock or ETF memos.

