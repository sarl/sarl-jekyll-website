---
title: "Interface"
layout: default
---

# Interface


<ul class="page_outline" id="page_outline">

<li><a href="#1-define-an-interface">1. Define an Interface</a></li>
<li><a href="#2-interface-inheritance">2. Interface Inheritance</a></li>
<li><a href="#3-define-a-generic-interface">3. Define a Generic Interface</a></li>
<li><a href="#4-interface-implementation">4. Interface Implementation</a></li>
<li><a href="#5-default-implementation-of-interface-functions">5. Default Implementation of Interface Functions</a></li>
<li><a href="#6-modifiers">6. Modifiers</a></li>
<ul>
  <li><a href="#61-top-interface-modifiers">6.1. Top Interface Modifiers</a></li>
  <li><a href="#62-nested-interface-modifiers">6.2. Nested Interface Modifiers</a></li>
  <li><a href="#63-field-modifiers">6.3. Field Modifiers</a></li>
  <li><a href="#64-method-modifiers">6.4. Method Modifiers</a></li>
</ul>
<li><a href="#7-references">7. References</a></li>
<li><a href="#8-version-specification">8. Version Specification</a></li>
<li><a href="#9-legal-notice">9. Legal Notice</a></li>

</ul>


An interface is a description of the actions that an object can do.
For example when you flip a light switch, the light goes on, you don't
care how, just that it does. In object-oriented programming, an
interface is a description of all functions that an object must have
in order to be an "X".

The purpose of interfaces is to allow the program to enforce these
properties, and to know that an object of type T (whatever the interface
is) must have functions called X,Y,Z, etc.


## 1. Define an Interface

In the following example, the `Light` interface is defined with the two methods `turnOn` and `turnOff`.

```sarl
interface Light {
	def turnOn
	def turnOff
}
```



## 2. Interface Inheritance

It is possible to specialize the definition of an interface. In the following example, the `VariableIntensityLight`
interface that is refining the previous `Light` interface and add specific functions.

```sarl
interface VariableIntensityLight extends Light {
	def setLightIntensity(intensity : float)
	def getLightIntensity : float
}
```



## 3. Define a Generic Interface

A generic interface declaration looks like a non-generic interface declaration, except that the interface name
is followed by a type parameter section.

The type parameter section of a generic interface can have one or more type parameters separated
by commas. These interfaces are known as parameterized interfaces or parameterized types
because they accept one or more parameters.

There may be times when you'll want to restrict the kinds of types that are allowed to be passed
to a type parameter. For example, a method that operates on numbers might only want to
accept instances of Number or its subclasses. This is what bounded type parameters are for.
To declare a bounded type parameter, list the type parameter's name, followed by:

* the `extends` keyword, followed by its upper bound; or
* the `super` keyword, followed by its lower bound.

Examples:

```sarl
interface AnInterface<T> {
	def add(t : T)

	def get : T
}

interface Vector<T extends Number> {
	def norm : Vector<? super Number>
}
```



## 4. Interface Implementation

A class is able to implement an interface. The `implements` keyword is used for defining
the implementation relationship between a class and an interface.
The class must provide an implementation of all the functions defined in the interface.
The only one exception is when the class is abstract. In this case, the derived classes must implement the
functions of the interface.

```sarl
class TheLight implements Light {
	var isSwitchedOn = false
	def turnOn {
		this.isSwitchedOn = true
	}
	def turnOff {
		this.isSwitchedOn = false
	}
}
```



## 5. Default Implementation of Interface Functions

As in Java 8, interface types could provide default function implementation if the implementation class is
not providing one. This feature is known as the default method mechanism.

In the following example, two default implementations of the `turnOn` and `turnOff` functions are provided.
The implementing class needs to provide a function code only for the `switchLight` function:
 
```sarl
interface Light {
	def turnOn {
		switchLight(true)
	}
	def turnOff {
		switchLight(false)
	}
	def switchLight(state : boolean)
}
class TheLight implements Light {
	var isSwitchedOn = false
	def switchLight(state : boolean) {
		this.isSwitchedOn = state
	}
}
```



## 6. Modifiers

Modifiers are used to modify declarations of types and type members. This section introduces the modifiers for the interface.
The modifiers are usually written before the keyword for defining the interface.

The complete description of the modifiers' semantic is available on [this page](./Modifiers.html).


### 6.1. Top Interface Modifiers

A top interface may be declared with one or more modifiers, which affect its runtime behavior:

* Access modifiers:
	* `public`: the class is accessible from any other type (default);
	* `package`: the class is accessible from only the types in the same package.
* `abstract`: the interface is abstract (not needed since all the interfaces are abstract).
* `strictfp`: avoid the methods of the implementing classes to use intermediate floating number formats.

Examples:

```sarl
public interface TopInterface1 {
}
package interface TopInterface2 {
}
abstract interface TopInterface3 {
}
```



### 6.2. Nested Interface Modifiers

A nested interface may be declared with one or more modifiers, which affect its runtime behavior:

* Access modifiers:
	* `public`: there are no restrictions on accessing the interface (default);
	* `protected`: the interface is accessible within the same package, and derived classes;
	* `package`: the interface is accessible only within the same package as its class;
	* `private`: the interface is accessible only within its class.
* `abstract`: the interface is abstract (not needed since all the interfaces are abstract).
* `static`: the inner interface do not have access to the non-static members of the enclosing type.
* `strictfp`: avoid the methods of the interface to use intermediate floating number formats.

<p markdown="1"><span class="label label-warning">Terminology</span> Nested interfaces are divided into two categories: static and non-static. Nested interfaces that are declared static are called **static nested interfaces**. Non-static nested interfaces are called **inner interfaces**.</p>

<p markdown="1"><span class="label label-info">Note</span> The modifiers may differ from the previously described, depending on the enclosing type, e.g. agent.</p>

```sarl
class EnclosingClass {
	public interface NestedInterface1 {
	}
	protected interface NestedInterface2 {
	}
	package interface NestedInterface3 {
	}
	private interface NestedInterface4 {
	}
	abstract interface NestedInterface5 {
	}
	static interface NestedInterface6 {
	}
	strictfp interface NestedInterface7 {
	}
}
```



### 6.3. Field Modifiers

The modifiers for the fields in an interface are:

* Access modifiers:
	* `public`: there are no restrictions on accessing the field (default);
* `static`: the field is a class field, not an instance field (default).

<p markdown="1"><span class="label label-danger">Caution</span> Only fields defined with `val` can be put in an interface.</p>

```sarl
public val a : Object;
static val e : Object;
```



### 6.4. Method Modifiers

The modifiers for the methods in an interface are:

* Access modifiers:
	* `public`: there are no restrictions on accessing the method (default);
* `abstract`: the method is abstract (not needed since all the interface methods are abstract).

Examples:

```sarl
public def fct1
abstract def fct5
```


## 7. References

This documentation is based on documentations from the Xtext and Xtend projects, and from the Java tutorials.
Thank you to the contributors to these documents.

* [Xtend](https://www.eclipse.org/xtend/documentation.html)
* [Xtext](https://www.eclipse.org/Xtext/documentation.html)
* [Java Tutorials](https://docs.oracle.com/javase/tutorial/)

## 8. Version Specification

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.15
* Status: Stable Release
* Release: 2025-09-10

## 9. Legal Notice

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

<small>Generated with the translator docs.generator 0.15.0.</small>
