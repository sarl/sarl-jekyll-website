---
title: "Active Annotations"
layout: default
---

# Active Annotations


<ul class="page_outline" id="page_outline">

<li><a href="#1-accessors">1. @Accessors</a></li>
<li><a href="#2-data">2.  @Data</a></li>
<li><a href="#3-delegate">3.  @Delegate</a></li>
<li><a href="#4-inline">4. @Inline</a></li>
<li><a href="#5-noequalitytestfunctionsgeneration">5. @NoEqualityTestFunctionsGeneration</a></li>
<li><a href="#6-tostring">6. @ToString</a></li>
<li><a href="#7-references">7. References</a></li>
<li><a href="#8-version-specification">8. Version Specification</a></li>
<li><a href="#9-legal-notice">9. Legal Notice</a></li>

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
To uses this annotation, you have to import it as:

```sarl
import org.eclipse.xtend.lib.annotations.Accessors
```






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
`@Data` is processed according to the following rules:

* all fields are final, i.e. they must be declared with `val`,
* getter methods will be generated (if they do not yet exist),
* a constructor with parameters for all non-initialized fields will be generated (if it does not exist),
* equals(Object) / hashCode() methods will be generated (if they do not exist),
* a toString() method will be generated (if it does not exist).

This annotation can be applied to object-oriented types. The agent-oriented types cannot be annotated.

Example:
```sarl
import org.eclipse.xtend.lib.annotations.Data
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
import org.eclipse.xtend.lib.annotations.Delegate
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




## 4. @Inline

The `@Inline` annotation is related to the feature of the SARL compiler that suggests that the compiler substitutes the code within the annotation definition in place of each call to that function.

In theory, using `@Inline` functions can make your program faster because they eliminate the overhead associated with function calls.
From background point-of-view, calling a function requires pushing the return address on the stack, pushing arguments onto the stack, jumping to the function body, and then executing a return instruction when the function finishes.
This process is eliminated by inlining the function.
The compiler also has different opportunities to optimize functions expanded inline versus those that aren't.
A tradeoff of inline functions is that the overall size of your program can increase.

The following code is an example of the usage of the `@Inline` annotation.
The defined function is computing the double of the multiplication of the two arguments.
The annotation specifies the **Java** expression that will be used as a replacement in the Java code for the function call to `mul`.

```sarl
import org.eclipse.xtext.xbase.lib.Inline
class MyClass {
	@Inline("((﹩1) * (﹩2) * 2)")
	def mul(a : int, b : int) : int {
		a * b * 2
	}
}
```


As it is illustrated before, the value of the annotation represents the Java code replacement.
This inline format string contains valid Java code with several placeholders like `$1`, `$2`, etc.
The number after the dollar sign corresponds to the index of the information that is used during the replacement process.
When the inlined function has `1..n` parameters, then `$1` to `$n` are used to represent there parameters, and the subsequent `m` values corresponds to the `m` types specified with the `imported` parameter of the `@Inline` annotation.
The next index `$n+m+1`} can be used to insert all type parameters of the original declaration.
And, finally the last indices refer to the upper bound substitute of the type parameters individually.

In the case a not-static function, two special numbers are reserved: `$0` is replaced by the object expression for which the inlined function was called, followed by a `.` character; and `$-1` is replaced by the object expression for which the inlined function was called, without a following `.` character.

Let the following example for illustrating the values of the `@Inline` placeholders.

```sarl
@Inline(value="......", imported = typeof(BigDecimal))
def myMethod(p1 : String, p2 : String) : void with T1, T2 extends Byte
```


The call to the previously defined function is:

```sarl
var obj : MyInterface
obj.<Integer, Byte>myMethod("abc", "def")
```


The following table provides a synthetic view of the `@Inline` placeholders.

| N.  | Description | In the example |
| --- | ----------- | -------------- |
| -1 | The calling receiver of the function without final dot character | `obj` |
| 0 | The calling receiver of the function with final dot character | `obj.` |
| [1..n] | `n` parameters of the function | `"abc"`, `"def"` | 
| (n..k] | `m` imported types (k=n+1+m) | `typeof(BigDecimal)` |
| k+1 | all of the `p` generic types of the function | `T1, T2 extends Byte` | 
| (k+1..i] | Upper bound of the type parameters (i=k+p+2) | `Object`, `Byte` |


The `@Inline` annotation has different arguments:

| Argument | Description |
| -------- | ----------- |
| `value` | The inline format string |
| `imported` | Types that should be imported to inline the operation |
| `statementExpression` | Whether the inlined expression is a statement expression in the Java code |
| `constantExpression` | Whether the compiled Java is a constant expression operator, i.e. `$0` is not automatically written as a prefix of the provided inline format string |




## 5. @NoEqualityTestFunctionsGeneration

The `@NoEqualityTestFunctionsGeneration` annotation disables the generation the equality test functions, i.e. `equals()` and `hashCode()` from
the field declarations.

By default, the SARL compiler generates the equality test functions from the type's fields. In several cases, this automatic
behavior should be avoiding because the standard equality test that is provided by the Java run-time environment should be used.
In this case, `@NoEqualityTestFunctionsGeneration` annotation may be used to mark a type or a field for being excluded of the equality test generation. 

The annotation may mark a type, as in the following example.
In this case, no equality test function is generated within the marked type and all its subtypes.

```sarl
import io.sarl.lang.core.annotation.NoEqualityTestFunctionsGeneration
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



## 6. @ToString

The `@ToString` annotation enables to generate the function that replies the string representation
of an object, a.k.a. as the `toString()` function in a Java program.
All non-static fields of the annotated class, and all of its superclasses are used for generating the `toString()` function.
This annotation can be applied to object-oriented types. The agent-oriented types cannot be annotated.

Let's a basic example:

```sarl
import org.eclipse.xtend.lib.annotations.ToString
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
