# Design to Nuxt 3 Implementation Prompt

## 🎯 任務目標

根據提供的「Pencil 設計稿」畫面，轉換為可實際運作的 Nuxt 3 專案頁面。

請嚴格遵守以下規範：
- 不新增設計稿中沒有的功能
- 不自行改動 UI 結構
- 不自行優化設計（除非明確標示為最佳實踐建議）
- 保持與設計稿視覺一致

---

## 🏗 技術棧規範

專案使用：

- Nuxt 3
- Vue 3 (Composition API)
- SCSS（全域變數）
- Tailwind（頁面樣式）
- 或 Vuetify / Element Plus（依專案決定）

請遵守：

- 使用 `<script setup>`
- 不使用 Options API
- 不使用 TypeScript（除非專案有明確使用）
- 不使用任何 fetch/curl 示範資料
- 不得使用行內樣式

## ✅ 圖示（SVG）一致性檢查

若設計稿有指定圖示（例如 Lucide），**必須使用正確的 SVG 路徑**，不可用相似圖示或自行拼湊的 path 代替。

過去錯誤案例：
- 以類似播放鍵的 path 取代設計稿的 `package` 圖示
- 以不對的箭頭 path 取代設計稿的 `log-in` 圖示

這會導致畫面與設計稿不一致，即使顏色與尺寸正確也視為錯誤。

### 取得正確 SVG Path 的方式

1. 從設計稿或設計工具（Figma / Pencil）確認圖示名稱（例如 `package`、`log-in`）。
2. 到官方圖示庫取得對應 SVG：
   - Lucide：<https://lucide.dev/icons>
3. 直接複製官方 SVG 的 `<path d="...">` 內容，**勿自行修改**。
4. 若專案已有圖示套件（例如 `lucide-vue`），優先使用元件版本並確認圖示名稱一致。

---

## 📁 檔案輸出結構

若為新頁面：
