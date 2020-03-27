% ==============================================================================
% Identification
% ==============================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{shtthesis}[%
  2020/03/23 %
  0.2.0 %
  A (unofficial) thesis template for ShanghaiTech University%
]
\hyphenation{Sht-Thesis}
\def\shtthesis{ShtThesis}
\def\version{0.2.0}
% ==============================================================================
% Options and Declarations
% ==============================================================================
% ------------------------------------------------------------------------------
%   Define \shtsetup command
% ------------------------------------------------------------------------------
\RequirePackage{kvdefinekeys}
\RequirePackage{kvsetkeys}
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
  family=sht,
  prefix=sht@,
  setkeys=\kvsetkeys}
\newcommand\sht@error[1]{%
  \ClassError{shtthesis}{#1}{}%
}
\newcommand\shtsetup{%
  \kvsetkeys{sht}%
}
\newcommand\sht@define@key[1]{%
  \kvsetkeys{sht@key}{#1}%
}
\kv@set@family@handler{sht@key}{%
  \@namedef{sht@#1@@name}{#1}%
  \def\sht@@default{}%
  \def\sht@@choices{}%
  \kv@define@key{sht@value}{name}{%
    \@namedef{sht@#1@@name}{##1}%
  }%
  \kv@define@key{sht@value}{code}{%
    \@namedef{sht@#1@@code}{##1}%
  }%
  \@namedef{sht@#1@@check}{}%
  \@namedef{sht@#1@@code}{}%
  \@namedef{sht@#1@@hook}{%
    \expandafter\ifx\csname\@currname.\@currext-h@@k\endcsname\relax
      \@nameuse{sht@#1@@code}%
    \else
      \AtEndOfClass{%
        \@nameuse{sht@#1@@code}%
      }%
    \fi
  }%
  \kv@define@key{sht@value}{choices}{%
    \def\sht@@choices{##1}%
    \@namedef{sht@#1@@reset}{}%
    \@namedef{sht@#1@@check}{%
      \@ifundefined{%
        ifsht@\@nameuse{sht@#1@@name}@\@nameuse{sht@\@nameuse{sht@#1@@name}}%
      }{%
        \sht@error{Invalid value "#1 = \@nameuse{sht@\@nameuse{sht@#1@@name}}"}%
      }%
      \@nameuse{sht@#1@@reset}%
      \@nameuse{sht@\@nameuse{sht@#1@@name}@\@nameuse{sht@\@nameuse{sht@#1@@name}}true}%
    }%
  }%
  \kv@define@key{sht@value}{default}{%
    \def\sht@@default{##1}%
  }%
  \kvsetkeys{sht@value}{#2}%
  \@namedef{sht@\@nameuse{sht@#1@@name}}{}%
  \kv@set@family@handler{sht@choice}{%
    \ifx\sht@@default\@empty
      \def\sht@@default{##1}%
    \fi
    \expandafter\newif\csname ifsht@\@nameuse{sht@#1@@name}@##1\endcsname
    \expandafter\g@addto@macro\csname sht@#1@@reset\endcsname{%
      \@nameuse{sht@\@nameuse{sht@#1@@name}@##1false}%
    }%
  }%
  \kvsetkeys@expandafter{sht@choice}{\sht@@choices}%
  \expandafter\let\csname sht@\@nameuse{sht@#1@@name}\endcsname\sht@@default
  \expandafter\ifx\csname sht@\@nameuse{sht@#1@@name}\endcsname\@empty\else
    \@nameuse{sht@#1@@check}%
    \@nameuse{sht@#1@@hook}%
  \fi
  \kv@define@key{sht}{#1}{%
    \@namedef{sht@\@nameuse{sht@#1@@name}}{##1}%
    \@nameuse{sht@#1@@check}%
    \@nameuse{sht@#1@@hook}%
  }%
}
% ------------------------------------------------------------------------------
%   Options for \shtsetup
% ------------------------------------------------------------------------------
\sht@define@key{
  degree = {
    choices = {
      bachelor,
      master,
      doctor,
      postdoc,
    },
    default = doctor,
  },
  degree-type = {
    choices = {
      academic,
      professional,
    },
    name = degree@type,
  },
  language = {
    choices = {
      chinese,
      english,
    },
  },
  secret-level = {
    name = secret@level,
  },
  secret-year = {
    name = secret@year,
  },
  title = {
    default = {标题},
  },
  title* = {
    default = {Title},
    name    = title@en,
    code    = {
      \title{\sht@title}
    },
  },
  author = {
    default = {姓名},
    code    = {
      \author{\sht@author}
    },
  },
  author* = {
    default = {Name of author},
    name    = author@en,
  },
  supervisor = {
    default = {导师姓名},
  },
  supervisor* = {
    default = {Name of supervisor},
    name    = supervisor@en,
  },
  associate-supervisor = {
    name = associate@supervisor,
  },
  associate-supervisor* = {
    name = associate@supervisor@en,
  },
  joint-supervisor = {
    name = joint@supervisor,
  },
  joint-supervisor* = {
    name = joint@supervisor@en,
  },
  degree-name = {
    default = {工学博士},
    name    = degree@name,
  },
  degree-name* = {
    default = {Doctor of Philosophy},
    name    = degree@name@en,
  },
  department = {
    default = {上海科技大学信息科学与技术学院},
  },
  discipline = {
    % default = {计算机科学与技术},
  },
  discipline* = {
    % default = {Computer Science and Technology},
    name    = discipline@en,
  },
  date = {
    default = {\the\year~年~\the\month~月},
  },
  clc,
  udc,
  id,
  discipline-level-1 = {
    default = {一级学科名称},
    name    = discipline@level@i,
  },
  discipline-level-2 = {
    default = {二级学科名称},
    name    = discipline@level@ii,
  },
  start-date = {
    name    = start@date,
    default = {\the\year-\two@digits{\month}-\two@digits{\day}},
  },
  end-date = {
    name    = end@date,
    default = {\the\year-\two@digits{\month}-\two@digits{\day}},
  },
}
% ------------------------------------------------------------------------------
%   Load minimum mandatory packages
% ------------------------------------------------------------------------------
\LoadClass[
  UTF8,
  a4paper,
  twoside, 
  openany, 
  zihao = -4, 
  scheme = plain, 
]{ctexbook}
\RequirePackage{geometry}
\RequirePackage{calc}
\RequirePackage{etoolbox}
\RequirePackage{ifthen}
\RequirePackage{graphicx}
\RequirePackage{indentfirst}
\RequirePackage[normalem]{ulem}
\RequirePackage{fancyhdr}
\RequirePackage{letltxmacro}
\RequirePackage{fontspec}[2016/12/27]
\RequirePackage{amsmath, amsthm, amssymb}
\RequirePackage[
  mathrm = sym,
  mathit = sym,
  mathbf = sym,
  mathtt = sym,
] {unicode-math}
\AtEndPreamble{
  \RequirePackage{hyperref}
  \hypersetup{
    pdfencoding = auto,
    psdextra = true,
    bookmarksnumbered = true,
    pdftitle = {\sht@title},
    pdfauthor = {\sht@author},
    colorlinks = true,
    linkcolor = black,
    citecolor = blue,
    urlcolor = blue,
  }
}
% ==============================================================================
% Format Specifications
% ==============================================================================
% ------------------------------------------------------------------------------
%   Geometry and layouts
% ------------------------------------------------------------------------------
\geometry{
  inner = 3.17cm,
  outer = 3.17cm,
  top = 2.54cm,
  bottom = 2.54cm,
  headheight = 12pt, % 9bp,
  headsep = 17.5pt, % 2.54cm - 9bp,
  footskip = 2.54cm - 1.75cm,
}
\setlength{\parskip}{0.5ex plus 0.25ex minus 0.25ex}
\setlength{\parindent}{2\ccwd}
\linespread{1.6}
\raggedbottom
% ------------------------------------------------------------------------------
%   Headers and footers
% ------------------------------------------------------------------------------
\fancypagestyle{CenteralPageNumbered}{
  \fancyhf{}
  \pagenumbering{Roman}
  \fancyhead[C]{
    \footnotesize
    \ifnumodd{\value{page}}{
      \leftmark
    }{
      \@title
    }
  }
  \fancyfoot[C]{
    \footnotesize
    \thepage
  }
  \renewcommand{\headrulewidth}{0.8pt}
  \renewcommand{\footrulewidth}{0pt}
}
\fancypagestyle{LRPageNumbered}{
  \fancyhf{}
  \fancyhead[C]{
    \footnotesize
    \ifnumodd{\value{page}}{
      \leftmark
    }{
      \@title
    }
  }
  \fancyfoot[C]{
    \footnotesize
    \ifnumodd{\value{page}}{
      \hspace*{\fill}
      \thepage
    }{
      \thepage
      \hspace*{\fill}
    }
  }
  \renewcommand{\headrulewidth}{0.8pt}
  \renewcommand{\footrulewidth}{0pt}
}
\fancypagestyle{LRPageNumberedWithoutHead}{
  \fancyhf{}
  \fancyfoot[C]{
    \footnotesize
    \ifnumodd{\value{page}}{
      \hspace*{\fill}
      \thepage
    }{
      \thepage
      \hspace*{\fill}
    }
  }
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}
\fancypagestyle{Plain}{}
\providecommand{\frontmatter}{}
\LetLtxMacro{\TmpFrontmatter}{\frontmatter}
\renewcommand{\frontmatter}{%
  \TmpFrontmatter%
  \pagestyle{CenteralPageNumbered}%
}
\providecommand{\mainmatter}{}
\LetLtxMacro{\TmpMainmatter}{\mainmatter}
\renewcommand{\mainmatter}{%
  \TmpMainmatter%
  \pagestyle{LRPageNumbered}%
}
\providecommand{\backmatter}{}
\LetLtxMacro{\TmpBackmatter}{\backmatter}
\renewcommand{\backmatter}{%
  \TmpBackmatter%
  \pagestyle{LRPageNumbered}%
}
% ------------------------------------------------------------------------------
%   Font utilities
% ------------------------------------------------------------------------------
\newcommand\sht@fontset{\csname g__ctex_fontset_tl\endcsname}
% ------------------------------------------------------------------------------
%   English fonts
% ------------------------------------------------------------------------------
\setmainfont{XITS} [
  Extension      = .otf,
  UprightFont    = *-Regular,
  BoldFont       = *-Bold,
  ItalicFont     = *-Italic,
  BoldItalicFont = *-BoldItalic,
  Ligatures      = TeX,
]
\setsansfont{texgyreheros} [
  Extension      = .otf,
  UprightFont    = *-regular,
  BoldFont       = *-bold,
  ItalicFont     = *-italic,
  BoldItalicFont = *-bolditalic,
  Ligatures      = TeX,
]
\setmonofont{texgyrecursor} [
  Extension      = .otf,
  UprightFont    = *-regular,
  BoldFont       = *-bold,
  ItalicFont     = *-italic,
  BoldItalicFont = *-bolditalic,
  Ligatures      = TeX,
]
% ------------------------------------------------------------------------------
%   Chinese fonts
% ------------------------------------------------------------------------------
\ifthenelse{\equal{\sht@fontset}{windows}}{
  \xeCJKsetup{EmboldenFactor=2.5}
  \IfFileExists{C:/bootfont.bin}{
    \setCJKmainfont[AutoFakeBold,ItalicFont=KaiTi_GB2312]{SimSun}
    \setCJKfamilyfont{zhkai}[AutoFakeBold]{KaiTi_GB2312}
  }{
    \setCJKmainfont[AutoFakeBold,ItalicFont=KaiTi]{SimSun}
    \setCJKfamilyfont{zhkai}[AutoFakeBold]{KaiTi}
  }
  \setCJKsansfont[AutoFakeBold]{SimHei}
  \setCJKfamilyfont{zhsong}[AutoFakeBold]{SimSun}
  \setCJKfamilyfont{zhhei}[AutoFakeBold]{SimHei}
}{}
% ------------------------------------------------------------------------------
%   Math fonts
% ------------------------------------------------------------------------------
\unimathsetup{
  math-style = ISO,
  bold-style = ISO,
  nabla      = upright,
  partial    = upright,
}
\IfFontExistsTF{XITSMath-Regular.otf}{
  \setmathfont{XITSMath-Regular} [
    Extension    = .otf,
    BoldFont     = XITSMath-Bold,
    StylisticSet = 8,
  ]
  \setmathfont{XITSMath-Regular.otf} [
    range        = {cal, bfcal},
    StylisticSet = 1,
  ]
  \setmathfont{XITSMath-Regular.otf} [
    range        = {scr, bfscr},
    StylisticSet = 2,
  ]
}{
  \setmathfont{xits-math} [
    Extension    = .otf,
    BoldFont     = *bold,
    StylisticSet = 8,
  ]
  \setmathfont{xits-math.otf} [
    range        = {cal, bfcal},
    StylisticSet = 1,
  ]
  \setmathfont{xits-math.otf} [
    range        = {scr, bfscr},
    StylisticSet = 2,
  ]
}
\IfFontExistsTF{FiraMath-Regular.otf}{
  \setmathfontface\mathsf{FiraMath-Regular.otf}
}{}
% ------------------------------------------------------------------------------
%   Table of contents, figures and tables
% ------------------------------------------------------------------------------
\def\@dotsep{1.5mu}
\def\@pnumwidth{2em}
\def\@tocrmarg{2em}
\def\@chaptervspace{1ex}
% [<level>,<indent>,<numwidth>,<title>,<page>]
\renewcommand*{\@dottedtocline}[5]{
  \ifnum #1>\c@tocdepth \else
    \vskip \z@ \@plus.2\p@
    {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
    \parindent #2\relax\@afterindenttrue
    \interlinepenalty\@M
    \leavevmode \zihao{-4}\heiti
    \@tempdima #3\relax
    \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
    {#4}\nobreak
    \leaders\hbox{$\m@th\mkern \@dotsep \cdot\mkern \@dotsep$}\hfill
    \nobreak
    \hb@xt@\@pnumwidth{\hfil\normalfont \normalcolor #5}%
    \par\penalty\@highpenalty}%
  \fi
}
% [<title>,<page>]
\renewcommand*{\l@part}[2]{
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}%
    \addvspace{2.25em \@plus\p@}%
    \setlength\@tempdima{3em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
      \zihao{4}\heiti #1
      \leaders\hbox{$\m@th\mkern \@dotsep \cdot\mkern \@dotsep$}
      \hfil \hb@xt@\@pnumwidth{\hss #2}}\par
      \nobreak
      \global\@nobreaktrue
      \everypar{\global\@nobreakfalse\everypar{}}%
    \endgroup
  \fi
}
% [<title>,<page>]
\renewcommand*{\l@chapter}[2]{
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip \@chaptervspace \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \zihao{4}\heiti
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak
      \leaders\hbox{$\m@th\mkern \@dotsep \cdot\mkern \@dotsep$}
      \hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi
}
\renewcommand*\l@section{\@dottedtocline{1}{1em}{1.8em}}
\renewcommand*\l@subsection{\@dottedtocline{2}{2em}{2.8em}}
\renewcommand*\l@subsubsection{\@dottedtocline{3}{3em}{3.8em}}
\renewcommand*\l@paragraph{\@dottedtocline{4}{4em}{4.8em}}
\renewcommand*\l@subparagraph{\@dottedtocline{5}{5em}{5.8em}}
\renewcommand*\l@figure{\@dottedtocline{1}{1em}{1.8em}}
\renewcommand*\l@table{\@dottedtocline{1}{1em}{1.8em}}
\setcounter{tocdepth}{2}
\setcounter{secnumdepth}{3}
% ------------------------------------------------------------------------------
%   Content specifications
% ------------------------------------------------------------------------------
\ctexset {
  chapter = {
    format = \bfseries\heiti\zihao{4}\linespread{1.0}\centering,
    nameformat = {},
    numberformat = \rmfamily,
    titleformat = {},
    name = {第, 章},
    number = \arabic{chapter},
    aftername = \hspace{1\ccwd},
    beforeskip = {7pt},
    afterskip = {18pt},
    pagestyle = Plain,
  },
  section = {
    format = \heiti\normalsize\linespread{1.0}\raggedright,
    nameformat = {},
    numberformat = \rmfamily,
    titleformat = {},
    aftername = \hspace{1\ccwd},
    beforeskip = {24pt},
    afterskip = {6pt},
  },
  subsection = {
    format = \heiti\normalsize\linespread{1.0}\raggedright,
    nameformat = {},
    numberformat = \rmfamily,
    titleformat = {},
    aftername = \hspace{1\ccwd},
    beforeskip = {12pt},
    afterskip = {6pt},
  },
  paragraph = {
    indent = 2\ccwd,
  },
  punct = quanjiao,
  space = auto,
  autoindent = true,
}
% ==============================================================================
% Cover Generation
% ==============================================================================
\newcommand{\ulunify}[1]{\uline{#1}}% unified name
\newcommand{\ulenhance}[2][1pt]{% enhanced underline
    \def\ULthickness{#1}% set thickness
    \setlength{\ULdepth}{0.3em}% set depth
    \expandafter\ulunify\expandafter{#2}% linebreak fix
}
\newcommand{\ulhshift}{-4em}% horizontal shift on underline
\newcommand{\ulextend}[2][350pt]{% extend underline length
    \hbox to #1{\hfill\hspace*{\ulhshift}#2\hfill}}
\def\sht@schoollogo{\includegraphics[width=10.48cm]{shanghaitech_logo.pdf}}
\renewcommand{\cleardoublepage}[1][plain]{%
  \clearpage%
  \if@twoside%
    \ifodd%
      \c@page%
    \else%
      \thispagestyle{#1}%
      \hbox{}%
      \newpage%
      \if@twocolumn%
        \hbox{}%
        \newpage%
      \fi%
    \fi%
  \fi%
}
\renewcommand{\maketitle}{%
  \maketitle@xpdc%
}
% ------------------------------------------------------------------------------
%   Master / PhD thesis cover
% ------------------------------------------------------------------------------
\newcommand{\maketitle@xpdc}{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    \linespread{1.6}
    \zihao{4}\bfseries

    \hfill{}
    \ifdefempty{\sht@secret@level}{%
      %
    }{%
      密级%
      \ulenhance{%
        \ulextend[50pt]{%
          \hspace*{-\ulhshift} \zihao{5} \sht@secret@level%
        }%
      }%
    }

    \vspace*{\stretch{4}}

    {\sht@schoollogo}

    \vspace*{\stretch{2}}

    {\zihao{1}\bfseries\heiti {硕士学位论文}}

    \vspace*{\stretch{3}}

    {\zihao{-3}\bfseries\heiti \ulenhance[1.5pt]{\sht@title}}

    \vspace*{\stretch{3}}

    {
      \def\tabcolsep{1pt}
      \def\arraystretch{1.3}
      \zihao{4}\bfseries\songti
      \begin{tabular}{llc}
        作者姓名： & \multicolumn{2}{c}{\ulenhance[1.2pt]{\ulextend{\sht@author}}}\\
        指导教师： & \multicolumn{2}{c}{\ulenhance[1.2pt]{\ulextend{\sht@supervisor}}}\\
        学位类别： & \multicolumn{2}{c}{\ulenhance[1.2pt]{\ulextend{\sht@degree@name}}}\\
        一级学科： & \multicolumn{2}{c}{\ulenhance[1.2pt]{\ulextend{\sht@discipline@level@i}}}\\
        \multicolumn{2}{l}{学校/学院名称：} & \ulenhance[1.2pt]{\ulextend[318pt]{\sht@department}}\\
      \end{tabular}
    }

    \vspace*{\stretch{4}}

    {\sht@date}

    \vspace*{\stretch{4}}
  \end{center}
  \clearpage
  \thispagestyle{empty}
  \cleardoublepage[empty]
}
