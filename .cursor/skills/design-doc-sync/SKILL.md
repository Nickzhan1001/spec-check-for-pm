---
name: design-doc-sync
description: 同步設計稿變更到相關 Markdown 文檔。當設計稿（design.pen）修改後，自動分析並更新設計缺漏分析報告（design-gap-analysis.md）和設計基準文件（design-baseline.prompt.md）。使用 Pencil MCP 工具讀取設計稿資訊。
---

# 設計稿文檔同步技能

## 用途

當設計稿（`design/design.pen`）修改後，自動分析設計變更並同步更新相關的 Markdown 文檔。

## 觸發時機

- 使用者修改設計稿後，要求同步到文檔
- 使用者執行 `sync-design-docs` 命令
- 使用者明確要求更新設計缺漏分析或設計基準文件

## 工作流程

### 1. 讀取設計稿結構

使用 Pencil MCP 工具讀取設計稿：

```javascript
// 讀取所有頂層頁面節點
mcp_pencil_batch_get({
  filePath: "design/design.pen",
  patterns: [{ type: "frame" }],
  searchDepth: 1,
  readDepth: 2
})
```

### 2. 分析頁面資訊

對於每個頁面節點，提取：
- **節點 ID**：用於追蹤和引用
- **頁面名稱**：從 `name` 屬性取得
- **座標位置**：`x`, `y` 座標用於版面配置分析
- **主要元件**：子節點的類型和功能
- **路由對應**：根據頁面名稱推斷對應的路由

### 3. 對照規格文件

讀取以下規格文件進行對照：
- `analysis_context/input/prd.md`
- `analysis_context/input/epics.md`
- `analysis_context/input/ux-design-specification.md`
- `analysis_context/spec/02-frontend.spec.md`
- `analysis_context/spec/tasks/frontend/*.md`

### 4. 更新設計缺漏分析

更新 `analysis_context/analysis/design-gap-analysis.md`：

#### 更新「三、設計稿頁面清單與對應路由」

生成表格，包含：
- 頁面名稱
- 設計節點 ID
- 對應路由（根據頁面名稱推斷）
- 備註（如有特殊說明）

#### 更新「四、依功能分列之版面配置（座標）」

根據 y 座標分組頁面：
- Row 0 (y=0)：登入相關
- Row 1 (y=1280)：出貨作業
- Row 2 (y=2560)：即時公告
- Row 3 (y=3840)：收貨作業
- Row 4 (y=5120)：退貨作業

#### 更新「一、已補齊之缺漏」

對照 spec 文件，檢查是否有新補齊的功能：
- 記錄功能名稱
- 標註 Spec 來源
- 記錄設計稿節點 ID
- 描述補齊的內容

#### 更新「二、建議再確認或細化之項目」

對照 spec，找出可能需要細化的項目：
- 功能列細節
- 表單欄位完整性
- 錯誤狀態設計
- 動態行為註記

### 5. 更新設計基準（可選）

如需更新 `docs/prompt/design/design-baseline.prompt.md`：

#### 提取設計變數

```javascript
mcp_pencil_get_variables({
  filePath: "design/design.pen"
})
```

更新色彩 Token、字體設定等。

#### 提取元件樣式

分析常用元件的樣式規範：
- 按鈕樣式
- 輸入框樣式
- 卡片樣式
- 導航欄樣式

## 輸出格式

### 設計缺漏分析更新範例

```markdown
## 三、設計稿頁面清單與對應路由

| 頁面名稱 | 設計節點 ID | 對應路由 | 備註 |
|----------|-------------|----------|------|
| Login Page | rHXiG | /login | |
| Shipping Page | Shp01 | /shipping | |
| Return List | btgQQ | /return-list | 已補篩選與列表結構 |
| Return Slip Edit | DGIJj | /return-slip-edit/:id | |
```

### 版面配置更新範例

```markdown
## 四、依功能分列之版面配置（座標）

- **Row 0** (y=0)：登入相關（Login、Login Error、Login Forgot Password）
- **Row 1** (y=1280)：出貨作業、Delivery Details Dialog、Signature Pad Dialog
- **Row 2** (y=2560)：即時公告
- **Row 3** (y=3840)：收貨作業
- **Row 4** (y=5120)：退貨作業
```

## 注意事項

1. **只更新事實資訊**：只記錄設計稿中實際存在的頁面和元件，不要推測或新增
2. **保持格式一致**：維持現有 Markdown 格式和表格結構
3. **保留現有內容**：更新時保留現有的分析內容，只更新變更部分
4. **日期更新**：更新「檢查日期」為當前日期（格式：yyyy-MM-dd）
5. **節點 ID 準確性**：確保記錄的節點 ID 正確，用於後續追蹤

## 使用範例

**使用者**：請同步設計稿到文檔

**Agent 執行**：
1. 讀取 design.pen 的所有頁面節點
2. 分析頁面結構和功能
3. 對照 spec 文件
4. 更新 design-gap-analysis.md
5. 報告更新內容

**使用者**：更新設計基準文件

**Agent 執行**：
1. 讀取設計稿的變數和樣式
2. 更新 design-baseline.prompt.md
3. 報告更新的章節

## 相關文件

- `analysis_context/analysis/design-gap-analysis.md` - 設計缺漏分析報告
- `docs/prompt/design/design-baseline.prompt.md` - 設計基準文件
- `design/design.pen` - 設計稿檔案
