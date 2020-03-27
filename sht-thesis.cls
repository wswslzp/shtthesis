% ==============================================================================
% Identification
% ==============================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sht-thesis}[%
  2020/03/23 %
  0.2.0 %
  A (unofficial) thesis template for ShanghaiTech University%
]
% ==============================================================================
% Options and Declarations
% ==============================================================================
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
    pdftitle = {\@title},
    pdfauthor = {\@author},
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
%   Fonts
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
    format = \zihao{4}\linespread{1.0}\bfseries\heiti\centering,
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
    format = \normalsize\linespread{1.0}\heiti\raggedright,
    nameformat = {},
    numberformat = \rmfamily,
    titleformat = {},
    aftername = \hspace{1\ccwd},
    beforeskip = {24pt},
    afterskip = {6pt},
  },
  subsection = {
    format = \normalsize\linespread{1.0}\heiti\raggedright,
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