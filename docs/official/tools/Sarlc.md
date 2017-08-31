---
title: "SARL Command-line Compiler"
layout: default
---

# SARL Command-line Compiler


<ul class="page_outline" id="page_outline">

<li><a href="#1-usage">1. Usage</a></li>
<li><a href="#2-command-line-options">2. Command-Line Options</a></li>
<li><a href="#3-legal-notice">3. Legal Notice</a></li>

</ul>




A command-line compiler is a tool that could be invoked from the command-line shell in order to compiler a language source file.
`sarlc` is the command-line compiler for the SARL language.

##1. Usage

The `sarlc` tool takes arguments:


	sarlc --dir <output folder> [OPTIONS] <source folder>...


The `output folder` is the name of the folder in which the generated Java files should be created by the SARL compiler.
The `sarlc` tool takes at least one `source folder` from which the SARL files are read.

You could change the behavior of the `sarlc` compiler with the command-line options.
For obtaining a list of the options, type:

	sarlc -help


##2. Command-Line Options

The complete list of the options is:



| Option | Description |
| ------ | ----------- |
| `-bp`, `--bootclasspath` | Specify where to find SARL compiler class files. &lt;arg&gt; is the boot classpath. |
| `-cp`, `--classpath` | Specify where to find user class files. &lt;arg&gt; is the classpath. |
| `-X`, `--debug` | Turn on the debugging logging. |
| `-d`, `--dir` | Specify where to place generated SARL files. &lt;arg&gt; is the output directory. |
| `-e`, `--encoding` | Specify character encoding used by source files. &lt;arg&gt; is the encoding name. |
| `-help` | Display the SARL compiler help. |
| `-inlines` | Generate inline annotations for the SARL code. &lt;arg&gt; is "true" or "false". |
| `-jc`, `--javac` | Run the Java compiler (ECL/JDT) after SARL on the all the Java source files. &lt;arg&gt; is "true" or "false". |
| `-jsv`, `--javaSourceVersion` | Create Java Source compatible to this version. &lt;arg&gt; is "true" or "false". |
| `-nowarn` | Disable warning messages. |
| `-q`, `--quiet` | Compiler is not verbose. Only errors are displayed. |
| `-td`, `--tempdir` | Temp directory to hold generated stubs and classes. &lt;arg&gt; is the temp directory. |
| `-v`, `--verbose` | Compiler will be more verbose. Verbosity is increased at each occurrence of this option. |
| `-version` | Display the version of the SARL compiler and the Java virtual machine. |
| `-w`, `--warn` | Change the level of a warning. &lt;arg&gt; is &lt;warningid&gt;=&lt;severity&gt;. Severity should be ign[ore], none, info[rmation], warn[ing], or err[or]. |
| `-werror` | Terminate compilation if warnings occur. |
| `-writestorages` | Write the storage files for faster access to SARL binary resources. &lt;arg&gt; is "true" or "false". |
| `-writetraces` | Write the trace files for SARL code for debugging and source exploration. &lt;arg&gt; is "true" or "false". |




##3. Legal Notice

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