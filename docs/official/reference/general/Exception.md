---
title: "Exception Support"
layout: default
---

# Exception Support

SARL supports exception throwing and catching. The mechanism is similar to the one in Java.

For a description of the exceptions that may be thrown by a function,
please see [how to declare exceptions in a function prototype](./FuncDecls.html#2-declare-exceptions-in-the-function-prototype).


##1. Throwing Exceptions

Throwing objects of type `Throwable` and the `throw` keyword have the same semantics and syntax as in Java; see
[Java Language Specification](http://docs.oracle.com/javase/specs/jls/se7/html/jls-14.html#jls-14.18). 

```sarl
throw new IllegalArgumentException("explanation")
```



##2. Try, Catch, Finally

The try-catch-finally expression is used to handle exceptional situations. 
Checked exceptions are treated like runtime exceptions and only optionally 
validated. You can, but do not have to, catch them as they will be silently thrown. 

```sarl
try {
	throw new RuntimeException()
} catch(e : Exception) {
	// Handle the exception
} finally {
	// Do this block after the try block (if no exception thrown), 
	// the matched catch block (if an exception was catched),
	// or before exiting the function (if an exception was thrown
	// but not catched).
}
```



##3. Try-Catch as an Expression

For try-catch, the argument is an expression. Consequently, you can
write code like the following and do not have to rely on
non-final variables: 

```sarl
def readFromFile : String { } 
def example {
	val name =	try {
					readFromFile
				} catch (e : IOException) {
					"unknown"
				}
	println(name)
}
```




##4. Acknowledgements

This documentation is inspired by the documentations from the
[Xtext](https://www.eclipse.org/Xtext/documentation.html) and
[Xtend](https://www.eclipse.org/xtend/documentation.html) projects.

##5. Legal Notice

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.8
* Status: Draft Release
* Release: 2018-08-19

> Copyright &copy; 2014-2018 [the original authors or authors](http://www.sarl.io/about/index.html).
>
> Licensed under the Apache License, Version 2.0;
> you may not use this file except in compliance with the License.
> You may obtain a copy of the [License](http://www.apache.org/licenses/LICENSE-2.0).
>
> You are free to reproduce the content of this page on copyleft websites such as Wikipedia.

<small>Generated with the translator io.sarl.maven.docs.generator 0.8.0-SNAPSHOT.</small>