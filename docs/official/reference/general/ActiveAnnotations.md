---
title: "Active Annotations"
layout: default
---

# Active Annotations


<ul class="page_outline" id="page_outline">

<li><a href="#1-accessors">1. @Accessors</a></li>
<li><a href="#2-data">2.  @Data</a></li>
<li><a href="#3-delegate">3.  @Delegate</a></li>
<li><a href="#4-noequalitytestfunctionsgeneration">4. @NoEqualityTestFunctionsGeneration</a></li>
<li><a href="#5-tostring">5. @ToString</a></li>
<li><a href="#6-acknowledgements">6. Acknowledgements</a></li>
<li><a href="#7-legal-notice">7. Legal Notice</a></li>

</ul>


Active annotations allow developers to participate in the translation process of SARL source code to Java.
An active annotation is just an annotation that is processed by a specific annotation processor during
the compilation of a SARL program.
Depending on the meaning of the active annotation, the generated Java code could be completed by the annotation processor.

SARL comes with ready-to-use active annotations for common code patterns.
The following sections describe there annotations.

## 1. @Accessors

If you want to add getter and or setter methods for your fields, `@Accessors` is your friend.
This annotation can be applied to either object-oriented types and several agent-oriented types.
The agent-oriented types in which you could uses the `@Accessors` annotation are the agents,
the behaviors and the skills.







Let's a basic example.

```sarl
@Accessors var name : String
```



It is compiled to the code:
```sarl
private var name : String
 
public def getName : String {
			this.name
}
	
public def setName(name : String) : void {
  this.name = name
}
```



By default, a public getter and a public setter method is created. The `@Accessors` can be configured to tell
that you only want one or the other, and to change the visibility. This is done by passing one or more values of
type `AccessorType` for representing the visibility categories
as parameters to the annotation: `PUBLIC_GETTER`, `PROTECTED_GETTER`, `PACKAGE_GETTER`,
`PRIVATE_GETTER`, `PUBLIC_SETTER`, `PROTECTED_SETTER`, `PACKAGE_SETTER`,
`PRIVATE_SETTER`, `NONE`.




You can also use the annotation on class level to do the same for all fields.

Here is a more complex example, that shows how it works:

```sarl
@Accessors class Person {
  var name : String
  var firstName : String
  @Accessors(PUBLIC_GETTER, PROTECTED_SETTER) var age : int
  @Accessors(NONE) var internalField : String
}
```

 

It is compiled to the code:
```sarl
class Person {
  private var name : String
  private var firstName : String
  private var age : int
  private var internalField : String
  
  public def getName : String {
    this.name
  }
  
  public def setName(name : String) : void {
    this.name = name
  }
  
  public def getFirstName : String {
    this.firstName
  }
  
  public def setFirstName(firstName : String) : void {
    this.firstName = firstName
  }
  
  public def getAge : int {
    this.age
  }
  
  protected def setAge(age : int) : void {
    this.age = age
  }
}
```



## 2.  @Data

The annotation `@Data` will turn an annotated class into a value object class. A class annotated with
[:dataannon] is processed according to the following rules:

* all fields are final, i.e. they must be declared with `val`,
* getter methods will be generated (if they do not yet exist),
* a constructor with parameters for all non-initialized fields will be generated (if it does not exist),
* equals(Object) / hashCode() methods will be generated (if they do not exist),
* a toString() method will be generated (if it does not exist).

This annotation can be applied to object-oriented types. The agent-oriented types cannot be annotated.

Example:
```sarl
@Data class Person {
  val firstName : String
  val lastName : String
  static def main(args : String*) {
    val p = new Person(args.get(0), args.get(1))
    println(p.getFirstName + ' ' + p.lastName)
  }
}
```




## 3.  @Delegate

The `@Delegate` annotation automatically generates delegate methods for all interfaces shared between the delegate
and the currently implemented class. You can optionally restrict it to explicitly stated interfaces.
This annotation can be applied to object-oriented types. The agent-oriented types cannot be annotated.

Let's start with a basic example:
```sarl
interface SomeInterface {
	def function(param : String) : int
}
interface SubTypeOfSomeInterface extends SomeInterface {
	def anotherFunction
}
class MyClass implements SomeInterface {
 
  // generates all methods of SomeInterface and delegates to this field
  @Delegate var myDelegate : SubTypeOfSomeInterface
 
}
```




The previous code is equivalent to:
```sarl
class MyClass implements SomeInterface {			 
  var myDelegate : SubTypeOfSomeInterface
  
  def function(param : String) : int {
    return this.myDelegate.function(param)
  }
}
```



It is not only possible to delegate to fields, but also to methods so you could lazily
create the delegate object or use a different one each time.

```sarl
class MyClass implements SomeInterface {
	@Delegate def provideDelegate : SomeInterface {
		return new MyDelegate
	}
}
```



The previous code is equivalent to:
```sarl
class MyClass implements SomeInterface {
	def function(param : String) : int {
		return provideDelegate().function(param)
	}

	def provideDelegate : SomeInterface {
		return new MyDelegate
	}
}
```



If you use a method, additional parameters could be declared, that will tell you about the method that should be invoked:

* the name of the method,
* the types of the formal parameters, and
* the arguments to the method.

Let's the following example:

```sarl
class MyClass implements SomeInterface {
	@Delegate def provideDelegate(methodName : String, parameterTypes : Class<?>[], arguments : Object[]) : SomeInterface {
		return new MyDelegate
	}
}
```


The previous code is equivalent to:

```sarl
class MyClass implements SomeInterface {
	def function(param : String) : int {
		return provideDelegate(
			"function",
			#[typeof(String)],
			#[param]).function(param)
	}

	def provideDelegate(methodName : String, parameterTypes : Class<?>[], arguments : Object[]) : SomeInterface {
		return new MyDelegate
	}
}
```



## 4. @NoEqualityTestFunctionsGeneration

The `@NoEqualityTestFunctionsGeneration` annotation disables the generation the equality test functions, i.e. `equals()` and `hashCode()` from
the field declarations.

By default, the SARL compiler generates the equality test functions from the type's fields. In several cases, this automatic
behavior should be avoiding because the standard equality test that is provided by the Java run-time environment should be used.
In this case, `@NoEqualityTestFunctionsGeneration` annotation may be used to mark a type or a field for being excluded of the equality test generation. 

The annotation may mark a type, as in the following example.
In this case, no equality test function is generated within the marked type and all its subtypes.

```sarl
@NoEqualityTestFunctionsGeneration
class MyClass {
  var field1 : int
  var field2 : String
}
```



The annotation may mark a specific field in order to exclude it from the equality test generation.
In the following example, the `field2` field is marked with the annotation. Consequently, it
is not included within the equality test within the `equals()` function, and the hash code replied
by the `hashCode()` function does not include the hash code of the `field2` field.

```sarl
class MyClass {
  var field1 : int
  @NoEqualityTestFunctionsGeneration
  var field2 : String
}
```




## 5. @ToString

The `@ToString` annotation enables to generate the function that replies the string representation
of an object, a.k.a. as the `toString()` function in a Java program.
All non-static fields of the annotated class, and all of its superclasses are used for generating the `toString()` function.
This annotation can be applied to object-oriented types. The agent-oriented types cannot be annotated.

Let's a basic example:

```sarl
@ToString
class MyClass {
  var field1 : int
  var field2 : String
}
```




The previous code is equivalent to:

```sarl
class MyClass {
  var field1 : int
  var field2 : String

  def toString() : String {
    var buffer = new ToStringBuilder(this)
    buffer.add("field1", this.field1);
    buffer.add("field2", this.field2);
    return buffer.toString
  }
}
```



For brevity there are options to the annotation to hide field names, skip fields with null values and print everything on one line.




## 6. Acknowledgements

This documentation is inspired by the documentations from the
[Xtext](https://www.eclipse.org/Xtext/documentation.html) and
[Xtend](https://www.eclipse.org/xtend/documentation.html) projects.

## 7. Legal Notice

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
