---
title: "SARL Syntax highlighting with other tools"
layout: default
---

# SARL Syntax highlighting with other tools


<ul class="page_outline" id="page_outline">

<li><a href="#1-atom-editor">1. Atom Editor</a></li>
<li><a href="#2-gnu-source-highlight">2. GNU source-highlight</a></li>
<li><a href="#3-google-code-prettify">3. Google Code Prettify</a></li>
<li><a href="#4-gtk-source-view">4. Gtk Source View</a></li>
<li><a href="#5-latex">5. LaTeX</a></li>
<ul>
  <li><a href="#5-1-standard-latex-style">5.1. Standard LaTeX Style</a></li>
  <li><a href="#5-2-latex-beamer">5.2. LaTeX Beamer</a></li>
</ul>
<li><a href="#6-pygments">6. Pygments</a></li>
<li><a href="#7-sublime-text-editor">7. Sublime Text Editor</a></li>
<li><a href="#8-textmate-editor">8. TextMate Editor</a></li>
<li><a href="#9-vim-editor">9. Vim Editor</a></li>
<li><a href="#10-legal-notice">10. Legal Notice</a></li>

</ul>


Syntax highlighting is a feature of text editors that are used for programming, scripting, or markup languages, such as SARL.
The feature displays text, especially source code, in different colors and fonts according to the category of terms.
This feature facilitates writing in a structured language such as a programming language or a markup language as both structures
and syntax errors are visually distinct. Highlighting does not affect the meaning of the text itself; it is intended only for human readers.

Several style specifications are provided for syntax highlighting in other tools than the SARL product.


##1. Atom Editor

[Atom Editor](https://atom.io/) is is a highly configurable text editor.
This editor uses the TextMate language syntax.

The SARL style is available on [GitHub](https://raw.githubusercontent.com/sarl/sarl/master/formatting-styles/textmate/sarl.tmLanguage)


##2. GNU source-highlight

[GNU source-highlight](https://www.gnu.org/software/src-highlite/) is the GNU source code highlightner.

The SARL style is available on [GitHub](https://raw.githubusercontent.com/sarl/sarl/master/formatting-styles/source-highlight/sarl.lang)

For installing the SARL style, you should:

* download all the style file;
* copy the file into the GNU source-lighlight folder.


##3. Google Code Prettify

[Google Code Prettify](https://github.com/google/code-prettify) is a Javascript library that enables syntax highlightning for several
different languages on Internet pages.

The SARL style is available on [GitHub](https://raw.githubusercontent.com/sarl/sarl/master/formatting-styles/gtk/sarl.lang)

For using the SARL style, you should:

* copy the SARL style into the same folder as the Google Code Prettify script; and
* Use the CSS classes `prettyprint lang-sarl` each time you want to render a SARL code into your HTML pages.


##4. Gtk Source View

[Gtk Source View](https://wiki.gnome.org/Projects/GtkSourceView) is the core library that is used by the Gnome tools, including Gedit,
for doing syntax highlightning.

The SARL style is available on [GitHub](https://raw.githubusercontent.com/sarl/sarl/master/formatting-styles/prettify/lang-sarl.js)

For using the SARL style, you should:

* copy the SARL style into the folder `$HOME/.local/share/gtksourceview-3.0/language-specs/`.


##5. LaTeX

LaTeX is a powerfull wordprocessor that is able to create documents such as books, presentations...


###5.1. Standard LaTeX Style

LaTeX may uses different extensions (packages) for rnedering algorithms and source code.
The SARL styles for LaTeX are based on the LaTeX [listings package](https://www.ctan.org/pkg/listings).

Two versions of the SARL style for LaTeX are available:

* [Monochrom](https://raw.githubusercontent.com/sarl/sarl/master/formatting-styles/latex/sarl-listing.sty) (no coloring), and
* [Colorized](https://raw.githubusercontent.com/sarl/sarl/master/formatting-styles/latex/sarl-colorized-listing.sty).

For using the SARL styles, you should:

* download the SARL style;
* copy the file into `$HOME/texmf/`.


###5.2. LaTeX Beamer

The [LaTeX Beamer](https://www.ctan.org/tex-archive/macros/latex/contrib/beamer) can be used for pro­duc­ing slides.
The SARL style for LaTeX Beamer is based on the LaTeX [listings package](https://www.ctan.org/pkg/listings) and one the predefined color templates from Beamer.

The SARL style is available on [GitHub](https://raw.githubusercontent.com/sarl/sarl/master/formatting-styles/latex/sarl-beamer-listing.sty)

For using the SARL style, you should:

* download the SARL style;
* copy the file into `$HOME/texmf/`.


##6. Pygments

[Pygments](http://pygments.org) is a Python generic syntax highlighter suitable for use in code hosting, forums, wikis or other applications that need to prettify source code.

The SARL style is available on [GitHub](https://github.com/sarl/sarl/tree/master/formatting-styles/pygments/)

For installing the SARL style, you should:

* download all the files from the previous URL;
* open a command-line shell;
* go into the folder where your have downloaded the `setup.py` script;
* call: `python setup.py install`


##7. Sublime Text Editor

[Sublime Text Editor](https://www.sublimetext.com/) is a sophisticated text editor for code and markup.
This editor uses the TextMate language syntax.

The SARL style is available on [GitHub](https://raw.githubusercontent.com/sarl/sarl/master/formatting-styles/textmate/sarl.tmLanguage)

For using the SARL style, you should:

* copy the SARL style into the folder `$HOME/.config/sublime-text-3/Packages/User/SARL/`.


##8. TextMate Editor

[TextMate Editor](https://macromates.com/) is a sophisticated text editor for MacOS platforms.

The SARL style is available on [GitHub](https://raw.githubusercontent.com/sarl/sarl/master/formatting-styles/textmate/sarl.tmLanguage)


##9. Vim Editor

[Vim Editor](http://www.vim.org/) is is a highly configurable text editor built to make creating and
changing any kind of text very efficient.

The SARL style is available on [GitHub](https://raw.githubusercontent.com/sarl/sarl/master/formatting-styles/vim/sarl.vim)

For using the SARL style, you should:

* copy the SARL style into the folder `$HOME/.vim/ftdetect`.



##10. Legal Notice

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.6
* Status: Draft Release
* Release: 2017-08-31

> Copyright &copy; 2014-2017 [the original authors or authors](http://www.sarl.io/about/index.html).
>
> Licensed under the Apache License, Version 2.0;
> you may not use this file except in compliance with the License.
> You may obtain a copy of the [License](http://www.apache.org/licenses/LICENSE-2.0).
>
> You are free to reproduce the content of this page on copyleft websites such as Wikipedia.

<small>Generated with the translator io.sarl.maven.docs.generator 0.6.0-SNAPSHOT.</small>