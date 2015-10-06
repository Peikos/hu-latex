\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hu}

\RequirePackage{calc,ifthen}

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
{ \PassOptionsToClass{\CurrentOption}{memoir}}

\ProcessOptions\relax

\ifthenelse{\boolean{@10pt}}
{ \PassOptionsToClass{10pt}{memoir}}
{ \ifthenelse{\boolean{@11pt}}
  { \PassOptionsToClass{11pt}{memoir}}
  { \PassOptionsToClass{12pt}{memoir}}}

\LoadClass[a4paper]{memoir}

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

\RequirePackage{polyglossia, fontspec, xunicode, xltxtra}
\RequirePackage[normalem]{ulem}
\RequirePackage[autostyle]{csquotes}
\RequirePackage[a4paper, textwidth=6.5in, textheight=9in, 
                marginparsep=7pt, marginparwidth=.6in]{geometry}
\RequirePackage[bookmarks, colorlinks, breaklinks, 
                urlcolor=Plum,
                citecolor=Plum,
                linkcolor=Black]
               {hyperref}

\linespread{1.2}

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
\duolingual{@datelabel}{Date}{Datum}
\duolingual{@hu}{Utrecht University of Applied Science\\}{Hogeschool Utrecht}
\duolingual{@fac}{Faculty of Nature and Technology}{Faculteit Natuur en Techniek}

\def\@subtitle{}
\def\@documenttype{}
\def\@version{}

\newcommand{\subtitle}[1]{\def\@subtitle{#1}}
\newcommand{\documenttype}[1]{\def\@documenttype{#1}}
\newcommand{\version}[1]{\def\@version{#1}}
\newcommand{\fac}[1]{\def\@fac{#1}}

\newcounter{numauthors}
\newcounter{curauthor}
\setcounter{numauthors}{0}

\renewcommand{\author}[3]
{ \addtocounter{numauthors}{1}
  \expandafter\def\csname author\arabic{numauthors}gname\endcsname{#1}
  \expandafter\def\csname author\arabic{numauthors}fname\endcsname{#2}
  \expandafter\def\csname author\arabic{numauthors}num\endcsname{#3}}

\newcommand{\@authors}
{ \setcounter{curauthor}{0}
  \begin{tabular}{r l}
    \multicolumn{2}{c}{\bfseries \ifthenelse{\equal{\arabic{numauthors}}{1}}{\@authorlabel}{\@authorslabel}} \\
    \addtocounter{numauthors}{1}
    \authorloop
   \end{tabular} }

\newcommand{\authorloop}
{ \addtocounter{curauthor}{1}
  \ifthenelse{\equal{\arabic{curauthor}}{\arabic{numauthors}}}{}
  {          \csname author\arabic{curauthor}gname\endcsname\ 
    \scshape \csname author\arabic{curauthor}fname\endcsname &
             \csname author\arabic{curauthor}num\endcsname \\
    \authorloop }}

\newcounter{numteachers}
\newcounter{curteacher}
\setcounter{numteachers}{0}

\newcommand{\teacher}[2]
{ \addtocounter{numteachers}{1}
  \expandafter\def\csname teacher\arabic{numteachers}gname\endcsname{#1}
  \expandafter\def\csname teacher\arabic{numteachers}fname\endcsname{#2}}

\newcommand{\@teachers}
{ \setcounter{curteacher}{0}
    { \bfseries \ifthenelse{\equal{\arabic{numteachers}}{1}}{\@teacherlabel}{\@teacherslabel} } \\
    \addtocounter{numteachers}{1}
    \teacherloop }

\newcommand{\teacherloop}
{ \addtocounter{curteacher}{1}
  \ifthenelse{\equal{\arabic{curteacher}}{\arabic{numteachers}}}{}
  {          \csname teacher\arabic{curteacher}gname\endcsname\ 
    { \scshape \csname teacher\arabic{curteacher}fname\endcsname } \\
    \teacherloop }}

\setlrmarginsandblock{4cm}{*}{*}
\setulmarginsandblock{4cm}{*}{*}
\checkandfixthelayout

\makefootrule {plain}{\textwidth}{\normalrulethickness}{\footruleskip}
\makeheadrule{headings}{\textwidth}{\normalrulethickness}
\makefootrule{headings}{\textwidth}{\normalrulethickness}{\footruleskip} 
\makefootrule{plain}{\textwidth}{\normalrulethickness}{\footruleskip}
\makeevenhead{headings}{}{\large\leftmark}{}
\makeoddhead{headings}{}{\large\rightmark}{} 
\makeevenfoot{headings}{}{\large\thepage}{} 
\makeoddfoot{headings}{}{\large\thepage}{} 
\makeevenfoot{plain}{}{\large\thepage}{}
\makeoddfoot{plain}{}{\large\thepage}{}

\pagestyle{plain}

\addtopsmarks{headings}{}
{ \createmark{chapter}{both}{shownumber}{}{. \space}}

\pagestyle{headings}

\makechapterstyle{hangnum}
{ \setlength{\beforechapskip}{1cm}
  \setlength{\afterchapskip}{20pt}
  \renewcommand*{\chapnumfont}{\chaptitlefont}
  \settowidth{\chapindent}{\chapnumfont 999}
  \renewcommand*{\chapnamefont}{\Huge\bfseries\color{DarkSkyBlue}}
  \renewcommand*{\chaptitlefont}{\Huge\bfseries\color{DarkSkyBlue}}
  \renewcommand*{\printchaptername}{}
  \renewcommand*{\chapternamenum}{}
  \renewcommand*{\chapnumfont}{\chaptitlefont}
  \renewcommand*{\printchapternum}
  { \noindent\llap{\makebox[\chapindent][l]
    { \chapnumfont \thechapter}}}
  \renewcommand*{\afterchapternum}{}}

\chapterstyle{hangnum} 

\hangsecnum 
\setsecheadstyle{\scshape\color{DarkSkyBlue}}

\setsubsecheadstyle{\scshape\color{SkyBlue}} 

\renewcommand*\footnoterule{}

\let\cleartorecto\newpage

\checkandfixthelayout

\renewcommand{\maketitle}
{ \thispagestyle{empty}
  \begin{center}
  
  \mbox{}
  \vspace{20mm}
  
  { \Huge \bfseries \@title }

  \vspace{2mm}

  { \LARGE \@subtitle }
  
  \vspace{15mm}

  \ifthenelse{\equal{\@documenttype}{}}{}
  {{ \LARGE \scshape «\ \@documenttype\ » }}
  
  \vspace{15mm}
  
  \begin{tabular}{c}
    \bfseries \@datelabel \\
    \@date
  \end{tabular}

  \vspace{10mm}
  
  \@authors

  \vspace{3mm}

  \@teachers
  
  \vfill

  { \vspace{-20mm}
    \@version
    \vspace{12mm}}{}

  \includegraphics[scale=.3]{\@logo}
  \vspace{4mm}

  \@hu\ \@fac
  
  \vspace{-30mm}
  
  \end{center}
  \newpage }