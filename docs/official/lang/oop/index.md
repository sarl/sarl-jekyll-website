---
title: "Basic Object-Oriented Programming Support with SARL"
layout: default
---

# Basic Object-Oriented Programming Support with SARL


<ul class="page_outline" id="page_outline">

<li><a href="#1-comparison-between-sarl-and-other-languages">1. Comparison between SARL and Other Languages</a></li>
<li><a href="#2-key-features-for-object-oriented-programming">2. Key Features for Object-Oriented Programming</a></li>
<ul>
  <li><a href="#21-classes">2.1. Classes</a></li>
  <li><a href="#22-anonymous-classes">2.2. Anonymous Classes</a></li>
  <li><a href="#23-interfaces">2.3. Interfaces</a></li>
  <li><a href="#24-enumerations">2.4. Enumerations</a></li>
  <li><a href="#25-annotation-types">2.5. Annotation Types</a></li>
  <li><a href="#26-modifiers">2.6. Modifiers</a></li>
</ul>
<li><a href="#3-references">3. References</a></li>
<li><a href="#4-version-specification">4. Version Specification</a></li>
<li><a href="#5-legal-notice">5. Legal Notice</a></li>

</ul>


SARL enables to declare objects with an object-oriented programming approach for convenience to develop complex programs, i.e.
the SARL developer must not learn another language such as Java for programming the objects that are used within the
SARL program.
Because of this convenience, the support of object-oriented programming may be less complete than in main stream object programming
languages.
 
This document describes the basic support of object-oriented programming provided by SARL.
Before reading this document, we recommend that you read
the [Expression Syntax Reference](../expr/index.html).

The support of the object-oriented programming (OOP) statements in SARL is less complete
than a real object-oriented language such as Java.
The basics of OOP are enabled in the SARL scripts. If you need more complex or more
complete support of the OOP, you should use a dedicated language, such as Java,
[Xtend](https://eclipse.org/xtend/), or [Scala](http://www.scala-lang.org/).

<p markdown="1"><span class="label label-info">Note</span> The SARL Eclipse product includes the tools for programming with the Java and Xtend languages.</p>


## 1. Comparison between SARL and Other Languages

A comparison between SARL and other programming languages could be found [here](../Comparison.html).

## 2. Key Features for Object-Oriented Programming

The SARL language is designed with a set of object-oriented features that enable developers to create modular, reusable, and scalable applications. This introduction covers the fundamental object-oriented concepts supported by SARL.

### 2.1. Classes

Classes are the cornerstone of object-oriented programming in SARL. They serve as blueprints for creating objects and define the structure and behavior that the objects instantiated from the class will have.

For more detailed information, refer to the [Class documentation](./Class.html).

### 2.2. Anonymous Classes

Anonymous classes in SARL allow you to define and instantiate a class at the same time, without giving it a name. They are useful for creating one-off implementations of interfaces or extensions of classes.

For more detailed information, refer to the [Anonymous Class documentation](./AnonymousClass.html).

### 2.3. Interfaces

Interfaces in SARL define contracts that classes can implement. They specify what methods a class must have, without dictating how those methods should be implemented.

For more detailed information, refer to the [Interface documentation](./Interface.html).

### 2.4. Enumerations

Enumerations (enums) in SARL provide a way to define a set of named constants, making code more readable and type-safe.

For more detailed information, refer to the [Enumeration documentation](./Enumeration.html).

### 2.5. Annotation Types

Annotations in SARL provide metadata about the code that can be used by compilers, development tools, or runtime environments. They do not directly affect the code they annotate but add an extra layer of information.

For more detailed information, refer to the [Annotation Type documentation](./AnnotationType.html).

### 2.6. Modifiers

Modifiers in SARL are keywords that can be applied to classes, methods, and fields to alter their accessibility and behavior.
For more detailed information, refer to the [Modifiers documentation](./Modifiers.html).


## 3. References

This documentation is based on documentations from the Xtext and Xtend projects, and from the Java tutorials.
Thank you to the contributors to these documents.

* [Xtend](https://www.eclipse.org/xtend/documentation.html)
* [Xtext](https://www.eclipse.org/Xtext/documentation.html)
* [Java Tutorials](https://docs.oracle.com/javase/tutorial/)

## 4. Version Specification

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.15
* Status: Stable Release
* Release: 2025-09-10

## 5. Legal Notice

> Copyright &copy; 2014-2025 [SARL.io, the Original Authors and Main Authors](http://www.sarl.io/about/index.html).
>
> Documentation text and medias are licensed under the Creative Common CC-BY-SA-4.0;
> you may not use this file except in compliance with CC-BY-SA-4.0.
> You may obtain a copy of [CC-BY-4.0](https://creativecommons.org/licenses/by-sa/4.0/deed.en).
>
> Examples of SARL code are licensed under the Apache License, Version 2.0;
> you may not use this file except in compliance with the Apache License.
> You may obtain a copy of the [Apache License](http://www.apache.org/licenses/LICENSE-2.0).
>
> You are free to reproduce the content of this page on copyleft websites such as Wikipedia.

<small>Generated with the translator docs.generator 0.15.0.</small>
