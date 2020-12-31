---
title: "Comparison between SARL and Other Languages"
layout: default
---

# Comparison between SARL and Other Languages

<a href="https://en.wikipedia.org/wiki/Java_(programming_language)">Java</a>, [Xtend](https://www.eclipse.org/xtend/) and
[Scala](http://scala-lang.org/) are object-oriented programming languages.
As SARL, Xtend is based on the [Xtext](https://www.eclipse.org/Xtext/) libraries for compiling to the Java language.

The main features coming from the Java language are supported by SARL too. The following table provides the major
differences between the SARL, Java, Xtend and Scala languages, excluding any feature provided by the development
environment (Eclipse, IntelliJ...)

## 1. Agent-Oriented Programming Features

|                                                                               |SARL |Java|Xtend| Scala                   |
|:----------------------------------------------------------------------------- |:---:|:--:|:---:|:-----------------------:|
| [Agent, Capacity, Skill, Behavior...](../index.html#agent-oriented-programming) | Yes | <span style="color: red;">No</span> | <span style="color: red;">No</span>  | <span style="color: orange;">Partial: actor paradigm</span> |



## 2. Object-Oriented Programming Features

|                                                                               |SARL |Java|Xtend| Scala                   |
|:----------------------------------------------------------------------------- |:---:|:--:|:---:|:-----------------------:|
| [Definition of class and interface types](./OOP.html)                           | Yes |Yes | Yes | Yes                     |
| [Object-oriented enumeration](./OOP.html#enumeration)                           | <span style="color: orange;">No, only constants could be defined</span> | Yes, constants and functions could be defined | <span style="color: red;">No, only constants could be defined</span> | Yes, constants and functions could be defined |
| [Definition of annotation types](./OOP.html#annotation-type)                    | Yes |Yes | Yes | Yes                     |
| [Definition of static constructors](./OOP.html#static-constructor-definition)   | Yes | Yes | <span style="color: red;">No</span> | <span style="color: orange;">See companion object</span> |
| Inheritance of constructors                                                   | Yes | <span style="color: red;">No</span> | <span style="color: red;">No</span> | <span style="color: red;">No</span> |
| [Automatic creation of read-only data structure](./general/ActiveAnnotations.html#data) | <span style="color: orange;">Manual with `@Data` annotation</span> | <span style="color: red;">No</span> | <span style="color: orange;">Manual with `@Data` annotation</span>| <span style="color: red;">No</span> |
| [Automatic creation of getters and setters](./general/ActiveAnnotations.html#accessors) | <span style="color: orange;">Manual with `Accessors` annotation</span> | <span style="color: red;">No</span> | <span style="color: orange;">Manual with @Accessors annotation</span> | Yes |
| Automatic creation of final-field constructor                                  | <span style="color: red;">No</span> | <span style="color: red;">No</span> | <span style="color: orange;">Manual with `@FinalFieldsConstructor` annotation</span> | <span style="color: red;">No</span> |
| Automatic creation of [equals()](https://docs.oracle.com/javase/8/docs/api/java/lang/Object.html#equals-java.lang.Object-)
            and [hashCode()](https://docs.oracle.com/javase/8/docs/api/java/lang/Object.html#hashCode--) | Yes | <span style="color: red;">No</span> | <span style="color: orange;">Manual with @EqualsHashCode annotation</span> | Yes, see case class |
| Automatic creation of [clone()](https://docs.oracle.com/javase/8/docs/api/java/lang/Object.html#clone--) when cloneable type | Yes | <span style="color: red;">No</span> | <span style="color: red;">No</span> | Yes |
| Automatic creation of a serialVersionUID field when
        [serializable type](https://docs.oracle.com/javase/8/docs/api/java/io/Serializable.html) | Yes | <span style="color: red;">No</span> | <span style="color: red;">No</span> | <span style="color: orange;">Manual with `@SerialVersionUID`</span> |
| [Automatic creation of the toString() function](./general/ActiveAnnotations.html#tostring) | <span style="color: orange;">Manual with `@ToString` annotation</span> | <span style="color: red;">No</span> | <span style="color: orange;">Manual with `@ToString` annotation</span> | Yes, see case class |



## 3. Functions, Procedures and Operators

|                                                                               |SARL |Java|Xtend| Scala                   |
|:----------------------------------------------------------------------------- |:---:|:--:|:---:|:-----------------------:|
| [Definition of dispatch functions](./general/FuncDecls.html#7-dispatch-function) | Yes | <span style="color: red;">No</span> | Yes | <span style="color: red;">No</span> |
| [Extension methods](./general/Extension.html) | Yes | <span style="color: red;">No</span> | Yes | Yes |
| [Definition of variadic functions](./general/FuncDecls.html#variadic-function) | Yes | Yes | Yes | Yes |
| [Definition of default values for the formal parameters](./general/FuncDecls.html#default-value-for-the-formal-parameters) | Yes | <span style="color: red;">No</span> | <span style="color: red;">No</span> | Yes |
| [Operator overloading](./general/Operators.html#operator-overloading) (except assignment and casting, see below) | Yes | <span style="color: red;">No</span> | Yes | Yes |
| [Cast operator overloading](./general/Cast.html) | Yes | <span style="color: red;">No</span> | <span style="color: red;">No</span> | <span style="color: red;">No</span> |
| [Assignment operator overloading](./general/Operators.html) | <span style="color: red;">No</span> | <span style="color: red;">No</span> | <span style="color: red;">No</span> | <span style="color: red;">No</span> |
| Automatic detection of [pure functions](http://download.eclipse.org/modeling/tmf/xtext/javadoc/2.9/org/eclipse/xtext/xbase/lib/Pure.html) and marking | Yes | <span style="color: red;">No</span> | <span style="color: red;">No</span> | <span style="color: red;">No</span> |



## 4. Code Expressions

|                                                                               |SARL |Java|Xtend| Scala                   |
|:----------------------------------------------------------------------------- |:---:|:--:|:---:|:-----------------------:|
| [Definition of lambda expressions](./general/Lambda.html) | Yes | Yes | Yes | Yes |
| [Inference of types](./general/VarDecls.html#typing) | Yes | <span style="color: red;">No</span> | Yes | Yes |
| [Support the break statement](./general/LoopExpression.html#breaking-a-loop) | Yes | Yes | <span style="color: red;">No</span> | Yes |
| [Support the continue statement](./general/LoopExpression.html#jump-to-the-next-iteration) | Yes | Yes | <span style="color: red;">No</span> | Yes |
| [Implicit typecasting between number values](./general/Cast.html#implicit-conversions), including `AtomicInteger`, `AtomicLong`, `AtomicDouble`, `BigInteger`, and `BigDecimal` | Yes | <span style="color: orange;">Partial: [primitive](./general/Types.html#primitive-types) to [primitive types](./general/Types.html#primitive-types), primitive to [object wrapper types](./general/Types.html#primitive-types), and [object wrapper](./general/Types.html#primitive-types) to [primitive types](./general/Types.html#primitive-types)</span> | <span style="color: orange;">Partial: [primitive](./general/Types.html#primitive-types) to [primitive types](./general/Types.html#primitive-types), primitive to [object wrapper types](./general/Types.html#primitive-types), and [object wrapper](./general/Types.html#primitive-types) to [primitive types](./general/Types.html#primitive-types)</span> | Yes |
| [Arithmetic operations with any type of number as operand](./general/Operators.html), including `AtomicInteger`, `AtomicLong`, `AtomicDouble`, `BigInteger`, and `BigDecimal` | Yes | <span style="color: orange;">Partial: [primitive](./general/Types.html#primitive-types) and [wrapper types](./general/Types.html#primitive-types) | Partial: primitive and [wrapper types](./general/Types.html#primitive-types) | Yes |



## 5. References

This documentation is based on elements from the following sources:

* [Xtend](https://www.eclipse.org/xtend/documentation.html)
* [Xtext](https://www.eclipse.org/Xtext/documentation.html)
* [Java Tutorials](https://docs.oracle.com/javase/tutorial/)
* [Scala Home Page](https://www.scala-lang.org/)



## 6. Legal Notice

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.12
* Status: Draft Release
* Release: 2020-12-31

> Copyright &copy; 2014-2020 [the original authors or authors](http://www.sarl.io/about/index.html).
>
> Licensed under the Apache License, Version 2.0;
> you may not use this file except in compliance with the License.
> You may obtain a copy of the [License](http://www.apache.org/licenses/LICENSE-2.0).
>
> You are free to reproduce the content of this page on copyleft websites such as Wikipedia.

<small>Generated with the translator io.sarl.maven.docs.generator 0.12.0-SNAPSHOT.</small>
