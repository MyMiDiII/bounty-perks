\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{notes}[2022/09/30 v1.0 NOTES class]

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
	right=15mm,
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

% tcolorbox
\RequirePackage{tcolorbox}

% Настройка заголовков
\RequirePackage[Sonny]{fncychap}
\ChRuleWidth{0pt}
\ChNameVar{\vspace{-31mm}\LARGE\rm\bfseries}
\ChNumVar{\LARGE\rm\bfseries}
\ChTitleVar{\vspace{-2.5cm}\Large\sf}
\addto\captionsrussian{%
\renewcommand\chaptername{Семинар №}}

\RequirePackage[explicit]{titlesec}
\newcommand*\SectionNumberBox[1]
  {%
    \colorbox{black}
      {%
        \makebox[2em][c]
          {%
            \color{white}%
            \strut
            \csname the#1\endcsname
          }%
      }%
    \colorbox{white}
      {%
        \makebox[0.25em][c]
          {%
          }%
      }%
  }
\titleformat{\section}
  {\large\bfseries\color{black}}
  {\setstretch{0.1}\SectionNumberBox{section}}
  {0pt}
  {\setstretch{0.1}#1}
\titlespacing{\chapter}{12.5mm}{-22pt}{-4cm}
\titlespacing{\section}{0mm}{10pt}{10pt}

% Рисунки
\RequirePackage{graphicx}

% Текст
\RequirePackage[normalem]{ulem}

% Таблицы
\RequirePackage{tabularx}

% Формулы
\RequirePackage{amsmath}

% Титульная страница
\newcommand{\makelogo}[0]
{
    \begin{minipage}{0.3\textwidth}
        \includegraphics[width=\linewidth]{bmstu-logo}
	\end{minipage}
}

\newcommand{\seminarstitle}[0]
{
    \begin{titlepage}
        \newgeometry{
            left=30mm,
            right=10mm,
            top=20mm,
            bottom=17mm
        }
        \noindent

        \vspace*{\fill}
        \begin{center}
            \makelogo\\
            \vspace{15mm}
            \fontsize{22pt}{22pt}\selectfont
            СЕМИНАРЫ ПО КУРСУ\\
            \fontsize{48pt}{48pt}\selectfont
            \textbf{ЭКОНОМИКА}
        \end{center}
        ~\\
        ~\\

        \fontsize{18pt}{18pt}\selectfont
        \begin{center}
            \begin{tabularx}{0.8\textwidth}{Xl}
                Студент: & Маслова Марина Дмитриевна\\
                Преподаватель: & Кушнарева Дарья Леонидовна\\
            \end{tabularx}
        \end{center}
        ~\\
        ~\\
        \vspace{7mm}
        \vspace*{\fill}

        \begin{center}
            \textit{Осень, \the\year~г.}
        \end{center}

        \restoregeometry
    \end{titlepage}
}

\newcommand{\semdate}[1]
{
\begin{flushright}
    #1
\end{flushright}
}
