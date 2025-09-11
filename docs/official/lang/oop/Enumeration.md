---
title: "Enumeration"
layout: default
---

# Enumeration


<ul class="page_outline" id="page_outline">

<li><a href="#1-define-an-enumeration">1. Define an Enumeration</a></li>
<li><a href="#2-modifiers">2. Modifiers</a></li>
<ul>
  <li><a href="#21-top-enumeration-modifiers">2.1. Top Enumeration Modifiers</a></li>
  <li><a href="#22-nested-enumeration-modifiers">2.2. Nested Enumeration Modifiers</a></li>
</ul>
<li><a href="#3-references">3. References</a></li>
<li><a href="#4-version-specification">4. Version Specification</a></li>
<li><a href="#5-legal-notice">5. Legal Notice</a></li>

</ul>


An enumeration specifies a list of constant values assigned to a type.

The SARL enumeration is not object-oriented unlike the enumeration in the Java programming language. It means
that you cannot define methods nor attributes in the enumeration.


## 1. Define an Enumeration

For defining an enumeration, you could use the `enum` keyword.
The following example defines the enumeration `MyEnum` with two constants: 

```sarl
enum MyEnum {
	CONSTANT_1,
	CONSTANT_2
}
```



## 2. Modifiers

Modifiers are used to modify declarations of types and type members. This section introduces the modifiers for the enumeration.
The modifiers are usually written before the keyword for defining the enumeration.

The complete description of the modifiers' semantic is available on [this page](./Modifiers.html).


### 2.1. Top Enumeration Modifiers

A top enumeration may be declared with one or more modifiers, which affect its runtime behavior:
* Access modifiers:
	* `public`:  the class is accessible from any other type (default);
	* `package`: the class is accessible from only the types in the same package.

Examples:

```sarl
public enum TopEnumeration1 {
	CST1, CST2
}
package enum TopEnumeration2 {
	CST3, CST4
}
```



### 2.2. Nested Enumeration Modifiers

A nested interface may be declared with one or more modifiers, which affect its runtime behavior:

* Access modifiers:
	* `public`: there are no restrictions on accessing the enumeration (default);
	* `protected`: the enumeration is accessible within the same package, and derived classes;
	* `package`: the enumeration is accessible only within the same package as its class;
	* `private`: the enumeration is accessible only within its class.
* `static`: the inner enumeration do not have access to the non-static members of the enclosing type.

<p markdown="1"><span class="label label-warning">Terminology</span> Nested enumerations are divided into two categories: static and non-static. Nested enumerations that are declared static are called **static nested enumerations**. Non-static nested enumerations are called **inner enumerations**.</p>

<p markdown="1"><span class="label label-info">Note</span> The modifiers may differ from the previously described, depending on the enclosing type, e.g. agent.</p>

```sarl
class EnclosingClass {
	public enum NestedClass1 {
		CST1, CST2
	}
	protected enum NestedClass2 {
		CST3, CST4
	}
	package enum NestedClass3 {
		CST5, CST6
	}
	private enum NestedClass4 {
		CST7, CST8
	}
	static enum NestedClass5 {
		CST9, CST10
	}
}
```


## 3. References

This documentation is based on documentations from the Xtext and Xtend projects, and from the Java tutorials.
Thank you to the contributors to these documents.

* [Xtend](https://www.eclipse.org/xtend/documentation.html)
* [Xtext](https://www.eclipse.org/Xtext/documentation.html)
* [Java Tutorials](https://docs.oracle.com/javase/tutorial/)

## 4. Version Specification

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.15
* Status: Stable Release
* Release: 2025-09-11

## 5. Legal Notice

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

<small>Generated with the translator docs.generator 0.15.1.</small>
