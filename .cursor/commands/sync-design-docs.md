---
description: 同步設計稿變更到相關 Markdown 文檔
---

## 任務說明

分析 `design/design.pen` 設計稿的變更，並更新以下文檔：

1. **analysis_context/analysis/design-gap-analysis.md** - 設計缺漏分析報告
2. **docs/prompt/design/design-baseline.prompt.md**（如需要）- 設計基準文件

## 執行步驟

### 1. 讀取設計稿結構

使用 Pencil MCP 工具讀取設計稿：

```javascript
// 使用 mcp_pencil_batch_get 讀取所有頁面節點
// 搜尋所有頂層 frame 節點（頁面）
```

### 2. 分析設計頁面

對於每個頁面節點，提取以下資訊：
- 節點 ID
- 頁面名稱（name 屬性）
- 座標位置（x, y）
- 對應的路由（根據頁面名稱推斷）
- 主要元件和功能

### 3. 更新設計缺漏分析

更新 `analysis_context/analysis/design-gap-analysis.md`：

**三、設計稿頁面清單與對應路由**
- 根據讀取的頁面節點，生成表格
- 包含：頁面名稱、設計節點 ID、對應路由、備註

**四、依功能分列之版面配置（座標）**
- 根據 y 座標分組頁面
- 列出每個功能區塊的頁面

**一、已補齊之缺漏**
- 對照 spec 文件，檢查是否有新補齊的功能
- 記錄補齊的功能和對應的節點 ID

**二、建議再確認或細化之項目**
- 對照 spec，找出可能需要細化的項目
- 記錄建議事項

### 4. 更新設計基準（可選）

如果需要更新設計基準文件，提取以下資訊：
- 色彩變數（從設計稿的 variables）
- 字體設定
- 間距和圓角規範
- 元件樣式規範

## 輸出格式

### 設計缺漏分析更新範例

```markdown
## 三、設計稿頁面清單與對應路由

| 頁面名稱 | 設計節點 ID | 對應路由 | 備註 |
|----------|-------------|----------|------|
| Login Page | rHXiG | /login | |
| Shipping Page | Shp01 | /shipping | |
| Return List | btgQQ | /return-list | 已補篩選與列表結構 |
```

## 注意事項

1. **只更新事實資訊**：只記錄設計稿中實際存在的頁面和元件，不要推測或新增
2. **保持格式一致**：維持現有 Markdown 格式和表格結構
3. **保留現有內容**：更新時保留現有的分析內容，只更新變更部分
4. **日期更新**：更新「檢查日期」為當前日期

## 執行指令

執行此命令時，Agent 應該：

1. 使用 `mcp_pencil_batch_get` 讀取設計稿的所有頂層頁面節點
2. 分析每個頁面的結構和功能
3. 對照 spec 文件（`analysis_context/spec/` 和 `analysis_context/input/`）
4. 更新 `design-gap-analysis.md` 的相關章節
5. 如有需要，更新 `design-baseline.prompt.md`

## 範例對話

**使用者**：執行 sync-design-docs

**Agent**：
1. 讀取 design.pen 的所有頁面節點
2. 分析頁面結構
3. 對照 spec 文件
4. 更新 design-gap-analysis.md
5. 報告更新內容
