\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{bmstu}[2021/11/01 v1.0 BMSTU class]


% Настройка документа ----------------------------------------------------------
% ------------------------------------------------------------------------------

% Установка базового класса
\LoadClass[a4paper, oneside, 14pt]{extreport}

% Настройка кодировки и языков
\RequirePackage[T1, T2A]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[english,main=russian]{babel}
\RequirePackage{pscyr}
\renewcommand{\rmdefault}{ftm}

% Настройка полей
\RequirePackage[
	left=30mm,
	right=10mm, % Является требованием МГТУ, не соответствует ГОСТ 7.32-2017
	top=20mm,
	bottom=20mm,
]{geometry}

% Настройка переносов
\RequirePackage{microtype}
\sloppy

% Настройка межстрочного интервала
\RequirePackage{setspace}
\onehalfspacing

% Настройка абзацного отступа
\RequirePackage{indentfirst}
\setlength{\parindent}{12.5mm}

% Настройка заголовков
\makeatletter
\renewcommand\LARGE{\@setfontsize\LARGE{22pt}{20}}
\renewcommand\Large{\@setfontsize\Large{20pt}{20}}
\renewcommand\large{\@setfontsize\large{16pt}{20}}
\makeatother
\RequirePackage{titlesec}
\titleformat{\chapter}{\large\bfseries}{\thechapter}{14pt}{\large\bfseries}
\titleformat{name=\chapter,numberless}{}{}{0pt}{\large\bfseries\centering}
\titleformat{\section}{\large\bfseries}{\thesection}{14pt}{\large\bfseries}
\titleformat{\subsection}{\large\bfseries}{\thesubsection}{14pt}{\large\bfseries}
\titleformat{\subsubsection}{\large\bfseries}{\thesubsubsection}{14pt}{\large\bfseries}
\titlespacing{\chapter}{12.5mm}{-22pt}{10pt}
\titlespacing{\section}{12.5mm}{10pt}{10pt}
\titlespacing{\subsection}{12.5mm}{10pt}{10pt}
\titlespacing{\subsubsection}{12.5mm}{10pt}{10pt}
\setcounter{secnumdepth}{3}

% Подключения пакетов для фигур
\RequirePackage{graphicx}
\RequirePackage{float}
\RequirePackage{wrapfig}
\RequirePackage{tikzscale}

% Текст
\newcommand{\bfit}[1]{\textit{\textbf{#1}}}
\RequirePackage{xcolor}
\newcommand{\red}[1]{\textcolor{red}{#1}}

% Создание рисунков
\RequirePackage{rotating}
\newcommand{\imgw}[4]
{
	\begin{figure}[#2]
		\center{\includegraphics[width=#3]{../img/#1}}
		\caption{#4}
		\label{img:#1}
	\end{figure}
}
\newcommand{\imgh}[4]
{
	\begin{figure}[#2]
		\center{\includegraphics[height=#3]{../img/#1}}
		\caption{#4}
		\label{img:#1}
	\end{figure}
}
\newcommand{\imgs}[4]
{
	\begin{figure}[#2]
		\center{\includegraphics[scale=#3]{../img/#1}}
		\caption{#4}
		\label{img:#1}
	\end{figure}
}

% Подключение пакетов таблиц
\RequirePackage{tabularx}
\RequirePackage{booktabs}
\RequirePackage{threeparttable}
\RequirePackage{longtable}

% Настройка списков
\renewcommand{\labelitemi}{---}
\RequirePackage{enumitem}
\RequirePackage{multicol}
\RequirePackage{multirow}
% вторые и след строки выровнены по первой
\setlist{nosep, labelindent=\parindent, leftmargin=*, topsep=5px}
% вторые и след строки выровнены по левому краю
%\setlist{nosep, leftmargin=\parindent, wide}

% Настройка графиков
\RequirePackage{pgfplots}
\pgfplotsset{compat=newest}

% Настройка листингов
\RequirePackage[listings]{tcolorbox}
\tcbuselibrary{listings,breakable,minted,skins}
% изменение размера нумерации строк
\renewcommand\theFancyVerbLine{\scriptsize\arabic{FancyVerbLine}}
% пока не проходит нормоконтроль
\newtcbinputlisting[auto counter,number within=chapter]{\mylisting}[6][]{
	% для отображение box title, если листинг на одной странице
	enhanced,
	% отступ перед листингом
	left skip =10pt,
	% рамка без закрглений
	arc=0mm,
	% тонкая рамка
	boxrule=1pt,
    listing only,
	listing file={../listings/#2},
	% стиль листинга
    listing engine=minted,
    minted language=#1,
    minted options = {
        linenos,
        breaklines=true,
        breakbefore=.,
        fontsize=\footnotesize\ttfamily,
        numbersep=7mm,
        firstnumber=1,
        % для firstline, lastline и др.
        #3
    },
	colback=white,
	colframe=black,
	breakable,
	% стиль основной подписи
	title={\parbox[t][][t]{3.5cm}{Листинг \thetcbcounter~---}\parbox[t][][t]{13.1cm}{#4}},
	attach boxed title to top left,
	boxed title style={enhanced jigsaw, opacityfill=1, sharp corners, boxrule=0pt},
	coltitle=black,
	colbacktitle=white,
	% подписи при переносе
	overlay first={
		\draw[line width=.5pt] (frame.south west)--(frame.south east);
	},
	overlay middle={
        \draw[line width=.5pt] (frame.south west)--(frame.south east);
        \draw[line width=.5pt] (frame.north west)--(frame.north east);
        \node[anchor=south west] at (frame.north west) {Продолжение листинга \thetcbcounter};
	},
	overlay last={
        \draw[line width=.5pt] (frame.north west)--(frame.north east);
        \node[anchor=south west] at (frame.north west) {Продолжение листинга \thetcbcounter};
	},
	%extras last pre={},
    label={lst:#5},
	#6
}

\newtcbinputlisting[auto counter,number within=chapter]{\mylistingadd}[7][]{
	% для отображение box title, если листинг на одной странице
	enhanced,
	% отступ перед листингом
	left skip =10pt,
	% рамка без закрглений
	arc=0mm,
	% тонкая рамка
	boxrule=1pt,
    listing only,
	listing file={../listings/#2},
	% стиль листинга
    listing engine=minted,
    minted language=#1,
    minted options = {
        linenos,
        breaklines=true,
        breakbefore=.,
        fontsize=\footnotesize\ttfamily,
        numbersep=7mm,
        firstnumber=1,
        % для firstline, lastline и др.
        #3
    },
	colback=white,
	colframe=black,
	breakable,
	% стиль основной подписи
	title={\parbox[t][][t]{3.5cm}{Листинг A.#7~---}\parbox[t][][t]{13.1cm}{#4}},
	attach boxed title to top left,
	boxed title style={enhanced jigsaw, opacityfill=1, sharp corners, boxrule=0pt},
	coltitle=black,
	colbacktitle=white,
	% подписи при переносе
	overlay first={
		\draw[line width=.5pt] (frame.south west)--(frame.south east);
	},
	overlay middle={
        \draw[line width=.5pt] (frame.south west)--(frame.south east);
        \draw[line width=.5pt] (frame.north west)--(frame.north east);
        \node[anchor=south west] at (frame.north west) {Продолжение листинга A.#7};
	},
	overlay last={
        \draw[line width=.5pt] (frame.north west)--(frame.north east);
        \node[anchor=south west] at (frame.north west) {Продолжение листинга A.#7};
	},
	%extras last pre={},
    label={lst:#5},
	#6
}

\RequirePackage{listings}
\RequirePackage{listingsutf8}
\lstset{
	basicstyle=\small\ttfamily,
	frame=single,
	numbers=left,
	numberstyle=\footnotesize,
	numbersep=5pt,
	breaklines=true,
	inputencoding=utf8/koi8-r,
	xleftmargin=15pt
}

% Создание листинга (используем эту команду для листингов)
\newcommand{\listingfile}[5]{
	\lstinputlisting[
		float=!htbp,
		abovecaptionskip=-5pt,
		caption={#4},
		label={lst:#5},
		language={#1},
		tabsize=2,
		#3,
	]{../listings/#2}
}

% Настройка подписей
\RequirePackage[
	labelsep=endash,
	figurename=Рисунок,
	singlelinecheck=false,
]{caption}
\usepackage{subcaption}
\captionsetup[figure]{justification=centering}

% Подключение пакетов для альбомной ориентации
\RequirePackage{lscape}
\RequirePackage{afterpage}

% Подключение математических пакетов
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\DeclareMathOperator{\erf}{erf}

% Настройка библиографии
\RequirePackage[
	style=gost-numeric,
    citestyle=numeric-comp,
	language=auto,
	autolang=other,
	sorting=none,
    maxbibnames=4,
    minbibnames=3
    %blockpunct=space
]{biblatex}
%\toggletrue{bbx:gostbibliography}
\RequirePackage{csquotes}

% Подключение пакета для гиперссылок
\RequirePackage[unicode, hidelinks]{hyperref}

% Подключение пакета для управляющих конструкций
\RequirePackage{xifthen}

\RequirePackage{siunitx}


% Титульная страница -----------------------------------------------------------
% ------------------------------------------------------------------------------

% Установка мета-данных выходного файла
\newcommand{\documentmeta}[4]
{
	\hypersetup{
		pdftitle={#1 #2 #3},
		pdfsubject={#4},
		pdfauthor={#2}
	}
}

% Cоздание полей
\RequirePackage[normalem]{ulem}
\RequirePackage{stackengine}
\newcommand{\longunderline}[1]
{
	\uline{#1\hfill\mbox{}}
}
\newcommand{\fixunderline}[3]
{
	$\underset{\text{#3}}{\text{\uline{\stackengine{0pt}{\hspace{#2}}{\text{#1}}{O}{c}{F}{F}{L}}}}$
}

% Создание горизонтальной линии
\makeatletter
\newcommand{\vhrulefill}[1]
{
	\leavevmode\leaders\hrule\@height#1\hfill \kern\z@
}
\makeatother

% Создание шапки титульной страницы
\newcommand{\titlepageheader}[0]
{
	\noindent
    \begin{minipage}{0.15\textwidth}
        \includegraphics[width=\linewidth]{bmstu-logo}
	\end{minipage}
	\fontsize{12pt}{12pt}\selectfont
	\noindent
    \begin{minipage}{0.85\textwidth}\centering
        \linespread{1.1}\selectfont
        \textbf{Министерство науки и высшего образования Российской
                Федерации}\\
        \textbf{Федеральное государственное бюджетное образовательное
                учреждение высшего образования}\\
        \textbf{«Московский государственный технический университет~\\имени
                Н.Э.~Баумана}\\
        \textbf{(национальный исследовательский университет)»}\\
        \textbf{(МГТУ им. Н.Э.~Баумана)}
	\end{minipage}
    \begin{spacing}{0.2}
        ~\\
    \end{spacing}

    \noindent
	\rule{17cm}{3pt}
    \\
    \begin{spacing}{0.1}
        ~\\
    \end{spacing}
	\noindent ФАКУЛЬТЕТ
    \uline
    {
            ~~~~~~~~~~~~~~~~~~~~~~~~~~~
            «Информатика и системы управления»
            ~~~~~~~~~~~~~~~~~~~~~~~~~~~
    }
    \newline\newline
	\noindent КАФЕДРА
    \uline{
            ~~~
            «Программное обеспечение ЭВМ и информационные технологии»
            ~~~~~~~~~
        }
    \newline\newline
    \newline
}

\newcommand{\titlepageheaderibm}[0]
{
	\noindent
    \begin{minipage}{0.15\textwidth}
        \includegraphics[width=\linewidth]{bmstu-logo}
	\end{minipage}
	\fontsize{12pt}{12pt}\selectfont
	\noindent
    \begin{minipage}{0.85\textwidth}\centering
        \linespread{1.1}\selectfont
        \textbf{Министерство науки и высшего образования Российской
                Федерации}\\
        \textbf{Федеральное государственное бюджетное образовательное
                учреждение высшего образования}\\
        \textbf{«Московский государственный технический университет~\\имени
                Н.Э.~Баумана}\\
        \textbf{(национальный исследовательский университет)»}\\
        \textbf{(МГТУ им. Н.Э.~Баумана)}
	\end{minipage}
    \begin{spacing}{0.2}
        ~\\
    \end{spacing}

    \noindent
	\rule{17cm}{3pt}
    \\
    \begin{spacing}{0.1}
        ~\\
    \end{spacing}
	\noindent ФАКУЛЬТЕТ
    \uline
    {
            ~~~~~~~~~~~~~~~~~~~~~~~~~
            «Инженерный бизнес и менеджмент»
            ~~~~~~~~~~~~~~~~~~~~~~~~~~~
    }
    \newline\newline
	\noindent КАФЕДРА
    \uline{
            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            «ИБМ-3 Промышленная логистика»
            ~~~~~~~~~~~~~~~~~~~~~~~~~~~
        }
    \newline\newline
    \newline
}

% Установка заголовков РПЗ
\newcommand{\titlepagenotetitle}[2]
{
	\fontsize{22pt}{22pt}\selectfont
	\begin{center}
        \textbf{РАСЧЕТНО-ПОЯСНИТЕЛЬНАЯ ЗАПИСКА}\\
        ~\\
        \fontsize{20pt}{20pt}\selectfont
        \textsl{К #1}\\
        \fontsize{14pt}{14pt}\selectfont
        ~\\
        \fontsize{20pt}{20pt}\selectfont
        \textsl{НА ТЕМУ:}\\
        ~\\
        «#2»
	\end{center}
}

\newcommand{\titlereportitle}[3]
{
	\fontsize{18pt}{18pt}\selectfont
	\begin{center}
        \textbf{ОТЧЕТ ПО #1}\\
        \textbf{по курсу <<#2>>}\\
        ~\\
        \fontsize{16pt}{16pt}\selectfont
        <<#3>>
	\end{center}
}

\newcommand{\titlehwtitle}[2]
{
	\fontsize{18pt}{18pt}\selectfont
	\begin{center}
        \textbf{ДОМАШНЕЕ ЗАДАНИЕ}\\
        \textbf{по курсу <<#1>>}\\
        ~\\
        \fontsize{16pt}{16pt}\selectfont
        \text{<<#2>>}
	\end{center}
}

\newcommand{\titlerw}[1]
{
    \titlepagenotetitle{НАУЧНО-ИССЛЕДОВАТЕЛЬСКОЙ РАБОТЕ}{#1}
}

\newcommand{\titlecw}[1]
{
    \titlepagenotetitle{КУРСОВОЙ РАБОТЕ}{#1}
}

\newcommand{\titlelabreport}[2]
{
    \titlereportitle{ЛАБОРАТОРНОЙ РАБОТЕ}{#1}{#2}
}

\newcommand{\titlenumlabreport}[3]
{
    \titlereportitle{ЛАБОРАТОРНОЙ РАБОТЕ №#1}{#2}{#3}
}

\newenvironment{performers}
{
    \fontsize{14pt}{14pt}\selectfont
    \centering
    \tabularx{\textwidth}{lcXcc}
}
{
    \endtabularx
}

\newcommand{\student}[2]
{
    Студент: &
    $\text{\uline{#1}}$ &
    &
    $\text{\uline{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}}$ &
    $\text{\uline{#2}}$ \\
    &
    \footnotesize (группа) &
    &
    \footnotesize (подпись, дата) &
    \footnotesize (И. О. Фамилия) \\
}

\newcommand{\supervisor}[1]
{
	Преподаватель:&
    &
    &
    $\text{\uline{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}}$ &
    $\text{\uline{#1}}$ \\
    &
    &
    &
    \footnotesize (подпись, дата) &
    \footnotesize (И. О. Фамилия) \\
}

\newcommand{\sciadvisor}[1]
{
	Руководитель:&
    &
    &
    $\text{\uline{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}}$ &
    $\text{\uline{#1}}$ \\
    &
    &
    &
    \footnotesize (подпись, дата) &
    \footnotesize (И. О. Фамилия) \\
}

\newcommand{\performersspace}[0]
{
    \footnotesize ~ & \footnotesize ~ & \footnotesize ~
                    & \footnotesize ~ & \footnotesize ~ \\
}

\newcommand{\makeyear}
{
    \fontsize{14pt}{14pt}\selectfont
	\begin{center}
        \textit{\the\year~г.}
	\end{center}
}

% Установка заголовков отчета
\newcommand{\titlepagereporttitle}[4]
{
	\textbf{ОТЧЕТ} \\
	по #1 \\
	\ifthenelse{\isempty{#2}}{}{по курсу <<#2>> \\}
	\ifthenelse{\isempty{#3}}{}{на тему: <<#3>> \\}
	\ifthenelse{\isempty{#4}}{}{Вариант №~#4 \\}
}

% Создание поля студента
\newcommand{\titlepagestudent}[2]
{
	Студент \fixunderline{#1}{25mm}{(Группа)} &
	\fixunderline{}{40mm}{(Подпись, дата)} \vspace{1.3mm} &
	\fixunderline{#2}{40mm}{(И.~О.~Фамилия)} \\
}

% Создание прочих полей
\newcommand{\titlepageothers}[2]
{
	#1 &
	\fixunderline{}{40mm}{(Подпись, дата)} \vspace{1.3mm} &
	\fixunderline{#2}{40mm}{(И.~О.~Фамилия)} \\
}

% Установка исполнителей работы
\newcommand{\titlepageauthors}[7]
{
	{
		\small
		\begin{tabularx}{\textwidth}{@{}>{\hsize=.5\hsize}X>{\hsize=.25\hsize}X>{\hsize=.25\hsize}X@{}}
			\titlepagestudent{#1}{#2}
			\titlepageothers{#3}{#4}
			\ifthenelse{\isempty{#5}}{}{\titlepageothers{Консультант}{#5}}
			\ifthenelse{\isempty{#6}}{}{\titlepageothers{Консультант}{#6}}
			\ifthenelse{\isempty{#7}}{}{\titlepageothers{Нормоконтролер}{#7}}
		\end{tabularx}
	}
}

% Создание титульной страницы РПЗ к ВКР
\makeatletter
\newcommand{\makethesistitle}[9]
{
	\documentmeta{РПЗ к ВКР}{#5}{#4}{#3}
	
	\begin{titlepage}
		\centering
		
		\titlepageheader{#1}{#2}
		\vspace{15.8mm}
		
		\titlepagenotetitle{К ВЫПУСКНОЙ КВАЛИФИКАЦИОННОЙ РАБОТЕ}{#3}
		\vfill
		
		\titlepageauthors{#4}{#5}{Руководитель ВКР}{#6}{#7}{#8}{#9}
		\vspace{14mm}
		
		\textit{{\the\year} г.}
	\end{titlepage}

	\setcounter{page}{2}
}
\makeatletter

% Создание титульной страницы РПЗ к КР
\makeatletter
\newcommand{\makecourseworktitle}[8]
{
	\documentmeta{РПЗ к КР}{#5}{#4}{#3}
	
	\begin{titlepage}
		\centering
		
		\titlepageheader{#1}{#2}
		\vspace{15.8mm}
		
		\titlepagenotetitle{К КУРСОВОЙ РАБОТЕ}{#3}
		\vfill
		
		\titlepageauthors{#4}{#5}{Руководитель курсовой работы}{#6}{#7}{#8}{}
		\vspace{14mm}
		
		\textit{{\the\year} г.}
	\end{titlepage}
	
	\setcounter{page}{2}
}
\makeatletter

% Создание титульной страницы отчета
\makeatletter
\newcommand{\makereporttitle}[9]
{
	\documentmeta{Отчет}{#8}{#3 #4}{#5}
	
	\begin{titlepage}
		\centering
		
		\titlepageheader{#1}{#2}
		\vspace{15.8mm}
		
		\titlepagereporttitle{#3}{#4}{#5}{#6}
		\vfill
		
		\titlepageauthors{#7}{#8}{Преподаватель}{#9}{}{}{}
		\vspace{14mm}
		
		\textit{{\the\year} г.}
	\end{titlepage}
	
	\setcounter{page}{2}
}
\makeatletter


% Реферат ----------------------------------------------------------------------
% ------------------------------------------------------------------------------

% Подсчет количества страниц
\RequirePackage{lastpage}

% Подсчет количества рисунков и таблиц
\RequirePackage{etoolbox}
\newcounter{totfigures}
\newcounter{tottables}
\providecommand\totfig{}
\providecommand\tottab{}
\makeatletter
\AtEndDocument{%
	\addtocounter{totfigures}{\value{figure}}%
	\addtocounter{tottables}{\value{table}}%
	\immediate\write\@mainaux{%
		\string\gdef\string\totfig{\number\value{totfigures}}%
		\string\gdef\string\tottab{\number\value{tottables}}%
	}%
}
\makeatother
\pretocmd{\chapter}{\addtocounter{totfigures}{\value{figure}}\setcounter{figure}{0}}{}{}
\pretocmd{\chapter}{\addtocounter{tottables}{\value{table}}\setcounter{table}{0}}{}{}

% Подсчет количества использованных источников
\newcounter{totbibentries}
\newcommand*{\listcounted}{}
\providecommand\totbib{}
\makeatletter
\AtDataInput{%
	\xifinlist{\abx@field@entrykey}\listcounted%
	{}%
	{\stepcounter{totbibentries}%
		\listxadd\listcounted{\abx@field@entrykey}}%
}%
\makeatother

% Подсчет количества приложений
\usepackage{totcount, assoccnt}
\newcounter{appendixchapters}
\DeclareAssociatedCounters{chapter}{appendixchapters}
\regtotcounter{appendixchapters}

% Создание страницы реферата
\newenvironment{essay}[1]
{
	\chapter*{РЕФЕРАТ}
	\addcontentsline{toc}{chapter}{РЕФЕРАТ}
	
	Расчетно-пояснительная записка \begin{NoHyper}\pageref{LastPage}\end{NoHyper}~с., \totfig~рис., \tottab~табл., \thetotbibentries~источн., 1~прил.
	%\total{appendixchapters}~прил.
	
	\noindent \MakeUppercase{#1} \par
}{}


% Содержание -------------------------------------------------------------------
% ------------------------------------------------------------------------------

% Создание содержания
\newcommand{\maketableofcontents}
{
	\renewcommand\contentsname{СОДЕРЖАНИЕ}
	\tableofcontents
}

% Отточие у глав
\RequirePackage{tocloft}
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}

% Настройка стиля заголовка содержания

% Стиль с выравниванием по центру
\renewcommand{\cfttoctitlefont}{\hfill\large\bfseries}
\renewcommand{\cftaftertoctitle}{\hfill\hfill}

% Отступы до и после
\setlength\cftbeforetoctitleskip{-22pt}
\setlength\cftaftertoctitleskip{15pt}

% Определения, обозначения и сокращения ----------------------------------------
% ------------------------------------------------------------------------------

% Создание элемента
\RequirePackage{enumitem}
\newcommand{\definition}[2]
{
 	\item \noindent #1 --- #2
}

% Создание страницы определений
\newenvironment{definitions}
{
	\chapter*{ОПРЕДЕЛЕНИЯ}
	\addcontentsline{toc}{chapter}{ОПРЕДЕЛЕНИЯ}
	
	В настоящей расчетно-пояснительной записке применяют следующие термины с соответствующими определениями.
	
	\begin{description}[leftmargin=-1pt]
}
{
	\end{description}
}

% Создание страницы обозначений и сокращений
\newenvironment{abbreviations}
{
	\chapter*{ОБОЗНАЧЕНИЯ И СОКРАЩЕНИЯ}
	\addcontentsline{toc}{chapter}{ОБОЗНАЧЕНИЯ И СОКРАЩЕНИЯ}
	
	В настоящем отчете применяют следующие сокращения и обозначения.
	
	\begin{description}[leftmargin=-4pt]
}
{
	\end{description}
}

% Введение, заключение ---------------------------------------------------------
% ------------------------------------------------------------------------------

% Создание введения
\newcommand{\intro}
{
	\chapter*{ВВЕДЕНИЕ}
	\addcontentsline{toc}{chapter}{ВВЕДЕНИЕ}
}

% Создание заключение
\newcommand{\conclusion}
{
	\chapter*{ЗАКЛЮЧЕНИЕ}
	\addcontentsline{toc}{chapter}{ЗАКЛЮЧЕНИЕ}
}

% Создание главы без номера
\newcommand{\nonumchapter}[1]
{
	\chapter*{#1}
	\addcontentsline{toc}{chapter}{#1}
}


% Список использованных источников ---------------------------------------------
% ------------------------------------------------------------------------------

% Создание списка использованных источников
\newcommand{\makebibliography}
{
	\printbibliography[title=СПИСОК ИСПОЛЬЗОВАННЫХ ИСТОЧНИКОВ]
	\addcontentsline{toc}{chapter}{СПИСОК ИСПОЛЬЗОВАННЫХ ИСТОЧНИКОВ}
}


% Приложения -------------------------------------------------------------------
% ------------------------------------------------------------------------------

% Установка заголовков приложений
\RequirePackage[
	titletoc,
	title,
]{appendix}
\AtBeginDocument{\renewcommand{\appendixname}{ПРИЛОЖЕНИЕ}}

% Создание приложений
\let\oldappendices\appendices
\let\oldendappendices\endappendices
\renewenvironment{appendices}
{
	\titleformat{\chapter}{\large\bfseries}{\appendixname~\thechapter}{0pt}{\centering\large\bfseries\\}
	\setcounter{appendixchapters}{0}
	\oldappendices
	\renewcommand{\thechapter}{\Asbuk{chapter}}
}
{
	\oldendappendices
}
