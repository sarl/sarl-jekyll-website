---
title: "Exception Support"
layout: default
---

# Exception Support

SARL supports exception throwing and catching. The mechanism is similar to the one in Java.

For a description of the exceptions that may be thrown by a function,
please see [how to declare exceptions in a function prototype](./FuncDecls.html#declare-exceptions-in-the-function-prototype).


## 1. Throwing Exceptions

Throwing objects of type `Throwable` and the `throw` keyword have the same semantics and syntax as in Java; see
[Java Language Specification](http://docs.oracle.com/javase/specs/jls/se7/html/jls-14.html#jls-14.18). 

```sarl
throw new IllegalArgumentException("explanation")
```



## 2. Try, Catch, Finally

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



## 3. Try-Catch as an Expression

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



## 4. The try-with-resources Statement

The try-with-resources statement is a try statement that declares one or more resources. A resource
is an object that must be closed after the program is finished with it. The try-with-resources
statement ensures that each resource is closed at the end of the statement. Any object that
implements `java.lang.AutoCloseable`, which includes all objects which implement `java.io.Closeable`,
can be used as a resource.

The following example reads the first line from a file. It uses an instance of `BufferedReader`
to read data from the file. `BufferedReader` is a resource that must be closed after the
program is finished with it:

```sarl
static def readFirstLineFromFile(path : String) : String {
	try (var br = new BufferedReader(new FileReader(path))) {
    				return br.readLine
	}
}
```




In this example, the resource declared in the try-with-resources statement is a `BufferedReader`.
The declaration statement appears within parentheses immediately after the `try` keyword.
The class `BufferedReader` implements the interface `java.lang.AutoCloseable`.
Because the `BufferedReader` instance is declared in a try-with-resource statement, it will be
closed regardless of whether the try statement completes normally or abruptly (as a result of the method
`BufferedReader.readLine` throwing an `IOException`).






## 5. Acknowledgements

This documentation is inspired by the documentations from the
[Xtext](https://www.eclipse.org/Xtext/documentation.html) and
[Xtend](https://www.eclipse.org/xtend/documentation.html) projects.

## 6. Legal Notice

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.11
* Status: Stable Release
* Release: 2020-06-02

> Copyright &copy; 2014-2020 [the original authors or authors](http://www.sarl.io/about/index.html).
>
> Licensed under the Apache License, Version 2.0;
> you may not use this file except in compliance with the License.
> You may obtain a copy of the [License](http://www.apache.org/licenses/LICENSE-2.0).
>
> You are free to reproduce the content of this page on copyleft websites such as Wikipedia.

<small>Generated with the translator io.sarl.maven.docs.generator 0.11.0.</small>