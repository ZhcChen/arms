# arms

`arms` 是一个面向第一人称视角的武器展示与使用项目。仓库采用多模块结构：Godot 负责游戏运行时，Blender 负责模型源资产与制作记录。

## 模块布局

```text
arms/
├── apps/
│   └── arms-game/        Godot 4 游戏项目
├── assets/
│   └── blender/          Blender 源资产、导出物、预览与制作文档
├── docs/
│   ├── design/           产品和玩法设计记录
│   ├── plans/            CE 技术计划
│   ├── brainstorms/      CE 需求讨论产物
│   └── solutions/        CE 经验沉淀
└── tools/
    └── blender/          Blender 自动化脚本入口
```

## 开发入口

- Godot 项目：打开 `apps/arms-game/project.godot`
- Blender 资产模块：查看 `assets/blender/README.md`
- 资产制作流程：查看 `assets/blender/docs/pipeline.md`
- AK-47 Type 3 参数记录：查看 `assets/blender/catalog/weapons/traditional-ak47-type3-parameters.md`
- BlenderMCP 状态：查看 `assets/blender/docs/blender-mcp.md`
- 模型文件备份：运行 `make backup-models`，再把 `model-backups/` 里的压缩包手动上传云盘

## 当前阶段

当前仓库只完成项目骨架和文档占位，还没有实现第一人称控制器、武器系统或真实模型资产。
