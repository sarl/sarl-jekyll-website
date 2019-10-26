---
title: "Synchronization Expression"
layout: default
---

# Synchronization Expression

The synchonization expression does the same as it does in Java (see
[Java Language Specification](http://docs.oracle.com/javase/specs/jls/se7/html/jls-14.html#jls-14.19)).
The only difference is that in SARL it is an expression and can therefore be used at more places. 


##1. Standard Syntax

The synchronization statement can be used as in Java:

```sarl
var lock = new Object
synchronized (lock) {
	println("Hello")
}
```



##2. Expression Syntax

Because the `synchronized` keyword is an expression, it is possible to write synchronized code inside another expression.

```sarl
var lock = new Object
val name = synchronized (lock) { 
		"Hello" 
}
println(name)
```




##3. Acknowledgements

This documentation is inspired by the documentations from the
[Xtext](https://www.eclipse.org/Xtext/documentation.html) and
[Xtend](https://www.eclipse.org/xtend/documentation.html) projects.

##4. Legal Notice

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.10
* Status: Stable Release
* Release: 2019-10-26

> Copyright &copy; 2014-2019 [the original authors or authors](http://www.sarl.io/about/index.html).
>
> Licensed under the Apache License, Version 2.0;
> you may not use this file except in compliance with the License.
> You may obtain a copy of the [License](http://www.apache.org/licenses/LICENSE-2.0).
>
> You are free to reproduce the content of this page on copyleft websites such as Wikipedia.

<small>Generated with the translator io.sarl.maven.docs.generator 0.10.0.</small>