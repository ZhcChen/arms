# Blender Assets

此模块管理武器模型的 Blender 源文件、导出物、预览图和制作记录。

## 目录

```text
assets/blender/
├── sources/
│   └── weapons/          .blend 源文件
├── exports/
│   └── godot/weapons/    面向 Godot 的 .glb / glTF 导出物
├── textures/             制作源贴图或烘焙输出
├── previews/             模型预览图
├── references/           参考图和资料
├── catalog/              武器资产目录
└── docs/                 制作流程、导出规则和 MCP 记录
```

## 命名约定

- 武器 ID 使用小写短横线：`ak-style-rifle`、`service-pistol`。
- Blender 源文件：`sources/weapons/<weapon-id>/<weapon-id>.blend`。
- Godot 导出物：`exports/godot/weapons/<weapon-id>/<weapon-id>.glb`。
- 预览图：`previews/<weapon-id>.png`。

## Godot 导入边界

此目录包含 `.gdignore`，用于避免 Godot 误扫描 Blender 源制作文件。需要进入游戏模块的资产应导出为 `.glb` 后复制或同步到 `apps/arms-game/assets/weapons/`。
