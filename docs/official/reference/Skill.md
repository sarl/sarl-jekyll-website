---
title: "Skill Reference"
layout: default
---

# Skill Reference


<ul class="page_outline" id="page_outline">

<li><a href="#1-defining-a-skill">1. Defining a Skill</a></li>
<ul>
  <li><a href="#11-basic-definition">1.1. Basic Definition</a></li>
  <li><a href="#12-field-definition">1.2. Field Definition</a></li>
  <li><a href="#13-action-definition">1.3. Action Definition</a></li>
  <li><a href="#14-initialization-of-a-skill">1.4. Initialization of a skill</a></li>
  <li><a href="#15-uninitialization-of-a-skill">1.5. Uninitialization of a skill</a></li>
  <li><a href="#16-constructor-definition">1.6. Constructor Definition</a></li>
  <li><a href="#17-multiple-capacity-implementation">1.7. Multiple Capacity Implementation</a></li>
  <li><a href="#18-extending-a-skill">1.8. Extending a Skill</a></li>
  <li><a href="#19-modifiers">1.9. Modifiers</a></li>
</ul>
<li><a href="#2-built-in-skills">2. Built-in Skills</a></li>
<li><a href="#3-use-of-the-skills">3. Use of the Skills</a></li>
<li><a href="#4-legal-notice">4. Legal Notice</a></li>

</ul>


This document describes how to define Skills in SARL.
Before reading this document, we recommend that you read
the [General Syntax Reference](./GeneralSyntax.html),
and the [Capacity Reference](./Capacity.html).

An *Action* is code (a public method or function) that transforms a part of the 
designed system or its environment. This transformation guarantees 
resulting properties if the system before the transformation satisfies 
a set of constraints. An Action is defined in terms of pre- and post-conditions.

A *Capacity* is the specification of a collection of Actions. This specification 
makes no assumptions about the implementation of each Action. It is used to specify 
what an Agent can do, what behavior is required for its execution.

A *Skill* is a collection of Actions implementing a Capacity as described in
this specification.


## 1. Defining a Skill

### 1.1. Basic Definition

A Skill implements a Capacity and is defined with the `skill`
keyword. This relationship is specified with the `implements` keyword.

Below, a Skill is defined to output messages on the standard console
(defined in the [Capacity Reference](./Capacity.html)).
Note that all the Actions defined in the Capacity must
have a definition (with a body containing code) in the Skill.

```sarl
skill ConsoleLogging implements Logging {
	def info(text : String) {
		System.out.println(text)
	}
	def debug(text : String) {
		System.err.println(text)
	}
}
```



### 1.2. Field Definition

Often it is useful or necessary to base a Skill (a
Capacity's implementation) on attributes (properties or fields).

The following example defines a Skill that uses the standard Java logging library.
To avoid creating an instance of the Java logger each time the Capacity's Actions are invoked, an instance
of the Java logger is created and stored in a field of the Skill.

```sarl
skill StandardJavaLogging implements Logging {
	// A field is defined in the Skill
	val logger = Logger.anonymousLogger
	def info(text : String) {
		logger.info(text)
	}
	def debug(text : String) {
		logger.fine(text)
	}
}
```



### 1.3. Action Definition

It is possible to declare methods in the Skill in addition to those specified by the Capacity. 

```sarl
skill MyLogging implements Logging {
	def info(text : String) {
		output(text)
	}
	def debug(text : String) {
		output(text)
	}
	// Define an utility function
	// that is outputting the text
	def output(t : String) {
		System.err.println(t)
	}
}
```



### 1.4. Initialization of a skill

Several elements of the skill can be used only after the skill is attached to its owning agent.
For example, the value returned by the function `getOwner` is not `null` only when the skill is
attached to an agent, i.e. its owner. 

In order to enable the developer to write a code that is run when the skill is attached, the function
`install` could be defined and implemented. The code below provides an example in which the value
returned by `getOwner` is checked.

```sarl
def install {
	// Initialization of the skill
	assert getOwner !== null
}
```



### 1.5. Uninitialization of a skill

In a similar way as `install`, it is possible to execute a code when the skill is detached from it owning agent.
For this purpose, the `uninstall` function should be defined, as illustrated below: 

```sarl
def uninstall {
	// Do uninstallation statements
}
```



### 1.6. Constructor Definition

It is not necessary to specify a constructor for Skills unless a value will be initialized.

Two constructors are defined in the abstract `Skill` class: 

```sarl
class Skill extends AgentTrait
		implements IBehaviorGuardEvaluatorReceiver {
	def getReferenceCount : int
}
```


Example of constructor definition:
```sarl
// The constructor is mandatory
// for defining the field "logger"
new (l : Logger) {
	super() // Call the super's constructor
	logger = l
}
```



If no constructor is defined in the skill type and a super-type is declared, implicit constructors will be assumed.
Implicit constructors has the same prototypes as the constructors of the super type.
Details on implicit constructors are given in the reference documentation related to the
[synthetic functions](./general/SyntheticFunctions.html).


### 1.7. Multiple Capacity Implementation

In some situations it is useful to combine more than one capacity in a skill.
Below, the `MyLogging` skill is defined as an implementation of the capacities
`Logging` and `LogReader`.
All the Actions defined in a Capacity must have an implementation in the related Skill.

If two implemented Capacities include the same Action signature, it must be implemented only once in the Skill.

```sarl
capacity LogReader {
	def open(filename : String) : int
	def info(t : String)
	def close(fid : int)
}
skill MyLogging implements Logging, LogReader {
	// Shared implementation for the methods
	// defind in the two Capacities.
	def info(text : String) {
		System.out.println(text)
	}
	def debug(text : String) {
		System.out.println(text)
	}
	def open(filename : String) : int {
		return 0
	}
	def close(fid : int) {
	}
}
```



### 1.8. Extending a Skill

In some situations it is useful to specialize the definition of a Skill. This mechanism is supported by the __inheritance__
feature of SARL, which has the same semantics as the inheritance mechanism of the Java object-oriented language.

The extended Skill is specified just after the `extends` keyword.

<p markdown="1"><span class="label label-danger">Very Important Note</span> A Skill type can extend __only one__ other Skill type.  This is similar to the constraint on the extension of classes in the Java language.</p>

In the following code, the `StandardJavaLogging` Skill (defined above) is extended to override the info output.

```sarl
skill ExtendedLogging extends StandardJavaLogging {
	def info(text : String) {
		super.info("INFO: "+text)
	}
}
```



### 1.9. Modifiers

Modifiers are used to modify declarations of types and type members.
This section introduces the modifiers for the Skill.
The modifiers are usually written before the keyword for defining the Skill.

The complete description of the modifiers' semantic is available in
[this section](./OOP.html#definition-of-all-the-supported-modifiers).

#### Skill Modifiers

A Skill may be declared with one or more modifiers, which affect its runtime behavior:

* Access modifiers:
	* `public`: the behavior is accessible from any other type (default);
	* `package`: the behavior is accessible only from types in the same package.
* `abstract`: this Skill is abstract and cannot be instantiated; an extension Skill must implement this behavior.
* `final`: an extending Skill may not override this behavior.

Examples:

```sarl
public skill Example1 implements CapacityExample {
}
package skill Example2 implements CapacityExample {
}
abstract skill Example3 implements CapacityExample {
}
final skill Example4 implements CapacityExample {
}
```



#### Field Modifiers

The modifiers for the fields in a Skill are:

* Access modifiers:
	* `public`: the field is accessible from everywhere;
	* `protected`: the field is accessible within the same package, and in derived Agents;
	* `package`: the field is accessible only within the same package as its Agent;
	* `private`: the field is accessible only within its Agent (default).

Examples:

```sarl
public var example1 : Object
protected var example2 : Object
package var example3 : Object
private var example4 : Object
```



#### Method Modifiers

The modifiers for the methods in a Skill are:

* Access modifiers:
	* `public`: there are no restrictions on accessing the method (public);
	* `protected`: the method is accessible within the same package, and derived classes;
	* `package`: the method is accessible only within the same package as its class;
	* `private`: the method is accessible only within its class.
* `abstract`: the method has no implementation in the class.
* `dispatch`: the method provides an implementation for the dispatch method mechanism.
* `final`: the method cannot be overridden in derived classes.

Examples:

```sarl
// Public access function
public def example1 { }
// Protected access function
protected def example2 { }
// Package access function
package def example3 { }
// Private access function
private def example4 { }
// Abstract function
abstract def example5
// Not-overridable function
final def example6 { }
// Dispatch functions
dispatch def example7(p : Integer) { }
dispatch def example7(p : Float) { }
```



## 2. Built-in Skills

Several Capacities are defined and reserved by the SARL Core Specification. The corresponding Skills are provided
by the runtime environment (such as the [Janus platform](http://www.janusproject.io)).
The built-in Skills are described in the [Built-in Capacity Reference](./BIC.html).


## 3. Use of the Skills

Details on the use of Skills may be found in the following:

* [Agent](./Agent.html)
* [Behavior](./Behavior.html)




## 4. Legal Notice

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.12
* Status: Draft Release
* Release: 2021-02-11

> Copyright &copy; 2014-2021 [the original authors or authors](http://www.sarl.io/about/index.html).
>
> Licensed under the Apache License, Version 2.0;
> you may not use this file except in compliance with the License.
> You may obtain a copy of the [License](http://www.apache.org/licenses/LICENSE-2.0).
>
> You are free to reproduce the content of this page on copyleft websites such as Wikipedia.

<small>Generated with the translator io.sarl.maven.docs.generator 0.12.0-SNAPSHOT.</small>
