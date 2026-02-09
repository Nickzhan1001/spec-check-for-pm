---
name: pm-checklist-normalizer
description: Transforms a PM confirmation checklist into a format-complete version with term explanations. Adds 名詞解釋 for items containing domain terms, status names, or abbreviations when missing. Does NOT re-analyze requirements or add/delete items. Use when the user wants to normalize a checklist, generate a full/complete checklist version, add term explanations for new PMs, or prepare a checklist for meetings/Top20/glossary.
---

# PM Checklist 正規化／完整版

依據既有 `pm-client-checklist.md` 重組與強化，產出格式完整、可直接使用的完整版確認清單。**不重新分析需求、不新增確認事項**。

## 觸發情境

- 使用者要求將 checklist 轉成完整版、加入名詞解釋
- 使用者要求產生「新人 PM 可讀」的 checklist
- 使用者要求準備 meeting / Top20 / Glossary 用 checklist

## 輸入與輸出

**主要輸入**：
- `analysis_context/output/pm-client-checklist.md`

**參考輸入**（僅供对照，不作為新增依據）：
- `analysis_context/input/prd.md`
- `analysis_context/input/epics.md`

**輸出**：
- `analysis_context/output/pm-client-checklist-full.md`

## 任務目標

1. 完整列出所有【確認】項目
2. 完整列出所有【建議】項目
3. 不得遺漏任何一條既有項目
4. 不得新增、刪除或改寫任何問題語意

## 專有名詞解釋補強規則（新人 PM 模式）

若任何【確認】項目中包含：
- 系統專有名詞
- 業務術語
- 狀態名稱
- 技術／架構名詞
- 文件縮寫或角色代稱

且該條下方 **尚未有【名詞解釋】**，必須補上一行【名詞解釋】。

【名詞解釋】必須：
- 以白話說明該名詞的意思
- 假設讀者為無經驗新人 PM
- 不引入新需求、不做設計決策
- 原則上一句即可

**格式固定**（不可更改）：

```
  - 名詞解釋：XXX
```

（縮排為兩個空格）

## 輸出規則

- 僅能使用 `pm-client-checklist.md` 中既有的項目
- 不得自行推導新確認事項
- 不得新增【建議】內容
- 原有來源標註必須保留
- 若原項目已有名詞解釋，不得改寫

## 輸出結構

維持既定的完整版 checklist 格式，與原 checklist 章節對應：

- 一、名詞與狀態定義（確認）
- 二、流程與操作規則（確認）
- 三、跨文件一致性（確認）
- 四、業務決策點（確認）
- 五、例外與錯誤處理（確認）
- 六、跨系統整合與責任歸屬（確認）
- 七、潛在缺漏功能與規劃建議（建議）

## 禁止事項

- 不得補寫、改寫 PRD 或 Epics 內容
- 不得新增、刪除或改寫 checklist 既有項目
- 不得替客戶或 PM 做決策
- 不得改寫既有名詞解釋

## 成功標準

- Full 版與原 checklist 在「問題數量與語意」上完全一致
- 僅差異在於：格式更完整、新人 PM 可理解的名詞解釋更齊全
- 可作為後續 Top20 / Meeting / Glossary 的穩定來源
