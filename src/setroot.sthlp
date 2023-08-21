{smcl}
{* *! version 1.0.0 20aug2023}{...}
{viewerjumpto "Syntax" "setroot##syntax"}{...}
{viewerjumpto "Description" "setroot##description"}{...}
{viewerjumpto "Options" "setroot##options"}{...}
{viewerjumpto "Examples" "setroot##examples"}{...}
{viewerjumpto "Stored results" "setroot##results"}{...}
{viewerjumpto "Author" "setroot##contact"}{...}
{viewerjumpto "Acknowledgements" "setroot##acknowledgements"}{...}
{title:Title}

{p2colset 5 16 18 2}{...}
{p2col :{cmd:setroot} {hline 2}} Find the root path of a project and set it as a global variable.{p_end}
{p2colreset}{...}

{marker syntax}{...}
{title:Syntax}

{pstd}
{cmd:setroot}{cmd:,}
[{opt glo:bal}
{opt loc:al}
{opt more}
{opt search(files_or_folders)}
{opt add(filename)}
{opt verbose}]
{p_end}

{marker options_table}{...}
{synoptset 22 tabbed}{...}
{synopthdr}
{synoptline}
{synopt: {opt glo:bal}}save root folder as global variable $root (default){p_end}
{synopt: {opt loc:al}}save root folder as local variable `root'{p_end}
{synopt: {opt more}}save additional variables such as $code, $data, etc.{p_end}
{synopt: {opt search(...)}}specify alternative files or folder that will be searched{p_end}
{synopt: {opt add(filename)}}create a file in a working directory{p_end}
{synopt: {opt verbose}}show information of all the files searched.{p_end}


{marker description}{...}
{title:Description}

{pstd}
Use {cmd:setroot} to improve the reproductibility of your research,
by ensuring that all code and files are accessed with respect to
the top-level directory of your project, instead of using hardcoded or relative paths.

{pstd}
{cmd:setroot} first finds the root or top-level folder of your project by searching for common filenames in the working directory.
It then saves this name to the global variable $root, so it can be used to build file paths.
{cmd:setroot} first searches the working directory for a set of filenames,
and then searches any subsequent parent directories until a matching file is found,
stopping with an error if not.

{pstd}
Using this package has two advantages:

{pmore}
1. It ensures your code is portable across computers and coauthors, as it avoids hardcoded paths.
So instead of "C:/Users/John/MyPaper/data/xyz.dta",
you just need to use the string "$root/data/xyz.dta".

{pmore}
2. It makes code less fragile, as it can be moved to subdirectories without the need to change all any relative paths.

{pstd}
{cmd:findroot} is heavily inspired by the {browse "https://here.r-lib.org/":here} R package and
the {browse "https://github.com/korenmiklos/here":Stata package} of the same name.


{marker options}{...}
{title:Options}

{dlgtab:Main}

{phang}
{opt more} Will create additional variables, including $code, $data, $input, $output, $log, and $temp in the root folder, and $figures and $tables as subfolders of $output.
These names are based on the suggested folder structure by {browse "https://www.stata.com/bookstore/data-analysis-using-stata/":Data Analysis Using Stata}.

{phang}
{opt loc:al} Saves local variables instead of global variables.

{phang}
{opt search(files_or_folders)} Allows you to customize the files or folders that will be searched within the working directory.
By default, the files searched are:{res}
.here .project .git DESCRIPTION LICENSE README.md project.toml manifest.toml pyproject.toml{txt}

{phang}
{opt add(file)} Creates an empty filename in the working directory that can be used as a reference in the future..
Recommended usage is {cmd:setroot, add(.here)}.


{marker examples}{...}
{title:Examples}

{pstd}Template for starting a do-file:{p_end}

{phang2}{cmd:clear all}	{p_end}
{phang2}{cmd:setroot}	{p_end}

{pstd}To view debug information:{p_end}

{phang2}{cmd:setroot, verbose}{p_end}


{marker results}{...}
{title:Stored results}

{pstd}
{cmd:setroot} stores the following in {cmd:r()}:

{synoptset 24 tabbed}{...}
{syntab:Macros}
{synopt:{cmd:r(root)}}root path{p_end}


{marker contact}{...}
{title:Author}

{pstd}Sergio Correia{break}
Board of Governors of the Federal Reserve{break}
Email: {browse "mailto:sergio.correia@gmail.com":sergio.correia@gmail.com}
{p_end}


{marker support}{...}
{title:Support and updates}

{pstd}Links to online documentation & code:{p_end}

{p2colset 8 10 10 2}{...}
{p2col: -}{browse "https://github.com/sergiocorreia/stata-setroot":Github page}: code repository, issues, etc.{p_end}
{p2colreset}{...}

{marker acknowledgements}{...}
{title:Acknowledgements}

{pstd}
This work is heavily based on R's {cmd:here} package, as well as on Miklós Koren's Stata port.
Thank you in advance for bug-spotting and feature suggestions.{p_end}
