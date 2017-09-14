---
title: "Variable and Field Declaration"
layout: default
---

# Variable and Field Declaration


<ul class="page_outline" id="page_outline">

<li><a href="#1-variable-vs-value-declaration">1. Variable vs. Value Declaration</a></li>
<li><a href="#2-typing">2. Typing</a></li>
<li><a href="#3-implicit-variables-this-and-it">3. Implicit Variables: this and it</a></li>
<li><a href="#4-acknowledgements">4. Acknowledgements</a></li>
<li><a href="#5-legal-notice">5. Legal Notice</a></li>

</ul>


Variables and fields can be declared in SARL. To declare a variable or a field, you must specify if it is a value or a
variable (see below for details), its name, and optionally its type and its initial value.

The variable/value declaration follows the syntax:

		var NAME [: TYPE] [= INITIAL VALUE]
		val NAME [: TYPE] [= INITIAL VALUE]

Shadowing variables from outer scopes is not allowed, the only exception is the implicit variable `it`.


##1. Variable vs. Value Declaration

A variable declaration starting with the keyword `val` denotes a value, which is essentially a final, unsettable variable.



The variable needs to be declared with the keyword `var`, which stands for 'variable', if its value can change.



Variables declared outside a lambda expression using the `var` or `val` keyword are accessible from within the
lambda expressions.



Fields declared outside a lambda expression using the `var` keyword or the `val` keyword are
accessible from within the lambda expressions.




##2. Typing

The type of the variable itself can either be explicitly declared or it can be inferred from the initializer expression.

In the following example, the type of the variable is explicitly given:

```sarl
var a : String = "abc"
```


In the following example, the type of the variable is inferred to `String`:

```sarl
var a = "abc"
```



##3. Implicit Variables: this and it

Like in Java the current object is bound to the keyword `this`. This allows for implicit field access or method invocations.

You can use the variable name `it` to get the same behavior for any variable or parameter.
Moreover, the variable `it` is allowed to be shadowed. This is especially useful when used together with lambda
expressions.

When you type a name that doesn't resolve to a variable in the local scope, the compiler tries to find a field
with the same name on the `it` object, then in the `this` object.



##4. Acknowledgements

This documentation is inspired by the documentations from the
[Xtext](https://www.eclipse.org/Xtext/documentation.html) and
[Xtend](https://www.eclipse.org/xtend/documentation.html) projects.

##5. Legal Notice

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.6
* Status: Stable Release
* Release: 2017-09-14

> Copyright &copy; 2014-2017 [the original authors or authors](http://www.sarl.io/about/index.html).
>
> Licensed under the Apache License, Version 2.0;
> you may not use this file except in compliance with the License.
> You may obtain a copy of the [License](http://www.apache.org/licenses/LICENSE-2.0).
>
> You are free to reproduce the content of this page on copyleft websites such as Wikipedia.

<small>Generated with the translator io.sarl.maven.docs.generator 0.6.0.</small>