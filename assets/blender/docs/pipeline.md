# Blender 到 Godot 资产流程

## 目标

建立可重复的武器模型制作链路：Blender 源文件 -> 面向 Godot 的 `.glb` 导出物 -> Godot 运行时资源 -> 第一人称武器场景。

## 推荐流程

1. 在 `assets/blender/sources/weapons/<weapon-id>/` 创建 `.blend` 源文件。
2. 在 Blender 中保持单位、朝向、原点和挂点命名一致。
3. 导出 `.glb` 到 `assets/blender/exports/godot/weapons/<weapon-id>/`。
4. 复制或同步 `.glb` 到 `apps/arms-game/assets/weapons/<weapon-id>/`。
5. 用 Godot 打开 `apps/arms-game/project.godot`，检查导入结果。
6. 提交 Godot `.import` 配置和对应制作记录；模型源文件和导出物不提交 Git。
7. 运行 `make backup-models` 生成本地模型备份压缩包。
8. 将 `model-backups/` 中最新压缩包人工上传到云盘。

## 初始约定

- 优先导出 `.glb`，减少贴图和二进制资源分散。
- 一把武器一个稳定 `weapon-id`。
- 第一人称视角需要特别关注：
  - 枪口方向和局部坐标。
  - 握持点、瞄准点、弹匣/活动部件挂点。
  - 近景视角下的法线、材质和遮挡问题。
  - 动画命名和可复用性。

## 版本控制

- `.blend`、`.glb`、贴图、预览图和参考图等大资产默认不提交 Git。
- `assets/blender/sources/`、`assets/blender/exports/`、`assets/blender/textures/`、`assets/blender/previews/`、`assets/blender/references/` 的真实内容由 `.gitignore` 忽略。
- `apps/arms-game/assets/weapons/` 下由 Blender 导入或同步的真实武器模型也不提交 Git。
- 模型资产通过 `make backup-models` 压缩到 `model-backups/` 后手动备份到云盘。
- `model-backups/` 中的压缩包也不提交 Git，只提交目录说明。
- Godot `.godot/` 缓存不提交。
- Godot `.import` 文件后续应提交。
