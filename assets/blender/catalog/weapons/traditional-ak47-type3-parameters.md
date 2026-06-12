# Traditional AK-47 Type 3 Model Parameters

## 基本信息

- Weapon ID: `traditional-ak47-type3`
- 显示名称: AK-47 Type 3
- 版本/变体: 传统固定木托、铣削机匣版本
- 建模目标: 360°动态武器展示 + 第一人称使用的外观级模型
- 参数文档状态: 360 pass4c 展示细化已构建；仍非最终高模
- 对应 Blender 文件: `assets/blender/sources/weapons/traditional-ak47-type3/traditional-ak47-type3.blend`
- Godot 导出路径: `assets/blender/exports/godot/weapons/traditional-ak47-type3/traditional-ak47-type3.glb`
- Godot 运行时路径: `apps/arms-game/assets/weapons/traditional-ak47-type3/traditional-ak47-type3.glb`
- 最近更新: 2026-06-12 17:41

## 工作原则

- 先记录参数，再开始或继续建模。
- 此模型文件只服务 `traditional-ak47-type3`，不混放其他武器。
- `.blend`、`.glb`、贴图和预览图不提交 Git，只通过 `make backup-models` 压缩备份。
- 每次调整整体比例、零件尺寸、零件位置、挂点或导出设置，都必须更新“参数调整记录”。
- 参数以 360°视觉还原、动态旋转展示和游戏使用为目标，不记录制造级内部结构、公差或可制造图纸。

## 360°展示级质量门槛

```text
目标:
  - 玩家可通过鼠标旋转，从任意角度查看武器。
  - 模型不能只依赖侧面剪影或第一人称可见区域。
  - 每个主要零件必须有可读的厚度、倒角、前后端面、左右侧面、顶面和底面。

最低检查视角:
  - 左侧正交
  - 右侧正交
  - 顶视正交
  - 底视正交
  - 前 3/4
  - 后 3/4

主要零件要求:
  - 机匣: 需要完整盒体厚度、顶/底面层次、左右侧细节和端面过渡。
  - 机匣盖: 不能只是侧面轮廓，需要可从上方读出的弧面/折面体积。
  - 木托: 需要椭圆化/倒角后的立体体积，不只是一块扁板。
  - 上下护木: 需要左右厚度、圆角体积和端面过渡。
  - 手枪握把: 需要符合握把的前后厚度和底部端面。
  - 弹匣: 需要 360°曲面、前后筋条、侧面压筋、底板和供弹口；方向必须底部朝枪口方向 -Y 前弯。
  - 枪管/导气系统/准星座/表尺: 需要从侧面、上方、3/4 都能识别，不只是一组方块。
  - 小件: 选择杆、拉机柄、扳机护圈、背带环等应有基础厚度和投影。

当前 pass4c 状态:
  - 已从 pass3c 低模基线推进到 360°展示细化 pass。
  - 已补充顶面、底面、端面、小件厚度和六视角预览。
  - 仍不是最终高模；曲面拓扑、真实凹槽、贴图和细节比例还需要后续人工/半手工精化。
```

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

## 第一人称与 Godot 挂点

```text
对象命名: ak47t3_muzzle_point
用途: 枪口特效、弹道/射线起点参考
位置: x=0.000, y=-0.578, z=-0.001
类型: Blender Empty
备注: 位于枪口螺母前方，沿 -Y 为出射方向
```

```text
对象命名: ak47t3_aim_point
用途: 瞄准线前参考点
位置: x=0.000, y=-0.536, z=0.103
类型: Blender Empty
备注: 暂放在准星柱顶部；后续 Godot 第一人称视角验证后可微调
```

```text
对象命名: ak47t3_grip_point
用途: 第一人称右手/主手持握参考
位置: x=0.000, y=0.012, z=-0.102
类型: Blender Empty
备注: 暂放在手枪握把内部中心偏上位置
```

```text
对象命名: ak47t3_magazine_socket
用途: 弹匣装配/换弹动画参考
位置: x=0.000, y=-0.112, z=-0.047
类型: Blender Empty
备注: 暂放在弹匣顶部供弹口附近
```

## 零件清单

### 主体与机匣

```text
零件 ID: receiver
中文名称: 铣削机匣
英文名称: milled receiver
对象命名: ak47t3_receiver
建模状态: profile_pass3c_baseline
是否独立对象: yes
可见级别: hero
尺寸参数: 根据总长和枪管位置推导；需保留 Type 3 大型铣削减重槽
位置参数: 全枪主体参考件
材质: 深色磷化/烤蓝金属
备注: Type 3 的关键识别件；profile pass 3c 已重建较长扁的铣削机匣轮廓和斜向减重槽
```

```text
零件 ID: receiver_cover
中文名称: 机匣盖
英文名称: receiver cover
对象命名: ak47t3_receiver_cover
建模状态: profile_pass3c_baseline
是否独立对象: yes
可见级别: hero
尺寸参数: 覆盖机匣上方，按外观比例推导
位置参数: 机匣上方
材质: 深色金属
备注: profile pass 3c 已改为带弧面视觉的机匣盖，后续仍需精化曲面
```

```text
零件 ID: selector_lever
中文名称: 快慢机拨杆
英文名称: selector lever
对象命名: ak47t3_selector_lever
建模状态: profile_pass3c_baseline
是否独立对象: yes
可见级别: medium
尺寸参数: 右侧长条薄片，按外观比例推导
位置参数: 机匣右侧
材质: 深色金属
备注: profile pass 3c 保留右侧快慢机视觉，并添加右侧拉机柄
```

### 枪管、导气与瞄具

```text
零件 ID: barrel
中文名称: 枪管
英文名称: barrel
对象命名: ak47t3_barrel
建模状态: profile_pass3c_baseline
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
建模状态: profile_pass3c_baseline
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
建模状态: profile_pass3c_baseline
是否独立对象: yes
可见级别: hero
尺寸参数: 按枪管和导气管位置推导
位置参数: 枪管前段上方连接导气管
材质: 深色金属
备注: profile pass 3c 已替换为斜面导气箍低模轮廓
```

```text
零件 ID: gas_tube
中文名称: 导气管
英文名称: gas tube
对象命名: ak47t3_gas_tube
建模状态: profile_pass3c_baseline
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
建模状态: profile_pass3c_baseline
是否独立对象: yes
可见级别: hero
尺寸参数: 按枪口附近轮廓推导
位置参数: 枪管前端上方
材质: 深色金属
备注: profile pass 3c 已重建更窄的准星座底座和护耳
```

```text
零件 ID: rear_sight_leaf
中文名称: 表尺
英文名称: rear sight leaf
对象命名: ak47t3_rear_sight_leaf
建模状态: profile_pass3c_baseline
是否独立对象: yes
可见级别: hero
尺寸参数: 按照门座长度推导
位置参数: 机匣前上方
材质: 深色金属
备注: profile pass 3c 已保留表尺底座和表尺叶片，仍需后续细化刻度/缺口
```

### 木质件

```text
零件 ID: stock
中文名称: 固定木枪托
英文名称: fixed wood stock
对象命名: ak47t3_stock
建模状态: profile_pass3c_baseline
是否独立对象: yes
可见级别: hero
尺寸参数: 根据总长和机匣后部位置推导
位置参数: 机匣后方
材质: 琥珀色清漆木材
备注: profile pass 3c 已重建为更低、更长、更贴近 AK 固定木托的侧面轮廓
```

```text
零件 ID: lower_handguard
中文名称: 下护木
英文名称: lower handguard
对象命名: ak47t3_lower_handguard
建模状态: profile_pass3c_baseline
是否独立对象: yes
可见级别: hero
尺寸参数: 位于机匣前方下侧，按外观比例推导
位置参数: 枪管下方、机匣前方
材质: 琥珀色清漆木材
备注: profile pass 3c 已重建为较扁的下护木轮廓，并保留简化沟槽/木纹线
```

```text
零件 ID: upper_handguard
中文名称: 上护木
英文名称: upper handguard
对象命名: ak47t3_upper_handguard
建模状态: profile_pass3c_baseline
是否独立对象: yes
可见级别: hero
尺寸参数: 包覆导气管区域，按外观比例推导
位置参数: 枪管上方、导气管外侧
材质: 琥珀色清漆木材
备注: profile pass 3c 已重建为较扁的上护木轮廓，并保留简化沟槽/木纹线
```

```text
零件 ID: pistol_grip
中文名称: 手枪握把
英文名称: pistol grip
对象命名: ak47t3_pistol_grip
建模状态: profile_pass3c_baseline
是否独立对象: yes
可见级别: hero
尺寸参数: 根据第一人称手部占位推导
位置参数: 机匣下方后部
材质: 木材或早期深色握把材质，后续参考确认
备注: profile pass 3c 已重建为更少三角感的木质握把轮廓，并设置 grip_point
```

### 弹匣与小件

```text
零件 ID: magazine_30rd
中文名称: 30 发弯弹匣
英文名称: 30-round curved magazine
对象命名: ak47t3_magazine_30rd
建模状态: profile_pass3c_baseline
是否独立对象: yes
可见级别: hero
尺寸参数: 按 7.62x39 AK 弹匣外形比例推导
位置参数: 机匣下方前部
材质: 深色金属
备注: profile pass 3c 已修正弹匣方向，底部朝枪口方向 -Y 前弯；保留前后筋条和中部压筋
```

```text
零件 ID: trigger_guard
中文名称: 扳机护圈
英文名称: trigger guard
对象命名: ak47t3_trigger_guard
建模状态: profile_pass3c_baseline
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
建模状态: profile_pass3c_baseline
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
- 重点服务 360°动态展示和第一人称近景观感，机匣盖、护木、表尺、准星、底面结构和弹匣曲率优先级高。

## 参数假设

- 因公开资料难以获得完整零件工程尺寸，本模型采用公开整体尺寸 + 外观参考图比例推导。
- 零件内部结构不建模，除非它在第一人称或展示拆解视角中可见。
- 小型螺钉、铆钉和销钉优先用简化几何或法线细节表达。
- 若后续参考照片与当前假设冲突，优先保留视觉辨识度，并在参数调整记录中说明。

## refine pass 1 细化参数

以下参数是视觉建模用的 Blender 外形坐标，不是制造级工程数据。

```text
固定木枪托:
  对象: ak47t3_stock_refined_tapered_wood
  类型: 多段 profile prism
  y/top_z/bottom_z/half_x:
    0.018 / 0.034 / -0.039 / 0.026
    0.070 / 0.037 / -0.050 / 0.030
    0.170 / 0.030 / -0.064 / 0.034
    0.285 / 0.023 / -0.082 / 0.038
    0.324 / 0.026 / -0.083 / 0.039
  倒角: 0.007 m，5 段视觉圆角
  配套对象:
    ak47t3_buttplate_refined_dark_metal
    ak47t3_buttplate_screw_upper
    ak47t3_buttplate_screw_lower
    ak47t3_stock_woodgrain_left_upper/lower
    ak47t3_stock_woodgrain_right_upper/lower
```

```text
下护木:
  对象: ak47t3_lower_handguard_refined_rounded_wood
  类型: 多段 profile prism
  y/top_z/bottom_z/half_x:
    -0.388 / -0.001 / -0.044 / 0.030
    -0.350 / 0.005 / -0.060 / 0.036
    -0.290 / 0.007 / -0.068 / 0.039
    -0.230 / 0.004 / -0.059 / 0.036
    -0.208 / -0.001 / -0.046 / 0.031
  倒角: 0.007 m，5 段视觉圆角
  材质: ak47t3_amber_lacquered_wood
```

```text
上护木:
  对象: ak47t3_upper_handguard_refined_rounded_wood
  类型: 多段 profile prism
  y/top_z/bottom_z/half_x:
    -0.400 / 0.091 / 0.057 / 0.026
    -0.360 / 0.101 / 0.051 / 0.033
    -0.310 / 0.104 / 0.050 / 0.036
    -0.258 / 0.099 / 0.052 / 0.033
    -0.223 / 0.089 / 0.058 / 0.027
  倒角: 0.006 m，5 段视觉圆角
  材质: ak47t3_amber_lacquered_wood
```

```text
机匣 Type 3 减重槽:
  对象前缀: ak47t3_receiver_lightening_cut_{left/right}
  侧面 shadow inset:
    left x=-0.0332, right x=0.0332
    center y=-0.082, z=0.006
    尺寸 x=0.0025, y=0.132, z=0.032
  bevel 框:
    top/bottom y=0.124, z=0.003
    front/rear y=0.004, z=0.027
  说明: 当前采用外贴 shadow inset 表达凹槽，不做布尔切割
```

```text
30 发弯弹匣:
  对象: ak47t3_magazine_30rd_refined_curved_body
  类型: 曲线中心线 + 局部截面网格
  path_yz:
    -0.140 / -0.062
    -0.148 / -0.112
    -0.134 / -0.172
    -0.104 / -0.236
    -0.062 / -0.292
  half_x:
    0.025, 0.028, 0.030, 0.030, 0.026
  half_depth:
    0.019, 0.024, 0.030, 0.032, 0.025
  配套对象:
    ak47t3_magazine_30rd_rib_front_left/right
    ak47t3_magazine_30rd_rib_back_left/right
    ak47t3_magazine_30rd_rib_band_left/right_0..2
    ak47t3_magazine_feed_lips_refined
```

```text
手枪握把:
  对象: ak47t3_pistol_grip_refined_slanted_wood
  类型: 多段 profile prism
  y/top_z/bottom_z/half_x:
    -0.030 / -0.045 / -0.064 / 0.020
    -0.008 / -0.060 / -0.116 / 0.024
    0.010 / -0.072 / -0.145 / 0.027
    0.026 / -0.068 / -0.155 / 0.026
  倒角: 0.006 m，5 段视觉圆角
```

```text
材质与预览:
  木材: ak47t3_amber_lacquered_wood，Base Color=(0.42, 0.16, 0.045, 1)，Roughness=0.58
  木纹线: ak47t3_dark_woodgrain_lines，Base Color=(0.12, 0.035, 0.010, 1)，Roughness=0.72
  金属: ak47t3_dark_phosphate_metal，Base Color=(0.028, 0.030, 0.028, 1)，Roughness=0.57，Metallic=0.78
  磨损边: ak47t3_worn_dark_edge，Base Color=(0.09, 0.086, 0.078, 1)，Roughness=0.64，Metallic=0.58
  预览色彩管理: Filmic / Medium High Contrast / Exposure=-0.8
```

## profile pass 3c 低模基线参数

profile pass 2 / 3 的目标是修正 pass 1 “不成形”和弹匣方向错误的问题。当前 pass 3c 作为低模基线，而不是最终精模。

```text
建模方法:
  - 清空旧 AK 对象后重建，避免在错误 blockout 上继续叠加。
  - 先保证侧面轮廓成立，再用 x 方向厚度、倒角和简化细节补 3D 体积。
  - 以 -Y 为枪口方向；弹匣底部必须朝 -Y 方向前弯。
  - 使用 profile prism / tapered prism / curve bevel 组合生成游戏低模。
```

```text
主要对象:
  receiver: ak47t3_receiver_milled_pass3
  receiver_cover: ak47t3_receiver_cover_arched_pass3
  receiver_cut: ak47t3_receiver_cut_left/right_shadow_pass3 + rim
  barrel: ak47t3_barrel_pass3
  muzzle_nut: ak47t3_muzzle_nut_pass3
  gas_tube: ak47t3_gas_tube_pass3
  gas_block: ak47t3_pass3c_gas_block_sloped
  front_sight: ak47t3_pass3c_front_sight_base / left_ear / right_ear
  rear_sight: ak47t3_rear_sight_block_pass3 / leaf_pass3
  stock: ak47t3_stock_wood_pass3
  lower_handguard: ak47t3_lower_handguard_pass3
  upper_handguard: ak47t3_upper_handguard_pass3
  pistol_grip: ak47t3_pass3c_pistol_grip
  magazine: ak47t3_magazine_forward_curve_pass3
  charging_handle: ak47t3_pass3c_charging_handle_stem / knob
```

```text
弹匣方向修正:
  对象: ak47t3_magazine_forward_curve_pass3
  center_yz:
    -0.112 / -0.050
    -0.132 / -0.105
    -0.170 / -0.173
    -0.218 / -0.246
    -0.264 / -0.304
  half_depth:
    0.018, 0.024, 0.029, 0.031, 0.026
  half_x:
    0.026, 0.029, 0.031, 0.031, 0.028
  验证:
    - 从顶部到底部，center_y 从 -0.112 到 -0.264，说明底部向枪口方向 -Y 前弯。
    - 侧面预览中底板位于弹匣前下方，不再反向。
```

```text
pass3c 新增识别细节:
  - 右侧拉机柄: ak47t3_pass3c_charging_handle_stem / knob
  - 弹匣前 lug: ak47t3_pass3c_magazine_front_lug
  - 弹匣后卡榫: ak47t3_pass3c_magazine_rear_catch
  - 后部 trunnion / 枪托衔接视觉: ak47t3_pass3c_rear_trunnion_cap / stock_tang_shadow
  - 前端斜面导气箍: ak47t3_pass3c_gas_block_sloped
  - 窄化准星护耳: ak47t3_pass3c_front_sight_left_ear / right_ear
```

```text
pass3c 材质:
  金属: ak47t3_pass3b_dark_blued_steel
  磨损边/小金属件: ak47t3_pass3b_worn_edges
  阴影: ak47t3_pass3b_shadow_black
  木材: ak47t3_pass3b_lacquered_wood
  木纹/沟槽线: ak47t3_pass3b_dark_wood_lines
```

```text
pass3c 预览输出:
  侧面预览: assets/blender/previews/traditional-ak47-type3-profile-pass3c-side.png
  3/4 预览: assets/blender/previews/traditional-ak47-type3-profile-pass3c-3q.png
```

## 360 pass4c 展示细化参数

pass4 / pass4b / pass4c 的目标是把模型从“侧面和 3/4 可读的低模基线”推进到“用户可旋转查看的展示模型”。本阶段直接在 Blender 场景中补全顶面、底面、端面和小件厚度，不只优化第一人称可见区域。

```text
建模方法:
  - 保留 profile pass 3c 的主体比例和弹匣方向。
  - 在独立零件对象上叠加 360°可见面细节。
  - 使用 Mesh / Curve + bevel + weighted normals 表达外观细节。
  - 每个新增对象都写入 weapon_id、model_stage 和 part_id 自定义属性。
  - model_stage: 360_pass4c_showcase_refine。
```

```text
场景统计:
  weapon objects: 153
  mesh objects: 100
  curve objects: 48
  empty objects: 5
  pass4c 新增对象: 34
  pass4c 新增展示 pivot: ak47t3_display_turntable_pivot
```

```text
整体包围盒:
  bbox_min: x=-0.0430, y=-0.5885, z=-0.3260
  bbox_max: x=0.0513, y=0.3500, z=0.1200
  bbox_dims: x=0.0943, y=0.9385, z=0.4460
  说明:
    - y 轴总长包含枪口前缘和托底板细节。
    - z 轴高度包含弹匣底板和准星/表尺上方细节。
```

```text
pass4c 重点新增/调整对象:
  机匣底面与弹匣井:
    ak47t3_pass4c_receiver_bottom_beveled_plate
    ak47t3_pass4c_receiver_magwell_front_lip
    ak47t3_pass4c_receiver_magwell_rear_lip
    ak47t3_pass4c_receiver_top_cover_front_step
    ak47t3_pass4c_receiver_top_rear_button

  扳机与底部结构:
    ak47t3_pass4c_trigger_guard_side_xm017
    ak47t3_pass4c_trigger_guard_side_xp017
    ak47t3_pass4c_trigger_guard_front_pin
    ak47t3_pass4c_trigger_guard_rear_pin
    ak47t3_pass4c_trigger_curved_blade
    ak47t3_pass4c_magazine_release_paddle

  弹匣 360°细节:
    ak47t3_pass4c_magazine_front_locking_lug
    ak47t3_pass4c_magazine_rear_locking_lug
    ak47t3_pass4c_magazine_side_top_fold_xm027
    ak47t3_pass4c_magazine_side_top_fold_xp027
    ak47t3_pass4c_magazine_floorplate_front_lip
    ak47t3_pass4c_magazine_floorplate_rear_lip

  木件顶/底与端面:
    ak47t3_pass4c_stock_bottom_center_cut
    ak47t3_pass4c_stock_top_rear_grain
    ak47t3_pass4c_stock_buttplate_rounded_edge_top
    ak47t3_pass4c_stock_buttplate_rounded_edge_bottom
    ak47t3_pass4c_lower_handguard_bottom_left_groove
    ak47t3_pass4c_lower_handguard_bottom_right_groove
    ak47t3_pass4c_upper_handguard_top_left_groove
    ak47t3_pass4c_upper_handguard_top_right_groove

  前端与瞄具:
    ak47t3_pass4c_muzzle_front_face_ring
    ak47t3_pass4c_muzzle_bore_dark_inner
    ak47t3_pass4c_front_sight_bridge
    ak47t3_pass4c_rear_sight_axis_pin
    ak47t3_pass4c_rear_sight_slider_block

  背带环:
    ak47t3_pass4c_front_sling_base
    ak47t3_pass4c_front_sling_loop
    ak47t3_pass4c_rear_sling_base
    ak47t3_pass4c_rear_sling_loop
```

```text
pass4c 材质:
  金属: ak47t3_pass4c_oiled_blued_steel，Base Color=(0.018, 0.020, 0.017, 1)，Roughness=0.58，Metallic=0.82
  磨损边: ak47t3_pass4c_bright_worn_edges，Base Color=(0.115, 0.111, 0.098, 1)，Roughness=0.61，Metallic=0.62
  阴影: ak47t3_pass4c_deep_shadow，Base Color=(0.004, 0.004, 0.004, 1)，Roughness=0.88
  木纹/切线: ak47t3_pass4c_dark_wood_cuts，Base Color=(0.082, 0.028, 0.010, 1)，Roughness=0.75
```

```text
pass4c 六视角预览输出:
  右侧正交: assets/blender/previews/traditional-ak47-type3-360-pass4c-right.png
  左侧正交: assets/blender/previews/traditional-ak47-type3-360-pass4c-left.png
  顶视正交: assets/blender/previews/traditional-ak47-type3-360-pass4c-top.png
  底视正交: assets/blender/previews/traditional-ak47-type3-360-pass4c-bottom.png
  前 3/4: assets/blender/previews/traditional-ak47-type3-360-pass4c-front_3q.png
  后 3/4: assets/blender/previews/traditional-ak47-type3-360-pass4c-rear_3q.png
```

```text
pass4c 文件大小:
  .blend: 219991 bytes
  Godot 导出 GLB: 479064 bytes
  Godot 运行时 GLB: 479064 bytes
  右侧预览: 2733386 bytes
  左侧预览: 2556424 bytes
  顶视预览: 1998917 bytes
  底视预览: 2018314 bytes
  前 3/4 预览: 2685809 bytes
  后 3/4 预览: 2693739 bytes
```

```text
pass4c 局限:
  - 仍属于程序化/半程序化展示细化，不是最终高模。
  - 机匣盖、护木、握把和弹匣仍需要更干净的拓扑与真实曲面。
  - Type 3 铣削凹槽目前仍以外贴/叠加细节表达，没有做真实布尔切割或烘焙法线。
  - 木纹仍是几何线/基础材质，不是最终贴图。
  - 后续需要在 Godot 中做实际 turntable / 鼠标旋转展示验证。
```

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

### 2026-06-12 16:08

```text
对应 Blender 文件: assets/blender/sources/weapons/traditional-ak47-type3/traditional-ak47-type3.blend
调整对象: AK-47 Type 3 外观细化 pass 1
调整前:
  - 枪托、上下护木、握把为长方体 blockout。
  - Type 3 机匣减重槽为简单黑色标记块。
  - 弹匣为曲线 spine + 两条 rib 的粗占位。
  - 准星座和表尺为基础方块，缺少可读轮廓。
  - 尚无 Godot/第一人称挂点 Empty。
调整后:
  - 枪托改为多段 tapered profile prism，加入金属托底板、托底板螺钉和木纹线。
  - 上下护木改为多段圆角 profile prism，加入左右侧木纹线。
  - 手枪握把改为后倾 profile prism，并以 grip_point 标记第一人称握持参考。
  - Type 3 机匣减重槽改为左右 shadow inset + bevel 框，提升侧面识别度。
  - 弹匣改为曲线截面网格，加入前后筋条、横向加强筋和供弹口。
  - 准星座加入左右护耳和准星柱；表尺加入底座、叶片和缺口阴影。
  - 添加 ak47t3_muzzle_point、ak47t3_aim_point、ak47t3_grip_point、ak47t3_magazine_socket 四个 Empty 挂点。
  - 调整木材、木纹、金属材质颜色和预览曝光。
  - 重新导出 GLB 并同步到 Godot 运行时路径。
  - 生成侧面预览图 assets/blender/previews/traditional-ak47-type3-refine-pass1-side.png。
调整原因: 进入阶段 3 零件拆分建模，先提升第一人称和侧面轮廓中最显眼的木件、机匣槽、弹匣和瞄具辨识度。
验证方式:
  - 独立 BlenderMCP 端口 9877 执行 refine pass 1 脚本成功。
  - Blender 场景信息返回 scene object_count=69、materials_count=9。
  - 关键对象存在: ak47t3_stock_refined_tapered_wood、ak47t3_receiver_lightening_cut_left_shadow_inset、ak47t3_lower_handguard_refined_rounded_wood、ak47t3_upper_handguard_refined_rounded_wood、ak47t3_magazine_30rd_refined_curved_body。
  - 挂点位置已验证:
    muzzle_point=(0.000, -0.582, 0.000)
    aim_point=(0.000, -0.535, 0.104)
    grip_point=(0.000, -0.002, -0.108)
    magazine_socket=(0.000, -0.140, -0.052)
  - 确认 .blend 文件约 144K，导出 .glb 文件约 231K，Godot 运行时 .glb 文件约 231K，侧面预览图约 1.2M。
  - 侧面预览确认木件外轮廓、减重槽和弹匣曲率比 blockout 更清晰；仍需后续从第一人称视角调整机匣盖、导气系统和握持遮挡。
  - make backup-models 成功打包 .blend、导出 GLB、Godot 运行时 GLB 和预览图。
备份批次: model-backups/20260612-160810-blender-models.zip
```

### 2026-06-12 16:51

```text
对应 Blender 文件: assets/blender/sources/weapons/traditional-ak47-type3/traditional-ak47-type3.blend
调整对象: AK-47 Type 3 profile pass 3c 低模基线重建
调整前:
  - refine pass 1 / silhouette pass 2 仍存在整体不成形问题。
  - 早期弹匣方向错误，底部曾向错误方向弯曲。
  - 木件、机匣、导气系统、准星和握把存在方块化、比例僵硬问题。
  - 预览相机曾裁切太近，不能完整评估轮廓。
调整后:
  - 清空旧 AK 对象后以侧面轮廓优先方式重建 profile pass 3。
  - pass3b 修复材质节点写入和曝光问题，避免预览全白。
  - pass3c 修正前端导气箍、准星护耳、弹匣井过渡、右侧拉机柄和握把轮廓。
  - 弹匣明确修正为底部朝枪口方向 -Y 前弯。
  - 重新导出 GLB 并同步到 Godot 运行时路径。
  - 生成可用于评审的完整侧面和 3/4 预览图。
调整原因:
  - 用户指出上一轮模型不成形，尤其弹匣方向错误。
  - 需要建立一个更可靠的低模基线，后续再做精修和第一人称集成。
验证方式:
  - 独立 BlenderMCP 端口 9877 执行 pass3 / pass3b / pass3c 脚本成功。
  - Blender 场景信息返回 scene object_count=67、materials_count=24。
  - 关键对象存在:
    ak47t3_magazine_forward_curve_pass3
    ak47t3_receiver_milled_pass3
    ak47t3_stock_wood_pass3
    ak47t3_pass3c_charging_handle_stem
  - 场景记录 magazine_orientation=bottom curves forward toward muzzle (-Y)。
  - 挂点位置已验证:
    muzzle_point=(0.000, -0.578, -0.001)
    aim_point=(0.000, -0.536, 0.103)
    grip_point=(0.000, 0.012, -0.102)
    magazine_socket=(0.000, -0.112, -0.047)
  - 确认 .blend 文件约 159K，导出 .glb 文件约 216K，Godot 运行时 .glb 文件约 216K。
  - 侧面预览 traditional-ak47-type3-profile-pass3c-side.png 显示完整轮廓、弹匣方向正确、木件和机匣比例比 pass1 更稳定。
  - 3/4 预览 traditional-ak47-type3-profile-pass3c-3q.png 确认右侧拉机柄、前端瞄具和护木不再明显穿帮。
  - make backup-models 成功打包 .blend、导出 GLB、Godot 运行时 GLB 和全部预览图。
局限:
  - 当前仍是程序化低模基线，不是最终精模。
  - 机匣盖曲面、准星细节、表尺刻度、导气块真实形状、弹匣板筋和木件拓扑仍需后续手工/半手工精化。
  - 第一人称持枪位置尚未在 Godot 中验证。
备份批次: model-backups/20260612-165035-blender-models.zip
```

### 2026-06-12 17:41

```text
对应 Blender 文件: assets/blender/sources/weapons/traditional-ak47-type3/traditional-ak47-type3.blend
调整对象: AK-47 Type 3 360 pass4c 展示细化
调整前:
  - profile pass 3c 主要解决侧面轮廓、3/4 轮廓和弹匣方向问题。
  - pass4b 已补充部分顶面/底面/左右侧细节，但顶/底展示仍有可读性不足。
  - 用户明确要求后续做动态武器展示，不能只按第一人称可见区域精模。
调整后:
  - 保留 pass3c 主体比例和弹匣向 -Y 前弯方向。
  - 新增/整理 34 个 pass4c 对象，覆盖机匣底面、弹匣井、扳机护圈、扳机、弹匣卡榫、弹匣底板、木件顶/底沟槽、枪口前脸、准星/表尺小件和背带环。
  - 增加 ak47t3_display_turntable_pivot，作为后续 Godot 鼠标旋转展示的中心参考。
  - 重新设置 360°检查相机，输出右侧、左侧、顶视、底视、前 3/4、后 3/4 六张预览图。
  - 重新导出 GLB 并同步到 Godot 运行时路径。
调整原因:
  - 模型需要支持用户 360°旋转查看，顶/底/前/后/左右都要有基础体积和细节。
  - 不能只做第一人称视角中的“近景可见面”。
验证方式:
  - 独立 BlenderMCP 端口 9877 执行 pass4c 脚本成功。
  - Blender 场景统计:
    weapon objects=153
    mesh objects=100
    curve objects=48
    empty objects=5
    pass4c objects=34
  - 包围盒验证:
    bbox_min=(-0.0430, -0.5885, -0.3260)
    bbox_max=(0.0513, 0.3500, 0.1200)
    bbox_dims=(0.0943, 0.9385, 0.4460)
  - 文件输出验证:
    .blend=219991 bytes
    导出 GLB=479064 bytes
    Godot 运行时 GLB=479064 bytes
  - 预览输出验证:
    assets/blender/previews/traditional-ak47-type3-360-pass4c-right.png
    assets/blender/previews/traditional-ak47-type3-360-pass4c-left.png
    assets/blender/previews/traditional-ak47-type3-360-pass4c-top.png
    assets/blender/previews/traditional-ak47-type3-360-pass4c-bottom.png
    assets/blender/previews/traditional-ak47-type3-360-pass4c-front_3q.png
    assets/blender/previews/traditional-ak47-type3-360-pass4c-rear_3q.png
  - make backup-models 成功生成模型备份压缩包。
局限:
  - 当前是 360°展示方向的细化 pass，不是最终高模。
  - 仍需要后续人工/半手工精化曲面、拓扑、真实凹槽、贴图和 Godot 动态展示验证。
备份批次: model-backups/20260612-174100-blender-models.zip
```

## 下一步细化记录

```text
已完成:
  - 调整枪托外形，从长方体改为 AK Type 3 固定木托轮廓。
  - 细化铣削机匣侧面大型减重槽，替换当前黑色标记块。
  - 细化上下护木弧面。
  - 优化弹匣曲率和厚度。
  - 修正弹匣方向，确保底部朝枪口方向 -Y 前弯。
  - 添加基本木纹方向和材质区分。
  - 添加第一人称握持点、瞄准点、枪口点和弹匣插槽空对象。
  - 重建 profile pass 3c 作为当前低模基线。
  - 补充 360 pass4c 展示细化，包括顶/底/端面、小件厚度和六视角预览。
  - 增加 ak47t3_display_turntable_pivot 作为动态展示旋转中心参考。

优先级 1:
  - 在 Godot 中创建 360°动态展示场景，验证鼠标旋转、相机距离、灯光和模型 pivot。
  - 在 Godot 中创建导入检查场景，验证 GLB 尺寸、朝向、挂点和第一人称持枪位置。
  - 从第一人称视角检查机匣盖、表尺、准星、护木和弹匣遮挡关系。
  - 根据 Godot 检查结果微调 muzzle_point、aim_point、grip_point 和 magazine_socket。

优先级 2:
  - 将机匣盖、导气箍、准星座、表尺从当前展示细化提升为更干净的曲面/半精模。
  - 将 Type 3 铣削减重槽从外贴视觉件升级为更真实的凹槽/法线表现。
  - 优化弹匣筋条、底板、供弹口和侧面压筋的真实比例。

优先级 3:
  - 添加第一人称展示用相机、手臂占位和基础持枪姿态。
  - 建立后续精模所需的参考图/轮廓模板流程，减少纯坐标猜测。
```
