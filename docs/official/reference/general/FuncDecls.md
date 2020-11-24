---
title: "Function Declarations"
layout: default
---

# Function Declarations


<ul class="page_outline" id="page_outline">

<li><a href="#1-standard-declarations">1. Standard Declarations</a></li>
<li><a href="#2-declare-exceptions-in-the-function-prototype">2. Declare exceptions in the function prototype</a></li>
<li><a href="#3-generic-function">3. Generic Function</a></li>
<ul>
  <li><a href="#31-definition-with-with-keyword">3.1. Definition with "with" keyword</a></li>
  <li><a href="#32-definition-with-brackets">3.2. Definition with brackets</a></li>
  <li><a href="#33-bounded-type-parameters">3.3. Bounded Type Parameters</a></li>
</ul>
<li><a href="#4-variadic-function">4. Variadic Function</a></li>
<li><a href="#5-default-value-for-the-formal-parameters">5. Default Value for the Formal Parameters</a></li>
<li><a href="#6-mixing-variadic-parameter-and-default-values">6. Mixing Variadic Parameter and Default Values</a></li>
<li><a href="#7-dispatch-function">7. Dispatch Function</a></li>
<li><a href="#8-purity-of-the-functions">8. Purity of the Functions</a></li>
<ul>
  <li><a href="#81-general-definition">8.1. General Definition</a></li>
  <li><a href="#82-i-o-in-pure-functions">8.2. I/O in Pure Functions</a></li>
  <li><a href="#83-automatic-determination-of-the-function-purity-in-sarl">8.3. Automatic Determination of the Function Purity in SARL</a></li>
  <li><a href="#84-manually-tagging-of-pure-functions">8.4. Manually Tagging of Pure Functions</a></li>
</ul>
<li><a href="#9-acknowledgements">9. Acknowledgements</a></li>
<li><a href="#10-legal-notice">10. Legal Notice</a></li>

</ul>


A function, or method, or action, is a named block of code that can be invoked.

A function declaration starts with the keyword `def`. This declaration can only occur
in top-level features, such as `agent`.


## 1. Standard Declarations

The standard function declaration follows the following syntax:

```text
def NAME [([PARAMETER, PARAMETER, PARAMETER...])] [: RETURN TYPE] [BLOCK]
```


<p markdown="1"><span class="label label-info">Note</span> The parameters are implicitly declared with the keyword `val` so are read-only.</p>

The following code gives examples of function declarations:

```sarl
// No parameter.
// Return type: void
def action1 {
}

// No parameter.
// Return type: int
def action2 : int {
	return 0
}

// Parameter 1, named 'a', of type int.
// Return type: void
def action3(a : int) {
}

// Parameter 1, named 'a', of type int.
// Parameter 2, named 'b', of type String.
// Return type: void
def action4(a : int, b : String) {
}

// Parameter 1, named 'a', of type int.
// Return type: double
def action5(a : int) : double {
	return 0
}

// Parameter 1, named 'a', of type int.
// Parameter 2, named 'b', of type String.
// Return type: String
def action6(a : int, b : String) : String {
}
```



## 2. Declare exceptions in the function prototype

The section "[Exception Support](./Exception.html)" shows how to write
an exception handler in the code. Sometimes, it is appropriate for code
to catch exceptions that can occur within it. In other cases, however,
it is better to let a method further down the call stack handle the exception.

If a function doesn't catch the checked exceptions that can occur within
it, the function may specify that it can throw these exceptions.

<p markdown="1"><span class="label label-info">Note</span> This specification is optional since the SARL compiler determines the exceptions that are not catched, and assumes that they are implicitly thrown outside the function.</p>

The declaration of the thrown exceptions is done with the 
`throws` keyword, followed by a list of thrown exception types.
This declaration must be put between the list of formal parameters and the function's code.

In the following example, the function `myaction` is defined with no formal
parameters and no return type.
This function indicates to its caller that it could throw an exception of
type `IllegalStateException`. 

```sarl
def myaction throws IllegalStateException {
}
```



## 3. Generic Function

Generic functions are methods that introduce their own type parameters. This is similar to declaring a
[generic type](../OOP.html#define-a-generic-class),
but the type parameter's scope is limited to the function where it is declared.
Static and non-static generic functions are allowed.

You can write a single generic method declaration that can be called with arguments of
different types. Based on the types of the arguments passed to the generic method,
the compiler handles each method call appropriately. Following are the rules to define
generic functions:

* All generic method declarations have a type parameter section written with the `with` or the bracket syntax.
* Each type parameter section contains one or more type parameters separated by commas. A type parameter, also known as a type variable, is an identifier that specifies a generic type name.
* The type parameters can be used to declare the return type and acts as placeholders for the types of the arguments passed to the generic method, which are known as actual type arguments.


A generic method's body is declared like that of any other method.

<p markdown="1"><span class="label label-info">Note</span> Type parameters can represent only reference types, not primitive types (like `int`, `double` and `char`).</p>

Two syntaxes are allowed for defining the type parameters of the actions: the `with` syntax, and the bracket syntax.


### 3.1. Definition with "with" keyword

The `with` syntax for a generic function includes a type parameter, after the `with`
keyword, between the function's return type and the function's body.

In the following example, the function specifies a type `T`, which is used both
as type for the element parameter and the generic type of the Collection.

```sarl
def addAndReturn(element : T, collection : Collection<T>) : T with T {
    collection.add(element)
    return element
}
```



### 3.2. Definition with brackets

The bracket syntax for a generic function includes a type parameter, inside angle brackets, and
appears before the function's name.

In the following example, the function specifies a type `T`, which is used both
as type for the element parameter and the generic type of the Collection.

```sarl
def <T> addAndReturn(element : T, collection : Collection<T>) : T {
    collection.add(element)
    return element
}
```



### 3.3. Bounded Type Parameters

There may be times when you'll want to restrict the kinds of types that are allowed to be
passed to a type parameter. For example, a method that operates on numbers might only want
to accept instances of Number or its subclasses. This is what bounded type parameters are for.

To declare a bounded type parameter, list the type parameter's name, followed by the
`extends` keyword, followed by a class name. This keyword indicates that `T`
must be a subtype of the following type.

```sarl
def print(value : T) with T extends Number {
    System.out.println("Type = " + value.getClass)
    System.out.println("Value = " + value)
}
```



## 4. Variadic Function

A variadic function is a function of indefinite arity: one which accepts a variable number of arguments.

SARL allows you to define the last parameter of a function as variadic with the operator `*`.
This operator has an informal meaning similar to the cardinality in
[UML](https://en.wikipedia.org/wiki/Unified_Modeling_Language): zero to many.

In the code of the variadic function, the variadic parameter is assumed to be an array of objects of
the parameter type. 

In other languages, such as Java and C++, the variadic operator is `...`.

In the following example, two variadic functions are defined:
 
```sarl
// Function with indefinite number of integers as parameters
def action1(v : int*) {
	for (value : v) {
		info(value)
	}
}
// Function which takes a boolean, a double and an indefinite 
// number of integers as parameters
def action2(a : boolean, b : double, c : int*) {
	info(a)
	info(b)
	for (value : c) {
		info(value)
	}
}
```


Examples of calls to the two previous variadic functions are:
 
```sarl
action1()
action1(1)
action1(1, 3)
action2(true, 3.0)
action2(true, 3.0, 1)
action2(true, 3.0, 1, 5)
```



## 5. Default Value for the Formal Parameters

SARL allows you to specify a default value for a formal parameter.

When a default value is specified, it means that the caller of
the action can skip passing a value for the corresponding argument.
And, when the function is called, the default value is given to the
skipped argument.

<p markdown="1"><span class="label label-warning">Important Note</span> In SARL, if a formal parameter has a default value, the following formal parameters do not need to have default values as well. This is a major difference with the default values in other languages, such as C++.</p>
 
```sarl
// Function with one parameter with a default value.
def action1(v : int = 5) {
	info("v == " + v)
}
// Function which takes a boolean, a double and an integer as parameters.
// The first and third parameters have default values. 
def action2(a : boolean=true, b : double, c : int=7) {
	info("a == " + a)
	info("b == " + b)
	info("c == " + c)
}
```



Examples of calls to the two previous functions are:
 
```sarl
// v == 1
action1(1)

// v == 5
action1()

// a == true, b == 3.0, c == 1
action2(true, 3.0, 1)

// a == false, b == 4.0, c == 7
action2(false, 4.0)

// a == true, b == 7.0, c == 56
action2(7.0, 56)

// a == true, b == 9.0, c == 7
action2(9.0)
```



## 6. Mixing Variadic Parameter and Default Values

It is possible to mix the variadic parameter and the default values,
except that the variadic parameter cannot have a default value. 

```sarl
def action(v : int = 5, a : float*) { }
```



## 7. Dispatch Function

Generally, method resolution and binding is done statically at compile time.
Method calls are bound based on the static types of arguments.

Sometimes this is not what you want. Especially in the context of extension methods
you would like to have polymorphic behavior.

The `dispatch` modifier permits defining a dispatch method.

```sarl
dispatch def getType(x : Integer) { 
  "it's an int" 
}
dispatch def getType(x : String) { 
  "it's a string" 
}
dispatch def getType(x : Number) { 
  "it's a number" 
}
 
def clientCode {
	getType(4.5).println
	getType(4).println
	getType("a string").println
}
```



For a set of visible dispatch methods in the current type hierarchy with the same name and
the same number of arguments, the compiler infers a synthetic dispatcher method.
From the example above, the SARL compiler infers the following function, named the synthesized dispatcher.

```sarl
def printType(x : Object) { 
  if (x instanceof Integer) {
    printType(x as Integer)
  } else if (x instanceof Number) {
    printType(x as Number)
  } else if (x instanceof String) {
    printType(x as String)
  }
}
```



This dispatcher uses the common super type of all declared arguments.
Client code always binds to the synthesized dispatcher method.

In the example, the calls to the `getType` functions produces the output:

```text
it's a number
it's an int
it's a string
```


## 8. Purity of the Functions

### 8.1. General Definition

A [pure function](https://en.wikipedia.org/wiki/Pure_function) is a function that has the following properties:

1. Its return value is the same for the same arguments (no variation with local static variables, non-local variables, 
   mutable reference arguments or input streams from I/O devices).
2. Its evaluation has no side effects (no mutation of local static variables, non-local variables, mutable
   reference arguments or I/O streams).

Most of the time, a pure function is a computational analogue of a mathematical function. Some authors, particularly from the
imperative language community, use the term "pure" for all functions that just have the above property.

In SARL, a pure function is a function that has no side-effect on the state of the invoked object,  the static state, and
I/O targets. The following examples of SARL functions are pure:

```sarl
def floor(value : double) : double {
	val fvalue = value as int
	return fvalue
}
def max(a : double, b : double) : double {
	if (a >= b) a
	else b
}
def f : void {
	var x = 0
	x++
}
```


 The following examples of SARL functions are impure:

```sarl
class MyClass {
	var ifield : int
	static var sfield : int
	def incrementField : void {
		this.ifield ++
	}
	def incrementGlobalField : void {
		sfield ++
	}
	static def incrementGlobalField2 : void {
		sfield ++
	}
}
```



### 8.2. I/O in Pure Functions

I/O is inherently impure: input operations undermine
[referential transparency](https://en.wikipedia.org/wiki/Referential_transparency),
and output operations create side effects.
Nevertheless, there is a sense in which function can perform input or output and still be pure, if the sequence of
operations on the relevant I/O devices is modeled explicitly as both an argument and a result, and I/O operations are
taken to fail when the input sequence does not describe the operations actually taken since the program began execution.

The second point ensures that the only sequence usable as an argument must change with each I/O action; the first allows
different calls to an I/O-performing function to return different results on account of the sequence arguments having changed.


### 8.3. Automatic Determination of the Function Purity in SARL

SARL compiler tries to figure out if the functions have side-effect. 
It does some clever analysis of the name of the method (e.g., getters) and also tries to check if the
body has any method that is impure, i.e., that may have side-effects.

SARL compiler considers the following cases for determining if a function must be tagged as pure or not:

1. The function name follows one of the regular expression pattern that corresponds to functions that are
   usually pure:
   * For getter functions:
     * name starts with `get`, `has` or `is`

     * name equals to `length`

   * For comparison functions:
     * name equals to `equals`, `hashCode`, `compare` or `compareTo`.




   * For container functions:
     * name equals to `size`

     * name starts with `contains`, optionally followed by characters according to the
       [camel-case standard](https://en.wikipedia.org/wiki/Camel_case)

   * For iteration:
     * name equals to `iterator`

   * For cloning:
     * name equals to `clone`

   * For data conversion:
     * name starts with `to` following the [camel-case standard](https://en.wikipedia.org/wiki/Camel_case)

   * For well-known pure functions:
   	 * name equals to one of `abs`, `acos`, `asin`, `atan`, `atan2`, `cbrt`, `ceil`, `cos`, `cosh`, `exp`, `floor`,
   	   `hypot`, `log`, `log10`, `log1p`, `max`, `min`, `pow`, `random`, `rint`, `round`, `scalb`, `signum`, `sin`,
   	   `sinh`, `sqrt`, `tan`, `tanh`, `ulp`.




























2. The code of the function, *if it is written in SARL*, is analyzed in order to determine if it contains no
   call to a side-effect (impure) features.

If none of the cases above is matching the current definition of a function, then the function is assumed to be impure.


### 8.4. Manually Tagging of Pure Functions

In the case the SARL compiler is not able to automatically determine the purity of a function, but you are sure that the function
is pure, it is possible to mark the function as pure manually.

```sarl
@Pure
def myFunction() : int {
	// Do something complex
	return 0
}
```



## 9. Acknowledgements

This documentation is inspired by the documentations from the
[Xtext](https://www.eclipse.org/Xtext/documentation.html) and
[Xtend](https://www.eclipse.org/xtend/documentation.html) projects.

## 10. Legal Notice

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.12
* Status: Draft Release
* Release: 2020-11-25

> Copyright &copy; 2014-2020 [the original authors or authors](http://www.sarl.io/about/index.html).
>
> Licensed under the Apache License, Version 2.0;
> you may not use this file except in compliance with the License.
> You may obtain a copy of the [License](http://www.apache.org/licenses/LICENSE-2.0).
>
> You are free to reproduce the content of this page on copyleft websites such as Wikipedia.

<small>Generated with the translator io.sarl.maven.docs.generator 0.12.0-SNAPSHOT.</small>
