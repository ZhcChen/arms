# Weapon Catalog

用于记录每个武器资产的制作状态、文件位置和导出状态。

## 状态字段

- `idea`：只有概念或参考。
- `blockout`：完成基础轮廓。
- `modeling`：建模中。
- `texturing`：贴图或材质制作中。
- `exported`：已导出到 Godot 可用格式。
- `integrated`：已进入 Godot 场景并通过手动验证。

## 武器列表

- `traditional-ak47-type3`：AK-47 Type 3 传统固定木托版本，当前状态 `modeling`。已完成 refine pass 1，本地导出物已同步到 Godot 运行时目录。参数记录见 `assets/blender/catalog/weapons/traditional-ak47-type3-parameters.md`。

后续建议记录格式：

```text
ID:
显示名称:
类型:
状态:
参数记录:
Blender 源文件:
Godot 导出物:
预览图:
备份批次:
备注:
```

注意：`Blender 源文件`、`Godot 导出物` 和 `预览图` 记录的是本地相对路径，不代表文件会提交到 Git。真实模型资产通过 `make backup-models` 进入本地压缩包，再人工上传云盘。每个正式武器都必须有独立参数记录文档。
