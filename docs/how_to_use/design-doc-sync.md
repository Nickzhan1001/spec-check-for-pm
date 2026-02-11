# 設計稿文檔同步使用指南

## 概述

當您修改 `design/design.pen` 設計稿後，可以使用以下方法將變更同步到相關的 Markdown 文檔。

## 方法一：使用 Cursor Agent（推薦）

### 步驟

1. **開啟 Agent 對話**
   - 在 Cursor 中按 `Ctrl+L`（或 `Cmd+L`）開啟 Agent 對話

2. **執行同步指令**
   ```
   請同步設計稿到文檔
   ```
   或
   ```
   請分析 design.pen 並更新 design-gap-analysis.md
   ```

3. **Agent 會自動執行**
   - 讀取設計稿的所有頁面節點
   - 分析頁面結構和功能
   - 對照 spec 文件
   - 更新 `analysis_context/analysis/design-gap-analysis.md`
   - 報告更新內容

### 優點

- ✅ 自動使用 Pencil MCP 工具讀取設計稿
- ✅ 智能分析設計變更
- ✅ 自動對照規格文件
- ✅ 保持文檔格式一致

## 方法二：使用 Cursor Command

### 步驟

1. **開啟命令面板**
   - 按 `Ctrl+Shift+P`（或 `Cmd+Shift+P`）

2. **執行命令**
   - 輸入 `sync-design-docs`
   - 選擇「同步設計稿到文檔」命令

3. **Agent 會自動執行同步**

## 方法三：使用 PowerShell 腳本（進階）

### 步驟

1. **開啟 PowerShell**
   ```powershell
   cd e:\project\quotation-check-with-spec-kit
   ```

2. **執行腳本**
   ```powershell
   .\.specify\scripts\powershell\sync-design-to-docs.ps1
   ```

**注意**：此腳本目前只提供工作流程指引，實際更新仍需透過 Agent 執行。

## 同步內容

### 會更新的文檔

1. **analysis_context/analysis/design-gap-analysis.md**
   - 設計稿頁面清單與對應路由
   - 版面配置（座標）
   - 已補齊之缺漏
   - 建議再確認或細化之項目

2. **docs/prompt/design/design-baseline.prompt.md**（可選）
   - 設計變數（色彩、字體）
   - 元件樣式規範

### 更新範例

**設計缺漏分析更新前**：
```markdown
| Return List | btgQQ | /return-list | |
```

**設計缺漏分析更新後**：
```markdown
| Return List | btgQQ | /return-list | 已補篩選與列表結構 |
```

## 最佳實踐

### 1. 定期同步

建議在以下時機執行同步：
- ✅ 完成一個功能模組的設計後
- ✅ 修改設計稿後準備提交前
- ✅ 需要更新規格文件時

### 2. 檢查更新內容

同步後，檢查以下內容：
- 頁面清單是否完整
- 路由對應是否正確
- 缺漏分析是否準確

### 3. 手動補充

對於以下內容，可能需要手動補充：
- 詳細的功能說明
- 複雜的互動流程
- 特殊狀態的設計說明

## 疑難排解

### 問題：Agent 無法讀取設計稿

**解決方案**：
1. 確認 Pencil MCP 工具已正確配置
2. 確認設計稿路徑正確：`design/design.pen`
3. 嘗試重新開啟 Cursor

### 問題：更新內容不完整

**解決方案**：
1. 檢查設計稿節點的 `name` 屬性是否正確
2. 確認 spec 文件路徑正確
3. 手動補充缺失的資訊

### 問題：格式不一致

**解決方案**：
1. 檢查現有文檔的格式
2. 確保更新時維持相同格式
3. 使用 Markdown 格式化工具檢查

## 相關資源

- [設計缺漏分析報告](../analysis_context/analysis/design-gap-analysis.md)
- [設計基準文件](../docs/prompt/design/design-baseline.prompt.md)
- [Pencil MCP 工具文件](https://pencil.dev/docs)

## 支援

如有問題，請：
1. 檢查本文檔的疑難排解章節
2. 查看 Agent 的執行日誌
3. 聯繫專案維護者
