# SPE LaTeX Template

This repository contains template files to submit papers according to the Society of Petroleum Engineers' requirements.

The style was originally obtained from [SPE's Author Resources](https://www.spe.org/en/authors/resources), with modifications according to the instructions and guides provided.
We do not claim to hold the copyright or ownership for any SPE file.

> [!IMPORTANT]
> We recommend anyone wishing to use the files here provided to double-check the correctness of the template according to the desired journal/conference's style requirements.

We are open to suggestions and contributions to the repository.
Please feel free to open pull requests/issues for contribution and discussion.

## Instructions

### Installation

It suffices to use the class file as the project's *documentclass*.
For this purpose, the user can either:

1. Download the [*spe* class file](src/spe.cls) from the [*src* directory](src) to the same directory as the user's main LaTeX file.
2. Clone the repository and make sure the [*src* directory](src) can be seen by LaTeX. 
As an example, in MiKTeX for Windows one can add it as a TEXMF root directory under [MiKTeX Console's settings](https://miktex.org/kb/texmf-roots).

### Usage

To use the class in the main file, one of the `journal` or `conference` options needs to be loaded, i.e.

```latex
\documentclass[journal]{spe}
or
\documentclass[conference]{spe}
```

The following commands need to be defined for the title block. 
For commands that hold more than one information, separate each by semicolons (e.g. multiple authors).

| Command                  | Needed in `conference`? | Needed in `journal`? | Explanation                                                                            |
|:-------------------------|:-----------------------:|:--------------------:|:---------------------------------------------------------------------------------------|
| `spevenuename`           |            ✅            |          ✅           | Name of the conference or journal.                                                     |
| `spemanuscriptnumber`    |            ✅            |          ✅           | Number of the manuscript being submitted.                                              |
| `spetitle`               |            ✅            |          ✅           | Title of the paper.                                                                    |
| `speauthors`             |            ✅            |          ✅           | Name of the authors.                                                                   |
| `speaffiliations`        |            ✅            |          ✅           | Affiliations of the authors. Affiliations should not be repeated.                      |
| `speauthoraffiliations`  |            ✅            |          ✅           | Number of each author's affiliation, following the order defined by the command above. |
| `specorrespondingauthor` |            ❌            |          ✅           | Which author is the corresponding one, with respective email address.                  |
| `spekeywords`            |            ❌            |          ✅           | Keywords of the paper.                                                                 |

The `\spemaketitle` command creates the title block.

Example:
```latex
...
\newcommand{\spevenue}{2024 SPE Annual Technical Conference and Exhibition}
\newcommand{\spemanuscriptnumber}{SPE-123456-MS}
\newcommand{\spetitle}{My Awesome Paper}
\newcommand{\speauthors}{A. One; A. Two; A. Three; A. Four}
\newcommand{\speaffiliations}{My University, City One, TX, USA; Other Company, City Two, TX, USA}
\newcommand{\speauthoraffiliations}{1; 1; 2; 1}
\newcommand{\specorrespondingauthor}{1; email@myuniversity.edu}
\newcommand{\spekeywords}{keyword1; keyword2}

\begin{document}
\spemaketitle
...
```

To reference figures and tables, use `\speref` or `\sperefp`.
If it's the first reference of an item in the paper, use `\spefirstref` or `\spefirstrefp`.

For section headings, use the commands `\spesection`, `\spesubsection`, `\spesubsubsection` and `\spesubsubsubsection`.
