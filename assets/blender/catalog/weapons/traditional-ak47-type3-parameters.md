# Traditional AK-47 Type 3 Model Parameters

## 基本信息

- Weapon ID: `traditional-ak47-type3`
- 显示名称: AK-47 Type 3
- 版本/变体: 传统固定木托、铣削机匣版本
- 建模目标: 第一人称武器展示用外观级模型
- 参数文档状态: initial blockout 已构建
- 对应 Blender 文件: `assets/blender/sources/weapons/traditional-ak47-type3/traditional-ak47-type3.blend`
- Godot 导出路径: `assets/blender/exports/godot/weapons/traditional-ak47-type3/traditional-ak47-type3.glb`
- Godot 运行时路径: `apps/arms-game/assets/weapons/traditional-ak47-type3/traditional-ak47-type3.glb`
- 最近更新: 2026-06-12 15:50

## 工作原则

- 先记录参数，再开始或继续建模。
- 此模型文件只服务 `traditional-ak47-type3`，不混放其他武器。
- `.blend`、`.glb`、贴图和预览图不提交 Git，只通过 `make backup-models` 压缩备份。
- 每次调整整体比例、零件尺寸、零件位置、挂点或导出设置，都必须更新“参数调整记录”。
- 参数以视觉还原和游戏使用为目标，不记录制造级内部结构、公差或可制造图纸。

## 整体基准参数

```text
单位: meter
总长: 0.880 m
枪管长: 0.415-0.417 m
口径/弹药: 7.62x39 mm
弹匣: 30 发弯弹匣
目标比例: 1 Blender unit = 1 meter
Blender 单位换算: 1.0 = 1 m
```

说明：

- `0.880 m` 作为初始总长 blockout 基准。
- 枪管长公开资料存在小差异，初始建模以 `0.416 m` 作为中值。
- 所有零件尺寸先按外观比例推导，后续在 Blender 中验证第一人称视角观感后记录调整。

## 坐标与朝向

```text
Blender 前向: -Y
Blender 上向: +Z
枪口方向: -Y
模型原点: 机匣中心附近，后续可按 Godot 挂载需求微调
第一人称握持参考点: pistol_grip / lower_receiver 附近
瞄准参考点: rear_sight_leaf 到 front_sight_post 的连线
导出缩放: 1.0
```

## 零件清单

### 主体与机匣

```text
零件 ID: receiver
中文名称: 铣削机匣
英文名称: milled receiver
对象命名: ak47t3_receiver
建模状态: planned
是否独立对象: yes
可见级别: hero
尺寸参数: 根据总长和枪管位置推导；需保留 Type 3 大型铣削减重槽
位置参数: 全枪主体参考件
材质: 深色磷化/烤蓝金属
备注: Type 3 的关键识别件
```

```text
零件 ID: receiver_cover
中文名称: 机匣盖
英文名称: receiver cover
对象命名: ak47t3_receiver_cover
建模状态: planned
是否独立对象: yes
可见级别: hero
尺寸参数: 覆盖机匣上方，按外观比例推导
位置参数: 机匣上方
材质: 深色金属
备注: 第一人称视角可见度高
```

```text
零件 ID: selector_lever
中文名称: 快慢机拨杆
英文名称: selector lever
对象命名: ak47t3_selector_lever
建模状态: planned
是否独立对象: yes
可见级别: medium
尺寸参数: 右侧长条薄片，按外观比例推导
位置参数: 机匣右侧
材质: 深色金属
备注: 需要避免贴平导致阴影丢失
```

### 枪管、导气与瞄具

```text
零件 ID: barrel
中文名称: 枪管
英文名称: barrel
对象命名: ak47t3_barrel
建模状态: planned
是否独立对象: yes
可见级别: hero
尺寸参数: 初始长度 0.416 m，直径按外观比例推导
位置参数: 从机匣前部沿 -Y 延伸
材质: 深色金属
备注: 不建模内部膛线
```

```text
零件 ID: muzzle_nut
中文名称: 枪口螺母
英文名称: muzzle nut
对象命名: ak47t3_muzzle_nut
建模状态: planned
是否独立对象: yes
可见级别: medium
尺寸参数: 枪口短圆柱件
位置参数: 枪管最前端
材质: 深色金属
备注: Type 3 不使用 AKM 典型斜切补偿器
```

```text
零件 ID: gas_block
中文名称: 导气箍
英文名称: gas block
对象命名: ak47t3_gas_block
建模状态: planned
是否独立对象: yes
可见级别: hero
尺寸参数: 按枪管和导气管位置推导
位置参数: 枪管前段上方连接导气管
材质: 深色金属
备注: 外形影响 AK 轮廓
```

```text
零件 ID: gas_tube
中文名称: 导气管
英文名称: gas tube
对象命名: ak47t3_gas_tube
建模状态: planned
是否独立对象: yes
可见级别: hero
尺寸参数: 位于枪管上方，连接导气箍与照门座区域
位置参数: 枪管上方
材质: 深色金属 / 部分被上护木覆盖
备注: 与上护木组合决定侧面轮廓
```

```text
零件 ID: front_sight_block
中文名称: 准星座
英文名称: front sight block
对象命名: ak47t3_front_sight_block
建模状态: planned
是否独立对象: yes
可见级别: hero
尺寸参数: 按枪口附近轮廓推导
位置参数: 枪管前端上方
材质: 深色金属
备注: 需要建出护耳轮廓
```

```text
零件 ID: rear_sight_leaf
中文名称: 表尺
英文名称: rear sight leaf
对象命名: ak47t3_rear_sight_leaf
建模状态: planned
是否独立对象: yes
可见级别: hero
尺寸参数: 按照门座长度推导
位置参数: 机匣前上方
材质: 深色金属
备注: 第一人称瞄准视角关键件
```

### 木质件

```text
零件 ID: stock
中文名称: 固定木枪托
英文名称: fixed wood stock
对象命名: ak47t3_stock
建模状态: planned
是否独立对象: yes
可见级别: hero
尺寸参数: 根据总长和机匣后部位置推导
位置参数: 机匣后方
材质: 琥珀色清漆木材
备注: 传统外观关键件
```

```text
零件 ID: lower_handguard
中文名称: 下护木
英文名称: lower handguard
对象命名: ak47t3_lower_handguard
建模状态: planned
是否独立对象: yes
可见级别: hero
尺寸参数: 位于机匣前方下侧，按外观比例推导
位置参数: 枪管下方、机匣前方
材质: 琥珀色清漆木材
备注: 第一人称视角可见度高
```

```text
零件 ID: upper_handguard
中文名称: 上护木
英文名称: upper handguard
对象命名: ak47t3_upper_handguard
建模状态: planned
是否独立对象: yes
可见级别: hero
尺寸参数: 包覆导气管区域，按外观比例推导
位置参数: 枪管上方、导气管外侧
材质: 琥珀色清漆木材
备注: 与导气管组合建模
```

```text
零件 ID: pistol_grip
中文名称: 手枪握把
英文名称: pistol grip
对象命名: ak47t3_pistol_grip
建模状态: planned
是否独立对象: yes
可见级别: hero
尺寸参数: 根据第一人称手部占位推导
位置参数: 机匣下方后部
材质: 木材或早期深色握把材质，后续参考确认
备注: 影响持握点
```

### 弹匣与小件

```text
零件 ID: magazine_30rd
中文名称: 30 发弯弹匣
英文名称: 30-round curved magazine
对象命名: ak47t3_magazine_30rd
建模状态: planned
是否独立对象: yes
可见级别: hero
尺寸参数: 按 7.62x39 AK 弹匣外形比例推导
位置参数: 机匣下方前部
材质: 深色金属
备注: 曲率必须优先视觉准确
```

```text
零件 ID: trigger_guard
中文名称: 扳机护圈
英文名称: trigger guard
对象命名: ak47t3_trigger_guard
建模状态: planned
是否独立对象: yes
可见级别: medium
尺寸参数: 按机匣下方比例推导
位置参数: 握把前方
材质: 深色金属
备注: 与扳机、弹匣卡榫相邻
```

```text
零件 ID: cleaning_rod
中文名称: 通条
英文名称: cleaning rod
对象命名: ak47t3_cleaning_rod
建模状态: planned
是否独立对象: yes
可见级别: medium
尺寸参数: 枪管下方细长杆
位置参数: 枪管下方、护木前方
材质: 深色金属
备注: 外观还原重要但可低模处理
```

## 外观特征

- 铣削机匣，而不是 AKM 的冲压铆接机匣。
- 机匣侧面需要大型铣削减重槽。
- 固定木枪托、木质上下护木和传统外观枪口螺母。
- 不使用 AKM 斜切补偿器。
- 重点服务第一人称近景观感，机匣盖、护木、表尺、准星和弹匣曲率优先级高。

## 参数假设

- 因公开资料难以获得完整零件工程尺寸，本模型采用公开整体尺寸 + 外观参考图比例推导。
- 零件内部结构不建模，除非它在第一人称或展示拆解视角中可见。
- 小型螺钉、铆钉和销钉优先用简化几何或法线细节表达。
- 若后续参考照片与当前假设冲突，优先保留视觉辨识度，并在参数调整记录中说明。

## 参考来源

- Small Arms Survey AK-47 识别资料：`https://www.smallarmssurvey.org/sites/default/files/SAS-weapons-assault-rifles-Kalashnikov-AK-47.pdf`
- USMC AK-47 Operator's Manual：`https://info.publicintelligence.net/USMC-AK47-OperatorsManual.pdf`
- Modern Firearms AK family reference：`https://modernfirearms.net/`
- 公开图片参考：后续下载或整理到 `assets/blender/references/`，并通过模型备份流程保存。

## 构建阶段计划

```text
阶段 1: 参数整理
目标: 确认总长、枪管长、主要零件清单、坐标方向和对象命名。
完成标准: 本文档整体基准参数和零件清单可用于 blockout。

阶段 2: 整体 blockout
目标: 用简单几何建立 0.880 m 总长比例骨架。
完成标准: 已完成初始版本；机匣、枪管、枪托、护木、弹匣的体块比例可在 Blender 中检查。

阶段 3: 零件拆分建模
目标: 将主要外露零件拆为独立对象并细化外形。
完成标准: 关键识别件可从第一人称和侧面视角辨认。

阶段 4: 材质与导出
目标: 添加金属和木质基础材质，导出 Godot 可用 `.glb`。
完成标准: Godot 可导入并在展示场景中查看。
```

## 参数调整记录

### 2026-06-12 初始记录

```text
对应 Blender 文件: assets/blender/sources/weapons/traditional-ak47-type3/traditional-ak47-type3.blend
调整对象: 全局参数文档
调整前: 无
调整后: 建立整体基准、坐标约定、零件清单和构建阶段计划
调整原因: 开始 AK-47 Type 3 建模前先固化参数记录流程
验证方式: 文档审阅；尚未创建正式 .blend 模型
备份批次: 无
```

### 2026-06-12 15:48

```text
对应 Blender 文件: assets/blender/sources/weapons/traditional-ak47-type3/traditional-ak47-type3.blend
调整对象: 初始整体 blockout 与主要外露零件
调整前: 只有参数文档；无正式 .blend 模型
调整后:
  - 创建 1:1 米制 Blender 文件。
  - 设置枪口方向为 -Y。
  - 建立 0.880 m 总长参考线。
  - 建立 0.416 m 枪管基准。
  - 创建 32 个场景对象，其中包含 30 个模型/文本参考对象、1 个灯光、1 个相机。
  - 拆分创建机匣、机匣盖、减重槽标记、快慢机拨杆、枪管、枪口螺母、导气管、导气箍、准星座、表尺、枪托、上下护木、握把、扳机护圈、弹匣曲线体、通条和背带环标记。
  - 添加基础金属、木材、黑色阴影和蓝色尺寸参考材质。
  - 导出 GLB 到 assets/blender/exports/godot/weapons/traditional-ak47-type3/traditional-ak47-type3.glb。
  - 同步 GLB 到 apps/arms-game/assets/weapons/traditional-ak47-type3/traditional-ak47-type3.glb。
  - 生成侧面预览图 assets/blender/previews/traditional-ak47-type3-blockout-side.png。
调整原因: 开始 AK-47 Type 3 建模阶段 2，先用简单几何建立可检查整体比例。
验证方式:
  - 独立 BlenderMCP 端口 9877 执行建模脚本成功。
  - Blender 场景信息返回 object_count=32、materials_count=8。
  - 确认 .blend 文件约 123K，导出 .glb 文件约 376K，侧面预览图约 947K。
  - 侧面预览显示整体 AK 轮廓已经成型，但枪托、护木、机匣减重槽和弹匣仍为 blockout 级，需要下一阶段细化。
  - make backup-models 成功打包 .blend、导出 GLB、Godot 运行时 GLB 和侧面预览图。
备份批次: model-backups/20260612-155041-blender-models.zip
```

## 下一步细化记录

```text
优先级 1:
  - 调整枪托外形，从长方体改为 AK Type 3 固定木托轮廓。
  - 细化铣削机匣侧面大型减重槽，替换当前黑色标记块。
  - 细化上下护木弧面。

优先级 2:
  - 优化弹匣曲率和厚度。
  - 调整准星座、导气箍、照门座高度关系。
  - 添加基本木纹方向或材质区分。

优先级 3:
  - 添加第一人称握持点、瞄准点、枪口点空对象。
  - 在 Godot 中创建导入检查场景。
```
