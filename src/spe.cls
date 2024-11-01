% File obtained from https://github.com/agurwicz/spe-latex-template.


% Original template
\LoadClass[10pt, twoside]{article}

\RequirePackage[letterpaper, portrait, margin=1in]{geometry}
\RequirePackage[utf8]{inputenc}
\RequirePackage[scaled]{helvet}

\renewcommand{\familydefault}{\sfdefault}

% Additional

% Conference and journal options
\newif\if@isconference \@isconferencefalse \DeclareOption{conference}{\@isconferencetrue}
\newif\if@isjournal \@isjournalfalse \DeclareOption{journal}{\@isjournaltrue}
\ProcessOptions\relax

\if@isjournal \if@isconference
    \PackageError{spe}{Cannot load both "journal" and "conference" options}
\fi \fi
\unless\if@isjournal \unless\if@isconference
    \PackageError{spe}{One of the "journal" or "conference" options needs to be loaded}
\fi \fi

\newcommand{\specheckargument}[1]{%
    \ifx#1\undefined%
        \PackageError{spe}{Need to define command "\string#1"} %
    \fi%
}
\newcommand{\specheckarguments}{%
    \specheckargument{\spevenuename}%
    \specheckargument{\spemanuscriptnumber}%
    \specheckargument{\spetitle}%
    \specheckargument{\speauthors}%
    \specheckargument{\speaffiliations}%
    \specheckargument{\speauthoraffiliations}%
    \if@isjournal%
        \specheckargument{\specorrespondingauthor}%
        \specheckargument{\spekeywords}%
    \fi%
}

\RequirePackage[hyperref]{xcolor}
\definecolor{spelink}{HTML}{172b81}

\RequirePackage[hidelinks, urlcolor=spelink, citecolor=black, linkcolor=black, colorlinks=true]{hyperref}
\RequirePackage{listofitems}
\RequirePackage{pgffor}
\RequirePackage{float}
\RequirePackage{graphicx}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsfonts}
\RequirePackage{amsthm}
\RequirePackage{mathtools}

% Captions
\RequirePackage{caption}
\floatstyle{plaintop}
\restylefloat{table}
\DeclareCaptionLabelSeparator{spelabelseparator}{—}
\captionsetup[figure]{name={Fig.}, labelsep={spelabelseparator}, font={bf,footnotesize}}
\captionsetup[table]{name={Table}, labelsep={spelabelseparator}, font={footnotesize}}

% References
\RequirePackage[capitalize, nameinlink]{cleveref}
\crefname{figure}{Fig.}{Figs.}
\crefname{table}{Table}{Tables}
\creflabelformat{equation}{#2\textup{#1}#3}
\newcommand{\speref}[1]{\cref{#1}}
\newcommand{\sperefp}[1]{(\speref{#1})}
\newcommand{\spefirstref}[1]{\textbf{\speref{#1}}}
\newcommand{\spefirstrefp}[1]{\textbf{\sperefp{#1}}}
\newcommand\setcurrentname[1]{\def\@currentlabelname{``\textit{#1}''}}

% Citations
\RequirePackage[bibstyle=authoryear, giveninits=true, uniquename=init, maxbibnames=3, minbibnames=3, style=authoryear, dashed=false]{biblatex}
\DeclareFieldFormat*{title}{#1}
\renewbibmacro{in:}{}
\DeclareNameAlias{sortname}{family-given}
\urlstyle{same}
\DeclareFieldFormat{doi}{\url{https://doi.org/#1}}
\DeclareFieldFormat{url}{\url{#1}}

% Section headings
\RequirePackage{titlesec}
\titleformat{\section}[hang]{\Large \bfseries}{\thesection.}{1em}{}
\titleformat{\subsection}[runin]{\normalsize \bfseries}{\thesubsection.}{1em}{}[.]
\titleformat{\subsubsection}[runin]{\normalsize \bfseries \itshape}{\thesubsubsection.}{1em}{\indent}[.]

\newcommand{\spesection}[1]{\section*{#1} \setcurrentname{#1}}
\newcommand{\spesubsection}[1]{\subsection*{#1} \setcurrentname{#1}}
\newcommand{\spesubsubsection}[1]{\subsubsection*{#1} \setcurrentname{#1}}
\newcommand{\spesubsubsubsection}[1]{~\newline \indent \textit{#1.}}

% Title
\newcommand{\latexmath}[1]{
    \numexpr #1 \relax
}
\newcommand{\parselist}[1]{
    \readlist*{#1}{#1}
}

\newcommand{\spemaketitle}{
    \specheckarguments

    \setsepchar{;}

    \parselist{\speauthors}
    \parselist{\speaffiliations}
    \parselist{\speauthoraffiliations}
    \if@isjournal
        \parselist{\specorrespondingauthor}
        \parselist{\spekeywords}
    \fi

    \begin{flushleft}

        \spevenuename \vspace{5mm}

        \spemanuscriptnumber \vspace{5mm}

        \begin{center}
        \huge \spetitle \vspace{5mm}
        \end{center}

        \textbf{%
            \foreach \index in {1, ..., \speauthorslen} {%
                \newcommand{\spetempauthor}{%
                    \speauthors[\index]%
                    \textsuperscript{\speauthoraffiliations[\index]}%
                    \if@isjournal \ifnum \index = \latexmath{\specorrespondingauthor[1]}%
                        *%
                    \fi\fi%
                }%
                \ifnum \index < \latexmath{\speauthorslen - 1}%
                    \spetempauthor, %
                \else \ifnum \index = \latexmath{\speauthorslen - 1}%
                    \spetempauthor~and %
                \else%
                    \spetempauthor%
                \fi%
                \fi%
            }
        }

        \vspace{5mm}
        \foreach \index in {1, ..., \speaffiliationslen} {
            \textsuperscript{\index}%
            \speaffiliations[\index]%
            \par%
        }

        \if@isjournal
            \vspace{3mm}

            *Corresponding author; email: \url{\specorrespondingauthor[2]}
            \vspace{3mm}

            \textbf{Keywords:}
            \foreach \index in {1, ..., \spekeywordslen} {%
                \spekeywords[\index]%
                \ifnum \index < \latexmath{\spekeywordslen}%
                    ;
                \fi%
            }
        \fi

    \end{flushleft}
}
