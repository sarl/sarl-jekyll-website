---
title: "API Documentation for SARL"
layout: default
---

# API Documentation for SARL


<ul class="page_outline" id="page_outline">

<li><a href="#1-doclet-for-sarl">1. Doclet for SARL</a></li>
<li><a href="#2-maven-generation">2. Maven Generation</a></li>
<li><a href="#3-command-line-generation">3. Command-Line Generation</a></li>
<li><a href="#4-specific-options-of-the-sarl-doclet">4. Specific Options of the SARL Doclet</a></li>
<ul>
  <li><a href="#41-doclet-options">4.1. Doclet Options</a></li>
  <li><a href="#42-exclude-elements-from-the-documentation">4.2. Exclude elements from the documentation</a></li>
</ul>
<li><a href="#5-legal-notice">5. Legal Notice</a></li>

</ul>


Good API documentation is one of the many factors contributing to the overall success of a software project.
Fortunately, SARL provide a tool for generating API documentation from comments present in the source code.

Because the SARL compiler generates Java code, the SARL documentation tool is based 
on the famous [Javadoc tool](https://docs.oracle.com/javase/9/javadoc/javadoc-command.htm).
Javadoc is a documentation generator created by Sun Microsystems (now Oracle) for the
Java language for generating API documentation in HTML format from Java
source code. The HTML format is used for adding the convenience of being able to hyperlink related documents together.

The ["doc comments" format](https://www.oracle.com/technetwork/articles/java/index-137868.html) used by
Javadoc is the de facto industry standard for documenting Java classes. SARL uses the 
same standard format.

Documentation does not affect performance in neither in SARL not Java as all comments are removed at compilation time. Writing
comments and documentation is for better understanding the code and thus better maintaining it.

## 1. Doclet for SARL

Javadoc also provides an API for creating doclets and taglets, which allows users to analyze the
structure of an application. This enables to generate specific documentation pages.

SARL comes with a specific doclet that replaces all the elements written with the Java syntax 
by their equivalent into the SARL syntax.
The SARL doclet is provided into the Maven module:

* Group Id: `io.sarl.docs`
* Artifact Id: `io.sarl.docs.doclet`

See the next sections for details on the usage of the SARL doclet.


## 2. Maven Generation

The Maven Javadoc Plugin uses the Javadoc tool to generate documentation for the specified project.
The Maven Javadoc Plugin gets the parameter values that will be used from the plugin configuration
specified in the POM file.

To generate output from an alternate doclet, add configuration similar to the following to your POM 
file.

```xml
<build>
    <plugins>
        <plugin>
            <groupId>org.apache.maven.plugins</groupId>
            <artifactId>maven-javadoc-plugin</artifactId>

            <configuration>
                <doclet>io.sarl.docs.doclet.SarlDoclet</doclet>
                <docletArtifact>
                    <groupId>io.sarl.docs</groupId>
                    <artifactId>io.sarl.docs.doclet</artifactId>
                    <version>${sarl.version}</version>
                </docletArtifact>
            </configuration>
        </plugin>
    </plugins>
</build>
```

## 3. Command-Line Generation

As described into the [Javadoc documentation](https://docs.oracle.com/javase/9/javadoc/javadoc-command.htm),
the javadoc command has options for doclets. 
The Javadoc command provides `-doclet` option for specifying a custom doclet.

A typical command-line to launch is:

```
javadoc -doclet io.sarl.docs.doclet.SarlDoclet
        -cp doclet-0.12.jar:path_to_sources
        -source 1.8
        -sourcepath path_to_sources
        -d path_to_documentation
```

In order to use the SARL doclet, you have to specific the name of the doclet with the `-doclet`.
You must also include the SARL doclet binary file into the class path with the `-cp`.
In the example above, the name of the SARL doclet's jar file is `doclet-[:sarl.specification.release_version!].jar`.


## 4. Specific Options of the SARL Doclet

The SARL doclet provides specific options that may be used into the documentation text 
itself, or from the command-line.

### 4.1. Doclet Options

The SARL doclet has the same options as the [Standard doclet](https://docs.oracle.com/javase/9/javadoc/javadoc-command.htm#JSJAV-GUID-F9E5D57D-5A94-4043-A010-B24511A7BAB2).

### 4.2. Exclude elements from the documentation

It is possible to exclude elements from the documentation by adding the `@ExcludeFromApidoc` 
into the SARL documentation. For example:

```
/** This is an example of excluded documentation.
 *
 * @ExcludeFromApidoc
 */
class TheClass {
}
```



## 5. Legal Notice

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.12
* Status: Draft Release
* Release: 2020-07-18

> Copyright &copy; 2014-2020 [the original authors or authors](http://www.sarl.io/about/index.html).
>
> Licensed under the Apache License, Version 2.0;
> you may not use this file except in compliance with the License.
> You may obtain a copy of the [License](http://www.apache.org/licenses/LICENSE-2.0).
>
> You are free to reproduce the content of this page on copyleft websites such as Wikipedia.

<small>Generated with the translator io.sarl.maven.docs.generator 0.12.0-SNAPSHOT.</small>