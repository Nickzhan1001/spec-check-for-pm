---
name: pm-checklist
description: Runs the full PM checklist pipeline: first generates pm-client-checklist.md from PRD and Epics (pm-requirement-checklist), verifies it exists, then produces pm-client-checklist-full.md with term explanations (pm-checklist-normalizer). Use when the user wants to run the complete checklist flow, generate both checklist and full version in one go, or execute the full requirement-to-checklist pipeline.
---

# PM Checklist 完整流程

依序執行兩階段，產出 checklist 與完整版 checklist。

## 觸發情境

- 使用者要求執行「完整 checklist 流程」
- 使用者要求「先產生 checklist 再產生 full 版」
- 使用者要求一次跑完兩階段

## 執行順序（必須依序）

### 階段一：產生 Checklist

依照 **pm-requirement-checklist** 技能執行：

1. 讀取 `analysis_context/input/prd.md` 與 `analysis_context/input/epics.md`
2. 依五個分析維度進行分析，產出【確認】與【建議】項目
3. 寫入 `analysis_context/output/pm-client-checklist.md`

### 階段二：驗證中繼輸出

在進入階段三之前，**必須**確認：

- `analysis_context/output/pm-client-checklist.md` 已存在
- 檔案內容非空、含有完整 checklist 結構（至少包含七大章節標題）

若未產生或內容不完整，**不得**繼續階段三，應回報錯誤並修正階段一。

### 階段三：產生完整版

依照 **pm-checklist-normalizer** 技能執行：

1. 讀取 `analysis_context/output/pm-client-checklist.md`
2. 為【確認】項目中缺少名詞解釋者補上 `  - 名詞解釋：XXX`
3. 寫入 `analysis_context/output/pm-client-checklist-full.md`

## 參考技能

- 階段一細節：`.cursor/skills/pm-requirement-checklist/SKILL.md`
- 階段三細節：`.cursor/skills/pm-checklist-normalizer/SKILL.md`

## 輸出檔案

| 階段 | 檔案路徑 |
|------|----------|
| 一 | `analysis_context/output/pm-client-checklist.md` |
| 三 | `analysis_context/output/pm-client-checklist-full.md` |

## 成功標準

- 階段一完成後，pm-client-checklist.md 存在且內容完整
- 階段三完成後，pm-client-checklist-full.md 存在
- 兩份 checklist 在問題數量與語意上一致（full 版僅多了名詞解釋）
