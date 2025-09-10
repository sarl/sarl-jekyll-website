---
title: "Supported Types for Variables and Parameters"
layout: default
---

# Supported Types for Variables and Parameters


<ul class="page_outline" id="page_outline">

<li><a href="#1-primitive-types">1. Primitive Types</a></li>
<li><a href="#2-string-of-characters">2. String of Characters</a></li>
<li><a href="#3-default-values-of-primitive-types">3. Default Values of Primitive Types</a></li>
<li><a href="#4-immutable-types">4. Immutable Types</a></li>
<li><a href="#5-references">5. References</a></li>
<li><a href="#6-version-specification">6. Version Specification</a></li>
<li><a href="#7-legal-notice">7. Legal Notice</a></li>

</ul>



The SARL programming language is statically-typed, which means that all variables and parameters must first be declared before
they can be used. This involves stating the variable's type and name, as you've already seen:

```sarl
var gear : int = 1
```


		
Doing so tells your program that a field named `gear` exists, holds numerical data, and has an initial
value of `1`. A variable's data type determines the values it may contain, plus the operations that
may be performed on it. In addition to `int`, the SARL programming language supports other data types:

* Eight primitive data types, and
* Object data types (class, enumeration, annotation, etc.).


## 1. Primitive Types

A primitive type is predefined by the language and is named by a reserved keyword. Primitive values do not
share state with other primitive values. The eight primitive data types supported by the SARL programming language are:


| Type      | Object Equivalent (Wrapper) | Definition                                            |
| --------- | --------------------------- | ----------------------------------------------------- |
| `byte`    | `java.lang.Byte`            | The `byte` data type is an 8-bit signed two's complement integer. It has a minimum value of -128 and a maximum value of 127 (inclusive). The byte data type can be useful for saving memory in large arrays, where the memory savings actually matters. They can also be used in place of `int` where their limits help to clarify your code; the fact that a variable's range is limited can serve as a form of documentation. |
| `short`   | `java.lang.Short`           | The `short` data type is a 16-bit signed two's complement integer. It has a minimum value of -32,768 and a maximum value of 32,767 (inclusive). As with byte, the same guidelines apply: you can use a short to save memory in large arrays, in situations where the memory savings actually matters. |
| `int`     | `java.lang.Integer`         | By default, the `int` data type is a 32-bit signed two's complement integer, which has a minimum value of -2^31 and a maximum value of 2^(31)-1. In SARL, you can use the `int` data type to represent an unsigned 32-bit integer, which has a minimum value of 0 and a maximum value of 2^(32)-1. Use the `Integer` class to use `int` data type as an unsigned integer. Static methods like `compareUnsigned`, `divideUnsigned` etc have been added to the `Integer` class to support the arithmetic operations for unsigned integers. |
| `long`    | `java.lang.Long`            | The `long` data type is a 64-bit two's complement integer. The signed `long` has a minimum value of -2^63 and a maximum value of 2^(63)-1. In SARL, you can use the `long` data type to represent an unsigned 64-bit long, which has a minimum value of 0 and a maximum value of 2^(64)-1. Use this data type when you need a range of values wider than those provided by `int`. The `Long` class also contains methods like `compareUnsigned`, `divideUnsigned` etc to support arithmetic operations for unsigned long. |
| `float`   | `java.lang.Float`           | The `float` data type is a single-precision 32-bit IEEE 754 floating point. Its range of values is beyond the scope of this discussion, but is specified in the Floating-Point Types, Formats, and Values section of the SARL Language Specification. As with the recommendations for `byte` and `short`, use a `float` (instead of `double`) if you need to save memory in large arrays of floating point numbers. This data type should never be used for precise values, such as currency. For that, you will need to use the `java.math.BigDecimal` class Numbers and Strings covers `BigDecimal` and other useful classes provided by the SARL platform. |
| `double`  | `java.lang.Double`          | The `double` data type is a double-precision 64-bit IEEE 754 floating point. Its range of values is beyond the scope of this discussion, but is specified in the Floating-Point Types, Formats, and Values section of the SARL Language Specification. For decimal values, this data type is generally the default choice. As mentioned above, this data type should never be used for precise values, such as currency. |
| `boolean` | `java.lang.Boolean`         | The `boolean` data type has only two possible values: `true` and `false`. Use this data type for simple flags that track `true`/`false` conditions. This data type represents one bit of information, but its "size" isn't something that's precisely defined. |
| `char`    | `java.lang.Character`       | The `char` data type is a single 16-bit Unicode character. It has a minimum value of `\u0000` (or 0)  and a maximum value of `\uffff` (or 65,535 inclusive). |


## 2. String of Characters

In addition to the eight primitive data types listed above, the SARL  programming language also provides special
support for character strings via the `java.lang.String` class. Enclosing your character string within (double or simple) quotes
will automatically create a new `String` object; for example, `var s : String = "this is a string"`.

String objects are immutable, which means that once created, their values cannot be changed. The `String` class is not technically
a primitive data type, but considering the special support given to it by the language, you'll probably
tend to think of it as such.

## 3. Default Values of Primitive Types

It's not always necessary to assign a value when a field is declared. Fields that are declared but not initialized
will be set to a reasonable default by the compiler. Generally speaking, this default will be zero or null,
depending on the data type. Relying on such default values, however, is generally considered bad programming style.

The following chart summarizes the default values for the above data types.


| Data Type              | Default Value |
| ---------------------- | ------------- |
| `byte`                 | `0`           |
| `int`                  | `0`           |
| `long`                 | `0`           |
| `float`                | `0`           |
| `double`               | `0`           |
| `char`                 | `0`           |
| `boolean`	             | `false`       |
| `String` or any object | `null`        |


## 4. Immutable Types

All objects in SARL has an internal state (composed of the values of the different attributes, transitively).
As SARL is a strongly-typed language, each object is of a given type.
This type is said to be immutable when the internal state of a object of this type remains constant after it has been entirely created.
In other words, the values of the object's attributes cannot be changed after the object's construction.
 
Several types are always immutable in SARL (mostly from the Java API itself):

| Immutable Types |
| --------------- |
| io.sarl.lang.core.Event |
| java.io.File |
| java.lang.Boolean |
| java.lang.Byte |
| java.lang.Character |
| java.lang.Double |
| java.lang.Enum |
| java.lang.Float |
| java.lang.Integer |
| java.lang.Long |
| java.lang.Short |
| java.lang.StackTraceElement |
| java.lang.String |
| java.lang.annotation.Annotation |
| java.net.InetAddress |
| java.net.URI |
| java.net.URL |
| java.security.Permission |
| java.time.Clock |
| java.time.Duration |
| java.time.Instant |
| java.time.LocalDate |
| java.time.LocalDateTime |
| java.time.LocalTime |
| java.time.MonthDay |
| java.time.OffsetDateTime |
| java.time.OffsetTime |
| java.time.Period |
| java.time.Year |
| java.time.YearMonth |
| java.time.ZoneId |
| java.time.ZoneOffset |
| java.time.ZonedDateTime |
| java.util.Date |
| java.util.Locale |
| java.util.UUID |
| org.eclipse.xtext.util.Pair |
| org.eclipse.xtext.xbase.lib.Pair |


Additionally, you could define your own data type that is assumed to be immutable.
This definition is based on the usage of a specific annotation that is attached to your type.
The complete list of annotations that mark the types as immutable is:

| Annotations for Immutable Types |
| ------------------------------- |
| org.eclipse.xtend.lib.Data |
| org.eclipse.xtend.lib.annotations.Data |


For illustration, the `@Data` annotation, that is described in the [active annotation documentation](./ActiveAnnotations.html#data),
could be used as below:

```sarl
@Data class Person {
  val firstName : String
  val lastName : String
}
```


## 5. References

This documentation is based on documentations from the Xtext and Xtend projects, and from the Java tutorials.
Thank you to the contributors to these documents.

* [Xtend](https://www.eclipse.org/xtend/documentation.html)
* [Xtext](https://www.eclipse.org/Xtext/documentation.html)
* [Java Tutorials](https://docs.oracle.com/javase/tutorial/)

## 6. Version Specification

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.15
* Status: Stable Release
* Release: 2025-09-10

## 7. Legal Notice

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
