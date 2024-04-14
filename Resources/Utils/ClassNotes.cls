\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ClassNotes}

%--------------------------------------------------------------------------------------------------
%------------------------------------ Delaring class options --------------------------------------
%--------------------------------------------------------------------------------------------------

%% Language
\DeclareOption{english}{
    \newcommand{\notes@lang}{english}
    \newcommand{\notes@theoremname}{Theorem}
    \newcommand{\notes@propositionname}{Proposition}
    \newcommand{\notes@corollaryname}{Corollary}
    \newcommand{\notes@lemmaname}{Lemma}
    \newcommand{\notes@definitionname}{Definition}
    \newcommand{\notes@examplename}{Example}
    \newcommand{\notes@axiomname}{Axiom}
    \newcommand{\notes@remarkname}{Remark}
    \newcommand{\notes@proofname}{Proof}
    \newcommand{\notes@propertyname}{Property}
    \newcommand{\notes@lawname}{Law}
}

\DeclareOption{italian}{
    \newcommand{\notes@lang}{italian}
    \newcommand{\notes@theoremname}{Teorema}
    \newcommand{\notes@propositionname}{Proposizione}
    \newcommand{\notes@corollaryname}{Corollario}
    \newcommand{\notes@lemmaname}{Lemma}
    \newcommand{\notes@definitionname}{Definizione}
    \newcommand{\notes@examplename}{Esempio}
    \newcommand{\notes@axiomname}{Assioma}
    \newcommand{\notes@remarkname}{Osservazione}
    \newcommand{\notes@proofname}{Dimostrazione}
    \newcommand{\notes@propertyname}{Propietà}
    \newcommand{\notes@lawname}{Legge}
}

%% Sides
\DeclareOption{oneside}{\newcommand{\notes@sides}{oneside}}
\DeclareOption{twoside}{\newcommand{\notes@sides}{twoside}}

%% Columns
\DeclareOption{onecolumn}{\newcommand{\notes@columns}{onecolumn}}
\DeclareOption{twocolumn}{\newcommand{\notes@columns}{twocolumn}}

%% Text size
\DeclareOption{10pt}{\newcommand{\notes@textsize}{10pt}}
\DeclareOption{11pt}{\newcommand{\notes@textsize}{11pt}}
\DeclareOption{12pt}{\newcommand{\notes@textsize}{12pt}}

\ProcessOptions
\LoadClass[a4paper,
    \ifdefined\notes@textsize \notes@textsize\else 11pt\fi,
    \ifdefined\notes@columns \notes@columns\else onecolumn\fi,
    \ifdefined\notes@sides \notes@sides\else oneside\fi]{article}

%%-----------------------------------------------------------------------------
%%------------------------------- Packages List -------------------------------
%%-----------------------------------------------------------------------------
\RequirePackage[usernames, x11names]{xcolor}
\RequirePackage[\ifdefined\notes@lang \notes@lang\else italian\fi]{babel}
\RequirePackage{../../../Resources/Utils/Common}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{fancyhdr}
\RequirePackage[a4paper, left = 72pt, right = 72pt, top = 72pt, bottom = 72pt, twoside, includeall]{geometry}
\RequirePackage[explicit, compact]{titlesec}
\RequirePackage{titletoc}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{mathdots}
\RequirePackage{mathrsfs}
\RequirePackage{tikz}
\RequirePackage{forest}
\RequirePackage{listings}
\RequirePackage{lstautogobble}
\RequirePackage{graphicx}
\RequirePackage{wrapfig}
\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage{setspace}
\RequirePackage{subfiles}


%%-----------------------------------------------------------------------------
%%---------------------------- Custom Environments ----------------------------
%%-----------------------------------------------------------------------------
\ProvideDocumentEnvironment{MarginNote}{+b}{
    \marginpar{
        \setstretch{0.7}\footnotesize{\textit{#1}}
    }
}{}

%%-----------------------------------------------------------------------------
%%%%-------------------------- Numbered Environments --------------------------
%%-----------------------------------------------------------------------------
\newtheoremstyle{Emphasised}{7.5pt}{7.5pt}{\itshape}{}{\bfseries}{.}{ }{\thmname{#1}\thmnumber{ #2}}

\theoremstyle{Emphasised}
\newtheorem{Proposition}{Proposizione}
\newtheorem{Theorem}{Teorema}[section]
\newtheorem{Corollary}{Corollario}[Theorem]
\newtheorem{Lemma}{Lemma}[Theorem]
%%-----------------------------------------------------------------------------
%%%%------------------------ Non-Numbered Environments ------------------------
%%-----------------------------------------------------------------------------
\newtheoremstyle{Definition*}{7.5pt}{7.5pt}{}{}{\bfseries}{:}{ }{\thmname{#1}}

\theoremstyle{Definition*}
\newtheorem{Definition*}{Definizione}
\newtheorem{Example*}{Esempio}
\newtheorem{Axiom*}{Assioma}

\newtheoremstyle{Remark*}{0pt}{0pt}{}{}{\bfseries}{.}{ }{\thmname{#1}}

\theoremstyle{Remark*}
\newtheorem{Remark*}{Osservazione}

\newtheoremstyle{Proof*}{0pt}{0pt}{}{\parindent}{\itshape}{:}{ }{\thmname{#1}}

\theoremstyle{Proof*}
\newtheorem{Proof*}{Dimostrazione}

\newtheoremstyle{Emphasised*}{7.5pt}{7.5pt}{}{}{\bfseries}{.}{ }{\thmname{#1}\thmnote{ #3}}

\theoremstyle{Emphasised*}
\newtheorem{Algorithm*}{Algoritmo}
\newtheorem{Theorem*}{Teorema}
\newtheorem{Property*}{Proprietà}
\newtheorem{Law*}{Legge}

%%-----------------------------------------------------------------------------
%%---------------------- Adjusting Existing Environments ----------------------
%%-----------------------------------------------------------------------------
\AtBeginEnvironment{tabular}{\color{black}}
\AtBeginEnvironment{minipage}{\color{black}}

\AtEndEnvironment{equation}{\label{Eq:\theequation}}
\AtEndEnvironment{Proposition}{\label{Prop:\theProposition}}
\AtEndEnvironment{Theorem}{\label{Thm:\theTheorem}}
\AtEndEnvironment{Corollary}{\label{Corol:\theCorollary}}
\AtEndEnvironment{Lemma}{\label{Lemma:\theLemma}}
\AtEndEnvironment{Proof}{\qed}
\AtEndEnvironment{itemize}{\noindent}
\AtEndEnvironment{enumerate}{\noindent}
\AtEndEnvironment{Definition}{}

\captionsetup[subfigure]{labelformat = simple, labelsep = colon}
\renewcommand\thesubfigure{\thefigure.\alph{subfigure}}

%%-----------------------------------------------------------------------------
%%-------------------------- Tikz & related settings --------------------------
%%-----------------------------------------------------------------------------
\usetikzlibrary{
    angles,
    arrows.meta,
    quotes,
    patterns,
    calc,
    automata,
    positioning,
    decorations.pathmorphing,
    backgrounds,
    fit,
    petri,
    babel
}
\lstset{
    autogobble = true,
    frame = single,
    frameround = tttt,
    mathescape,
    basicstyle = \scriptsize,
    linewidth = 0.75\textwidth,
    breaklines = true,
    xleftmargin = \parindent,
    escapeinside={__*}{*__}
}

\lstdefinelanguage{PSEUDO}{
    keywords = {if, then, else, for, do, while, true, false, and, AND, or, OR, not, NOT, xor, XOR},
    keywordstyle = \bfseries
}


%%-----------------------------------------------------------------------------
%%------------------------------- Other Options -------------------------------
%%-----------------------------------------------------------------------------
\RenewDocumentCommand{\maketitle}{m m m}{
    \pagestyle{empty}
    \newgeometry{marginparwidth = 0pt, left = 1.25in, right = 1.25in, top = 1in, bottom = 1in, asymmetric}
    \vskip 40pt
    \begin{center}
        {\large\protect\textsl{\protect\MakeUppercase{#1}}}
        {\vskip 7.5pt \normalsize\textsl{\protect\MakeUppercase{appunti a cura di: #2}}}
        \vskip 6.75pt\noindent\rule{0.5\textwidth}{0.5pt}
        \vskip 6.75pt
            {\small\itshape{Università degli studi di Palermo}}
        \vskip 1.25pt
            {\small\itshape{a.a. #3}}
        \vskip 3.75pt\noindent\rule{0.25\textwidth}{0.25pt}
        \clearpage
        \tableofcontents
    \end{center}
    \clearpage
    \setcounter{page}{1}

    \restoregeometry
    \pagestyle{fancy}
}

%%-----------------------------------------------------------------------------
%%------------------------------- Math settings -------------------------------
%%-----------------------------------------------------------------------------
\everydisplay{\ifmmode \color{SkyBlue4} \fi}
\everymath{\color{SkyBlue4}}
\DeclareMathSizes{11pt}{10pt}{5pt}{3.5pt}


\makeatletter
\AtBeginDocument{
    \setlength{\jot}{5pt}
    \setlength{\abovedisplayskip}{10pt}
    \setlength{\belowdisplayskip}{10pt}
    \setlength{\abovedisplayshortskip}{5pt}
    \setlength{\belowdisplayshortskip}{5pt}
}
\makeatother

%%-----------------------------------------------------------------------------
%%-------------------------------- Page Option --------------------------------
%%-----------------------------------------------------------------------------
\pagestyle{fancy}
\renewcommand{\sectionmark}[1]{\markboth{#1}{}}
\fancyhead[LO]{\textbf{Sezione \thesection:} \leftmark}
\fancyhead[RE]{\textbf{Sezione \thesection:} \leftmark}
\fancyhead[LE, RO]{}
\fancyfoot[C]{-- {\thepage} --}

\setlength{\oddsidemargin}{10pt}
\setlength{\evensidemargin}{75pt}
\setlength{\textwidth}{371pt}
\setlength{\topmargin}{15pt}
\setlength{\headheight}{15pt}
\setlength{\headsep}{15pt}
\setlength{\marginparpush}{10pt}
\setlength{\marginparwidth}{65pt}
\setlength{\marginparsep}{11pt}
\renewcommand{\headrulewidth}{0.25pt}
\renewcommand{\footrulewidth}{0.25pt}
\renewcommand{\headwidth}{447.25pt}

\titleformat{\section}[hang]{\LARGE\bfseries}{-- {\thesection} -- }{5pt}{#1.}
\titleformat{\subsection}[hang]{\Large\bfseries}{-- {\thesubsection} -- }{5pt}{#1.}
\titleformat{\subsubsection}[hang]{\large\bfseries}{-- {\thesubsubsection} -- }{5pt}{#1.}
\titleformat{\paragraph}[hang]{\small\bfseries}{-- {\theparagraph} -- }{5pt}{#1.}
\titlespacing*{\section}{0pt}{2.5pt}{2.5pt}
\titlespacing*{\subsection}{0pt}{2.5pt}{2.5pt}
\titlespacing*{\subsubsection}{0pt}{2.5pt}{2.5pt}
\titlespacing*{\paragraph}{0pt}{2.5pt}{2.5pt}

\setcounter{secnumdepth}{4}
\setcounter{tocdepth}{2}