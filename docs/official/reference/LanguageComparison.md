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

<table><thead>
<tr><th></th><th>SARL</th><th>Java</th><th>Xtend</th><th>Scala</th></tr>
</thead><tbody>
<tr><td colspan=5><strong>Agent-oriented programming</strong></td></tr>
<tr><td><a href="../index.html#agent-oriented-programming">Agent, Capacity, Skill, Behavior...</a></td>
			<td style="background: green; color: white;">Yes</td>
			<td style="background: orange; color: white;">No</td>
			<td style="background: orange; color: white;">No</td>
			<td style="background: yellow; color: black;">Partial: actor paradigm</td></tr>
<tr><td colspan=5><strong>Object-oriented programming</strong></td></tr>
<tr><td><a href="./OOP.html">Definition of class and interface types</a></td>
			<td style="background: green; color: white;">Yes</td>
			<td style="background: green; color: white;">Yes</td>
			<td style="background: green; color: white;">Yes</td>
			<td style="background: green; color: white;">Yes</td></tr>
<tr><td><a href="./OOP.html#enumeration">Object-oriented enumeration</a>
			<td style="background: orange; color: white;">No, only constants could be defined</td>
			<td style="background: green; color: white;">Yes, constants and functions could be defined</td>
			<td style="background: orange; color: white;">No, only constants could be defined</td>
			<td style="background: green; color: white;">Yes, constants and functions could be defined</td></tr>
<tr><td><a href="./OOP.html#annotation-type">Definition of annotation types</a></td>
			<td style="background: green; color: white;">Yes</td>
			<td style="background: green; color: white;">Yes</td>
			<td style="background: green; color: white;">Yes</td>
			<td style="background: green; color: white;">Yes</td></tr>
<tr><td><a href="./OOP.html#static-constructor-definition">Definition of static constructors</a></td>
			<td style="background: green; color: white;">Yes</td>
			<td style="background: green; color: white;">Yes</td>
			<td style="background: orange; color: white;">No</td>
			<td style="background: yellow; color: black;">See companion object</td></tr>
<tr><td>Inheritance of constructors</td>
			<td style="background: green; color: white;">Yes</td>
			<td style="background: orange; color: white;">No</td>
			<td style="background: orange; color: white;">No</td>
			<td style="background: orange; color: white;">No</td></tr>
<tr><td><a href="./general/ActiveAnnotations.html#Data">Automatic creation of read-only data structure</a></td>
			<td style="background: yellow; color: black;">Manual with <code>@Data</code> annotation</td>
			<td style="background: orange; color: white;">No</td>
			<td style="background: yellow; color: black;">Manual with <code>@Data</code> annotation</td>
			<td style="background: orange; color: white;">No</td></tr>
<tr><td><a href="./general/ActiveAnnotations.html#Accessors">Automatic creation of getters and setters</a></td>
			<td style="background: yellow; color: black;">Manual with <code>@Accessors</code> annotation</td>
			<td style="background: orange; color: white;">No</td>
			<td style="background: yellow; color: black;">Manual with <code>@Accessors</code> annotation</td>
			<td style="background: green; color: white;">Yes</td></tr>
<tr><td>Automatic creation of final-field constructor</td>
			<td style="background: orange; color: white;">No</td>
			<td style="background: orange; color: white;">No</td>
			<td style="background: yellow; color: black;">Manual with <code>@FinalFieldsConstructor</code> annotation</td>
			<td style="background: orange; color: white;">No</td></tr>
<tr><td>Automatic creation of <a href="https://docs.oracle.com/javase/8/docs/api/java/lang/Object.html#equals-java.lang.Object-"><code>equals()</code></a>
            and <a href="https://docs.oracle.com/javase/8/docs/api/java/lang/Object.html#hashCode--"><code>hashCode()</code></a></td>
			<td style="background: green; color: white;">Yes</td>
			<td style="background: orange; color: white;">No</td>
			<td style="background: yellow; color: black;">Manual with <code>@EqualsHashCode</code> annotation</td>
			<td style="background: green; color: white;">Yes, see case class</td></tr>
<tr><td>Automatic creation of <a href="https://docs.oracle.com/javase/8/docs/api/java/lang/Object.html#clone--"><code>clone()</code></a>
            when <a href="https://docs.oracle.com/javase/8/docs/api/java/lang/Cloneable.html">cloneable type</a></td>
			<td style="background: green; color: white;">Yes</td>
			<td style="background: orange; color: white;">No</td>
			<td style="background: orange; color: white;">No</td>
			<td style="background: green; color: white;">Yes</td></tr>
<tr><td>Automatic creation of a serialVersionUID field when
        <a href="https://docs.oracle.com/javase/8/docs/api/java/io/Serializable.html">serializable type</a></td>
			<td style="background: green; color: white;">Yes</td>
			<td style="background: orange; color: white;">No</td>
			<td style="background: orange; color: white;">No</td>
			<td style="background: yellow; color: black;">Manual with <code>@SerialVersionUID</code></td></tr>
<tr><td><a href="./general/ActiveAnnotations.html#ToString">Automatic creation of the <code>toString()</code> function.</a></td>
			<td style="background: yellow; color: black;">Manual with <code>@ToString</code> annotation</td>
			<td style="background: orange; color: white;">No</td>
			<td style="background: yellow; color: black;">Manual with <code>@ToString</code> annotation</td>
			<td style="background: green; color: white;">Yes, see case class</td></tr>
<tr><td colspan=5><strong>Functions, Procedures and Operators</strong></td></tr>
<tr><td><a href="./general/FuncDecls.html#7-dispatch-function">Definition of dispatch functions</a></td>
			<td style="background: green; color: white;">Yes</td>
			<td style="background: orange; color: white;">No</td>
			<td style="background: green; color: white;">Yes</td>
			<td style="background: orange; color: white;">No</td></tr>
<tr><td><a href="./general/Extension.html">Extension methods</a></td>
			<td style="background: green; color: white;">Yes</td>
			<td style="background: orange; color: white;">No</td>
			<td style="background: green; color: white;">Yes</td>
			<td style="background: green; color: white;">Yes</td></tr>
<tr><td><a href="./general/FuncDecls.html#variadic-function">Definition of variadic functions</a></td>
			<td style="background: green; color: white;">Yes</td>
			<td style="background: green; color: white;">Yes</td>
			<td style="background: green; color: white;">Yes</td>
			<td style="background: green; color: white;">Yes</td></tr>
<tr><td><a href="./general/FuncDecls.html#default-value-for-the-formal-parameters">Definition of default values for the formal parameters</a></td>
			<td style="background: green; color: white;">Yes</td>
			<td style="background: orange; color: white;">No</td>
			<td style="background: orange; color: white;">No</td>
			<td style="background: green; color: white;">Yes</td></tr>
<tr><td><a href="./general/Operators.html#operator-overloading">Operator overloading (except assignment and casting, see below)</a></td>
			<td style="background: green; color: white;">Yes</td>
			<td style="background: orange; color: white;">No</td>
			<td style="background: green; color: white;">Yes</td>
			<td style="background: green; color: white;">Yes</td></tr>
<tr><td><a href="./general/Cast.html">Cast operator overloading</a></td>
			<td style="background: green; color: white;">Yes</td>
			<td style="background: orange; color: white;">No</td>
			<td style="background: orange; color: white;">No</td>
			<td style="background: orange; color: white;">No</td></tr>
<tr><td><a href="./general/Operators.html">Assignment operator overloading</a></td>
			<td style="background: orange; color: white;">No</td>
			<td style="background: orange; color: white;">No</td>
			<td style="background: orange; color: white;">No</td>
			<td style="background: orange; color: white;">No</td></tr>
<tr><td>Automatic detection of <a href="http://download.eclipse.org/modeling/tmf/xtext/javadoc/2.9/org/eclipse/xtext/xbase/lib/Pure.html">pure functions</a> and marking</td>
			<td style="background: green; color: white;">Yes</td>
			<td style="background: orange; color: white;">No</td>
			<td style="background: orange; color: white;">No</td>
			<td style="background: orange; color: white;">No</td></tr>
<tr><td colspan=5><strong>Expressions</strong></td></tr>
<tr><td><a href="./general/Lambda.html">Definition of lambda expressions</a></td>
			<td style="background: green; color: white;">Yes</td>
			<td style="background: green; color: white;">Yes</td>
			<td style="background: green; color: white;">Yes</td>
			<td style="background: green; color: white;">Yes</td></tr>
<tr><td><a href="./general/VarDecls.html#typing">Inference of types</a></td>
			<td style="background: green; color: white;">Yes</td>
			<td style="background: orange; color: white;">No</td>
			<td style="background: green; color: white;">Yes</td>
			<td style="background: green; color: white;">Yes</td></tr>
<tr><td><a href="./general/LoopExpression.html#breaking-a-loop">Support the <code>break</code> statement</a></td>
			<td style="background: green; color: white;">Yes</td>
			<td style="background: green; color: white;">Yes</td>
			<td style="background: orange; color: white;">No</td>
			<td style="background: green; color: white;">Yes</td></tr>
<tr><td><a href="./general/LoopExpression.html#jump-to-the-next-iteration">Support the <code>continue</code> statement</a></td>
			<td style="background: green; color: white;">Yes</td>
			<td style="background: green; color: white;">Yes</td>
			<td style="background: orange; color: white;">No</td>
			<td style="background: green; color: white;">Yes</td></tr>
<tr><td><a href="./general/Cast.html#implicit-conversions">Implicit typecasting between number values</a>, including <code>AtomicInteger</code>, <code>AtomicLong</code>, <code>AtomicDouble</code>, <code>BigInteger</code>, and <code>BigDecimal</code></td>
			<td style="background: green; color: white;">Yes</td>
			<td style="background: yellow; color: black;">Partial: <a href="./general/Types.html#primitive-types">primitive</a> to <a href="./general/Types.html#primitive-types">primitive</a> types, primitive to object <a href="./general/Types.html#primitive-types">wrapper</a> types, and object <a href="./general/Types.html#primitive-types">wrapper</a> to <a href="./general/Types.html#primitive-types">primitive</a> types</td>
			<td style="background: yellow; color: black;">Partial: <a href="./general/Types.html#primitive-types">primitive</a> to <a href="./general/Types.html#primitive-types">primitive</a> types, primitive to object <a href="./general/Types.html#primitive-types">wrapper</a> types, and object <a href="./general/Types.html#primitive-types">wrapper</a> to <a href="./general/Types.html#primitive-types">primitive</a> types</td>
			<td style="background: green; color: white;">Yes</td></tr>
<tr><td><a href="./general/Operators.html">Arithmetic operations with any type of number as operand</a>, including <code>AtomicInteger</code>, <code>AtomicLong</code>, <code>AtomicDouble</code>, <code>BigInteger</code>, and <code>BigDecimal</code></td>
			<td style="background: green; color: white;">Yes</td>
			<td style="background: yellow; color: black;">Partial: <a href="./general/Types.html#primitive-types">primitive</a> and <a href="./general/Types.html#primitive-types">wrapper</a> types</td>
			<td style="background: yellow; color: black;">Partial: <a href="./general/Types.html#primitive-types">primitive</a> and <a href="./general/Types.html#primitive-types">wrapper</a> types</td>
			<td style="background: green; color: white;">Yes</td></tr>
</tbody></table>


##1. References

This documentation is based on elements from the following sources:

* [Xtend](https://www.eclipse.org/xtend/documentation.html)
* [Xtext](https://www.eclipse.org/Xtext/documentation.html)
* [Java Tutorials](https://docs.oracle.com/javase/tutorial/)
* [Scala Home Page](https://www.scala-lang.org/)



##2. Legal Notice

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.10
* Status: Stable Release
* Release: 2019-10-26

> Copyright &copy; 2014-2019 [the original authors or authors](http://www.sarl.io/about/index.html).
>
> Licensed under the Apache License, Version 2.0;
> you may not use this file except in compliance with the License.
> You may obtain a copy of the [License](http://www.apache.org/licenses/LICENSE-2.0).
>
> You are free to reproduce the content of this page on copyleft websites such as Wikipedia.

<small>Generated with the translator io.sarl.maven.docs.generator 0.10.0.</small>