# BlenderMCP 状态记录

## 当前检测结果

检测日期：2026-06-12

本地发现 Blender 应用：

```text
/Applications/Blender.app
```

通过 BlenderMCP 获取场景信息失败：

```text
Could not connect to Blender. Make sure the Blender addon is running.
```

PolyHaven 状态检测同样失败，原因相同。

## 结论

BlenderMCP 服务在 Codex 侧可调用，但当前没有连接到正在运行并启用插件的 Blender 实例。

## 后续恢复步骤

1. 启动 Blender。
2. 确认 BlenderMCP 插件已安装并启用。
3. 在 Blender 中启动插件对应的服务。
4. 重新让 Codex 调用 BlenderMCP 的场景信息接口。

连接恢复后，可用它自动检查场景、导入资产、生成预览或协助模型制作。
