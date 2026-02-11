#!/usr/bin/env pwsh
<#!
.SYNOPSIS
同步設計稿變更到相關 Markdown 文檔

.DESCRIPTION
讀取 design.pen 設計稿的變更，並更新相關的 Markdown 文檔：
- analysis_context/analysis/design-gap-analysis.md
- docs/prompt/design/design-baseline.prompt.md（如需要）

使用 Pencil MCP 工具讀取設計稿資訊。

.PARAMETER DesignFile
設計稿檔案路徑（預設：design/design.pen）

.PARAMETER UpdateGapAnalysis
是否更新設計缺漏分析（預設：true）

.PARAMETER UpdateBaseline
是否更新設計基準文件（預設：false）

.EXAMPLE
./sync-design-to-docs.ps1

.EXAMPLE
./sync-design-to-docs.ps1 -UpdateBaseline $true

.NOTES
需要 Pencil MCP 工具支援
#>
param(
    [Parameter(Position=0)]
    [string]$DesignFile = "design/design.pen",
    
    [Parameter()]
    [bool]$UpdateGapAnalysis = $true,
    
    [Parameter()]
    [bool]$UpdateBaseline = $false
)

$ErrorActionPreference = 'Stop'

# 導入共用函數
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
. (Join-Path $ScriptDir 'common.ps1')

# 取得環境路徑
$envData = Get-FeaturePathsEnv
$REPO_ROOT = $envData.REPO_ROOT
$DESIGN_FILE_PATH = Join-Path $REPO_ROOT $DesignFile
$GAP_ANALYSIS_FILE = Join-Path $REPO_ROOT "analysis_context/analysis/design-gap-analysis.md"
$BASELINE_FILE = Join-Path $REPO_ROOT "docs/prompt/design/design-baseline.prompt.md"

function Write-Info {
    param([string]$Message)
    Write-Host "INFO: $Message" -ForegroundColor Cyan
}

function Write-Success {
    param([string]$Message)
    Write-Host "✓ $Message" -ForegroundColor Green
}

function Write-WarningMsg {
    param([string]$Message)
    Write-Warning $Message
}

function Write-Err {
    param([string]$Message)
    Write-Host "ERROR: $Message" -ForegroundColor Red
}

function Get-DesignPages {
    param([string]$DesignPath)
    
    Write-Info "讀取設計稿頁面資訊..."
    
    # 這裡需要使用 Pencil MCP 工具
    # 由於無法直接呼叫 MCP，建議透過 Agent 或 API 來執行
    # 暫時返回提示訊息
    
    Write-WarningMsg "此功能需要透過 Cursor Agent 或 MCP 工具來執行"
    Write-Info "建議使用以下方式："
    Write-Info "1. 在 Cursor 中開啟 Agent 對話"
    Write-Info "2. 輸入：請分析 design.pen 並更新 design-gap-analysis.md"
    Write-Info "3. Agent 會使用 Pencil MCP 工具讀取設計稿並更新文檔"
    
    return @()
}

function Update-GapAnalysis {
    param(
        [array]$Pages,
        [string]$OutputFile
    )
    
    if (-not $Pages) {
        Write-WarningMsg "沒有設計頁面資訊，跳過更新"
        return $false
    }
    
    Write-Info "更新設計缺漏分析文件..."
    
    $date = Get-Date -Format "yyyy-MM-dd"
    $content = @"
# 設計缺漏分析報告

依 `epics.md`、`prd.md`、`ux-design-specification.md` 及 frontend-task spec 對照 `design.pen` 設計稿之缺漏檢查結果。

**檢查日期**：$date

---

## 一、已補齊之缺漏

（此部分由 Agent 分析後填入）

---

## 二、建議再確認或細化之項目

（此部分由 Agent 分析後填入）

---

## 三、設計稿頁面清單與對應路由

| 頁面名稱 | 設計節點 ID | 對應路由 | 備註 |
|----------|-------------|----------|------|
（此部分由 Agent 分析後填入）

---

## 四、依功能分列之版面配置（座標）

（此部分由 Agent 分析後填入）

---

## 五、結論

（此部分由 Agent 分析後填入）
"@
    
    $dir = Split-Path -Parent $OutputFile
    if (-not (Test-Path $dir)) {
        New-Item -ItemType Directory -Path $dir -Force | Out-Null
    }
    
    Set-Content -LiteralPath $OutputFile -Value $content -Encoding utf8
    Write-Success "已更新設計缺漏分析文件"
    return $true
}

function Main {
    Write-Info "=== 同步設計稿到文檔 ==="
    
    if (-not (Test-Path $DESIGN_FILE_PATH)) {
        Write-Err "設計稿檔案不存在：$DESIGN_FILE_PATH"
        exit 1
    }
    
    Write-Info "設計稿路徑：$DESIGN_FILE_PATH"
    
    # 由於 PowerShell 腳本無法直接使用 MCP 工具，
    # 這裡提供一個工作流程建議
    
    Write-Host ""
    Write-Host "由於需要讀取 .pen 檔案，建議使用以下方式：" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "方法 1：使用 Cursor Agent" -ForegroundColor Cyan
    Write-Host "  1. 在 Cursor 中開啟 Agent 對話"
    Write-Host "  2. 輸入：請分析 design.pen 並更新 design-gap-analysis.md"
    Write-Host "  3. Agent 會使用 Pencil MCP 工具讀取設計稿並更新文檔"
    Write-Host ""
    Write-Host "方法 2：使用 Cursor Command" -ForegroundColor Cyan
    Write-Host "  1. 建立一個 Cursor Command（見下方建議）"
    Write-Host "  2. 執行該命令來自動同步"
    Write-Host ""
    
    if ($UpdateGapAnalysis) {
        Write-Info "準備更新設計缺漏分析..."
        # 實際更新需要透過 Agent 執行
    }
    
    if ($UpdateBaseline) {
        Write-Info "準備更新設計基準文件..."
        # 實際更新需要透過 Agent 執行
    }
    
    Write-Success "腳本執行完成（實際更新需透過 Agent 執行）"
}

Main
