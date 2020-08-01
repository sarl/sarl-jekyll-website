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

## 1. Usage

The `sarlc` tool takes arguments:


	sarlc [OPTIONS] <source folder>...


The `sarlc` tool takes at least one `source folder` from which the SARL files are read.

You could change the behavior of the `sarlc` compiler with the command-line options.
For obtaining a list of the options, type:

	sarlc -h


## 2. Command-Line Options

The complete list of the options is:



| Option | Description |
| ------ | ----------- |
| -b path<br>--boot-classpath=path | Cross-compiles against the specified set of boot classes. As with the user class path, boot class path entries are separated by colons (:) and can be directories, JAR archives, or ZIP archives. |
| --classpath=path | Specifies where to find user class files, and source files. This class path overrides the user class path in the SARLC_CLASSPATH environment variable. If neither SARLC_CLASSPATH, --cp nor --classpath is specified, then the user class path is built upon the source folders, the generated file folders, and the standard SARL libraries. If a user class path is specified, it must contains the the user libraries and the standard SARL libraries. |
| --config=yaml_location | Specifies YAML config location, which can be a file path or a URL. |
| --cp=path | Specifies where to find user class files, and source files. This class path overrides the user class path in the SARLC_CLASSPATH environment variable. If neither SARLC_CLASSPATH, --cp nor --classpath is specified, then the user class path is built upon the source folders, the generated file folders, and the standard SARL libraries. If a user class path is specified, it must contains the the user libraries and the standard SARL libraries. |
| -d directory_name<br>--directory=directory_name | Sets the destination directory for Java source files that are generated from the SARL files. The directory must already exist because sarlc does not create it. If a SARL declaration is part of a package, then sarlc puts the Java source file in a subdirectory that reflects the package name and creates directories as needed. If the --directory option is not specified, then sarlc assumes src/main/generated-sources/sarl. |
| -e [encoding]<br>--encoding[=encoding] | Sets the source file encoding name, such as EUC-JP and UTF-8. If the --encoding option is not specified, then the platform default converter is used. |
| --generate-clones[=true&#124;false] | Specifies if the clone functions should be generated; default is true. |
| --generate-equality-tests[=true&#124;false] | Specifies if the equality tests should be generated; default is true. |
| --generate-inlines[=true&#124;false] | Specifies if the @Inline annotations should be generated; default is false. |
| --generate-pures[=true&#124;false] | Specifies if the @Pure annotations should be generated; default is true. |
| --generate-serials[=true&#124;false] | Specifies if the serial identifiers should be generated; default is true. |
| --generate-tostring[=true&#124;false] | Specifies if the toString functions should be generated; default is true. |
| --generatemarkdownhelp | Prints the list of the command-line options using a Markdown table. |
| --generator=identifiers | Enables extra-language generators. The parameter is a list of identifiers of the generators to turn on, separated by ':'. See the option -G for printing out the list of the available generators. |
| -h<br>--help | Prints this message. |
| -H<br>--help-config | Prints information about application modules and their configuration options. |
| --java-compiler[=none&#124;ecj&#124;javac] | Specifies the Java compiler to be run; default is ecj. |
| --java-source[=version] | Specifies the Java version of the Java source code that is accepted, and of the Java class files for targeting a specific release of the Java virtual machine. Java class files will run on the specified target and on later releases, but not on earlier releases of the Java virtual machine. Provided version must be greater than or equal to 1.8, and strictly lower than 12. |
| --json | When present, the output of the configuration has the Json format. |
| -l level<br>--log=level | Specifies where to find user class files, and source files. This class path overrides the user class path in the LOG_LEVEL environment variable. If neither LOG_LEVEL, --log nor --{2} is specified, then the user class path is built upon the current folder. If a user class path is specified, it must contains the the user libraries and the standard SARL libraries. |
| -o directory_name<br>--outputdir=directory_name | Sets the destination directory for class files. The directory must already exist because sarlc does not create it. If a class is part of a package, then sarlc puts the class file in a subdirectory that reflects the package name and creates directories as needed. If the --outputdir option is not specified, then sarlc assumes target/classes. |
| -G<br>--print-generators | Prints the list of the available extra-language generators. |
| -C<br>--printconfig | Print the current configuration. The output format is Yaml by default. See --json for a Json output, and --xml for a XML output. |
| -p [val]<br>--progress[=val] | Prints the progress bar on the console. |
| -t directory_name<br>--tempdir=directory_name | Directory in which the temporary files will be generated during the compilation process. |
| -v<br>--version | Prints release information. |
| --wall | Specifies if all the warnings are printed out. |
| --werror | Terminates compilation when warnings occur. |
| --wnone | Specifies if all the warnings are ignored. |
| --write-storages[=true&#124;false] | Specifies if the storage files should be generated; default is true. |
| --write-traces[=true&#124;false] | Specifies if the trace files should be generated; default is true. |
| -x<br>--xml | When present, the output of the configuration has the XML format. |



## 3. Legal Notice

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.12
* Status: Draft Release
* Release: 2020-08-01

> Copyright &copy; 2014-2020 [the original authors or authors](http://www.sarl.io/about/index.html).
>
> Licensed under the Apache License, Version 2.0;
> you may not use this file except in compliance with the License.
> You may obtain a copy of the [License](http://www.apache.org/licenses/LICENSE-2.0).
>
> You are free to reproduce the content of this page on copyleft websites such as Wikipedia.

<small>Generated with the translator io.sarl.maven.docs.generator 0.12.0-SNAPSHOT.</small>