# Latex_EXP

浙江大学课程大作业/结课汇报的通用简易 $\LaTex$ 模板

## Quick Start

1. 克隆仓库到本地：

    ```bash
    git clone https://github.com/Phil-Fan/Latex_exp.git
    cd Latex_exp
    ```

2. 编译生成 PDF：

    ```bash
    make
    ```

编译完成后，生成的 PDF 文件为 `thesis.pdf`。

其他常用命令：

- `make clean` - 清理编译生成的临时文件
- `make help` - 查看所有可用的 make 命令

## 结构

项目文件结构如下：

```text
Latex_exp/
├── thesis.tex          # 主文件，包含报告正文
├── thesis.sty          # 文档格式控制，包括页面设置、样式定义等
├── config.tex          # 配置文件，包含个人信息、课程名称等设置
├── ref.bib             # 参考文献列表
├── Makefile            # 编译脚本
├── figures/            # 图片文件夹
│   ├── char.png        # 字符图片
│   ├── example.png     # 示例图片
│   └── logo.png        # 院校 LOGO
└── README.md           # 项目说明文档
```

### 文件说明

- **thesis.tex** - 主文件，包含报告正文内容
- **thesis.sty** - 文档格式控制文件，定义页面布局、样式等
- **config.tex** - 配置文件，用于设置：
  - 课程名称（封面标题/页眉）
  - 实验名称、地点、日期
  - 学生姓名、学号
  - 指导老师
- **ref.bib** - BibTeX 参考文献数据库
- **figures/** - 存放图片资源的文件夹

### 使用步骤

1. 编辑 `config.tex` 设置个人信息、课程名称等
2. 编辑 `thesis.tex` 编写报告正文
3. 在 `figures/` 文件夹中放置所需图片
4. 在 `ref.bib` 中添加参考文献
5. 运行 `make` 编译生成 PDF

## Trouble Shooting

### 关于 macOS 系统下的编译方法

VsCode 插件 LaTeX Workshop 中的 `latexmk` 配置（.vscode/settings.json）参考如下：

```json
{
    "latex-workshop.latex.tools": [
        {
            "name": "latexmk-xelatex",
            "command": "latexmk",
            "args": [
                "-xelatex",
                "-synctex=1",
                "-interaction=nonstopmode",
                "-file-line-error",
                "-halt-on-error",
                "-outdir=build",
                "%DOC%"
            ],
            "env": {
               "PATH": "/Library/TeX/texbin:/usr/bin:/bin:/usr/local/bin"
            }
        }
    ],
    "latex-workshop.latex.recipes": [
        {
            "name": "latexmk (xelatex)",
            "tools": [
                "latexmk-xelatex"
            ]
        }
    ],
    // 告诉插件生成文件所在目录（用于预览、反向搜索等）
    "latex-workshop.latex.outDir": "build",
    // 可选：保存时自动构建
    "latex-workshop.latex.autoBuild.run": "onSave",

    // 以下为新增：对 LaTeX / TeX 文件启用自动换行
    "[latex]": {
        "editor.wordWrap": "on",             // 自动软换行
        "editor.wordWrapColumn": 80,        // 换行列（仅在 wordWrap=wordWrapColumn 时生效）
        "editor.wrappingIndent": "indent",  // 换行缩进方式
        "editor.quickSuggestions": { 
            "other": true, 
            "comments": false, 
            "strings": false 
        }
    },
    "[tex]": {
        "editor.wordWrap": "on",
        "editor.wordWrapColumn": 80,
        "editor.wrappingIndent": "indent"
    },
}
```

NOTE: macOS 上的 VSCode 有个「经典 bug」：
从 Dock 或 Finder 启动的 GUI 应用不会继承你 `.zshrc` 或 `.bashrc` 的环境变量，所以 `$PATH` 是不完整的。

✅ 解决办法 1：

新 shell 是否应从 VS Code 继承其环境，这可能会生成登录 shell，以确保初始化 $PATH 和其他开发变量。这不会对 Windows 造成影响。

```json
"terminal.integrated.inheritEnv": true,
```

✅ 解决办法 2：从终端启动 VSCode：

```bash
code .
```

## 参考

- [GBT7714-2015 标准下的 BibTex 样式](https://github.com/zepinglee/gbt7714-bibtex-style)
- [国科大学位论文 LaTeX 模板](https://github.com/mohuangrui/ucasthesis)
- [北京大学课程论文模板](https://www.overleaf.com/latex/templates/bei-jing-da-xue-ke-cheng-lun-wen-mo-ban/yntmqcktrzfh)
