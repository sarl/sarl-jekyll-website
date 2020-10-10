---
title: "General Syntax Reference"
layout: default
---

# General Syntax Reference


<ul class="page_outline" id="page_outline">

<li><a href="#1-java-interoperability">1. Java Interoperability</a></li>
<li><a href="#2-name-syntax">2. Name Syntax</a></li>
<li><a href="#3-statement-syntax">3. Statement Syntax</a></li>
<li><a href="#4-details-on-the-sarl-language-elements">4. Details on the SARL language elements</a></li>
<li><a href="#5-acknowledgements">5. Acknowledgements</a></li>
<li><a href="#6-legal-notice">6. Legal Notice</a></li>

</ul>


This document describes the general syntax of the SARL Language. 


## 1. Java Interoperability

SARL, like Java, is a statically typed language. In fact, it completely supports 
Java's type system, including the primitive types like _int_ or _boolean_, 
arrays and all the Java classes, interfaces, enumerations and annotations that reside 
on the class path.

Java generic types are fully supported as well: you can define type parameters on 
methods and classes and pass type arguments to generic types just as you are 
used to from Java. The type system and its conformance and casting rules are 
implemented as defined in the
[Java Language Specification](https://docs.oracle.com/javase/specs/jls/se8/html/).

One of the problems with Java is that you are forced to write type signatures 
over and over again. That is why so many people do not like static typing. 
But this is in fact not a problem of static typing, but simply a problem with 
Java. Although SARL is statically typed just like Java, you rarely have to 
write types down because they can be computed from the context.

In addition to Java's auto-boxing to convert primitives to their corresponding wrapper 
types (e.g. _int_ is automatically converted to _Integer_ when needed), there are 
additional conversion rules in SARL: arrays are automatically converted to
`List<ComponentType>` and vice versa.



Resembling and supporting every aspect of Java's type system ensures that there is 
no impedance mismatch between Java and SARL. __This means that SARL and Java are 
100% interoperable__. There are no exceptional cases and you do not have to 
think in two worlds. You can invoke SARL code from Java and vice versa without any
surprises or hassles.	


## 2. Name Syntax

In SARL, the names of the features (agents, variables, fields, etc.)
cannot be one of the keywords of SARL or Java.
For example, since `event` is a keyword in SARL, the following is illegal:

```sarl
import io.sarl.event.ActionEvent
```


To solve this problem (since some names come from Java, and
this language has different keywords than SARL), it
is possible to prefix the name fragment with the character `^`:

```sarl
import io.sarl.^event.ActionEvent
```



## 3. Statement Syntax

In SARL, statements are instructions that will be executed.
A statement may be one of the elements described in the rest of this document.

As compared to programming languages as Java and C++, there is no need to terminate
a statement with the `;` character.
Use of this statement terminator is optional, and used if you want to
put multiple statements on a line. To continue a statement on the next
line, you end the line with the `\` character.

For instance, the two following lines are equivalent:

```sarl
var myVariable : int = 5
```



```sarl
var myVariable : int = 5;
```



## 4. Details on the SARL language elements

In the following pages, you could find details on the different elements of the SARL syntax:

* Structural elements;
	* [Script format](./general/Script.html)
	* [Function declaration](./general/FuncDecls.html)
	* [Synthetic Functions](./general/SyntheticFunctions.html)
* Type system:
	* [Supported Types for Variables and Parameters](./general/Types.html)
* Constant expressions:
	* [Numerical, string, and collection literals](./general/Literals.html)
* Structuring expressions:
	* [Block expression](./general/Block.html)
	* [If-then-else expression](./general/IfExpression.html)
	* [Switch expression](./general/SwitchExpression.html)
	* [Loops](./general/LoopExpression.html)
	* [Lambda expressions](./general/Lambda.html)
* Standard expressions:
	* [Variable and attribute declarations](./general/VarDecls.html)
	* [Operators](./general/Operators.html)
	* [Type casting](./general/Cast.html)
	* [Access to object members](./general/MemberAccess.html)
	* [Extension methods](./general/Extension.html)
	* [Synchronization expression](./general/Synchronization.html)
* Errors and exceptions:
	* [Exceptions](./general/Exception.html)
	* [Assertions](./general/Assertion.html)
* Meta-programming:
	* [Active annotations](./general/ActiveAnnotations.html)



## 5. Acknowledgements

This documentation is inspired by the documentations from the
[Xtext](https://www.eclipse.org/Xtext/documentation.html) and
[Xtend](https://www.eclipse.org/xtend/documentation.html) projects.

## 6. Legal Notice

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.12
* Status: Draft Release
* Release: 2020-10-10

> Copyright &copy; 2014-2020 [the original authors or authors](http://www.sarl.io/about/index.html).
>
> Licensed under the Apache License, Version 2.0;
> you may not use this file except in compliance with the License.
> You may obtain a copy of the [License](http://www.apache.org/licenses/LICENSE-2.0).
>
> You are free to reproduce the content of this page on copyleft websites such as Wikipedia.

<small>Generated with the translator io.sarl.maven.docs.generator 0.12.0-SNAPSHOT.</small>