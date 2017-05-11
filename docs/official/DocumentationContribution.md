---
title: "Specific Markdown Format for the Documentation"
layout: default
---

# Specific Markdown Format for the Documentation


<ul class="page_outline" id="page_outline">

<li><a href="#1-extra-macros">1. Extra Macros</a></li>
<ul>
  <li><a href="#1-1-compile-a-sarl-code-with-success">1.1. Compile a SARL code with success</a></li>
  <li><a href="#1-2-compile-a-sarl-code-with-expected-errors">1.2. Compile a SARL code with expected errors</a></li>
  <li><a href="#1-3-changing-the-visibility-of-the-sarl-code">1.3. Changing the visibility of the SARL code</a></li>
  <li><a href="#1-4-evaluating-a-sarl-expression">1.4. Evaluating a SARL expression</a></li>
  <li><a href="#1-5-capture-sarl-code-into-the-documentation">1.5. Capture SARL code into the documentation</a></li>
  <li><a href="#1-6-dynamic-generation-of-the-markdown-text">1.6. Dynamic generation of the Markdown text</a></li>
  <li><a href="#1-7-generate-code-from-java-type">1.7. Generate code from Java type</a></li>
  <li><a href="#1-8-generating-an-outline">1.8. Generating an Outline</a></li>
</ul>
<li><a href="#2-syntax-extensions">2. Syntax Extensions</a></li>
<ul>
  <li><a href="#2-1-changing-the-characters-for-enclosing-the-macro-parameter">2.1. Changing the characters for enclosing the macro parameter</a></li>
  <li><a href="#2-2-comments-in-the-file">2.2. Comments in the file</a></li>
</ul>
<li><a href="#3-maven-tool-for-generating-the-documentation">3. Maven Tool for Generating the Documentation</a></li>
<li><a href="#4-legal-notice">4. Legal Notice</a></li>

</ul>


The SARL documentation is built from a collection of [Markdown](https://fr.wikipedia.org/wiki/Markdown) files that may contain
additional macros in order to validate the content of the documentation.

The Mardown support is extended in order to:

1. check if a SARL code is compiling or not;
2. check if SARL expression could be interpreted to a valid value;
3. copy and paste virtually pieces of SARL code into the text;
4. check if the links are pointing to existing local files;
5. check if the reference to the local images are pointing to existing files.

##1. Extra Macros

###1.1. Compile a SARL code with success

For compiling a SARL code, and failing the validation if it cannot be compiled with success, you may use the `Success` macro:


```text
[:Success:]
	type your SARL code here.
[:End:]
``` 


Any piece of text in this macro, i.e. between `Success` and `End` is assumed to be a SARL code, except the other macros
explained in this documentation.

The SARL code inside this macro is not rendered into the final Markdown document.
If you want to render a part of the code, you should use the `On` macro (see below).


###1.2. Compile a SARL code with expected errors

For compiling a SARL code, and failing the validation if it can be compiled with success, you may use the `Failure` macro:


```text
[:Failure:]
	type your SARL code here.
[:End:]
```


Any piece of text in this macro, i.e. between `Success` and `End`  is assumed to be a SARL code, except the other macros
explained in this documentation.

The SARL code inside this macro is not rendered into the final Markdown document.
If you want to render a part of the code, you should use the `On` macro (see below).


###1.3. Changing the visibility of the SARL code

With two previous macros, i.e. `Success` and `Failure`, the SARL code is not put into the final Markdown document by default.
In order to output a part of the SARL code, you should manually turn on the rendering of the code with the `On` macro.
Turning off the visibility flag could be done with the `Off` macro.

The following example gives you the general syntax of the two macros: 


```text
[:Success:]
	this part of the code is invisible
	[:On]
	this part of the code is visible
	[:Off]
	this part of the code is invisible again 
[:End:] 
```


###1.4. Evaluating a SARL expression

Several validation may need to interpret and evaluate a SARL expression. The `Fact` macro takes a parameter that is a valid SARL
expression. This expression is interpreted and the result is evaluated.


```text
[:Fact:](expression)
```


The `Fact` macro is succeeding is the expression is evaluated to:

1. a boolean value that is equal to `true`, or
2. an object instance that is not `null`.


###1.5. Capture SARL code into the documentation

Many times, a part of the SARL code is mentionned in the documentation text. In order to have the same value in
the code itself and in the documentation text, you could use the copying and referencing macros.

For saving a piece of the SARL code, you should use the macro `[:id](value)`, where
`id` is a name that you should give to the saved value (only alphnumerical and dot characters are allowed).
The `value` is the text to capture.

For putting back in the text the captured text, you should use the macro `[:id:]`, with
the `id` is the name of the captured value. This macro put the saved text inside a Markdown code environment.

If the given `id` is not associated to a captured value, the parser will search for an environment property that has its name
equals to the `id`.

If you want to avoid the generation of a Markdown block around the captured text, you should use the syntax:


```text
[:my.id.without.code.block!]
```


This protection is implicit in the parameters and the content of the other macros that are described on this page.


###1.6. Dynamic generation of the Markdown text

Sometimes, it is useful to create the Markdown text via a script in order to introduce dynamic building of the documentation.
The following macro provides you the ability to run a SARL script for generating the documentation.


```text
[:Dynamic:](expression)
```


The `Dynamic` macro is supposed to replies a value that could be interpreted as a string of characters.
The given string of characters will replace the `Dynamic` macro into the generated Markdown text.


###1.7. Generate code from Java type

You could generate a piece of code from a Java type with the following macro:


```text
[:ShowType:](typename)
```



This macro extracts the type definition with the reflection mechanism for the given `typename`.
The output of this macro is a formatted SARL code that corresponds to the extracted information.


###1.8. Generating an Outline

By default, Markdown does not include a specific tag for generating the outline.
If you put the `Outline` macro, it will be replaced by a generated outline.


```text
[:Outline:]
```



The section headings will be updating with a section number.


##2. Syntax Extensions

###2.1. Changing the characters for enclosing the macro parameter

Several of the macros above take a parameter. Sometimes the characters `(` and `)` are not suitable for enclosing a parameter
value because the `)` character is inside the value.

In order to enable you to put a special character in a parameter value, you are able to change the characters for enclosing
the parameter values. The accepted characters are:

* `( value )`
* `{ value }`
* `| value |`
* `$ value $`


###2.2. Comments in the file

Any text enclosing by `&lt;!---` and `--&gt;` is assumed to be a comment that should not appear in the generated files.

Note that the standard HTML comments are still copied into the generated files.


##3. Maven Tool for Generating the Documentation

The parser that is supporting the macros above is provided in a Maven plugin. You may create a Maven project with the following
configuration:

```xml
<dependencies>
	<dependency>
		<groupId>io.sarl.maven</groupId>
		<artifactId>io.sarl.maven.docs.testing</artifactId>
	</dependency>
</dependencies>

<build>
	<plugins>
		<plugin>
			<groupId>io.sarl.maven</groupId>
			<artifactId>io.sarl.maven.docs.generator</artifactId>
			<extensions>true</extensions>
			<executions>
				<execution>
					<id>mytests-initialize</id>
					<goals>
						<goal>initialize</goal>
					</goals>
					<phase>initialize</phase>
				</execution>
				<execution>
					<id>mytests-generate</id>
					<goals>
						<goal>generate</goal>
					</goals>
					<phase>compile</phase>
				</execution>
				<execution>
					<id>mytests-validate</id>
					<goals>
						<goal>generatetests</goal>
					</goals>
					<phase>generate-test-sources</phase>
				</execution>
			</executions>
		</plugin>
	</plugins>
</build>
```

By default, the Markdown code should be in the `src/main/documentation` folder.
The other resources, such as images should be in the `src/main/resources` folder.


##4. Legal Notice

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.6
* Status: Draft Release
* Release: 2017-05-11

> Copyright &copy; 2014-2017 [the original authors or authors](http://www.sarl.io/about/index.html).
>
> Licensed under the Apache License, Version 2.0;
> you may not use this file except in compliance with the License.
> You may obtain a copy of the [License](http://www.apache.org/licenses/LICENSE-2.0).
>
> You are free to reproduce the content of this page on copyleft websites such as Wikipedia.

<small>Generated with the translator io.sarl.maven.docs.generator 0.6.0-SNAPSHOT.</small>