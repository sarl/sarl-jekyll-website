---
title: "Block Expressions"
layout: default
---

# Block Expressions

The block expression consists of a sequence of
expressions. 


## 1. General Syntax

A block expression is surrounded by curly braces. The expressions in a block can be terminated
by an optional semicolon.

```text
{
	<sequence of expressions>
}
```

## 2. Type and Value of a Block Expression

The value of the last expression in the block is returned as the value of the
complete block.

The type of a block is the returned type (i.e., of the last expression). Empty blocks return
`null` and have the type `Object`.

In the following example, the block type is `String` because the last expressions in all the
possible execution paths are all of type `String`.

```sarl
{
	var x = greeting
	if (x == "Hello") {
		x + " World!" 
	} else {
		x
	}
}
```




## 3. Acknowledgements

This documentation is inspired by the documentations from the
[Xtext](https://www.eclipse.org/Xtext/documentation.html) and
[Xtend](https://www.eclipse.org/xtend/documentation.html) projects.

## 4. Legal Notice

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.14
* Status: Draft Release
* Release: 2023-09-26

> Copyright &copy; 2014-2023 [SARL.io, the Original Authors and Main Authors](https://www.sarl.io/about/index.html).
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

<small>Generated with the translator docs.generator 0.14.0-SNAPSHOT.</small>
