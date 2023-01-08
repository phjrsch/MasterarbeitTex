\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{iofm_studentthesis}[2020/04/08 v2.0 iofm thesis-class]
% option to use german language
\newif\if@iofmgerman 
\DeclareOption{german}{\@iofmgermantrue}
% option to process all pstool figures
\newif\if@iofmpstoolall
\RequirePackage[utf8]{inputenc}
\RequirePackage{graphics,graphicx}
\RequirePackage{fancyhdr}
\RequirePackage{amsmath,amssymb}
\RequirePackage[square]{natbib}
\RequirePackage{subfigure}
\RequirePackage{listings}
\if@iofmpstoolall
\RequirePackage[crop=pdfcrop,process=all]{pstool}
\DeclareOption{pstoolall}{\@iofmpstoolalltrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
% process all supplied options
\ProcessOptions
% inherit report class
\LoadClass[a4paper]{report}
%
% load some default packages
\if@iofmgerman
\RequirePackage[ngerman]{babel}
\fi
\else
\RequirePackage[crop=pdfcrop]{pstool}
\fi
\RequirePackage{setspace}
\RequirePackage{algorithm}% http://ctan.org/pkg/algorithms
\RequirePackage{algpseudocode}
\RequirePackage[colorlinks=true,
            linkcolor=blue,
            citecolor=blue,
            filecolor=blue,
            urlcolor=black,
            bookmarks=true,
            breaklinks=true,
            bookmarksopen=true,
            bookmarksopenlevel=0,
            plainpages=false,
            pdftitle={},
            pdfsubject={},
            pdfauthor={},
            pdfkeywords={},
            pdfpagelabels=true]{hyperref}
%
% modify page a little
\setlength{\headheight}{12.5pt}
\setlength{\textwidth}{13.5cm}
\evensidemargin0cm
\oddsidemargin0mm %25mm
\pagestyle{fancy}
\fancyhf{}
\fancyhead[EL,OR]{\thepage}
\fancyhead[ER,OL]{\rightmark}
%
%
% define title page
\def\@thesistype{Bachelor thesis}
\def\@supervisors{}
\newcommand\thesistype[1]{\def\@thesistype{#1}}
\newcommand\addsupervisor[1]{\expandafter\def\expandafter\@supervisors\expandafter{\@supervisors\par#1}}
\if@titlepage
\renewcommand\maketitle{%
\begin{titlepage}%
  \let\footnotesize\small
  \let\footnoterule\relax
  \let \footnote \thanks
  \null\vfil
  \vskip 48\p@
  \begin{center}%
     {\large \@thesistype \par}
     \vskip 1em
    {\LARGE \@title \par}%
    \vskip 8em%
    \if@iofmgerman angefertigt am\else conducted at\fi\\[1.ex]
    \if@iofmgerman Institut f\"ur Mechanik\else Institute of Mechanics\fi,\\[1.ex]
    \if@iofmgerman Fakult\"at Maschinenbau\else Department of Mechanical Engineering\fi,\\[1.ex]
    TU Dortmund\\[1.ex]
    \if@iofmgerman von\else by\fi\\[1.em]
    {\large
     \lineskip .75em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
      \vskip 1.5em%
      \if@iofmgerman am\else on\fi\\[1.ex]
    {\large \@date \par}%       % Set date in \large size.
    \vskip 8em
    \if@iofmgerman Betreuer\else Supervisors\fi:\par\@supervisors
  \end{center}\par
  \@thanks
  \vfil\null
  \vfill
  \includegraphics[height=.65cm]{iom_logo_rgb_m2.eps}\hfill\includegraphics[height=.8cm]{tud_logo_rgb.eps}
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\fi

% command for blank-page
\newcommand\addblankpage{\if@twoside\clearpage\null\thispagestyle{empty}\clearpage\fi}

\endinput

