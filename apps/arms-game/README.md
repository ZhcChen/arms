# Arms Game

这是 Godot 4 游戏模块，目标是实现第一人称视角下的武器展示、检视、切换和基础使用。

## 目录

```text
apps/arms-game/
├── project.godot
├── assets/
│   ├── weapons/      Godot 可导入或已导入的武器资源
│   ├── materials/    游戏运行时材质
│   ├── textures/     游戏运行时贴图
│   ├── audio/        音效
│   └── icons/        UI 图标
├── scenes/
│   ├── player/       第一人称玩家和相机
│   ├── weapons/      武器场景和挂点
│   ├── showroom/     展示房间和测试场景
│   └── ui/           HUD 与交互提示
└── scripts/
    ├── player/
    ├── weapons/
    ├── showroom/
    └── ui/
```

## 资产约定

- 优先使用 `.glb` / glTF 2.0 作为 Blender 到 Godot 的交付格式。
- Godot 生成的 `.godot/` 缓存不提交。
- Godot 为资产生成的 `.import` 文件后续应提交，因为它包含导入配置。
