---
title: "Name Syntax"
layout: default
---

# Name Syntax

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



## 1. References

This documentation is based on documentations from the Xtext and Xtend projects, and from the Java tutorials.
Thank you to the contributors to these documents.

* [Xtend](https://www.eclipse.org/xtend/documentation.html)
* [Xtext](https://www.eclipse.org/Xtext/documentation.html)
* [Java Tutorials](https://docs.oracle.com/javase/tutorial/)

## 2. Version Specification

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.15
* Status: Stable Release
* Release: 2025-09-11

## 3. Legal Notice

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
