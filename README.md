
# 浙江大学课程大作业/结课汇报Latex模板


## 介绍
- 用于浙江大学课程大作业/结课汇报的通用简易Latex模板

## 使用方法
默认模板文件由以下四部分组成：

- `main.tex` 主文件,包含报告正文
- `reference.bib` 参考文献列表
- `zjureport.sty` 文档格式控制，包括一些基础的设置，可以设置页眉、标题、姓名等
- `figures` 放置图片的文件夹,包含院校LOGO和效果预览图

使用时需前往`zjureport.sty` 对标题、副标题、姓名、学号、院所、页眉等进行设置，然后编辑`main.tex`进行正文编写

## 编译方法
#### 关于 macOS 系统下的编译方法：
命令行
```bash
latexmk -xelatex -interaction=nonstopmode -halt-on-error main.tex
```
VsCode 插件 LaTeX Workshop 中的 `latexmk` 配置（.vscode/settings.json） 参考如下：
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
        "editor.quickSuggestions": { "other": true, "comments": false, "strings": false }
    },
    "[tex]": {
        "editor.wordWrap": "on",
        "editor.wordWrapColumn": 80,
        "editor.wrappingIndent": "indent"
    },
}
```
NOTE: macOS 上的 VSCode 有个「经典 bug」：从 Dock 或 Finder 启动的 GUI 应用不会继承你 .zshrc 或 .bashrc 的环境变量，所以 $PATH 是不完整的。

✅ 解决办法1：
// 新 shell 是否应从 VS Code 继承其环境，这可能会生成登录 shell，以确保初始化 $PATH 和其他开发变量。这不会对 Windows 造成影响。
```
"terminal.integrated.inheritEnv": true,
```
把setting.json的这个变量从false改为true

✅ 解决办法2：从终端启动 VSCode：
```bash
code .
```

## 参考

+ [GBT7714-2015标准下的BibTex样式](https://github.com/zepinglee/gbt7714-bibtex-style)
+ [国科大学位论文LaTeX模板](https://github.com/mohuangrui/ucasthesis)
+ [北京大学课程论文模板](https://www.overleaf.com/latex/templates/bei-jing-da-xue-ke-cheng-lun-wen-mo-ban/yntmqcktrzfh)
