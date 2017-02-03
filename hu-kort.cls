\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hu-kort}

\RequirePackage{calc,ifthen}

\newboolean{@studentnr}
\setboolean{@studentnr}{true}
\DeclareOption{nostudentnr}
{ \setboolean{@studentnr}{false}}

\newboolean{@datehdr}
\setboolean{@datehdr}{false}
\DeclareOption{date}
{ \setboolean{@datehdr}{true}}

\newboolean{@dutch}
\setboolean{@dutch}{false}
\DeclareOption{dutch}
{ \setboolean{@dutch}{true}
  \PassOptionsToClass{dutch}{memoir}}

\newboolean{@nocolour}
\setboolean{@nocolour}{false}
\DeclareOption{nocolour}
{ \setboolean{@nocolour}{true} }

\newboolean{@10pt}
\setboolean{@10pt}{false}
\DeclareOption{10pt}
{ \setboolean{@10pt}{true} }

\newboolean{@11pt}
\setboolean{@11pt}{false}
\DeclareOption{11pt}
{ \setboolean{@11pt}{true} }

\newboolean{@12pt}
\setboolean{@12pt}{false}
\DeclareOption{12pt}
{ \setboolean{@12pt}{true} }

\DeclareOption*
{ \PassOptionsToClass{\CurrentOption}{article}}

\ProcessOptions\relax

\ifthenelse{\boolean{@10pt}}
{ \PassOptionsToClass{10pt}{article}}
{ \ifthenelse{\boolean{@11pt}}
  { \PassOptionsToClass{11pt}{article}}
  { \PassOptionsToClass{12pt}{article}}}

\LoadClass[a4paper,oneside]{article}

\RequirePackage{xcolor}

\ifthenelse{\boolean{@nocolour}}
{ \definecolor{SkyBlue}{rgb}{0, 0, 0}
  \definecolor{DarkSkyBlue}{rgb}{0, 0, 0}
  \definecolor{Plum}{rgb}{0, 0, 0}
  \definecolor{Black}{rgb}{0, 0, 0}
  \definecolor{HU-Blue}{cmyk}{0.99, 0.01, 0.05, 0.05}
  \definecolor{HU-Red}{cmyk}{0, 0.81, 0.87, 0.15} }
{ \definecolor{SkyBlue}{rgb}{0.20, 0.39, 0.64}
  \definecolor{DarkSkyBlue}{rgb}{0.12, 0.29, 0.53}
  \definecolor{Plum}{rgb}{0.46, 0.31, 0.48}
  \definecolor{Black}{rgb}{0, 0, 0}
  \definecolor{HU-Blue}{cmyk}{0.99, 0.01, 0.05, 0.05}
  \definecolor{HU-Red}{cmyk}{0, 0.81, 0.87, 0.15} }

\RequirePackage{polyglossia}
\RequirePackage[autostyle]{csquotes}

\defaultfontfeatures{Scale=MatchLowercase, Mapping=tex-text, Ligatures=Common, Numbers=OldStyle}

\ifthenelse{\boolean{@dutch}}
{ \setdefaultlanguage{dutch}
  \def\@logo{hu-nl.eps} }
{ \setdefaultlanguage[variant=british]{english}
  \def\@logo{hu-en.eps} }

\newcommand*\duolingual[3]
{ \ifthenelse{\boolean{@dutch}}
  { \expandafter\def\csname #1\endcsname{#3}}
  { \expandafter\def\csname #1\endcsname{#2}}}

\duolingual{@authorlabel}{Author}{Auteur}
\duolingual{@authorslabel}{Authors}{Auteurs}
\duolingual{@teacherlabel}{Teacher}{Docent}
\duolingual{@teacherslabel}{Teachers}{Docenten}
\duolingual{@hu}{Utrecht University of Applied Science}{Hogeschool Utrecht}
\duolingual{@inst}{Institute of ICT}{Instituut voor ICT}

\RequirePackage{fontspec, xunicode, xltxtra, polyglossia, wrapfig, fancyhdr}
\RequirePackage[a4paper, textwidth=6.5in, textheight=9in, footskip=1in,
                marginparsep=7pt, marginparwidth=.6in]{geometry}
\RequirePackage[bookmarks, colorlinks, breaklinks,
                urlcolor=Plum,
                citecolor=Plum,
                linkcolor=Black]
               {hyperref}

\fancypagestyle{plain}
{ \fancyhf{}
  \renewcommand{\headrulewidth}{0pt}
  \fancyfoot[C]{\footnotesize {\@hu\ --- \@inst}} }
\pagestyle{plain}

\def\@subtitle{}
\newcommand{\subtitle}[1]{\def\@subtitle{#1}}

\newcounter{numauthors}
\newcounter{curauthor}
\setcounter{numauthors}{0}

\renewcommand{\author}[3]
{ \addtocounter{numauthors}{1}
  \expandafter\def\csname author\arabic{numauthors}gname\endcsname{#1}
  \expandafter\def\csname author\arabic{numauthors}fname\endcsname{#2}
  \expandafter\def\csname author\arabic{numauthors}num\endcsname{#3}}

\renewcommand{\@author}[1]
{ \csname author#1gname\endcsname { \scshape \csname author#1fname\endcsname }
  \ifthenelse{\boolean{@studentnr}}
  {{\itshape\footnotesize (\csname author#1num\endcsname)}}{}}

\newcounter{numteachers}
\newcounter{curteacher}
\setcounter{numteachers}{0}

\newcommand{\teacher}[2]
{ \addtocounter{numteachers}{1}
  \expandafter\def\csname teacher\arabic{numteachers}gname\endcsname{#1}
  \expandafter\def\csname teacher\arabic{numteachers}fname\endcsname{#2}}

\renewcommand{\thefootnote}{\fnsymbol{footnote}}

\newcommand{\@teacher}[1]
{ \csname teacher#1gname\endcsname { \scshape \csname teacher#1fname\endcsname }}

\newcommand{\@authors}
{ \setcounter{curauthor}{1}
  \setcounter{curteacher}{1}
  \begin{tabbing}
    \ifthenelse{\boolean{@datehdr}}
    { \= \hspace{1.5cm} \= \hspace{6cm} \= \hspace{1.5cm} \= \hspace{4cm} \= \\[-7mm] }
    { \= \hspace{2cm} \= \hspace{7.5cm} \= \hspace{2cm} \= \\[-7mm] }
    \> \itshape \ifthenelse{\equal{\arabic{numauthors}}{1}}{\@authorlabel:}
                { \ifthenelse{\equal{\arabic{numauthors}}{0}}{}{\@authorslabel:}}
    \addtocounter{numauthors}{1}
    \> \ifthenelse{\arabic{curauthor} < \arabic{numauthors}}
    { \@author{\arabic{curauthor}}}{}
    \> \itshape \ifthenelse{\equal{\arabic{numteachers}}{1}}{\@teacherlabel:}
                { \ifthenelse{\equal{\arabic{numteachers}}{0}}{}{\@teacherslabel:}}
    \addtocounter{numteachers}{1}
    \> \ifthenelse{\arabic{curteacher} < \arabic{numteachers}}
    { \@teacher{\arabic{curteacher}}}{}
    \ifthenelse{\boolean{@datehdr}}{\> \@date}{} \\
    \authorloop
   \end{tabbing} }

\newcommand{\authorloop}
{ \addtocounter{curauthor}{1}
  \addtocounter{curteacher}{1}
  \ifthenelse{\arabic{curauthor} < \arabic{numauthors} \OR \arabic{curteacher} < \arabic{numteachers}}
  { \> \> \ifthenelse{\arabic{curauthor} < \arabic{numauthors}}
    { \@author{\arabic{curauthor}}}{}
    \> \> \ifthenelse{\arabic{curteacher} < \arabic{numteachers}}
    { \@teacher{\arabic{curteacher}}}{} \\
    \authorloop }{}}

\renewcommand{\maketitle}
{ \begin{wrapfigure}{r}{6cm}\vspace{-4mm}
    \includegraphics[width=5.8cm]{\@logo}\vspace{-4cm}
  \end{wrapfigure}

  { \noindent\Huge \bfseries \@title \\[4mm] }
  { \noindent \LARGE \@subtitle\\ }

  \vspace{2mm}\hrule
  \ifthenelse{\equal{\arabic{numauthors}}{0} \AND \equal{\arabic{numteachers}}{0}}{}
  { \@authors
    \vspace{-7mm}\hrule\vspace{2mm} }}
