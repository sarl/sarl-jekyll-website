---
title: "Variable and Field Declaration"
layout: default
---

# Variable and Field Declaration


<ul class="page_outline" id="page_outline">

<li><a href="#1-variable-vs-value-declaration">1. Variable vs. Value Declaration</a></li>
<li><a href="#2-typing">2. Typing</a></li>
<li><a href="#3-implicit-or-anaphoric-variables-this-super-it-and-occurrence">3. Implicit or Anaphoric Variables: this, super, it and occurrence</a></li>
<li><a href="#4-references">4. References</a></li>
<li><a href="#5-version-specification">5. Version Specification</a></li>
<li><a href="#6-legal-notice">6. Legal Notice</a></li>

</ul>


Variables and fields can be declared in SARL. To declare a variable or a field, you must specify if it is a value or a
variable (see below for details), its name, and optionally its type and its initial value.

The variable/value declaration follows the syntax:

```text
var NAME [: TYPE] [= INITIAL VALUE]
val NAME [: TYPE] [= INITIAL VALUE]
```

Shadowing variables from outer scopes is not allowed, the only exception is the implicit variable `it`.


## 1. Variable vs. Value Declaration

A variable declaration starting with the keyword `val` denotes a value, which is essentially a final, unsettable variable.




The variable needs to be declared with the keyword `var`, which stands for 'variable', if its value can change.




Variables declared outside a lambda expression using the `var` or `val` keyword are accessible from within the
lambda expressions.




Fields declared outside a lambda expression using the `var` keyword or the `val` keyword are
accessible from within the lambda expressions.




## 2. Typing

The type of the variable itself can either be explicitly declared or it can be inferred from the initializer expression.

In the following example, the type of the variable is explicitly given:

```sarl
var a : String = "abc"
```



In the following example, the type of the variable is inferred to `String`:

```sarl
var a = "abc"
```



## 3. Implicit or Anaphoric Variables: this, super, it and occurrence

In the domain of computer science and programming language theory, an [anaphoric macro or variable](https://en.wikipedia.org/wiki/Anaphoric_macro) refers to a linguistic construct that enables the implicit capture and reuse of intermediate computation results within an expression. The term anaphora originates from linguistics, where it denotes a word or phrase that refers back to a previously mentioned entity. In programming, this concept is adapted to allow a macro or variable to automatically bind to the result of a preceding computation, thereby reducing redundancy and enhancing expressiveness.
Anaphoric macros are most commonly associated with Lisp-family languages and domain-specific languages that support advanced macro systems.
The core characteristics of anaphoric variables are:

- **Implicit Binding:** The variable does not require explicit assignment; instead, it is bound to the result of the most recent relevant computation.
- **Lexical Scoping:** The binding is typically confined to the lexical scope of the variable use, ensuring referential transparency and avoiding unintended side effects.
- **Abstraction:** Anaphoric constructs abstract away repetitive patterns, such as repeatedly referencing the result of a function call or expression.


The following table describes the four anaphoric variables that are defined in SARL.


| Name of the implicit variable | Operational Semantic | Implicitly in naming scope w/ priority level |
|-------------------------------|----------------------|----------------------------------------------|
| `this`                        | Reference to the current instance of agent, behavior, skill, class or enumeration. The type of `this` is the type where it is mentionned in the code | Yes (2) |
| `super`                       | Reference to the current instance of agent, behavior, skill, class or enumeration. The type of `this` is the super-type of the type where it is mentionned in the code | Yes (3) |
| `it`                          | Reference to an object that depends on the current of usage in the code according to the concept of the [anamorphic macros or variables](https://en.wikipedia.org/wiki/Anaphoric_macro). To determine if `it` is defined at a specific locaiton in the code, you have to refer to the document of the enclosing features | Yes (1) |
| `occurrence`                  | Reference to the current instance of an event received by an agent, behavior or skill | No |



Like in Java the current object is bound to the keyword `this`. This allows for implicit field access or method invocations.
For example, in the following code, `this` represents the current agent instance in memory. Therefore, the code is changing the value of the agent's field `myvariable`. In this code, the type of `this` is `A`.

```sarl
agent A {
	var myvariable : int
	def action(value : int) {
		this.myvariable = value
	}
}
```



In the following code, `super` represents the current agent instance in memory but with a type different than `this`: `super` has the super-type, here `B`. `super` is equivalent to `this as B` in this example.

```sarl
agent B {
	protected var mysupervariable : int
}
agent A extends B {
	var thisexamplefield : int
	def action(value : int) {
		super.mysupervariable = value
	}
}
```




The `it` variable is defined and binded by some SARL constructs. For example, Let a [lambda expression][./Lambda.md] declared as a formal formater of a `function`. This lambda expression takes one argument:

```sarl
static def function(parameter : (int) => boolean) {
	println(parameter.apply(45))
}
static def main {
	function [ p | p > 30 ]
	function [ it > 30 ]
}
```


The two lines in the `main` function are equivalent. On the first line, the formal parameter of the lambda expression is explicitly named. On the second line, the formal parameter is not explicitly named. Therefore, the SARL compiler assumes that this parameter becomes the anphoric variable `it` with the value given as argument to the lambda expression.

SARL also defines the `it` variable in the [guards of the agent's behaviors units](../aop/Agent.html#behaviors-of-an-agent). The three guards in the following code are equivalent. Here `it` is binding to the `occurrence` variable. The `occurrence` variable is the forth anaphoric variable supported by SARL. It is binded to the instance of a received event.

```sarl
event E {
	var attr : int
}

agent A {
	on E [occurrence.attr > 10] {
	}
	on E [it.attr > 10] {
	}
	on E [attr > 10] {
	}
}
```




## 4. References

This documentation is based on documentations from the Xtext and Xtend projects, and from the Java tutorials.
Thank you to the contributors to these documents.

* [Xtend](https://www.eclipse.org/xtend/documentation.html)
* [Xtext](https://www.eclipse.org/Xtext/documentation.html)
* [Java Tutorials](https://docs.oracle.com/javase/tutorial/)

## 5. Version Specification

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.15
* Status: Stable Release
* Release: 2025-09-11

## 6. Legal Notice

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

<small>Generated with the translator docs.generator 0.15.1.</small>
