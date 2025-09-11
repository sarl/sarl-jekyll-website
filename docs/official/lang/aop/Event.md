---
title: "Event Reference"
layout: default
---

# Event Reference


<ul class="page_outline" id="page_outline">

<li><a href="#1-event-vs-message">1. Event vs. Message</a></li>
<li><a href="#2-defining-an-event">2. Defining an Event</a></li>
<ul>
  <li><a href="#21-define-an-empty-event">2.1. Define an empty event</a></li>
  <li><a href="#22-define-an-event-with-attributes">2.2. Define an event with attributes</a></li>
  <li><a href="#23-define-an-event-with-value-attributes">2.3. Define an event with value attributes</a></li>
  <li><a href="#24-define-an-event-with-generic-type-parameter">2.4. Define an event with generic type parameter</a></li>
  <li><a href="#25-extending-events">2.5. Extending Events</a></li>
  <li><a href="#26-generated-event-constructors">2.6. Generated Event Constructors</a></li>
  <li><a href="#27-modifiers">2.7. Modifiers</a></li>
</ul>
<li><a href="#3-reserved-events">3. Reserved Events</a></li>
<li><a href="#4-version-specification">4. Version Specification</a></li>
<li><a href="#5-legal-notice">5. Legal Notice</a></li>

</ul>


This document describes how to define events in SARL. Before reading this document, we recommend that you read
the [Expression Syntax Reference](../expr/index.html).

An event is one of the core concepts in SARL. It is a data structure composed of attributes where
each attribute has a name, a type, and a value.

Events are exchanged among the agents or the behavioral units of agents,
inside a given [Space](./Space.html).

Each event has:

* a type, i.e. its qualified name;
* a source, the identifier of the sender of the event;
* an optional list of generic type parameters; and
* a collection of name-value pairs, i.e. the attributes of the event, where each pair may be of one of the generic type of a predefined type.


## 1. Event vs. Message

In computer-science literature, there are two main approaches 
for communicating between entities: (1) an event and (2) a message.

An event and a message are similar in that they each have a name 
(or type), a source, and optional data (arguments or parameters).
The difference is in whether there is a receiver:
an event does not specify a receiver,
while a message needs to have at least
one receiver (even if it is a group such as "all"  
possible receivers).

Because the event approach is more general and close to the typical agent definitions in SARL, it is preferred 
by the designers of SARL.

So, to send data to another entity in SARL,
you create an instance of an event and emit
the event in a [Space](./Space.html).
The sending API is detailed in the [Built-in Capacity
Reference](./BIC.html).

<p markdown="1"><span class="label label-info">Note</span> There is no message concept in SARL. All communication is done by using an `Event`.</p>




## 2. Defining an Event

### 2.1. Define an empty event

An event is defined with the `event` keyword followed by the name of the event (without the qualified name of its package,
which is inferred from the `package` keyword, if present).

When an event does not contain any additional data (so is "empty"), nothing further is required (though an empty
block is allowed).

The example below contains the definition of `Event1` and `Event2`, which are both empty.
The first event is defined with the "empty block" syntax.
The second event is defined with the "nothing" syntax.

```sarl
event Event1 {  }
event Event2
```



### 2.2. Define an event with attributes

An Event may can carry additional information beyond its name (or type).
This information is described by a set of attributes (or typed 
key/value pairs). Each attribute is declared according to the 
"Field Declaration" of the [Variable Syntax Reference](../expr/VarDecls.html).

The following code example defines the event `MyEvent` with three attributes.
Each declaration of the attributes illustrates one possible syntax for defining a field:

* declaration with explicit typing: `var number : Integer`
* declaration with type inference: `var string = "abc"`
* declaration with free inferred element: `var something`


According to the type inference mechanism used by SARL, the attribute `something` will have the type `Object`.

<p markdown="1"><span class="label label-info">Note</span> Because of the use of the `var` keyword, the values of these attributes can be modified.</p>

```sarl
event MyEvent {
	var number : Integer
	var string = "abc"
	var something : Object
}
```


If no constructor is defined in the event type, implicit constructors will be assumed as describes in the section dedicated to the [generated event constructors](#generated-event-constructors).


### 2.3. Define an event with value attributes

Events in SARL will carry data that is unmodifiable 
when an attribute is defined using the `val` keyword.

<p markdown="1"><span class="label label-warning">Important Note</span> The `val` keyword has the same semantics as the `final` modifier in the Java language. It means that an element defined with `val` can be initialized only once. It also means that the element is read-only. But if the element is a reference to an object, then the referenced object is not read-only (only the initial reference is).</p>

Because the `val` keyword defines a single-initialization
variable, there should be a way to specify the initial value.
The initial value can be specified at the end of the `val`
directive or by specifying a constructor.

```sarl
event MyEvent {
	val string = "abcd"
	val number : Integer
	new(number : Integer) {
	  this.number = number
	}
}
```


If no constructor is defined in the event type, implicit constructors will be assumed as describes in the section dedicated to the [generated event constructors](#generated-event-constructors).

### 2.4. Define an event with generic type parameter

Generics are a facility of [generic programming](https://en.wikipedia.org/wiki/Generic_programming) that were added in several programming languages such as Java.
They were designed to extend SARL type system to allow "a type or method to operate on objects of various types while providing compile-time type safety".

A type parameter is an unqualified identifier.
Type parameters are introduced by generic declarations, e.g. of events, classes, interfaces or actions/methods.

A event is generic if it declares one or more type parameters.
A generic event declaration defines a set of parameterized types, one for each possible invocation of the type parameter section.
All of these parameterized types share the same class at runtime.

Each type parameter is defined by:

* a name, that is identifying the type parameter;
* a bounding specification that specifies the accepted types for the values that are declared ith a type equal to this type parameter. The bound may represents the uppest type or the lowest type from a type hierarchy.

To define the type parameters for an event, you should define them in a list between the characters lower-than `<` and upper-then `>`.
In the following example, three type parameters are defined: `T1`, `T2` and `T3`.
The first type parameter `T1` is defined without explicit bound, that means that all the values of `T1` type must be a subtype of `Object`.
The second type parameter `T2` is defined to have all the values with a type being a subtype of `String`.
The third type parameter `T3` is defined to have all the values with a type being subtype of `Double` and `Iterable<Character>`.
THe type parameters `T1`, `T2` and `T3` are used as regular types for the declarations of the fields `value0`, `value1` and `value2`, respectively.

```sarl
event MyEvent<T1, T2 extends String, T3 extends Double & Iterable<Character>> {
	var value0 : T1
	var value1 : T2
	var value2 : T3
}
```



### 2.5. Extending Events

In some use cases, it is useful to specialize the definition
of an event. This mechanism is supported by the inheritance
feature of SARL, which has the same semantic as the inheritance
mechanism as the Java object-oriented language.

The extended event is specified just after the `extends` keyword.

<p markdown="1"><span class="label label-danger">Very Important Note</span> An event type can extend __only one__ other event type.  This is similar to the model for class extensions in the Java language.</p>

#### Declaration

In the following code, the first event is defined with the name `Event1` and an attribute named `string`.
A second event `Event2`, is defined as an extension of the first event. It contains a new attribute named
`number`.
It is now possible to create instances of these events. For `Event1`, only the attribute `string`
is available. For `Event2`, two attributes are available (`Event2` inherits one field from
`Event2` and defines one field).

```sarl
event Event1 {
	var string : String
}
event Event2 extends Event1 {
	var number : int
}
```



#### Use

The following code illustrates the use of event instances.

```sarl
// Create an instance of Event1 and set its attribute.
var e1 = new Event1
e1.string = "abc"
// Create an instance of Event2 and set its attributes.
var e2 = new Event2
e2.string = "abc"
e2.number = 345
```



### 2.6. Generated Event Constructors

The SARL compiler is equiped with a feature for automatically generating event's constructors when they are not explicitly defined in the code of the event.

The SARL compiler considers different cases:


#### No super event, no field declaration

The event has neither super type declared, nor field.

```sarl
event MyEvent
```


The previous code is equivalent to the following code, in which the generated constructors are copied from the `Address` type, according the inheritance of constructors that is implemented by the SARL compiler, as it is documented in the the reference documentation related to the
[synthetic functions](../expr/SyntheticFunctions.html).

```sarl
event MyEvent {
	new(address : Address = null) {
		super(address)
	}
}
```



#### No super event, regular variable field

The event has no super type declared. A variable field is declared.

```sarl
event MyEvent {
	var field : String
}
```


The previous code is equivalent to the following code, in which different constructors enable to initialize, or not, the event's field:

```sarl
event MyEvent {
	var field : String
	new (field : String = null) {
		this.field = field
	}
}
```



#### No super event, value field without initialization

The event has no super type declared. A value field is declared without initialization.

```sarl
event MyEvent {
	val field : String
}
```


The previous code is equivalent to the following code, in which different constructors enable to initialize the event's field:

```sarl
event MyEvent {
	val field : String
	new (field : String) {
		this.field = field
	}
}
```



#### No super event, value field with initialization

The event has no super type declared. A value field is declared without initialization.

```sarl
event MyEvent {
	val field = "abc"
}
```


The previous code is equivalent to the following code, in which different constructors enable to initialize the event's field:

```sarl
event MyEvent {
	val field = "abc"
	new(address : Address = null) {
		super(address)
	}
}
```


The two generated constructors above copied from in the `Address` type, according the inheritance of constructors that is implemented by the SARL compiler, as it is documented in the the reference documentation related to the
[synthetic functions](../expr/SyntheticFunctions.html).


#### Declared super event, no field declaration

The event has a super type declared, but no field.

```sarl
event MySuperEvent {
	var field : String
}
event MyEvent extends MySuperEvent
```


The previous code is equivalent to the following code, in which the generated constructors are the same as the constructors that are defined in the `MySuperEvent` event type, according the inheritance of constructors that is implemented by the SARL compiler, as it is documented in the the reference documentation related to the [synthetic functions](../expr/SyntheticFunctions.html).

```sarl
event MyEvent extends MySuperEvent {
	new(field : String = null) {
		super(field)
	}
}
```



#### Declared super event, regular variable field declaration

The event has a super type and a variable field declared.

```sarl
event MySuperEvent {
	var field : String
}
event MyEvent extends MySuperEvent {
	var subfield : int
}
```


The previous code is equivalent to the following code, in which the generated constructors are based on the constructors that are defined in the `MySuperEvent` event type, according the inheritance of constructors that is implemented by the SARL compiler, as it is documented in the the reference documentation related to the [synthetic functions](../expr/SyntheticFunctions.html).

The generated constructors also includes the support of the locally declared fields in addition to those that are inherited. 

```sarl
event MyEvent extends MySuperEvent {
	var subfield : int
	new(field : String = null, subfield : int = 0) {
		super(field)
		this.subfield = subfield
	}
}
```



### 2.7. Modifiers

Modifiers are used to modify declarations of types and type members.
This section introduces the modifiers for the event.
The modifiers are usually written before the keyword for defining the event.

The complete description of the modifiers' semantic is available on
[this page](../oop/Modifiers.html).


#### Event Modifiers

An event may be declared with one or more modifiers, which affect its behavior:

* Access modifiers:
	* `public`: the behavior is accessible from any other type (default);
	* `package`: the behavior is accessible from only the types in the same package.
* `final`: cannot be extended.

Examples:

```sarl
public event Example1
package event Example2
final event Example3
```



#### Field Modifiers

The modifiers for the fields in an event are:

* Access modifiers:
	* `public`: the field is accessible from everywhere.

Example:

```sarl
public var example1 : Object
```



## 3. Reserved Events

Several events are defined and reserved by the SARL Core Specification.
They describe the minimal set of events that a runtime environment must support to run a SARL program.

<p markdown="1"><span class="label label-danger">Very Important Note</span> You must not define an event with a fully qualified name equals to one of the reserved events.</p>

Two types of reserved events exist:

* the events reserved in the SARL Core Specification for the [agent's life cycle](./Agent.html#behaviors-of-an-agent); and
* the events supported by the [Built-in Capacities](./BIC.html).


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
