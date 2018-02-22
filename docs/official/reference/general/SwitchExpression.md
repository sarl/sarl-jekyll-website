---
title: "Switch Expression"
layout: default
---

# Switch Expression


<ul class="page_outline" id="page_outline">

<li><a href="#1-switch-cases">1. Switch Cases</a></li>
<li><a href="#2-default-case">2. Default Case</a></li>
<li><a href="#3-case-guards">3. Case Guards</a></li>
<li><a href="#4-type-guards">4. Type Guards</a></li>
<li><a href="#5-fall-through">5. Fall Through</a></li>
<li><a href="#6-acknowledgements">6. Acknowledgements</a></li>
<li><a href="#7-legal-notice">7. Legal Notice</a></li>

</ul>


A switch statement is a type of selection control mechanism used to allow the value of a variable or expression
to change the control flow of program execution via a multiway branch.

Switch statements come in two main variants: a structured switch, as in Pascal, which takes exactly one branch, 
and an unstructured switch, as in C, which functions as a type of goto.
** The SARL language uses structured switchs. **

<importantnote>The switch expression is very different from Java's switch statement. The use of switch is
not limited to certain values, but can be used for any object reference.
The operator `==` or its Java-equivalent `Object.equals(Object)` are
used to compare the value in the case with the one you are switching over.</importantnote>

##1. Switch Cases

Consider the following example.

```sarl
switch myString {
case 'some' : "It's some string."
case 'other' : "another string."
}
```


The main expression `myString` is evaluated first and then compared to each 
`case` sequentially. If the case expression is of type boolean, the case matches 
if the expression evaluates to `true`. If it is not of type boolean it is 
compared to the value of the main expression using the operator `==`.

If a case is a match, the case expression after the colon is evaluated and is 
the result of the whole switch expression, e.g. `"It's some string."`.
Note that there is no need for a `break` keyword; as in Java the case following
the matching case is never evaluated, due to the structured nature of the switch
statement in SARL.

The main expression, i.e. the parameter of `switch` can also be a computed value instead 
of a field or variable.

<importantnote>A case must contains an expression. If you want to do nothing
for a given case, put an empty block after the colon character.</importantnote>

##2. Default Case

If none of the cases is matching, the `default` case matches automatically if it is specified
in the code.

```sarl
switch myString {
case 'some' : "It's some string."
case 'other' : "another string."
default: "default string"
}
```


##3. Case Guards

Consider the following example.

```sarl
switch myString {
case 'some' : "It's some string."
case 'other' : "another string."
case myString.length > 5 : "It's a long string."
}
```


The expression `myString.length > 5` is the guard of the case.
The associated case matches only if the guard expression is evaluated to `true`.
In the example above, the third case matches only if the value of `myString` has length
greater than 5.


##4. Type Guards

In addition to the case guard described in the previous section, you can specify a type
guard.

The case only matches if the switch value conforms to a given type.
A case with both a type guard and a predicate only matches if both conditions match.
If the switch value is a field, parameter or variable, it is automatically casted
to the given type within the predicate and the case body.

```sarl
switch myString {
String case myString.length == 5 : "It's string of length 5."
String : "a string."
}
```



##5. Fall Through

You can have multiple type guards and cases separated with a comma, to
have all of them share the same then part.

In the following example, the value `a string` is replied if one of the two first cases matches.
Otherwisen, the value associated to the default case is used.

```sarl
switch myString {
case myString.length==5,
case 'some' : "a string"
default: "Default"
}
```



##6. Acknowledgements

This documentation is inspired by the documentations from the
[Xtext](https://www.eclipse.org/Xtext/documentation.html) and
[Xtend](https://www.eclipse.org/xtend/documentation.html) projects.

##7. Legal Notice

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.7
* Status: Stable Release
* Release: 2018-02-22

> Copyright &copy; 2014-2017 [the original authors or authors](http://www.sarl.io/about/index.html).
>
> Licensed under the Apache License, Version 2.0;
> you may not use this file except in compliance with the License.
> You may obtain a copy of the [License](http://www.apache.org/licenses/LICENSE-2.0).
>
> You are free to reproduce the content of this page on copyleft websites such as Wikipedia.

<small>Generated with the translator io.sarl.maven.docs.generator 0.7.0.</small>