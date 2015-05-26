%% VUMIFKompMagistrinis.cls – „Tik svajotojai-romantikai gali pagerinti nepakeičiamą pasaulį“
%% Created by   „Atviras Kodas Lietuvai“  2015
%
%% Latest version available here: https://github.com/LIKS/master_thesis_template_vu_mif_cs2
%% Any suggestions or contributions are welcome!  Also see: http://latex.liks.lt!
%
%%  License CC BY 4.0 (see more at http://creativecommons.org/licenses/by/4.0/) 
% You are free to (a) share - copy and redistribute the material in any medium
% or format (b) adapt - remix, transform, and build upon the material for any
% purpose, even commercially. As long as you give appropriate credit, provide a
% link to the license, and indicate if changes were made.)


% Magistro darbo apiforminimas pagal Vilniaus universiteto
% Matematikos ir informatikos fakulteto Kompiuterijos katedros reikalavimus
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{VUMIFKompMagistrinis}[2015/02/03 1.0 VU MIF CS2 master thesis class]
\LoadClass[12pt, a4paper]{article}
\RequirePackage{LTPlius}  % Nustatymų sulietuvinimas
\RequirePackage{fontspec} % Šrifto pasirinkimui
\setmainfont[
    Ligatures=TeX,
    Extension=.otf,
    UprightFont= *-regular,
    BoldFont=*-bold,
    ItalicFont=*-italic,
    BoldItalicFont=*-bolditalic
]{texgyretermes}  % Teksto  šrifatas bus Nimbus Roman No9 L, kuris yra
                  % atviras Times New Roman šrifto atitikmuo
\RequirePackage{setspace} % Intervalas tarp eilučių
\RequirePackage[
    left=3cm,
    top=2cm,
    right=1.5cm,
    bottom=2cm,
    footskip=0.6cm,
]{geometry}  % Lapo paraštės
\sloppy  % Tolygiai paskirsto tekstą nuo kairės iki dešinės paraštės
\RequirePackage[titles]{tocloft} % Turinio eilučių išlygiavimo nustatymui
\RequirePackage{fancyhdr} % Puslapio numerio vietos nustatymui
\pagestyle{fancy}

% Nustatoma puslapio numerio vieta puslapyje
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\lhead{}
\chead{}
\rhead{} 
\lfoot{}
\cfoot{}
\rfoot{\thepage} % Numeris bus puslapio apačioje dešinėje

% Nerodyti įspėjimo dėl pakeistos article klasės antraščių stiliaus
\RequirePackage{silence}
\WarningFilter{caption}{Unsupported document class}

% Nustatomas paveikslėlių ir lentelių šriftas į 10pt
\usepackage[font=footnotesize,labelfont=bf,textfont=bf]{caption}

% Informacijos tituliniame puslapyje kintamieji
\newcommand{\university}[1]{\def\@university{#1}}
\newcommand{\faculty}[1]{\def\@faculty{#1}}
\newcommand{\papertype}[1]{\def\@papertype{#1}}
\newcommand{\department}[1]{\def\@department{#1}}
\newcommand{\supervisor}[1]{\def\@supervisor{#1}}
\newcommand{\reviewer}[1]{\def\@reviewer{#1}}
\newcommand{\status}[1]{\def\@status{#1}}
\newcommand{\titleineng}[1]{\def\@titleineng{#1}}
\newcommand{\secondauthor}[1]{\def\@secondauthor{#1}}

% Pirmos eilutės paragrafe atitraukimas 1 cm
\setlength{\parindent}{0.57cm}

% Nustatomas bibliografijos stilius
\RequirePackage[
    alldates=iso8601,
    autolang=other,
    backend=biber,
    sortcites=true,
    style=trad-alpha,
    abbreviate=true,
    minalphanames=3,
    maxalphanames=3,
    maxnames=9,
    minnames=4,
]{biblatex}
\RequirePackage[style=lithuanian]{csquotes}

% Pliuso ženklas, kuris rodomas esant >3 autoriams, sumažinamas ir pakeliamas
\renewcommand*{\labelalphaothers}{\textsuperscript{+}}

% -------------------------------
% Titulinio puslapio formatavimas
% -------------------------------
\newcommand{\@signatureplace}{%
    \parbox[t]{2.5cm}{%
        \makebox[2.5cm]{\raisebox{-0.5ex}{\scriptsize
        (para\v{s}as) }}}
}

\newcommand{\checkifdefined}[2]{%
    % Patikriname, ar visa reikalinga informacija tituliniam puslapiui
    % buvo nurodyta. #1 yra tikrinama reikšmė (be \ priekyje),
    % #2 - klaidos pranešimas.
    \@ifundefined{#1}{\PackageError{VUMIF}{#2}{Add the missing command}}%
}

\renewcommand\maketitle{\begin{titlepage}%
  \checkifdefined{@department}%
    {Tituliniame puslapyje nenurodyta katedra (komanda \protect\department)}
  \checkifdefined{@supervisor}%
    {Tituliniame puslapyje nenurodytas darbo vadovas (komanda \protect\supervisor)}
   ~
  \begin{center}
      {\setstretch{1.3}\large \MakeUppercase{\@university} \\
          \MakeUppercase{\@faculty} \\
         \MakeUppercase{\@department}\par }

     \null\vfil
     \vskip 2.8cm
     \@ifundefined{@titleineng}{\vspace{1.5cm}}{}%
     {\large \@papertype}%
     {\singlespacing \LARGE \textbf{\@title} \par}
     \@ifundefined{@titleineng}{\vspace{0.5cm}}{{\singlespacing \Large \textbf{\@titleineng} \par}}%

  \end{center}
  \@ifundefined{@secondauthor}{
     \vskip 2.5cm
     \begin{flushright}
        \large
        \singlespacing
        \@ifundefined{@reviewer}{\vspace{1cm}}{}
        {\begin{tabular}[t]{l l}%
          & \smallskip Atliko: \@ifundefined{@status}{}{\;\;\@status} \\
          & \medskip\bigskip \@author \hfill \@signatureplace \\
          & \smallskip Darbo vadovas: \\
          & \medskip\bigskip \@supervisor \hfill  \@signatureplace \\
          \@ifundefined{@reviewer}{}{
          & \smallskip Recenzentas: \\
          & \@reviewer \hfill  \@signatureplace \\
          }
        \end{tabular} \par}%
     \end{flushright}
     \vskip 3.4cm
   }{
     \vskip 2cm
     \begin{flushright}
        \large
        \singlespacing
        \@ifundefined{@reviewer}{\vspace{1cm}}{}
        {\begin{tabular}[t]{l l}%
          \smallskip & Atliko: \@ifundefined{@status}{}{\;\;\@status} \\
          \bigskip & \@author \hfill \@signatureplace \\
          \bigskip\medskip & \@secondauthor \hfill \@signatureplace \\
          & \smallskip Darbo vadovas: \\
          & \medskip\bigskip \@supervisor \hfill  \@signatureplace \\
          \@ifundefined{@reviewer}{}{
          & \smallskip Recenzentas: \\
          & \@reviewer \hfill  \@signatureplace \\
          }
        \end{tabular} \par}%
     \end{flushright}
     \vskip 3cm
   }

  \begin{center}
    {\singlespacing \@date \par}%   
  \end{center}\par
  \@thanks
  \vfil\null
  \end{titlepage}%
  % Atlaisviname panaudotus kintamuosius
  \global\let\@outputtitle\relax
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@papertype\@empty
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\@university\@empty
  \global\let\@faculty\@empty
  \global\let\@department\@empty
  \global\let\@papertype\@empty
  \global\let\@supervisor\@empty
  \global\let\@reviewer\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
  \global\let\department\relax
  \global\let\supervisor\relax
  \global\let\@signatureplace\relax
  \global\let\checkifdefined\relax
  \setcounter{footnote}{0}%
  % Nustatome dokumentui 1,5 eilutės intervalą
  \onehalfspacing
}

% Skyriaus pavadinimas, turinyje neturintis numerio
\newcommand{\sectionnonum}[1]{%
    \section*{#1}%
    \addcontentsline{toc}{section}{#1}% 
}

% Skyriaus pavadinimas, neturintis numerio bei neįeinantis į turinį
\newcommand{\sectionnonumnocontent}[1]{%
    \section*{#1}%   Sugadina pirmojo šio tipo skyriaus numeravimą puslapiais
}

\renewcommand\tableofcontents{%
    % Turinys su viengubu intervalu tarp eilučių
    \begin{singlespacing}%
        \section*{\rm\normalsize\centering\contentsname
        \@mkboth{%
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
    \@starttoc{toc}%
    \end{singlespacing}%
    \newpage%
    }

% Tarpai tarp taškų turinyje
\renewcommand{\@dotsep}{1}

% Pakeitimai sekcijos eilutėms turinyje:
% 1. Turinyje turi taškai bėgti ir iki sekcijų
% 2. Nėra vertikalaus tarpo prieš sekcijos turinio eilutę
% 3. Ne pusstoris, o paprastas šriftas
\renewcommand\l@section[2]{%
  \ifnum \c@tocdepth >\z@
    \addpenalty\@secpenalty
    \addvspace{0em \@plus\p@}
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode {
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1}\nobreak\
      \leaders\hbox{$\m@th\mkern \@dotsep mu\hbox{.}\mkern \@dotsep mu$}
     \hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
    \endgroup
  \fi}


% Sekcija pradeda naują puslapį
\renewcommand{\section}{%
    \cleardoublepage%
    \@startsection {section}{1}{\z@}%
        {-3.5ex \@plus -1ex \@minus -.2ex}%
        {2.3ex \@plus.2ex}%
        {\normalfont\Large\bfseries}%
}

% Priedo sekcijų formatavimas turiniui
\renewcommand{\appendix}{%
    \renewcommand{\section}{%
        \cleardoublepage%
         \secdef\@Appendix\@sAppendix%
    }%
    \makeatletter
    \addtocontents{toc}{\def\string\@dotsep{1000}}
    % \addtocontents{toc}{\protect\thispagestyle{empty}}   % Removes page number from ToC
    \makeatother
    \setcounter{section}{0}%
    \renewcommand{\thesection}{nr. \arabic{section}}%
    % Insert record to TOC 
    % \addcontentsline{toc}{section}{Priedai}%}
}

\def\@Appendix[#1]#2{%
    \refstepcounter{section}%
    \cftaddtitleline{toc}{section}{Priedas Nr.\arabic{section}}{}
    % \addcontentsline{toc}{subsection}%
    %     {\arabic{section} priedas.~#2}%
    {\large\bfseries\appendixname\ \thesection\par
     #2\par}% \nohyphens\centering#2\par}%
    \sectionmark{#1}\vspace{\baselineskip}%
}

\def\@sAppendix#1{%
    {\flushright\large\bfseries\appendixname\par
     \centering#1\par}% \nohyphens\centering#1\par}%
    \vspace{\baselineskip}%
}

% Literatūros sąrašą reikia pervadinti
\addto\captionslithuanian{%
    \renewcommand{\refname}{Literatūros sąrašas}%
}

% Apibrėžiame ketvirto lygio skyrius
\newcommand{\subsubsubsection}{\subsubparagraph}

\makeatletter
\renewcommand\subsubsubsection{\@startsection{paragraph}{4}{0ex}{-3.25ex plus -1ex minus
-0.2ex}{1.5ex plus 0.2ex}{\normalfont\normalsize\bfseries}}
\makeatother

\stepcounter{secnumdepth}
\stepcounter{tocdepth}
\renewcommand{\paragraph}{\subparagraph}

% Turinio skyrių indentavimo nustatymas. Kiekvienam skyriui nustatoma:
% 1. Atitraukimo iš kairės plotis
% 2. Vietos, skiriama skaičiams, plotis
\makeatletter
  \renewcommand*\l@subsection{\@dottedtocline{2}{0.1cm}{0.87cm}}
  \renewcommand*\l@subsubsection{\@dottedtocline{3}{0.8cm}{1.22cm}}
  \renewcommand*\l@paragraph{\@dottedtocline{4}{1.5cm}{1.52cm}}
\makeatother

% Raktinių žodžių komandos
\newcommand\keywords[1]{%
    \par \bigskip \par
    % \hangindent=\parindent   % Lygiavimas nuo antros eilutės
    \noindent \textbf{Keywords:}\; \textbf{#1}
}
\newcommand\raktiniaizodziai[1]{%
    \par \bigskip \par
    % \hangindent=\parindent   % Lygiavimas nuo antros eilutės
    \noindent \textbf{Raktiniai žodžiai:}\; \textbf{#1}
}
