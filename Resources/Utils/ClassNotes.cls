\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ClassNotes}

%--------------------------------------------------------------------------------------------------
%------------------------------------ Delaring class options --------------------------------------
%--------------------------------------------------------------------------------------------------

%% Language: required (a error will occur if not defined)
\DeclareOption{italian}{
    \newcommand{\notes@lang}{italian}
    \newcommand{\notes@theoremname}{Teorema}
    \newcommand{\notes@corollaryname}{Corollario}
    \newcommand{\notes@lemmaname}{Lemma}
    \newcommand{\notes@definitionname}{Definizione}
    \newcommand{\notes@examplename}{Esempio}
    \newcommand{\notes@axiomname}{Assioma}
    \newcommand{\notes@remarkname}{Osservazione}
    \newcommand{\notes@proofname}{Dimostrazione}
    \newcommand{\notes@propertyname}{Propietà}
    \newcommand{\notes@lawname}{Legge}
    \newcommand{\notes@exercisename}{Esercizio}
    \newcommand{\notes@solutionname}{Soluzione}
    \newcommand{\notes@ofname}{di}
}

\DeclareOption{english}{
    \newcommand{\notes@lang}{english}
    \newcommand{\notes@theoremname}{Theorem}
    \newcommand{\notes@corollaryname}{Corollary}
    \newcommand{\notes@lemmaname}{Lemma}
    \newcommand{\notes@definitionname}{Definition}
    \newcommand{\notes@examplename}{Example}
    \newcommand{\notes@axiomname}{Axiom}
    \newcommand{\notes@remarkname}{Remark}
    \newcommand{\notes@proofname}{Proof}
    \newcommand{\notes@propertyname}{Property}
    \newcommand{\notes@lawname}{Law}
    \newcommand{\notes@exercisename}{Exercise}
    \newcommand{\notes@solutionname}{Solution}
    \newcommand{\notes@ofname}{of}
}

%% Number of sides: optional (by default is onesided)
\DeclareOption{twoside}{\newcommand{\notes@sides}{twoside}}

%% Number of columns: optional (by default is onecolumn)
\DeclareOption{onecolumn}{\newcommand{\notes@columns}{onecolumn}}
\DeclareOption{twocolumn}{\newcommand{\notes@columns}{twocolumn}}

%% Text size: optional (by default is 10pt)
\DeclareOption{10pt}{\newcommand{\notes@textsize}{10pt}}
\DeclareOption{11pt}{\newcommand{\notes@textsize}{11pt}}
\DeclareOption{12pt}{\newcommand{\notes@textsize}{12pt}}

%% Margin notes: optional (if defined, margin_note_width will be set to 0).
%%             Note: if twosides is loaded, this option will always be set. 
\DeclareOption{disablemarginnotes}{\newcommand{\notes@disablemarginnotes}{disablemarginnotes}}

%% allowcoloredmath: optional (by default is not set). Intended to use to set SkyBlue4 as default mathmode color.
\DeclareOption{allowcoloredmath}{\newcommand{\notes@allowcoloredmath}{allowcoloredmath}}

%% isTemplate: a option used to load more conviniently the common.sty package.
%%                       Note: it isn't supposed to be loaded by the end user.
\DeclareOption{isTemplate}{\newcommand{\notes@isTemplate}{isTemplate}}

\ProcessOptions
\LoadClass[a4paper,
    \ifdefined\notes@textsize{\notes@textsize}\else{10pt}\fi
]{article}

%%-----------------------------------------------------------------------------
%%------------------------------- Used Packages -------------------------------
%%-----------------------------------------------------------------------------

%% xColor: neccessary to apply colors to the text or mathmode if `allowColoredMath' is set.
\RequirePackage[usernames, x11names]{xcolor}

%% babel: siplify linebreak based on the language set.
\RequirePackage[\notes@lang]{babel}

%% common: a custom package, containig some useful shortcuts (eg: simplified integral declaration, etc.),
%% in addition to some other commands.
\RequirePackage[
    \ifdef{\notes@customsnocompactmath}{nocompactmath}{},
    \ifdef{\notes@allowcoloredmath}{coloredmath}{}
]{\ifdef{\notes@isTemplate}{../../Resources/Utils/Common}{../../../Resources/Utils/Common}}

%% hyperref: enhance the refence to figures, etc.
\RequirePackage[hidelinks]{hyperref}

%% document customization packages
\RequirePackage{fancyhdr}
\RequirePackage[a4paper,
    left = 72pt, right = 72pt, top = 72pt, bottom = 72pt,
    includeall,
    \ifdef{\notes@sides}{\notes@sides}{},
    \ifdef{\notes@columns}{\notes@columns}{onecolumn}]{geometry}
\RequirePackage[explicit, compact]{titlesec}
\RequirePackage{caption}
\RequirePackage{subcaption}

%% AMS packages: math related packages.
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{mathdots}
\RequirePackage{mathrsfs}
\RequirePackage{nicefrac}

%% TikZ & like packages: packages related to draw graph and like.
\RequirePackage{tikz}
\RequirePackage{forest}
\RequirePackage{listings}
\RequirePackage{lstautogobble}
\RequirePackage{framed}

%% graphics packages: used to import graphics and to inssert graphics on the within text.
\RequirePackage{graphicx}
\RequirePackage{wrapfig}

%% text related packages: specifically defining the font encryption and font style.
\RequirePackage[notext]{kpfonts}
\RequirePackage[T1]{fontenc}

%% utility packages
\RequirePackage{lastpage}
\RequirePackage{ifthen}

%% subfile: permits to define a better structure of the document, allowing to devide the main file in many subfiles,
%% and subsequently importing them. 
\RequirePackage{subfiles}


%%-----------------------------------------------------------------------------
%%---------------------------- Custom Environments ----------------------------
%%-----------------------------------------------------------------------------

%% Numbered Environments 
\newtheoremstyle{Emphasised}{7.5pt}{7.5pt}{\itshape}{}{\bfseries}{.}{ }{\thmname{#1}\thmnumber{ #2}}

\theoremstyle{Emphasised}
\newtheorem{Theorem}{\notes@theoremname}[section]
\newtheorem{Corollary}{\notes@corollaryname}[Theorem]
\newtheorem{Lemma}{\notes@lemmaname}[Theorem]

%% Non-Numbered Environments 
\newtheoremstyle{Definition*}{7.5pt}{7.5pt}{}{}{\bfseries}{:}{ }{\thmname{#1}}

\theoremstyle{Definition*}
\newtheorem{Definition*}{\notes@definitionname}
\newtheorem{Example*}{\notes@examplename}
\newtheorem{Exercise}{\notes@exercisename}
\newtheorem{Axiom*}{\notes@axiomname}


\newtheoremstyle{Remark*}{0pt}{0pt}{}{}{\bfseries}{.}{ }{\thmname{#1}}

\theoremstyle{Remark*}
\newtheorem{Remark*}{\notes@remarkname}
\newtheorem{Solution}{\notes@solutionname}

\newtheoremstyle{Proof*}{0pt}{0pt}{}{\parindent}{\itshape}{:}{ }{\thmname{#1}}

\theoremstyle{Proof*}
\newtheorem{Proof*}{\notes@proofname}

\newtheoremstyle{Emphasised*}{7.5pt}{7.5pt}{}{}{\bfseries}{.}{ }{\thmname{#1}\thmnote{ #3}}

\theoremstyle{Emphasised*}
\newtheorem{Theorem*}{\notes@theoremname}
\newtheorem{Property*}{\notes@propertyname}
\newtheorem{Law*}{\notes@lawname}

%% Adjusting Existing Environments 
\AtBeginEnvironment{tabular}{\ifdef{\notes@allowcoloredmath}{\everymath{\color{black}}}{}}
\AtBeginEnvironment{minipage}{\ifdef{\notes@allowcoloredmath}{\everymath{\color{black}}}{}}
\AtBeginEnvironment{lstlisting}{\ifdef{\notes@allowcoloredmath}{\everymath{\color{black}}}{}}
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

%% notes@marginote: support macro to define MarginNote
\newcommand{\notes@marginnotes}[1]{
    {\footnotesize \marginpar{#1}}
}

%% marginnote: sets a margin text scaling the text to footnotesize, iff option ``disablemarginnotes' is unset.
\ifundef{\notes@disablemarginnotes}{
    \ProvideDocumentCommand{\MarginNote}{m}{
        \notes@marginnotes{#1}
    }
}{
    \ProvideDocumentCommand{\MarginNote}{m}{
        \ClassError{option not allowed}{Command MarginNote can't be use if option disablemarginnotes is set.}{}
    }
}

%% eg: exempli grazie, for inline text example
\ProvideDocumentCommand{\Eg}{m}{
    \!\textbf{eg:}{ \emph{#1}}
}

%%-----------------------------------------------------------------------------
%%--------------------------- Document Customization --------------------------
%%-----------------------------------------------------------------------------
%% Setting page style to `fancy' 
% \pagestyle{fancy}

%% Customization of header and footer
\renewcommand{\sectionmark}[1]{\markboth{#1}{}}
\ifdefstrequal{\notes@sides}{twoside}{
    \fancyhead[LO, RE]{\textbf{Sezione \thesection:} \leftmark}
    \fancyhead[LE, RO]{}
}{
    \fancyhead[L]{\textbf{Sezione \thesection:} \leftmark}
    \fancyhead[R]{}
}

\fancyfoot[C]{\thepage { \notes@ofname} \pageref{LastPage}}

\setlength{\topmargin}{15pt}
\setlength{\headheight}{15pt}
\setlength{\headsep}{15pt}

\renewcommand{\headrulewidth}{0.25pt}
\renewcommand{\footrulewidth}{0.25pt}

%% textwidth customization: defining textwidth based on the presence of `disablemarginnotes' and the `sides' type. 
\ifdefstring{\notes@sides}{twoside}{
    \ifdef{\notes@disablemarginnotes}{
        \ClassError{Option not allowed}{Options twoside and disablemarginnotes can't be loaded at the same time}{}
    }{
        \setlength{\textwidth}{370pt}
        \setlength{\marginparwidth}{70pt}
        \setlength{\evensidemargin}{82pt}
        \setlength{\marginparsep}{12pt}
        \renewcommand{\headwidth}{452pt}
    }
}{
    \ifdef{\notes@disablemarginnotes}{
        \setlength{\textwidth}{400pt}
        \setlength{\marginparsep}{24pt}
        \setlength{\oddsidemargin}{24pt}
        \setlength{\marginparwidth}{0pt}
        \renewcommand{\headwidth}{400pt}
    }{
        \setlength{\textwidth}{370pt}
        \setlength{\marginparsep}{13pt}
        \setlength{\marginparwidth}{70pt}
        \setlength{\evensidemargin}{81pt}
        \renewcommand{\headwidth}{452pt}
    }
}

%% textheight customization: setting it to a default value of 630pt
\setlength{\textheight}{630pt}

%%-----------------------------------------------------------------------------
%%------------------------------- Math settings -------------------------------
%%-----------------------------------------------------------------------------

%% everymath and everydisplay: checking whether ``allowcoloredmath' is set, if so change the text color to SkyBlue4,
%% for all text in math mode.
\everydisplay{\ifdef{\notes@allowcoloredmath}{\color{SkyBlue4}}{}}
\everymath{\ifdef{\notes@allowcoloredmath}{\color{SkyBlue4}}{}}

%% declaremathsize: setting mathmode text sizes depending on the value of the `textsize' option
\DeclareMathSizes{\ifdef{\notes@textsize}{\notes@textsize}{10pt}}{\ifdef{\notes@textsize}{\notes@textsize}{10pt}}{7pt}{5pt}

%% customizing display mode spacing, specifically for the equation, aligned, and similar environment.
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
%%-------------------------- Edited sectioning style --------------------------
%%-----------------------------------------------------------------------------
\titleformat{\section}[hang]{\LARGE\bfseries}{-- {\thesection} -- }{5pt}{#1.}
\titleformat{\subsection}[hang]{\Large\bfseries}{-- {\thesubsection} -- }{5pt}{#1.}
\titleformat{\subsubsection}[hang]{\large\bfseries}{-- {\thesubsubsection} -- }{5pt}{#1.}
\titleformat{\paragraph}[hang]{\normalsize\bfseries}{-- {\theparagraph} -- }{5pt}{#1.}
\titlespacing*{\section}{0pt}{2.5pt}{2.5pt}
\titlespacing*{\subsection}{0pt}{2.5pt}{2.5pt}
\titlespacing*{\subsubsection}{0pt}{2.5pt}{2.5pt}
\titlespacing*{\paragraph}{0pt}{2.5pt}{2.5pt}

%%  tocdepth: by default is set to 3, which look a bit excessive, it reduced to 2.
\setcounter{tocdepth}{2}

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
    babel,
    trees,
    graphs
}

\lstset{
    tabsize = 4,
    autogobble = true,
    frame = single,
    frameround = tttt,
    mathescape,
    basicstyle = \scriptsize,
    linewidth = \textwidth,
    breaklines = true,
    xleftmargin = \parindent,
    escapeinside={__*}{*__},
    frameshape = {YNNYNN}{nn}{nn}{NNYNNY},
    aboveskip = 0pt,
    belowskip = 0pt
}

%% declare a new language PSEUDO as an over-simplifired version of ALGOL.
\lstdefinelanguage{PSEUDO}{
    keywords = {function, procedure, if, then, else, for, do, while, true, false, to, and, AND, or, OR, not, NOT, xor, XOR},
    keywordstyle = \bfseries
}

%%-----------------------------------------------------------------------------
%%------------------------------- Other Options -------------------------------
%%-----------------------------------------------------------------------------
%% maketitle: the default one is kinda boring, it's been renewed as a shortcut for the titlepage and ToC
\RenewDocumentCommand{\maketitle}{m m m}{
    \pagestyle{empty}
    \newgeometry{marginparwidth = 0pt, left = 1.25in, right = 1.25in, top = 1in, bottom = 1in}
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