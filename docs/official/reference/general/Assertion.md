---
title: "Assertion Support"
layout: default
---

# Assertion Support

An assertion is a statement that a predicate is expected to always be true at that point in the code.
If an assertion evaluates to false at run time, an assertion failure results, which typically causes
the program to crash, or to throw an assertion exception.

##1. Assert Statement

SARL supports assertions in the source code by the `assert` keyword.

```sarl
assert someCondition
```


The `someCondition` expression is the Boolean expression that is dynamically evaluated.
For example, in the following code, the two first `assert` have their conditions evaluated to true, and do not stop the program.
The third `assert` condition is evaluated to false. It causes a stop of the program.

```sarl
x = 1
assert x > 0
x++
assert x > 1
assert x <= 1
```


##2. Error Message

Sometimes, it is useful to give an explanation about the failure.
The `assert` keyword accepts a string of character that is the message given when the program has crashed.
The message string follows the condition, with a coma character between them.

```sarl
assert someCondition, "the failure explanation is here"
```


##3. Acknowledgements

This documentation is inspired by the documentations from the
[Xtext](https://www.eclipse.org/Xtext/documentation.html) and
[Xtend](https://www.eclipse.org/xtend/documentation.html) projects.

##4. Legal Notice

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