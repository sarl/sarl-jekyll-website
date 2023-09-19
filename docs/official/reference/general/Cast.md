---
title: "Cast and Type Conversions"
layout: default
---

# Cast and Type Conversions

Because SARL is statically-typed at compile time, after a variable is declared, it cannot be declared again or assigned a
value of another type unless that type is implicitly convertible to the variable's type.
For example, the `String` cannot be implicitly converted to `int`. Therefore, after you declare `i` as an `int`, you
cannot assign the string `"Hello"` to it, as the following code shows:

```sarl
var i : int
i = "Hello" // Error: "Cannot cast String to int"
```



However, you might sometimes need to copy a value into a variable or method parameter of another type.
For example, you might have an integer variable that you need to pass to a method whose parameter is typed as `double`.
Or you might need to assign a class variable to a variable of an interface type. These kinds of operations are
called *type conversions*.
In SARL, you can perform the following kinds of conversions:

* **Implicit conversions:** No special syntax is required because the conversion is type safe and no data will be lost.
  Examples include conversions from smaller to larger number types, and conversions from derived classes to base classes.
* **Explicit conversions (casts):** Explicit conversions require a casting operator. Casting is required when information
  might be lost in the conversion, or when the conversion might not succeed for other reasons. Typical examples include
  numeric conversion to a type that has less precision or a smaller range, and conversion of a base-class instance to a
  derived class.
* **User-defined conversions:** User-defined conversions are performed by special methods that you can define to enable
  explicit and implicit conversions between custom types that do not have a base class–derived class relationship.
  For more information, see [Conversion Operators](#4-conversion-operators).


## 1. Implicit Conversions

For built-in types, e.g. numeric types, an implicit conversion can be made when the value to be stored can fit into
the variable without being truncated or rounded off. For example, a variable of type long (64-bit integer) 
can store any value that an int (32-bit integer) can store. In the following example, the compiler implicitly
converts the value of `num` on the right to a type long before assigning it to `bigNum`.

```sarl
var num : int = 2147483647
var bigNum : long = num
```



The following table shows the predefined implicit conversions between SARL types.


| From          | To                                                                                                       |
| ------------- | -------------------------------------------------------------------------------------------------------- |
| T[]           | List<T>                                                                                                  |
| boolean       | Boolean                                                                                                  |
| Boolean       | boolean                                                                                                  |
| byte          | Byte, short, int, long, float, double                                                                    |
| Byte          | byte, short, int, long, float, double                                                                    |
| char          | Character, String                                                                                        |
| Character     | char, String                                                                                             |
| double        | Double                                                                                                   |
| Double        | double                                                                                                   |
| float         | Float, double                                                                                            |
| Float         | float, double                                                                                            |
| int           | Integer, long, float, double                                                                             |
| Integer       | int, long, float, double                                                                                 |
| List<T>       | T[]                                                                                                      |
| long          | Long, float, double                                                                                      |
| Long          | long, float, double                                                                                      |
| short         | Short, int, long, float, double                                                                          |
| Short         | short, int, long, float, double                                                                          |
| String        | char, Character (if string length is 1)                                                                  |



## 2. Explicit Conversions

However, if a conversion cannot be made without a risk of losing information, the compiler requires that you perform
an explicit conversion, which is called a cast. A cast is a way of explicitly informing the compiler that you
intend to make the conversion and that you are aware that data loss might occur. To perform a cast, specify
the value or variable to be converted, followed by the `as` keyword and the type that you are casting.
The following program casts a `double` to an `int`. The program will not compile without the cast.

```sarl
var x : double = 1234.7
var a : int
// Cast double to int.
a = x as int
```






For object types, an explicit cast is required if you need to convert from a base type to a derived type:

```sarl
// Create a new derived type
var g = new Giraffe

// implicit conversion to base type is safe.
var a : Animal = g

// Explicit conversion is required to cast back to derived type.
// Note: This will compile but will throw an exception at run time if the right-side
// object is not in fact a Giraffe.
var g2 : Giraffe
g2 = a as Giraffe
```



A casting operation between reference types does not change the run-time type of the underlying object; it only changes
the type of the value that is being used as a reference to that object.


The following table shows the predefined explicit conversions that are predefined into 
SARL.


| From          | To                                                                                                       |
| ------------- | -------------------------------------------------------------------------------------------------------- |
| boolean       | String                                                                                                   |
| byte          | byte, short, int, long, float, double, AtomicInteger, AtomicLong, AtomicDouble, BigInteger, BigDecimal   |
| char          | String                                                                                                   |
| double        | byte, short, int, long, float, double, AtomicInteger, AtomicLong, AtomicDouble, BigInteger, BigDecimal   |
| float         | byte, short, int, long, float, double, AtomicInteger, AtomicLong, AtomicDouble, BigInteger, BigDecimal   |
| int           | byte, short, int, long, float, double, AtomicInteger, AtomicLong, AtomicDouble, BigInteger, BigDecimal   |
| long          | byte, short, int, long, float, double, AtomicInteger, AtomicLong, AtomicDouble, BigInteger, BigDecimal   |
| Number        | byte, short, int, long, float, double, AtomicInteger, AtomicLong, AtomicDouble, BigInteger, BigDecimal   |
| Object        | String                                                                                                   |
| short         | byte, short, int, long, float, double, AtomicInteger, AtomicLong, AtomicDouble, BigInteger, BigDecimal   |
| String        | boolean, char, byte, short, int, long, float, double, AtomicInteger,  AtomicLong, AtomicDouble           |
|               | BigInteger, BigDecimal                                                                                   |


## 3. Type Conversion Exceptions at Run Time

In some reference type conversions, the compiler cannot determine whether a cast will be valid. It is possible for
a casting operation that compiles correctly to fail at run time. As shown in the following example, a type cast
that fails at run time will cause an `ClassCastException` to be thrown.

```sarl
class Animal {}

class Reptile extends Animal {}

class Mammal extends Animal {}

class Test {
    static def main {
    	test(new Mammal())
    }
	static def test(a : Animal) {
		// Cause a ClassCastException at run time
		// because Mammal is not convertible to [:reptiletype].
		var r : Reptile
		r = a as Reptile
	}
}
```



SARL provides the `instanceof` operator to enable you to test for compatibility before actually performing a cast.

The `instanceof` operator evaluates type compatibility at runtime. It determines whether an object instance or
the result of an expression can be converted to a specified type. It has the syntax:

```sarl
expr instanceof type
```



where `expr` is an expression that evaluates to an instance of some type, and `type` is the name of the
type to which the result of `expr` is to be converted. The `instanceof` operator is `true` if
`expr` is non-null and the object that results from evaluating the expression can be converted to
`type`; otherwise, it returns `false`.


## 4. Conversion Operators

SARL enables programmers to declare conversions on classes or basic types so that classes or basic types can
be converted to and/or from other classes or basic types. Conversions are associated to the `as`
type casting operator. When the compiler cannot proceed an implicit nor explicit casting, it tries
to find within the current code scope the definition of a casting operator function.
Depending on the category of the type to cast to, the name of this casting operator function is different:

* **Object type:** the casting operator function's name must have the prefix `to` followed by the simple name
  (first letter upper case) of the cast type, e.g. `toString`.
* **Basic type:** the casting operator function's name must start with the name of the basic type (all lower
  case) following by the post-fix `Value`, e.g. `intValue`.

Additionnally, the return type of the casting operator function must be the cast type, and not a sub-type of the
type specified as right operand of the casting operator.

A single parameter may be specified or not. If it is specified, it is the expression to cast.
It means that the type of the formal parameter is the expected type of the expression.
If the formal parameter is omitted, the current object (`this`) is assumed to be converted.

In the following example, the function `toInteger` is defined for converting a `Type` to `Integer`.
When the expression `obj as Integer` is evaluated by the compiler, the function `toInteger` is discovered and used
for proceeding the cast.
 
```sarl
class Type {
	def toInteger : Integer { 0 }
}
class Test {
    def main {
    	var obj : Type
    	var value = obj as Integer
    }
}
```



In the second example below, the function `toInteger` is defined in the same class as the one where the cast operator is
defined.
When the expression `obj as Integer` is evaluated by the compiler, the function `toInteger` is discovered and used
for proceeding the cast.
 
```sarl
class Type {
}
class Test {
    def main {
    	var obj : Type
    	var value = obj as Integer
    }
	def toInteger(v : Type) : Integer { 0 }
}
```



Any function that is declared into the scope of the cast operator, and following the rules that are described above, may
be a candidate for being the cast operator function.



The two previous example have an object type as the cast type. The two following examples have the basic type `int`.
The declarations of the `toInteger` are replaced by declarations of `intValue`.

```sarl
class Type {
	def intValue : int { 0 }
}
class Test {
    def main {
    	var obj : Type
    	var value = obj as int
    }
}
```



```sarl
class Type {
}
class Test {
    def main {
    	var obj : Type
    	var value = obj as int
    }
	def intValue(v : Type) : int { 0 }
}
```



## 5. Acknowledgements

This documentation is inspired by the documentations from the
[Xtext](https://www.eclipse.org/Xtext/documentation.html) and
[Xtend](https://www.eclipse.org/xtend/documentation.html) projects.

## 6. Legal Notice

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.13
* Status: Stable Release
* Release: 2023-09-19

> Copyright &copy; 2014-2023 [SARL.io, the Original Authors and Main Authors](https://www.sarl.io/about/index.html).
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

<small>Generated with the translator docs.generator 0.13.0.</small>
