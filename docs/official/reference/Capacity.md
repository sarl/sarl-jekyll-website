---
title: "Capacity Reference"
layout: default
---

# Capacity Reference


<ul class="page_outline" id="page_outline">

<li><a href="#1-defining-a-capacity">1. Defining a Capacity</a></li>
<ul>
  <li><a href="#1-1-capacity-definition">1.1. Capacity Definition</a></li>
  <li><a href="#1-2-extending-a-capacity">1.2. Extending a Capacity</a></li>
  <li><a href="#1-3-extending-multiple-capacities">1.3. Extending Multiple Capacities</a></li>
  <li><a href="#1-4-modifiers">1.4. Modifiers</a></li>
</ul>
<li><a href="#2-built-in-capacities">2. Built-in Capacities</a></li>
<li><a href="#3-use-of-the-capacities">3. Use of the Capacities</a></li>
<li><a href="#4-legal-notice">4. Legal Notice</a></li>

</ul>


This document describes how to define Capacities in SARL. Before reading this document, we recommend that you read
the [General Syntax Reference](./GeneralSyntax.html).

An *Action* is code (a public method or function) that transforms a part of the designed system or its environment.
This transformation guarantees resulting properties if the system before the transformation satisfies
a set of constraints. An Action is defined in terms of pre- and post-conditions.

A *Capacity* is the specification of a collection of Actions. This specification makes no assumptions about the
implementation of each Action. It is used to specify what an Agent can do, what behavior is required for its execution.

A *Skill* is a collections of Actions implementing a Capacity as described in this specification.

An Agent can dynamically evolve by acquiring (learning) new Capacities, and it can also dynamically change the Skill
associated with a given Capacity. Acquiring a new Capacity enables an Agent to get access to new behaviors.
This provides Agents with a self-adaptation mechanism that allows them to dynamically change their architecture
according to their current needs and goals.

##1. Defining a Capacity

###1.1. Capacity Definition

A Capacity is the specification of a collection of Actions. Consequently, only Action signatures can be defined inside
a Capacity: no attribute or field is allowed, and no body (code) for the Action may be present.

The definition of a Capacity is done with the `capacity` keyword. Below, a Capacity that permits logging messages
is defined. This Capacity enables an Agent to log information and debugging messages.

<note>Defining a Capacity without Actions is a symptom of a design problem.</note>

```sarl
capacity Logging {
	// Log an information message
	def info(text : String)
	// Log a debugging message
	def debug(text : String)
}
```



###1.2. Extending a Capacity

In some situations, it is useful to specialize the definition of a Capacity. Capacity specialization is supported
by the inheritance feature of SARL, which has the same semantics as the inheritance mechanism of the Java
object-oriented language.

The extended Capacity is specified just after the `extends` keyword.

<veryimportantnote> A Capacity type can extend __zero-to-many__ other Capacity types.
This is similar to the implementation of interfaces in the Java language.</veryimportantnote>

In the following code, the `Logging` Capacity (defined above) is extended to enabling the output of error messages.

```sarl
capacity ErrorLogging extends Logging {
	// Log a error message
	def error(text : String)
}
```



###1.3. Extending Multiple Capacities

In some situations, it is useful to define a Capacity by extending more than one Capacity.
Below, the `Cap3` Capacity is defined as an extension of the Capacities `Cap1` and `Cap2`.

```sarl
capacity Cap1 {
	def action1
}
capacity Cap2 {
	def action2
}
capacity Cap3 extends Cap1, Cap2 {
	def action3
}
```



###1.4. Modifiers

Modifiers are used to modify declarations of types and type members. This section introduces the modifiers for Capacity.
The modifiers are usually written before the keyword defining the Capacity.

The complete description of the modifier semantics is available in
[this section](./OOP.html#7-modifiers).


#### Capacity Modifiers

A Capacity may be declared with one or more modifiers, which affect its runtime behavior:

* Access modifiers:
	* `public`: the Capacity is accessible from any other type (default);
	* `package`: the Capacity is accessible only from types in the same package.

Examples:

```sarl
public capacity Example1 {
}
package capacity Example2 {
}
```



#### Method Modifiers

The modifiers for the Actions (methods) in a Capacity are:

* Access modifiers:
	* `public`: the Action is accessible from any type.

Example:

```sarl
// Public access function
public def example1
```



##2. Built-in Capacities

Several Capacities are defined and reserved by the SARL Core Specification.
They compose the minimal set of Capacities that a runtime environment must support to run a SARL program.

<veryimportantnote> You must not define a Capacity with a fully qualified name equals to one
of the reserved Capacities.</veryimportantnote>

The built-in Capacities are defined in the [Built-in Capacity Reference](./BIC.html).


##3. Use of the Capacities

The use of a Capacity is related to the associated [Skills](./Skill.html).
A Capacity cannot be called by itself since it does not provide an implementation: this is the role of the Skill.

When a function `fct` of the Capacity `C` is called, it means that the Agent silently does:

* Find the Skill `S` associated to `C`; and
* Call `fct` on the object `S`.

Details on the use of the Capacities may be found in the following:

* [Agent](./Agent.html)
* [Behavior](./Behavior.html)




##4. Legal Notice

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.6
* Status: Stable Release
* Release: 2017-09-14

> Copyright &copy; 2014-2017 [the original authors or authors](http://www.sarl.io/about/index.html).
>
> Licensed under the Apache License, Version 2.0;
> you may not use this file except in compliance with the License.
> You may obtain a copy of the [License](http://www.apache.org/licenses/LICENSE-2.0).
>
> You are free to reproduce the content of this page on copyleft websites such as Wikipedia.

<small>Generated with the translator io.sarl.maven.docs.generator 0.6.0.</small>