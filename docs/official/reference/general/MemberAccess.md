---
title: "Object Member Invocation"
layout: default
---

# Object Member Invocation


<ul class="page_outline" id="page_outline">

<li><a href="#1-property-syntax">1. Property Syntax</a></li>
<ul>
  <li><a href="#11-definition-of-the-properties-and-the-accessors">1.1. Definition of the Properties and the Accessors</a></li>
  <li><a href="#12-read-accesses">1.2. Read Accesses</a></li>
  <li><a href="#13-write-accesses">1.3. Write Accesses</a></li>
</ul>
<li><a href="#2-static-access-to-members">2. Static Access to Members</a></li>
<li><a href="#3-null-safe-feature-call">3. Null-Safe Feature Call</a></li>
<li><a href="#4-call-to-an-inherited-method">4. Call to an Inherited Method</a></li>
<li><a href="#5-call-to-a-constructor">5. Call to a Constructor</a></li>
<ul>
  <li><a href="#51-instance-creation">5.1. Instance Creation</a></li>
  <li><a href="#52-inherited-constructor">5.2. Inherited Constructor</a></li>
</ul>
<li><a href="#6-acknowledgements">6. Acknowledgements</a></li>
<li><a href="#7-legal-notice">7. Legal Notice</a></li>

</ul>


This section describes the syntax for using or calling the members of an object.

A simple name can refer to a field, variable, or parameter. In addition, it can point to
a method with zero argument since empty parentheses are optional.

The rest of this section describes particular mechanisms for calling the object members.


## 1. Property Syntax

The SARL language provides a very powerfull mecanism for calling members of an object as
properties of this object.

If there is no field with the given name and also no method with
the name and zero parameters accessible, a simple name binds to a
corresponding Java-Bean getter method if available.
The getter method must have a name starting with one of the strings of
characters `get`, `is`, `has`, followed by the given name.

### 1.1. Definition of the Properties and the Accessors

In the following example, two fields are defined: `prop1` and `prop2`.
As usual, these properties have a private scope, and the getter and setter functions must
be defined to enable public scope access.
In the example, only the getter and setter functions for `prop2` are defined.

```sarl
agent A {
	var prop1 : Object
	var prop2 : Object
	def getProperty2 : Object {
		return this.prop2
	}
	def setProperty2(o : Object) {
		this.prop2 = o
	}
}
```



### 1.2. Read Accesses

Four cases for accessing a property are possible:


| Getter Function Def.    | Access Type     | Example             | Effect                            | 
| ----------------------- | --------------- | ------------------- | --------------------------------- |
| A getter is defined     | Functional      | `this.getProperty2` | Invocation of the getter function |
| A getter is defined     | Property-access | `this.property2`    | Invocation of the getter function |
| A getter is defined     | Field-access    | `this.prop2`        | Read the field if it is visible   |
| A getter is not defined | Field-access    | `this.prop2`        | Read the field if it is visible   |


The two first cases have the same effect: the getter function is called.
But, the second case uses the "property-access" syntax, and it is assumed to be easier to be read in the code.




### 1.3. Write Accesses

Four cases for writing a property are possible:


| Setter Function Def.    | Access Type     | Example                | Effect                            | 
| ----------------------- | --------------- | ---------------------- | --------------------------------- |
| A setter is defined     | Functional      | `this.setProperty2(x)` | Invocation of the setter function |
| A setter is defined     | Property-access | `this.property2 = x`   | Invocation of the setter function |
| A setter is defined     | Field-access    | `this.prop2 = x`       | Write the field if it is visible  |
| A setter is not defined | Field-access    | `this.prop2 = x`       | Write the field if it is visible  |


The two first cases have the same effect: the setter function is called.
But, the second case uses the "property-access" syntax, and it is assumed to be easier to be read in the code.
Note that for this latest case, the "variable assignment" syntax is used.




## 2. Static Access to Members

To access a static field or method you can use the recommended Java syntax or the more explicit double colon `::`.
That means, the following expressions are pairwise equivalent:

```sarl
var a = Integer::TYPE
var b = Integer.TYPE
```



## 3. Null-Safe Feature Call

Checking for null references can make code very unreadable. 
The variable `myRef` is assumed to be declared.

```sarl
if (myRef !== null) myRef.length() else 0
```



In many situations, it is correct for an expression to return a default value (`null`, `0`...) if a receiver was `null`.
SARL includes the safe navigation operator `?.`. to do the null-check test and make such code better readable.

```sarl
myRef?.length()
```



## 4. Call to an Inherited Method

When it is possible to extend an existing type, the methods can be overridden.
In this case, the `super` keyword invoks the inherited implementation of the method
from the overriding method.

```sarl
def anAction {
	// Call the inherited implementation
	super.anAction
}
```



## 5. Call to a Constructor

Constructor calls correspond to the calls of a constructor function for an object.


### 5.1. Instance Creation

Constructor calls have the same syntax as in Java. The only difference is that empty parentheses are optional.
If type arguments are omitted, they will be inferred from the current context similar to Java's
diamond operator on generic method and constructor call.

```sarl
var a = new Integer(345)
var b = new ArrayList<Integer>()
var c = new ArrayList<Integer>
```



### 5.2. Inherited Constructor

In the implementation of a constructor, it is possible to call one of the inherited constructors.
The syntax is similar to Java: the (:super:] keyword is used to represent the inherited constructor.

<p markdown="1"><span class="label label-warning">Important Note</span> We recommend that you include the parentheses when invoking the default constructor of the super type because, in some cases, typing `super` alone (without the parenthesis pair) has no effect, and that is an error.</p>

```sarl
new {
	super() // Call the inherited default constructor
}
new (param : Address) {
	super(param) // Call the inherited constructor with a parameter
}
```




## 6. Acknowledgements

This documentation is inspired by the documentations from the
[Xtext](https://www.eclipse.org/Xtext/documentation.html) and
[Xtend](https://www.eclipse.org/xtend/documentation.html) projects.

## 7. Legal Notice

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.12
* Status: Draft Release
* Release: 2021-02-14

> Copyright &copy; 2014-2021 [the original authors or authors](http://www.sarl.io/about/index.html).
>
> Licensed under the Apache License, Version 2.0;
> you may not use this file except in compliance with the License.
> You may obtain a copy of the [License](http://www.apache.org/licenses/LICENSE-2.0).
>
> You are free to reproduce the content of this page on copyleft websites such as Wikipedia.

<small>Generated with the translator io.sarl.maven.docs.generator 0.12.0-SNAPSHOT.</small>
