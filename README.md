# ShangHaiTech university THESIS (shtthesis)
[![Action status](https://github.com/lirundong/sht-thesis/workflows/Build/badge.svg)](https://github.com/lirundong/shtthesis/actions)
[![CTAN version](https://img.shields.io/ctan/v/shtthesis)](https://ctan.org/pkg/shtthesis)
[![GitHub release](https://img.shields.io/github/v/release/lirundong/shtthesis)](https://github.com/lirundong/shtthesis/releases/latest)
[![GitHub downloads](https://img.shields.io/github/downloads/lirundong/shtthesis/total)](https://github.com/lirundong/shtthesis/releases)

`shtthesis` project, forked from [`ucasthesis`](https://github.com/mohuangrui/ucasthesis), is an **unofficial** LaTeX thesis template for ShanghaiTech University and satisfies all format requirements in 《上海科技大学研究生学位论文撰写规范（初稿）》. The user just need to set `\documentclass{shtthesis}` and to setup mandatory information via `\shtsetup`, then his or her thesis document will be typeset properly:
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

## Get the Template
- Stable version:
  - GitHub Release: please refer to [release](https://github.com/lirundong/sht-thesis/releases) page, and download required files based on release information
  - CTAN: [`shtthesis`](https://ctan.org/pkg/shtthesis) package on CTAN can be installed via `tlmgr` for TeX Live and MacTeX users:
    ```bash
    tlmgr install shtthesis
    ```

    Note that `shtthesis` package on CTAN does not include the university logo file. Please download [`shanghaitech-logo.pdf`](https://github.com/lirundong/shtthesis/raw/master/shanghaitech-logo.pdf) from this repository and put it in the root of your project folder.
- Develop version: directly clone the GitHub repo
  ```bash
  git clone https://github.com/lirundong/sht-thesis.git
  ```

Please, read through [the user's guide](shtthesis-user-guide.pdf) before continuing.

## Get Started
After cloning or downloading this template, please

0. Install a modern TeX distribution **in full scheme**:
   - Windows or Linux: [TeX Live](https://www.tug.org/texlive/)
   - macOS: [MacTeX](https://www.tug.org/mactex/)
1. Open your terminal (CMD for Windows users) and switch to this directory, compile this template by `latexmk` tool with LuaLaTeX or XeLaTeX engine (**note**: pdfLaTeX is not supported):
   ```bash
   latexmk -pdflua
   # if you prefer XeLaTeX engine:
   # latexmk -pdfxe
   ```
   the output file `shtthesis-user-guide.pdf` is the compiled user guide document
2. Open the document source file [shtthesis-user-guide.tex](shtthesis-user-guide.tex) and enjoy TeXing :smirk:

## License
- The copyright of ShanghaiTech University logo (`shanghaitech-logo.pdf`) is owned by ShanghaiTech University
- `shtthesis-gbt7714-plain.bst` is modified from [gbt7714](https://github.com/CTeX-org/gbt7714-bibtex-style) project and is licensed under LaTeX Project Public License v1.3c, see [lppl-1.3c](https://www.latex-project.org/lppl/lppl-1-3c.txt) for details
- The rest of `shtthesis` project is licensed under GNU Public License v3, see [LICENSE](LICENSE) for details
