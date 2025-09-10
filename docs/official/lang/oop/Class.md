---
title: ""
layout: default
---

## 1. Class


<ul class="page_outline" id="page_outline">

<li><a href="#1-class">1. Class</a></li>
<li><a href="#2-define-a-class">2. Define a Class</a></li>
<li><a href="#3-class-inheritance">3. Class Inheritance</a></li>
<li><a href="#4-define-a-generic-class">4. Define a Generic Class</a></li>
<li><a href="#5-constructor-definition">5. Constructor Definition</a></li>
<li><a href="#6-static-constructor-definition">6. Static Constructor Definition</a></li>
<li><a href="#7-field-definition">7. Field Definition</a></li>
<li><a href="#8-method-definition">8. Method Definition</a></li>
<li><a href="#9-modifiers">9. Modifiers</a></li>
<ul>
  <li><a href="#91-top-class-modifiers">9.1. Top Class Modifiers</a></li>
  <li><a href="#92-nested-class-modifiers">9.2. Nested Class Modifiers</a></li>
  <li><a href="#93-field-modifiers">9.3. Field Modifiers</a></li>
  <li><a href="#94-method-modifiers">9.4. Method Modifiers</a></li>
  <li><a href="#95-constructor-modifiers">9.5. Constructor Modifiers</a></li>
</ul>
<li><a href="#10-method-overriding">10. Method Overriding</a></li>
<li><a href="#11-accessing-local-variables-of-the-enclosing-scope">11. Accessing Local Variables of the Enclosing Scope</a></li>
<li><a href="#12-references">12. References</a></li>
<li><a href="#13-version-specification">13. Version Specification</a></li>
<li><a href="#14-legal-notice">14. Legal Notice</a></li>

</ul>


Objects are structures that contain both data and procedures. Classes are definitions for the data format and
available procedures for a given type or class of objects. They may also contain data and
procedures (known as class methods) themselves.


## 2. Define a Class

For defining a class, you could use the `class` keyword. The following example defines the class `MyClass`.

The members of the class, i.e. the fields, methods and constructors must be written between the braces that are
following the class declaration.

```sarl
class MyClass {  }
```



## 3. Class Inheritance

Languages that support classes almost always support inheritance. This allows classes to be arranged in a
hierarchy that represents "is-a-type-of" relationships.

For example, class `Employee` might inherit from class `Person`.
All the data and methods available to the parent class also appear in the child class with the same names.
For example, class `Person` might define variables `firstName` and `lastName` with
method `getFullName`. These will also be available in class Employee, which might add the variables
`position` and `salary`.

The definition of the inheritance relationship between two classes is done with the `extends` keyword.

```sarl
class Person {
	
	var firstName : String
	var lastName : String
	
	def getFullName : String {
		this.firstName + " " + this.lastName
	}
}

class Employee extends Person {
	
	var position : String
	
	var salary : float

}
```



## 4. Define a Generic Class

A generic class declaration looks like a non-generic class declaration, except that the class name
is followed by a type parameter section.

The type parameter section of a generic class can have one or more type parameters separated
by commas. These classes are known as parameterized classes or parameterized types
because they accept one or more parameters.

There may be times when you'll want to restrict the kinds of types that are allowed to be passed
to a type parameter. For example, a method that operates on numbers might only want to
accept instances of Number or its subclasses. This is what bounded type parameters are for.
To declare a bounded type parameter, list the type parameter's name, followed by:

* the `extends` keyword, followed by its upper bound; or
* the `super` keyword, followed by its lower bound.

Example:

```sarl
class AType<T> {

	var t : T

	def add(t : T) {
		this.t = t
	}

	def get : T {
		return this.t
	}

}

class Vector<T extends Number> {

	var x : T
	var y : T

	def norm : Vector<? extends Number> {
		var v = new Vector
		var n = Math::sqrt(this.x.floatValue**2 + this.y.floatValue**2)
		v.x = this.x.floatValue / n
		v.y = this.y.floatValue / n
		return v
	}
}
```



## 5. Constructor Definition

An SARL class can define any number of constructors. Unlike Java, you do not have to repeat the name of the
class over and over again, but use the keyword `new` to declare a constructor.

Constructors can also delegate to other constructors using `this(args...)` in their first line.

If the super class does not define a no-argument constructor, you have to explicitly call
one using `super(args...)` as the first expression in the body of the constructor.

```sarl
class MyClass extends AnotherClass {
  new (s : String) {
    super(s)
  }

  new() {
    this("default")
  }
}
```



If no constructor is defined in the type and a super-type is declared, implicit constructors will be assumed.
Implicit constructors has the same prototypes as the constructors of the super type.
Details on implicit constructors are given in the reference documentation related to the
[synthetic functions](../expr/SyntheticFunctions.html).

## 6. Static Constructor Definition

A static constructor is used to initialize any static data, or to perform a particular action that needs to
be performed once only. It is called automatically before the first instance is created or any static members are referenced.
In the Java programming language, the static constructor is known as *static initialization block*.

In the following example, the static field `staticField` is defined with the `final` modifier.
It means the field must be intialized into the field declaration or into a static constructor.
The static constructor is defined with the `new` prefixed by the `static`.
The code block of the static constructor contains an assignment that is initializing the `staticField` field.

```sarl
class MyClass {
  static val staticField : int
  
  static new {
    staticField = 2
  }
}
```



Static constructors have the following properties:

* A static constructor does not take access modifiers or have parameters.
* A static constructor is called automatically to initialize the class before the first instance is created.
* A static constructor cannot be called directly.
* The user has no control on when the static constructor is executed in the program.
* A static constructor cannot throw an exception, except an *unchecked exception* (instance of `RuntimeException` or `Error`).



## 7. Field Definition

A field could be declared into a class following the [variable declaration syntax](../expr/VarDecls.html).

A field may be declared with the `static` modifier. In this case, it becomes a static field, or class variable.
A static field is a variable defined in a class of which a single copy exists, regardless of how many instances of the class exist.
A static field is not an instance variable. It is a special type of class attribute (or class property, field, or data member).


## 8. Method Definition

A method could be declared into a class following the [function declaration syntax](../expr/FuncDecls.html).
The overriding of an inhertited method is explained in section ["Method Overriding"](#method-overriding).

A method may be declared with the `static` modifier. In this case, it becomes a static method, or class method.
A static method is a function that is not associated to a specific instance of the class.



## 9. Modifiers

Modifiers are used to modify declarations of types and type members. This section introduces the modifiers for the class.
The modifiers are usually written before the keyword for defining the class.

The complete description of the modifiers' semantic is available on [this page](./Modifiers.html).


### 9.1. Top Class Modifiers

A top class may be declared with one or more modifiers, which affect its runtime behavior:

* Access modifiers:
	* `public`:  the class is accessible from any other type (default);
	* `package`: the class is accessible from only the types in the same package.
* `abstract`: the class is abstract and cannot be instanced.
* `final`: avoid to be derived.
* `strictfp`: avoid the methods of the class to use intermediate floating number formats.

Examples:

```sarl
public class TopClass1 {
}
package class TopClass2 {
}
abstract class TopClass3 {
}
final class TopClass4 {
}
strictfp class TopClass5 {
}
```



### 9.2. Nested Class Modifiers

A nested class may be declared with one or more modifiers, which affect its runtime behavior:

* Access modifiers:
	* `public`: there are no restrictions on accessing the class (default);
	* `protected`: the class is accessible within the same package, and derived classes;
	* `package`: the class is accessible only within the same package as its class;
	* `private`: the class is accessible only within its class.
* `abstract`: the class is abstract and cannot be instanced.
* `final`: avoid to be derived.
* `static`: the inner class do not have access to the non-static members of the enclosing type.
* `strictfp`: avoid the methods of the class to use intermediate floating number formats.

<p markdown="1"><span class="label label-warning">Terminology</span> Nested classes are divided into two categories: static and non-static. Nested classes that are declared static are called **static nested classes**. Non-static nested classes are called **inner classes**.</p>

<p markdown="1"><span class="label label-info">Note</span> The modifiers may differ from the previously described, depending on the enclosing type, e.g. agent.</p>

<p markdown="1"><span class="label label-danger">Caution</span> Until now, all the nested classes must be declared as static. This restriction may be removed in later versions.</p>

```sarl
class EnclosingClass {
	public static class NestedClass1 {
	}
	protected static class NestedClass2 {
	}
	package static class NestedClass3 {
	}
	private static class NestedClass4 {
	}
	abstract static class NestedClass5 {
	}
	final static class NestedClass6 {
	}
	strictfp static class NestedClass7 {
	}
}
```



### 9.3. Field Modifiers

The modifiers for the fields in a class are:

* Access modifiers:
	* `public`: there are no restrictions on accessing the field;
	* `protected`: the field is accessible within the same package, and derived classes;
	* `package`: the field is accessible only within the same package as its class;
	* `private`: the field is accessible only within its class (default).
* `static`: the field is a class field, not an instance field.
* `transient`: the field is never serialized.
* `volatile`: the field is modified by different threads. It is never cached thread-locally, and synchronized.

Examples:

```sarl
public var a : Object
protected var b : Object
package var c : Object
private var d : Object
static var e : Object
transient var h : Object
volatile var g : Object
```



### 9.4. Method Modifiers

The modifiers for the methods in a class are:

* Access modifiers:
	* `public`: there are no restrictions on accessing the method (default);
	* `protected`:  the method is accessible within the same package, and derived classes;
	* `package`: the method is accessible only within the same package as its class;
	* `private`: the method is accessible only within its class.
* `abstract`: the method has no implementation in the class.
* `dispatch`: the method provides an implementation for the dispatch method mechanism.
* `final`: the method cannot be overridden in derived classes.
* `native`: the implementation of the method is inside a native library (DLL, SO, DYNLIB).
* `static`: the method is a class method, not an instance method.
* `strictfp`: avoid the method to use intermediate floating number formats.
* `synchronized`: the method is synchronized on the class instance.

Examples:

```sarl
public def fct1 { }
protected def fct2 { }
package def fct3 { }
private def fct4 { }
abstract def fct5
final def fct6 { }
native def fct7
static def fct8 { }
strictfp def fct9 { }
synchronized def fct10 { }
// Dispatch functions
dispatch def fct11(p : Integer) { }
dispatch def fct11(p : Float) { }
```



### 9.5. Constructor Modifiers

The modifiers for the constructors of a class are:

* Access modifiers:
	* `public`: there are no restrictions on accessing the constructor (default);
	* `protected`: the constructor is accessible within the same package, and derived classes;
	* `package`: the constructor is accessible only within the same package as its class;
	* `private`: the constructor is accessible only within its class.

Examples:

```sarl
public new(p : int) { }
protected new(p : float) { }
package new(p : char) { }
private new(p : boolean) { }
```



## 10. Method Overriding

Method overriding is a language feature that allows a subclass or child class
to provide a specific implementation of a method that is already provided by
one of its super classes or parent classes.

The implementation in the subclass overrides (replaces) the implementation in
the superclass by providing a method that has same name, same parameters or
signature, and same return type as the method in the parent class.

The version of a method that is executed will be determined by the object that is
used to invoke it. If an object of a parent class is used to invoke the method,
then the version in the parent class will be executed, but if an object of the
subclass is used to invoke the method, then the version in the child class
will be executed.

The following code defines the class `PersonEx` as a subclass of `Person`,
and in which the title (mister, madam, miss) is added.
Then the full name of the person becomes the sequence of the title, first name and last name.
Since the first name and last name are already sequenced in the function
`getFullName` of the superclass, we should override this function for changing
its behavior. The `override` keyword is specified for clearly marking this
implementation of `getFullName` as an override of the parent's implementation.

<p markdown="1"><span class="label label-info">Note</span> The return type of the `getFullName` method (called with the name `fullName`, according to the [property access syntax](../expr/MemberAccess.html#property-syntax)) is not specified in the overriding prototype since it could be inferred by the SARL compiler.</p>

For preventing a function to be overridden, you should add the `final` modifier in the signature of
the method (as in Java).

```sarl
class PersonEx extends Person {
	
	var title : String
	
	override getFullName {
		return title + " " + super.fullName
	} 
}
```



## 11. Accessing Local Variables of the Enclosing Scope

Local classes (or nested classes, i.e. classes defined inside an other type) have
the `static` modifier. It means that a nested class cannot have access to the
fields and methods of the instance of the enclosing type. Only accesses to static members are allowed.

```sarl
class EnclosingClass {
	static var field1 : int
	static def fct1 {
	}
	static class NestedClass {
		def fct2 : int {
			// Explicit type specification for the field access
			EnclosingClass::field1
		}

		def fct3 {
			// Implicit type specification for the function's call
			fct1
		}
	}
}
```


## 12. References

This documentation is based on documentations from the Xtext and Xtend projects, and from the Java tutorials.
Thank you to the contributors to these documents.

* [Xtend](https://www.eclipse.org/xtend/documentation.html)
* [Xtext](https://www.eclipse.org/Xtext/documentation.html)
* [Java Tutorials](https://docs.oracle.com/javase/tutorial/)

## 13. Version Specification

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.15
* Status: Stable Release
* Release: 2025-09-10

## 14. Legal Notice

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
