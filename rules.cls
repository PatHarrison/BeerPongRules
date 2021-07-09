\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{rules}[Class for a specific rulebook style]

\LoadClass[11pt, oneside, letterpaper]{article}

\RequirePackage[english]{babel}
\RequirePackage{lmodern}
\RequirePackage{graphicx}
\RequirePackage{titlesec}
\RequirePackage[left=3.04cm, right=2.54cm, bottom=2.54cm]{geometry}
\RequirePackage{changepage} % indenting subsubsections
\RequirePackage{framed}
\RequirePackage{fancyhdr}
\RequirePackage{enumitem}
\RequirePackage{yfonts}
\RequirePackage{titletoc}

% Get gothic font for title
\font\titleFont = ygoth at 50pt

% Page Header and Footer
\pagestyle{fancy}
\fancyhf{}
\rhead{\leftmark}
\lhead{House Beer Pong Rules}
\rfoot{Page \thepage}
\renewcommand{\headrulewidth}{0.5pt}

% Footnote numbering style
\renewcommand{\thefootnote}{\fnsymbol{footnote}}
 
\RequirePackage{hyperref}
