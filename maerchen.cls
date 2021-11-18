\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{maerchen}[2021/11/18 Class for fairy tails as small book]

\LoadClass[paper=A5]{scrbook}
\RequirePackage{fontspec}
\RequirePackage{lettrine}
\RequirePackage[para*]{manyfoot}
\DeclareNewFootnote[para]{A}
\let\oldfootnoteA\footnoteA
\renewcommand{\footnoteA}[1]{\oldfootnoteA{\makebox[.24\dimexpr\textwidth-3\footglue\relax][l]{#1}}}

%\catcode`ſ=\active % Make ſ active
%\newcommand ſ{s} % Now we can let it expand to s

\ifdefined\directlua\else
	\errmessage{LuaTeX is required to typeset using this class}
	\csname @@end\expandafter\endcsname
\fi
\directlua
{
	fonts.handlers.otf.addfeature
	{
		name = "longssub",
		type = "substituation",
		data =
		{
			["ſ"] = {"s"}
		},
	}
}

\newcommand{\LTR}[1]{\lettrine[lines=2]{#1}}
