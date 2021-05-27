---
title: "Loop Expressions"
layout: default
---

# Loop Expressions


<ul class="page_outline" id="page_outline">

<li><a href="#1-for-each-loop">1. For-Each Loop</a></li>
<li><a href="#2-traditional-java-for-loop">2. Traditional Java For Loop</a></li>
<li><a href="#3-while-loop">3. While Loop</a></li>
<li><a href="#4-do-while-loop">4. Do-While Loop</a></li>
<li><a href="#5-breaking-a-loop">5. Breaking a loop</a></li>
<li><a href="#6-jump-to-the-next-iteration">6. Jump to the next iteration</a></li>
<li><a href="#7-acknowledgements">7. Acknowledgements</a></li>
<li><a href="#8-legal-notice">8. Legal Notice</a></li>

</ul>


SARL provides four types of loop statements.


## 1. For-Each Loop

The for loop is used to execute a certain expression for each element of an array or an instance of `Iterable`.

The for's variable is local and final, hence cannot be updated.

The type of a for loop is `void`. The type of the local variable can be inferred from the
iterable or array that is processed, e.g. in the following example `v` is of type `String`.

```sarl
var tab : String[]
for (v : tab) {
	println(v)
}
```



You could specify the expected type for the local variable with the `as` following the local variable:

```sarl
for (v as String : tab) {
	println(v)
}
```



## 2. Traditional Java For Loop

The traditional for loop is very similar to the one known from Java, or even C.
When executed, it first executes the init-expression, where local variables can be
declared. Next the predicate is executed and if it evaluates to `true`, the
body-expression is executed. On any subsequent iterations the update-expression
is executed instead of the init-expression. This happens until the predicate
returns `false`. The type of a for loop is `void`.

```sarl
for (var i = 0; i<123; i++) {
	println(i)
}
```



## 3. While Loop

A while loop is used to execute a certain expression unless the predicate is evaluated to
`false`. The type of a while loop is `void`.

```sarl
var i = 0
while (i<123) {
	println(i)
	i++
}
```



## 4. Do-While Loop

A while loop is used to execute a certain expression unless the predicate is evaluated 
to `false`. The difference to the while loop is that the execution starts by 
executing the block once before evaluating the predicate for the first time. 
The type of a while loop is `void`.

```sarl
var i = 0
do {
	println(i)
	i++
}
while (i<123)
```



## 5. Breaking a loop

The `break` keyword is provides for breaking the enclosing loop.
When this keyword is run, the control flow exits for the nearest
enclosing loop, and run the statement that is just following the loop
expression in the sequence of instructions.

```sarl
for (v : tab) {
	if (v == 1) {
		break
	}
}
```



## 6. Jump to the next iteration

The `continue` keyword is provides for stopping the execution of the
current iteration into loop, and jumping to the next iteration.
When this keyword is run, the control flow jumps to the next iteration
for the nearest enclosing loop, and run the statement that is just at
the beginning of the loop's block expression.

```sarl
for (v : tab) {
	if (v == 1) {
		continue
	}
}
```




## 7. Acknowledgements

This documentation is inspired by the documentations from the
[Xtext](https://www.eclipse.org/Xtext/documentation.html) and
[Xtend](https://www.eclipse.org/xtend/documentation.html) projects.

## 8. Legal Notice

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.12
* Status: Stable Release
* Release: 2021-05-27

> Copyright &copy; 2014-2021 [the original authors or authors](http://www.sarl.io/about/index.html).
>
> Licensed under the Apache License, Version 2.0;
> you may not use this file except in compliance with the License.
> You may obtain a copy of the [License](http://www.apache.org/licenses/LICENSE-2.0).
>
> You are free to reproduce the content of this page on copyleft websites such as Wikipedia.

<small>Generated with the translator io.sarl.maven.docs.generator 0.12.0.</small>
