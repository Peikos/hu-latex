\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hu-presentatie}

\RequirePackage{ifthen}

\newboolean{@dutch}
\setboolean{@dutch}{false}
\DeclareOption{dutch}
{ \setboolean{@dutch}{true}
  \PassOptionsToClass{dutch}{memoir}}

\DeclareOption*
{ \PassOptionsToClass{\CurrentOption}{beamer} }

\ProcessOptions\relax

\LoadClass{beamer}

\RequirePackage{fontspec, xunicode, xltxtra, polyglossia, graphicx, caption}
\RequirePackage[normalem]{ulem}
\RequirePackage{polyglossia}
\RequirePackage[autostyle]{csquotes}
\RequirePackage[utf8]{inputenc}

\ifthenelse{\boolean{@dutch}}
{ \setdefaultlanguage{dutch}
  \logo{\includegraphics[height=0.5cm]{hu-nl.eps}} }
{ \setdefaultlanguage[variant=british]{english}
  \logo{\includegraphics[height=0.5cm]{hu-en.eps}} }

\defaultfontfeatures{Scale=MatchLowercase, Mapping=tex-text, Ligatures=Common, Numbers=OldStyle}

\definecolor{LightSkyBlue}{rgb}{0.45,0.62,0.81}
\definecolor{DarkSkyBlue}{rgb}{0.12,0.29,0.53}
\definecolor{SkyBlue}{rgb}{0.20, 0.39, 0.64}
\definecolor{Plum}{rgb}{0.46, 0.31, 0.48}
\definecolor{Black}{rgb}{0, 0, 0}
\definecolor{HU-Blue}{cmyk}{0.99, 0.01, 0.05, 0.05}
\definecolor{HU-Red}{cmyk}{0, 0.81, 0.87, 0.15}

\DeclareCaptionFont{white}{\color{white}}
\DeclareCaptionFormat{listing}
{ \hspace{-.3mm}\colorbox[cmyk]{0.23, 0.15,0.15,0.01}
  {\parbox{\textwidth}{\hspace{15pt}\large#1#2#3}} }

\usefonttheme{serif}

\usetheme{Bergen}
\setbeamerfont{frametitle}{series=\bfseries}

\setbeamercolor{palette primary}{use=structure,fg=DarkSkyBlue}
\setbeamercolor{palette secondary}{use=structure,fg=SkyBlue}
\setbeamercolor{palette tertiary}{use=structure,fg=LightSkyBlue}

\setbeamercolor{sidebar}{use=structure,bg=LightSkyBlue}

\setbeamercolor{palette sidebar primary}{use=normal text,fg=DarkSkyBlue}
\setbeamercolor{palette sidebar secondary}{use=structure,fg=SkyBlue}
\setbeamercolor{palette sidebar tertiary}{use=normal text,fg=LightSkyBlue}

\setbeamercolor*{titlelike}{parent=palette primary}
\setbeamercolor*{title}{fg=DarkSkyBlue}

\setbeamercolor*{separation line}{}
\setbeamercolor*{fine separation line}{}

\setbeamercolor{alerted text}{fg=DarkSkyBlue}

\beamertemplatenavigationsymbolsempty

\institute{Hogeschool Utrecht}
