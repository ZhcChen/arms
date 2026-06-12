---
title: feat: 建立 Godot 与 Blender 多模块项目骨架
type: feat
status: completed
date: 2026-06-12
---

# feat: 建立 Godot 与 Blender 多模块项目骨架

## Overview

本计划为第一人称武器展示与使用项目建立仓库级模块边界：Godot 游戏模块负责运行时场景、脚本、输入与导入后的可用资产；Blender 模型模块负责源文件、导出物、预览与制作记录。仓库保持多模块结构，后续可以继续添加工具链、自动化与设计文档。

## Problem Frame

当前仓库只有 CE 文档目录，缺少 Godot 项目入口、Blender 资产管理规则和跨工具资产流转约定。用户希望项目最终展示各种武器并支持第一人称使用，因此初始结构需要同时支持游戏逻辑开发、模型制作、资产导出和文档沉淀。

## Requirements Trace

- R1. 仓库必须包含 Godot 游戏开发模块目录。
- R2. 仓库必须包含 Blender 模型文件管理和文档记录模块目录。
- R3. 空目录需要占位，便于提交到 Git。
- R4. 结构应支持第一人称武器展示和使用的后续开发。
- R5. 本地 BlenderMCP 配置需要检测，并记录当前可用性。

## Scope Boundaries

- 本次只建立仓库骨架、占位文件与说明文档，不实现第一人称控制器、武器逻辑或真实模型。
- 本次不生成或导入实际 3D 武器模型。
- 本次不依赖 BlenderMCP 成功连接；连接问题记录为后续环境任务。

## Context & Research

### Relevant Code and Patterns

- `AGENTS.md`：项目采用 CE 工作流，计划产物写入 `docs/plans/`。
- `docs/brainstorms/`、`docs/plans/`、`docs/solutions/`：已有文档模块目录和 `.gitkeep` 占位。
- 仓库当前无 Godot、Blender、构建或测试清单。

### Institutional Learnings

- `docs/solutions/` 目前没有可复用历史经验，仅有 `.gitkeep`。

### External References

- Godot 官方文档 `/godotengine/godot-docs`：
  - `project.godot` 是 Godot 项目识别入口。
  - `.godot/` 是编辑器生成缓存，应从版本控制排除。
  - 资产旁边的 `.import` 文件包含导入配置，应提交。
  - 3D 场景推荐使用 glTF 2.0 / `.glb`，也支持 Blender `.blend` 导入。
  - 可用 `.gdignore` 阻止 Godot 扫描不应导入的目录。
  - 大型二进制资产通常适合 Git LFS，但当前本机未检测到 `git lfs`。

## Key Technical Decisions

- 使用 `apps/arms-game/` 作为 Godot 游戏模块：多模块仓库中保留清晰应用边界，Godot 编辑器可直接打开该目录下的 `project.godot`。
- 使用 `assets/blender/` 作为 Blender 源资产模块：Blender 源文件、导出物、预览和制作记录与 Godot 运行时资源分离，避免游戏模块混入大量制作源文件。
- Godot 运行时资产只接收导入目标或轻量样例占位：后续从 Blender 导出的 `.glb` 放入 `apps/arms-game/assets/weapons/` 或从 `assets/blender/exports/godot/` 同步过去。
- 在 `assets/blender/` 下放置 `.gdignore`：如果未来 Godot 从仓库根或父目录扫描，可避免误导入源制作区。
- 先配置 `.gitignore` 与 `.gitattributes`，但不启用 Git LFS：官方建议大资产使用 LFS；当前本机没有 `git lfs`，因此先记录跟踪意图，待工具安装后再执行 LFS 初始化。

## Open Questions

### Resolved During Planning

- Godot 模块位置：选择 `apps/arms-game/`，兼顾多模块仓库和 Godot 项目根目录可打开性。
- Blender 模块位置：选择 `assets/blender/`，强调源资产管理而不是运行时代码。
- 资产导出格式：优先 `.glb` / glTF 2.0，必要时保留 `.blend` 源文件。

### Deferred to Implementation

- Godot 版本：本机 CLI 未检测到 `godot` 或 `godot4`，先按 Godot 4.x 结构写项目文件，后续由安装版本验证。
- BlenderMCP 连接：MCP 当前无法连接 Blender 插件，需启动 Blender 并启用对应插件后复测。
- Git LFS：本机未检测到 `git lfs`，后续安装后再决定是否迁移二进制资产到 LFS。

## High-Level Technical Design

> *This illustrates the intended approach and is directional guidance for review, not implementation specification. The implementing agent should treat it as context, not code to reproduce.*

```text
arms/
├── apps/
│   └── arms-game/                 Godot 可打开项目根
│       ├── project.godot
│       ├── scenes/                游戏场景：player / weapons / showroom / ui
│       ├── scripts/               GDScript 逻辑
│       └── assets/                Godot 运行时资源与导入配置
├── assets/
│   └── blender/                   Blender 源资产与制作记录
│       ├── sources/               .blend 源文件
│       ├── exports/godot/         面向 Godot 的 .glb 导出物
│       ├── previews/              预览图
│       ├── catalog/               武器资产目录
│       └── docs/                  制作、导出、MCP 使用记录
├── docs/
│   ├── design/                    项目设计文档
│   └── plans/                     CE 技术计划
└── tools/
    └── blender/                   Blender 自动化脚本入口
```

## Implementation Units

- [x] **Unit 1: Godot 游戏模块骨架**

**Goal:** 创建 Godot 项目入口、第一人称武器开发相关目录和基础说明。

**Requirements:** R1, R3, R4

**Dependencies:** None

**Files:**
- Create: `apps/arms-game/project.godot`
- Create: `apps/arms-game/README.md`
- Create: `apps/arms-game/assets/.gitkeep`
- Create: `apps/arms-game/scenes/.gitkeep`
- Create: `apps/arms-game/scripts/.gitkeep`

**Approach:**
- 以 `apps/arms-game/` 为 Godot 项目根。
- 创建面向第一人称武器展示的场景、脚本和资源子目录。
- 使用最小 `project.godot`，避免过早引入输入映射和场景依赖。

**Patterns to follow:**
- Godot 官方项目文件与导入缓存版本控制建议。

**Test scenarios:**
- Test expectation: none -- 本单元是项目骨架与配置占位，不包含可执行游戏行为。

**Verification:**
- Godot 编辑器后续可从 `apps/arms-game/project.godot` 打开项目。
- 相关空目录通过 `.gitkeep` 进入版本控制。

- [x] **Unit 2: Blender 资产模块骨架**

**Goal:** 创建 Blender 源文件、导出物、预览、目录和制作文档的管理结构。

**Requirements:** R2, R3, R5

**Dependencies:** None

**Files:**
- Create: `assets/blender/README.md`
- Create: `assets/blender/.gdignore`
- Create: `assets/blender/catalog/weapons.md`
- Create: `assets/blender/docs/pipeline.md`
- Create: `assets/blender/docs/blender-mcp.md`
- Create: `assets/blender/sources/weapons/.gitkeep`
- Create: `assets/blender/exports/godot/weapons/.gitkeep`
- Create: `assets/blender/previews/.gitkeep`
- Create: `assets/blender/references/.gitkeep`
- Create: `assets/blender/textures/.gitkeep`

**Approach:**
- 把 `.blend` 源文件和面向 Godot 的 `.glb` 导出物分层存放。
- 在文档中记录命名约定、导出规则和 BlenderMCP 当前检测结果。
- 使用 `.gdignore` 防止 Godot 误扫描制作源文件目录。

**Patterns to follow:**
- Godot 官方 `.gdignore` 与 3D 资产导入建议。

**Test scenarios:**
- Test expectation: none -- 本单元是资产目录和文档占位，不包含运行时代码。

**Verification:**
- Blender 资产模块目录清晰区分源文件、导出物、预览和文档。
- BlenderMCP 当前连接状态已记录。

- [x] **Unit 3: 仓库级协作与资产版本控制配置**

**Goal:** 添加仓库根说明、忽略规则、资产属性规则和后续工具入口。

**Requirements:** R1, R2, R3

**Dependencies:** Unit 1, Unit 2

**Files:**
- Create: `README.md`
- Create: `.gitignore`
- Create: `.gitattributes`
- Create: `docs/design/first-person-weapon-showcase.md`
- Create: `tools/blender/README.md`

**Approach:**
- 根 README 描述模块边界和建议开发入口。
- `.gitignore` 排除 Godot 缓存、Blender 备份和系统临时文件。
- `.gitattributes` 标记大资产类型，保留 Git LFS 迁移意图。
- 设计文档记录第一人称武器展示的初始概念边界。

**Patterns to follow:**
- CE 文档目录约定与 Godot 官方版本控制建议。

**Test scenarios:**
- Test expectation: none -- 本单元是文档与版本控制配置，不包含行为逻辑。

**Verification:**
- `git status` 展示预期新增文件。
- `.godot/` 等生成目录不会被纳入版本控制。

## System-Wide Impact

- **Interaction graph:** Blender 源资产通过导出物进入 Godot 运行时资源，文档记录命名、导出、导入和后续自动化规则。
- **Error propagation:** 当前无运行时代码错误链路；主要风险是工具链配置不完整，已在文档中记录。
- **State lifecycle risks:** Godot `.godot/` 缓存和 Blender 备份文件不进入 Git；资产导入配置 `.import` 后续应提交。
- **API surface parity:** 当前无外部 API。
- **Integration coverage:** 后续首个真实武器资产应验证 Blender 导出 `.glb` 到 Godot 的完整链路。
- **Unchanged invariants:** CE 文档目录和现有 Git 远程保持不变。

## Risks & Dependencies

- BlenderMCP 未连接：需要启动 Blender 并启用插件后复测；当前不阻塞目录初始化。
- 本机未检测到 Godot CLI：项目结构按 Godot 4.x 编写，后续用实际编辑器打开验证。
- 本机未检测到 Git LFS：真实模型与贴图进入仓库前应先安装并初始化 LFS，避免仓库膨胀。
- 过早固定游戏架构：本次只创建模块和文档，不提前锁死武器系统实现。

## Documentation / Operational Notes

- Godot 游戏入口：`apps/arms-game/project.godot`
- Blender 制作入口：`assets/blender/README.md`
- BlenderMCP 状态记录：`assets/blender/docs/blender-mcp.md`
- 资产流程记录：`assets/blender/docs/pipeline.md`

## Sources & References

- Godot 官方文档：`/godotengine/godot-docs`
- Project conventions: `AGENTS.md`
