---
title: "Lambda Expressions"
layout: default
---

# Lambda Expressions


<ul class="page_outline" id="page_outline">

<li><a href="#1-basic-definition">1. Basic Definition</a></li>
<li><a href="#2-inferred-parameter-type">2. Inferred Parameter Type</a></li>
<li><a href="#3-implicit-parameters">3. Implicit Parameters</a></li>
<ul>
  <li><a href="#31-case-of-a-single-parameter-it">3.1. Case of a single parameter: it</a></li>
  <li><a href="#32-case-of-multiple-parameters">3.2. Case of multiple parameters</a></li>
</ul>
<li><a href="#4-empty-list-of-parameters">4. Empty List of Parameters</a></li>
<li><a href="#5-short-notation-of-a-lambda-expression">5. Short notation of a Lambda Expression</a></li>
<li><a href="#6-lambda-as-the-last-parameter-of-a-method">6. Lambda as the Last Parameter of a Method</a></li>
<li><a href="#7-type-of-a-lambda-expression">7. Type of a Lambda Expression</a></li>
<ul>
  <li><a href="#71-pure-sarl-notation">7.1. Pure SARL Notation</a></li>
  <li><a href="#72-java-like-notation">7.2. Java-like Notation</a></li>
</ul>
<li><a href="#8-acknowledgements">8. Acknowledgements</a></li>
<li><a href="#9-legal-notice">9. Legal Notice</a></li>

</ul>


A lambda expression is basically a piece of code, which is wrapped 
in an object to pass it around. As a Java developer it is best to 
think of a lambda expression as an anonymous class with a single 
method.


## 1. Basic Definition

A lambda expression is code surrounded by square brackets (inspired from Smalltalk).
Like a method declaration, a lambda expression may declare parameters.

```sarl
[ e : ActionEvent |
	textField.text = "Something happened!" + e.toString
]
```


The lambda above has one parameter called `e` which is of type `ActionEvent`.
The code after the `|` operator is the internal code of the lambda expression.


## 2. Inferred Parameter Type

You do not have to specify the type explicitly because it can be inferred from the context.
For example, when using inferred type, the code in the previous section becomes:

```sarl
[ e |
	textField.text = "Something happened!" + e.toString
]
```


The type of `e` is inferred according to its usage.


## 3. Implicit Parameters

### 3.1. Case of a single parameter: it

As lambdas with one parameter are a common case, there  a special short hand notation
for these parameters, which is to leave the declaration including the vertical bar out.

The name of the single parameter becomes `it`.

```sarl
[
	textField.text = "Something happened!" + it.toString
]
```


### 3.2. Case of multiple parameters

When a lambda has multiple parameters, and no name is provided by the SARL developer, 
the compiler generates default names for each of the formal parameters.
The implicit name for the first parameter is `$0`, `$1` for the second,
`$2` for the third, etc.

Let the following interface declaration:

```sarl
interface MyInterface {
    def myfct(a : int, b : int, c : int)
}
```


The following code is a lambda expression implementing the `MyInterface` interface.
Because the `myfct` function has four formal parameters, the lambda expression 
has four parameters with implicit the following implicit names: `$0`, `$1`, and `$2`.

```sarl
[
            [:Success:]
            package io.sarl.docs.reference.gsr
            interface MyInterface {
                def myfct(a : int, b : int, c : int) : int
            }
            agent A {
                def called(p : MyInterface) {}
                def example {
                    called(
                    [:On]
                    [
                        $0 + $1 + $2
                    ]
                    [:Off])
                }
            }
        [:End:] +  + 
]
```


## 4. Empty List of Parameters

A lambda expression with zero arguments is written with a bar after the opening bracket:

```sarl
val runnable : Runnable = [ |
	println("Hello I'm executed!")
]
```



## 5. Short notation of a Lambda Expression

When the lamda expression is passed to a single-parameter function, the brackets that are enclosing the lambda
declaration could be missed. It specific syntax is called the short notation of a lambda expression. 

Consider the following definition of a function with lambda expression as a single parameter:

```sarl
def aFunction(aParameter : (Object) => Object) {
}
```



The call to the previously defined function with the short notation is:

```sarl
aFunction(a | new Object)
```



This call is equivalent to the following one, with the standard notation:

```sarl
aFunction([a | new Object])
```



As for the standard notation, the parameter and the bar could be missed when their is no formal parameter.


## 6. Lambda as the Last Parameter of a Method

When the last argument of a method call is a lambda, it can be passed right after the argument list.

For instance if you want to sort some strings by their length, you could use either of the following two examples.
The first example uses the notation with the lambda expression inside the argument list.

```sarl
var t : List<String>
// Lambda expression is written outside the parenthesis
Collections.sort(t, [ a, b | a.length - b.length ])
```


The second example uses the notation with the lambda expression outside the argument list.

```sarl
var t : List<String>
// Lambda expression is written outside the parenthesis
Collections.sort(t) [ a, b | a.length - b.length ]
```



## 7. Type of a Lambda Expression

### 7.1. Pure SARL Notation

Because SARL is a strongly typed programming language, each lambda expression has a type.
The syntax for specifying the type of a lambda is: `(parameter types) => return type`

The following example defines a variable `f`, which is a lambda taking one parameter of `String`, and
returning a value of `Boolean`. 

```sarl
var f : (String) => Boolean
```


If the lambda is a procedure, i.e. it has no return type, then the return type to specify must be `void`.


### 7.2. Java-like Notation

The SARL lambda expressions are mapped to the Java types defined in `Functions` or `Procedures`.


These two Java interfaces contains the definitions of inner interfaces for function/procedure with
different numbers of parameters.

For example, the SARL erasure `(String) => Boolean` may be written with the Java notation:

```sarl
// Same type of function.
var f2 : Functions.Function1<? super String,? extends Boolean>
```



The `Function1` interface represents a function with a single formal parameter (with the type equals to the first generic parameter),
and returning a value of type equals to the second generic parameter.
Depending of the number of parameters, you may use `Function0` to `Function5`, or `Procedure0` to `Procedure6`. 



## 8. Acknowledgements

This documentation is inspired by the documentations from the
[Xtext](https://www.eclipse.org/Xtext/documentation.html) and
[Xtend](https://www.eclipse.org/xtend/documentation.html) projects.

## 9. Legal Notice

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