# Blender 到 Godot 资产流程

## 目标

建立可重复的武器模型制作链路：Blender 源文件 -> 面向 Godot 的 `.glb` 导出物 -> Godot 运行时资源 -> 第一人称武器场景。

## 推荐流程

1. 先为目标武器创建参数记录文档，建议从 `assets/blender/docs/templates/weapon-model-parameters-template.md` 复制。
2. 在参数文档中整理整体尺寸、零件清单、外观特征、比例假设和参考来源。
3. 参数文档通过初审后，再在 `assets/blender/sources/weapons/<weapon-id>/` 创建 `.blend` 源文件。
4. 先建立整体 blockout：总长、枪管、机匣、枪托、护木、弹匣等主要体块。
5. 再按零件拆分建模：每个外露零件保留对象命名、尺寸、位置和状态记录。
6. 每次建模过程中调整参数，都必须同步更新该武器的参数记录文档：
   - 记录调整日期。
   - 记录对应 `.blend` 文件路径。
   - 记录调整对象或零件。
   - 记录调整前后参数。
   - 记录调整原因和验证结果。
7. 在 Blender 中保持单位、朝向、原点和挂点命名一致。
8. 导出 `.glb` 到 `assets/blender/exports/godot/weapons/<weapon-id>/`。
9. 复制或同步 `.glb` 到 `apps/arms-game/assets/weapons/<weapon-id>/`。
10. 用 Godot 打开 `apps/arms-game/project.godot`，检查导入结果。
11. 提交 Godot `.import` 配置和对应制作记录；模型源文件和导出物不提交 Git。
12. 运行 `make backup-models` 生成本地模型备份压缩包。
13. 将 `model-backups/` 中最新压缩包人工上传到云盘。

## 初始约定

- 优先导出 `.glb`，减少贴图和二进制资源分散。
- 一把武器一个稳定 `weapon-id`。
- 一个正式武器资产对应一个独立 `.blend` 源文件。
- 参数记录文档是模型构建过程的主记录，`.blend` 是二进制工作产物。
- 任何会影响比例、外形、挂点、导出或 Godot 使用的参数变化，都必须记录到对应参数文档。
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
