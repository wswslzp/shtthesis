# ShangHaiTech university THESIS (shtthesis)

`shtthesis` 项目派生于 [`ucasthesis`](https://github.com/mohuangrui/ucasthesis)，是根据《上海科技大学研究生学位论文撰写规范（初稿）》编写的、适用于上海科技大学学位论文写作的**非官方** LaTeX 模板。只需设定 `\documentclass{shtthesis}` 并通过 `\shtsetup` 设置相关信息，即可迅速完成学位论文排版：
```latex
\documentclass{shtthesis}

\shtsetup{
  title = {论文标题},
  title* = {Title~of~Thesis},
  author = {作者姓名},
  author* = {Name~of~Author},
  % ...
}

\begin{document}
% ...
```

## 模板下载

- 稳定版：
  - GitHub Release: 请移步至 [release](https://github.com/lirundong/sht-thesis/releases) 页面，根据发布信息下载相应文件
  - CTAN: TODO
- 开发版：直接克隆 master 分支
  ```bash
  git clone https://github.com/lirundong/sht-thesis.git
  ```

## 快速上手

在下载或克隆代码库后，依次

0. **完整安装**一个现代化的 TeX 发行版：
   - Windows 或 Linux：[TeX Live](https://www.tug.org/texlive/)
   - macOS：[MacTeX](https://www.tug.org/mactex/)
1. 在 terminal （Windows 使用 CMD）中切换至当前目录，使用 `latexmk` 工具，调用 LuaLaTeX 或 XeLaTeX 引擎编译项目（**注意**：不支持 pdfLaTeX）:
   ```bash
   latexmk -pdflua
   # 若调用 XeLaTeX 引擎，则执行
   # latexmk -pdfxe
   ```
   编译所得文件即为**使用说明**：shtthesis-user-guide.pdf
2. 强烈建议先快速看一遍上一步得到的使用说明，或预编译的[使用说明文件](shtthesis.pdf)
3. 打开文档的源文件 [shtthesis-user-guide.tex](shtthesis-user-guide.tex)，开始愉快的写作之旅吧 :smirk:

## 开源许可证

`shtthesis` 项目根据 GNU Public License V3 分发，具体条款见 [LICENSE](LICENSE)。
