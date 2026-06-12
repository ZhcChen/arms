# Model Backups

此目录用于存放本地生成的模型资产备份压缩包。

## 使用方式

在仓库根目录运行：

```bash
make backup-models
```

生成文件示例：

```text
model-backups/20260612-113000-blender-models.zip
```

文件名前缀为 `YYYYMMDD-HHMMSS`，按文件名倒序排序时最新备份在最前。

## 备份范围

默认压缩以下目录：

- `assets/blender/sources/`
- `assets/blender/exports/`
- `assets/blender/textures/`
- `assets/blender/previews/`
- `assets/blender/references/`
- `apps/arms-game/assets/weapons/`

## Git 策略

- 本目录只提交这个说明文件。
- 生成的 `.zip` 压缩包不提交 Git。
- 压缩包生成后需要人工上传到云盘。
- 上传后，把云盘备份批次或文件名记录到对应武器参数文档的“参数调整记录”中。
