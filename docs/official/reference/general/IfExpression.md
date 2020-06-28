---
title: "If-Then-Else Expressions"
layout: default
---

# If-Then-Else Expressions


<ul class="page_outline" id="page_outline">

<li><a href="#1-standard-if-then-else-syntax">1. Standard If-Then-Else Syntax</a></li>
<li><a href="#2-optional-else-part">2. Optional Else Part</a></li>
<li><a href="#3-conditional-operator">3. Conditional Operator</a></li>
<li><a href="#4-acknowledgements">4. Acknowledgements</a></li>
<li><a href="#5-legal-notice">5. Legal Notice</a></li>

</ul>


An if-expression is used to choose between two different values based on a predicate.


## 1. Standard If-Then-Else Syntax

The following results in either the value e1 or e2 depending on whether the predicate e1 !== null evaluates to
`true` or `false`.

```sarl
if (e1 !== null) 
	e1
else
	e2
```



## 2. Optional Else Part

The else part is optional, which is a shorthand for an else branch that returns the
default value of the current type.

```sarl
if (e1 !== null) e1
```


## 3. Conditional Operator

Sometimes, it is useful to put a if-then-else expression inside another expression.
This syntax is known as the [conditional operator, inline if, or ternary if](https://en.wikipedia.org/wiki/%3F:)
in many programming languages.
In programming languages such as Java or C/C++, this conditional operator has the syntax:

```java
a ? b : c
```

It evaluates to `b` if the value of `a` is true, otherwise to `c`.

In SARL, this specific syntax is not supported. The standard if-then-else expression (explained above) is
an expression. It means that it could be included into another expression like all the other expressions.
Consequently, there is no need of a specific syntax for the conditional operator in SARL.
The following example is the SARL equivelant of the Java conditional operator:

```sarl
if (a) b else c
```



You can use `if` expressions deeply nested within expressions:

```sarl
val name = if (e1 !== null) e1 + ' ' + e2 else e2
```



## 4. Acknowledgements

This documentation is inspired by the documentations from the
[Xtext](https://www.eclipse.org/Xtext/documentation.html) and
[Xtend](https://www.eclipse.org/xtend/documentation.html) projects.

## 5. Legal Notice

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.12
* Status: Draft Release
* Release: 2020-06-28

> Copyright &copy; 2014-2020 [the original authors or authors](http://www.sarl.io/about/index.html).
>
> Licensed under the Apache License, Version 2.0;
> you may not use this file except in compliance with the License.
> You may obtain a copy of the [License](http://www.apache.org/licenses/LICENSE-2.0).
>
> You are free to reproduce the content of this page on copyleft websites such as Wikipedia.

<small>Generated with the translator io.sarl.maven.docs.generator 0.12.0-SNAPSHOT.</small>