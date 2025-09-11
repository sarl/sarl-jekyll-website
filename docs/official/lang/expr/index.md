---
title: "General Syntax Reference of he SARL Language"
layout: default
---

# General Syntax Reference of he SARL Language


<ul class="page_outline" id="page_outline">

<li><a href="#1-basic-language-constructs">1. Basic Language Constructs</a></li>
<ul>
  <li><a href="#11-structure-of-sarl-scripts">1.1. Structure of SARL Scripts</a></li>
  <li><a href="#12-variables-and-types">1.2. Variables and Types</a></li>
  <li><a href="#13-literals-and-operators">1.3. Literals and Operators</a></li>
  <li><a href="#14-feature-access">1.4. Feature Access</a></li>
</ul>
<li><a href="#2-control-flow">2. Control Flow</a></li>
<ul>
  <li><a href="#21-conditional-statements">2.1. Conditional Statements</a></li>
  <li><a href="#22-loops">2.2. Loops</a></li>
</ul>
<li><a href="#3-functions-and-lambda-expressions">3. Functions and Lambda Expressions</a></li>
<ul>
  <li><a href="#31-function-declarations">3.1. Function Declarations</a></li>
  <li><a href="#32-lambda-expressions">3.2. Lambda Expressions</a></li>
</ul>
<li><a href="#4-advanced-features">4. Advanced Features</a></li>
<ul>
  <li><a href="#41-error-handling-and-code-quality-improvement">4.1. Error Handling and Code Quality Improvement</a></li>
  <li><a href="#42-synchronization-of-resources">4.2. Synchronization of Resources</a></li>
  <li><a href="#43-extensions-and-metaprogramming">4.3. Extensions and Metaprogramming</a></li>
</ul>
<li><a href="#5-references">5. References</a></li>
<li><a href="#6-version-specification">6. Version Specification</a></li>
<li><a href="#7-legal-notice">7. Legal Notice</a></li>

</ul>


SARL is designed to facilitate the creation of agent-based systems. It combines agent-specific constructs with several functional, imperative and object-oriented principles, providing a robust framework for developing autonomous and interactive agents. Below is an overview of the core features of SARL.

## 1. Basic Language Constructs

### 1.1. Structure of SARL Scripts

- [Script](./Script.html): SARL scripts are the basic units of execution, containing a series of types, statements and expressions.
- [Naming Convention](./Names.html): SARL has specific rules and conventions for naming variables, functions, and other constructs.
- [Statements](./Statements.html): Statements in SARL are used to perform actions, including variable declarations, control flow, and more.
- [Block Documentation](./Block.html): Blocks in SARL define scopes for variables and control structures.

### 1.2. Variables and Types

- [Variable Declarations](./VarDecls.html): SARL supports various ways to declare variables, including type inference and explicit typing.
- [Types](./Types.html): SARL provides a rich type system, including primitive types, custom types, and collections.
- [Cast Operator](./Cast.html): SARL supports type casting, allowing for explicit conversion between types.

### 1.3. Literals and Operators

- [Literals](./Literals.html): These are fixed values that can be directly used in code, such as numbers, strings, and booleans.
- [Operators](./Operators.html): SARL supports a wide range of operators for arithmetic, logical, and relational operations.

### 1.4. Feature Access

- [Member Access](./MemberAccess.html): This feature allows access to the members (fields and methods) of objects and classes.
- [Java Interoperability](./JavaInterroperability.html): SARL is designed to interoperate seamlessly with Java, allowing for the integration of Java libraries and frameworks.

## 2. Control Flow

### 2.1. Conditional Statements

- [If Expression](./IfExpression.html): Conditional logic in SARL is handled through `if` expressions, allowing for branching execution paths.
- [Switch Expression](./SwitchExpression.html): Switch expressions provide a concise way to handle multiple conditional branches.

### 2.2. Loops

- [Loop Expressions](./LoopExpression.html): SARL supports various loop constructs for iterative execution, including for, while, and do-while loops.

## 3. Functions and Lambda Expressions

### 3.1. Function Declarations

- [Function Declarations](./FuncDecls.html): Functions in SARL can be declared to encapsulate reusable pieces of code.

### 3.2. Lambda Expressions

- [Lambda](./Lambda.html): Lambdas provide a concise way to define anonymous functions, facilitating functional programming patterns.

## 4. Advanced Features

### 4.1. Error Handling and Code Quality Improvement

- [Exceptions](./Exception.html): SARL includes mechanisms for handling exceptions, allowing for robust error management.
- [Assertions](./Assertion.html): Assertions are used to validate assumptions within the code, aiding in debugging and testing.

### 4.2. Synchronization of Resources

- [Synchronization](./Synchronization.html): SARL provides constructs for synchronizing access to shared resources, ensuring parallel execution (thread) safety.

### 4.3. Extensions and Metaprogramming

- [Extension Methods](./Extension.html): SARL supports extension methods to enhance the functionality of types.
- [Active Annotations](./ActiveAnnotations.html): Annotations in SARL can be used to add metadata and influence the behavior of agents.
- [Synthetic Functions](./SyntheticFunctions.html): These are automatically generated functions that facilitate common patterns and reduce boilerplate code.


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
* Release: 2025-09-11

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

<small>Generated with the translator docs.generator 0.15.1.</small>
