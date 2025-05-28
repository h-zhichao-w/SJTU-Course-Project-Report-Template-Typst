# 上海交通大学课程报告模板 - Typst版本

这是一个基于原LaTeX模板转换的Typst版本，适用于SJTU的课程论文和期末报告。

**原LaTeX模板**: https://github.com/Jiazhen-Lei/SJTU_Course_Template_Latex

## 写在前面

本项目仍在构建中，尤其是在**格式、美化、多语言支持**上完成度仍然较低，**请谨慎使用，等待作者更新**。

## 文件结构

```
├── main.typ              # 主文件
├── sjtu-report.typ       # 模板样式文件  
├── references.bib        # 参考文献文件
├── figures/              # 图片文件夹
│   ├── sjtu_logo_page-0001.png     # 校名logo
│   └── sjtu_logo_notitle_page-0001.png  # 校徽
└── README.md            # 说明文件
```

## 快速开始

1. **安装Typst**
   - 方法1：在线使用 [Typst Web App](https://typst.app/)
   - 方法2：本地安装 `cargo install --git https://github.com/typst/typst`

2. **配置模板**
   打开 `main.typ`，修改文档开头的个人信息：
   ```typst
   #show: sjtu-report.with(
     title: "你的课程名称",
     lang: "你报告所用的语言"
     subtitle: "你的报告副标题", 
     school: "你的学院",
     class: "你的班级",
     student-id: "你的学号", 
     author: "你的姓名",
     header: "页眉内容",
   )
   ```
   
3. **编译文档**
   ```bash
   typst compile main.typ
   ```

## 功能特性

### ✅ 已实现功能
- [ ] 美化的标准封面页（含校徽/校名logo）
- [x] 自动生成目录
- [x] 页眉页码设置
- [x] 中英文字体配置（宋体+Times New Roman）
- [x] 公式编号和引用
- [x] 图片插入和引用
- [x] 表格插入和引用
- [x] 自定义文本框
- [x] 参考文献自动生成
- [x] 超链接支持

### 🎨 样式设置
- 页边距：2.5cm
- 中文字体：宋体（正文）、黑体（标题）、楷体（封面信息）
- 英文字体：Times New Roman
- 字号：12pt（小四）

## 使用指南

### 插入公式
```typst
// 行内公式
这是行内公式 $a + b = c$

// 行间公式（带编号和标签）
$ f(x) = integral_0^oo e^(-x^2) dif x $ <gauss>

// 引用公式
如公式 @gauss 所示...
```

### 插入图片
```typst
#figure(
  image("figures/example.png", width: 50%),
  caption: [图片说明],
) <fig-label>

// 引用图片
如 @fig-label 所示...
```

### 插入表格
```typst
#figure(
  table(
    columns: 3,
    [列1], [列2], [列3],
    [数据1], [数据2], [数据3],
  ),
  caption: [表格说明],
) <tab-label>
```

### 使用文本框
```typst
#tbox[
  这里是文本框内容
]
```

### 添加参考文献
1. 在 `references.bib` 中添加文献条目
2. 在正文中使用 `@citation-key` 引用
3. 默认使用中国国标 GB/T 7714-2015 格式

## 与LaTeX版本的主要差异

| 功能 | LaTeX | Typst |
|------|-------|-------|
| 编译速度 | 较慢 | 极快 |
| 语法复杂度 | 复杂 | 简洁 |
| 公式引用 | `\autoref{eq:label}` | `@eq-label` |
| 图片插入 | `\includegraphics` | `image()` |
| 表格语法 | 复杂 | 直观 |
| 错误提示 | 难理解 | 清晰 |

## 常见问题

**Q: 如何更换校徽？**
A: 将图片放入 `figures/` 目录，然后在模板配置中设置 `logo: "figures/your-logo.png"`

**Q: 如何调整页眉？**  
A: 在模板配置中修改 `header: "你的页眉内容"`

**Q: 中文显示异常？**
A: 确保系统安装了宋体、黑体、楷体字体

## 许可证

本模板基于原LaTeX版本进行转换，遵循相同的开源许可。

## 贡献

欢迎提交Issue和Pull Request来改进这个模板！
