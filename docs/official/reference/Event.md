---
title: "Event Reference"
layout: default
---

# Event Reference


<ul class="page_outline" id="page_outline">

<li><a href="#1-event-vs-message">1. Event vs. Message</a></li>
<li><a href="#2-defining-an-event">2. Defining an Event</a></li>
<ul>
  <li><a href="#2-1-define-an-empty-event">2.1. Define an empty event</a></li>
  <li><a href="#2-2-define-an-event-with-attributes">2.2. Define an event with attributes</a></li>
  <li><a href="#2-3-define-an-event-with-value-attributes">2.3. Define an event with value attributes</a></li>
  <li><a href="#2-4-extending-events">2.4. Extending Events</a></li>
  <li><a href="#2-5-modifiers">2.5. Modifiers</a></li>
</ul>
<li><a href="#3-reserved-events">3. Reserved Events</a></li>
<li><a href="#4-legal-notice">4. Legal Notice</a></li>

</ul>


This document describes how to define events in SARL. Before reading this document, we recommend that you read
the [General Syntax Reference](./GeneralSyntax.html).

An event is one of the core concepts in SARL. It is a data structure composed of attributes where
each attribute has a name, a type, and a value.

Events are exchanged among the agents or the behavioral units of agents,
inside a given [Space](./Space.html).

Each event has:

* a type, i.e. its qualified name;
* a source, the identifier of the sender of the event; and
* a collection of name-value pairs, i.e. the attributes of the event.


##1. Event vs. Message

In computer-science literature, there are two main approaches 
for communicating between entities: (1) an event and (2) a message.

An event and a message are similar in that they each have a name 
or type), a source, and optional data (arguments or parameters).
The difference is in whether there is a receiver:
an event does not specify a receiver,
while a message needs to have at least
one receiver (even if it is a group such as "all"  
possible receivers).

Because the event approach is more general, it is preferred 
by the designers of SARL.

So, to send data to another entity in SARL,
you create an instance of an event and emit
the event in a [Space](./Space.html).
The sending API is detailed in the [Built-in Capacity
Reference](./BIC.html).

<note>There is no message concept in SARL. All communication is done by using an `Event`.</note>




##2. Defining an Event

###2.1. Define an empty event

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



###2.2. Define an event with attributes

An Event may can carry additional information beyond its name (or type).
This information is described by a set of attributes (or typed 
key/value pairs). Each attribute is declared according to the 
"Field Declaration" of the [General Syntax Reference](./GeneralSyntax.html).

The following code example defines the event `MyEvent` with three attributes.
Each declaration of the attributes illustrates one possible syntax for defining a field:

* declaration with explicit typing: `var number : Integer`
* declaration with type inference: `var string = "abc"`
* declaration with free inferred element: `var something`


According to the type inference mechanism used by SARL, the attribute `something` will have the type `Object`.

<note> Because of the use of the `var` keyword, the values of these attributes can be modified.</note>

```sarl
event MyEvent {
	var number : Integer
	var string = "abc"
	var something : Object
}
```



###2.3. Define an event with value attributes

Events in SARL will carry data that is unmodifiable 
when an attribute is defined using the `val` keyword.

<importantnote> The `val` keyword has the same semantics as the `final` modifier in
the Java language. It means that an element defined with `val` can be initialized only once. It
also means that the element is read-only.
But if the element is a reference to an object, then the referenced object
is not read-only (only the initial reference is).</importantnote>

Because the `val` keyword defines a single-initialization
variable, there should be a way to specify the initial value.
The initial value can be specified at the end of the `val`
directive or by specifying a constructor.

```sarl
event MyEvent {
	val string = "abcd"
	val number : Integer
	
	new(nb : Integer) {
		number = nb
	}
}
```


If no constructor is defined in the event type and a super-type is declared, implicit constructors will be assumed.
Implicit constructors has the same prototypes as the constructors of the super type.
Details on implicit constructors are given in the reference documentation related to the
[synthetic functions](./general/SyntheticFunctions.html).


###2.4. Extending Events

In some use cases, it is useful to specialize the definition
of an event. This mechanism is supported by the inheritance
feature of SARL, which has the same semantic as the inheritance
mechanism as the Java object-oriented language.

The extended event is specified just after the `extends` keyword.

<veryimportantnote> An event type can extend __only one__ other event type.  This is similar to the
model for class extensions in the Java language.</veryimportantnote>

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



###2.5. Modifiers

Modifiers are used to modify declarations of types and type members.
This section introduces the modifiers for the event.
The modifiers are usually written before the keyword for defining the event.

The complete description of the modifiers' semantic is available in
[this section](./OOP.html#definition-of-all-the-supported-modifiers).


#### Event Modifiers

An event may be declared with one or more modifiers, which affect its behavior:

* Access modifiers:
	* `public`: the behavior is accessible from any other type (default);
	* `package`: the behavior is accessible from only the types in the same package.
* `final`: cannot be extended.

Examples:

```sarl
public event Example1 {
}
package event Example2 {
}
final event Example3 {
}
```



#### Field Modifiers

The modifiers for the fields in an event are:

* Access modifiers:
	* `public`: the field is accessible from everywhere.

Example:

```sarl
public var example1 : Object
```



##3. Reserved Events

Several events are defined and reserved by the SARL Core Specification.
They describe the minimal set of events that a runtime environment must support to run a SARL program.

<veryimportantnote> You must not define an event with a fully qualified name equals to one of the reserved
events.</veryimportantnote>

Two types of reserved events exist:

* the events reserved in the SARL Core Specification for the [agent's life cycle](./Agent.html#4-behaviors-of-an-agent); and
* the events supported by the [Built-in Capacities](./BIC.html).



##4. Legal Notice

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.7
* Status: Stable Release
* Release: 2018-04-03

> Copyright &copy; 2014-2018 [the original authors or authors](http://www.sarl.io/about/index.html).
>
> Licensed under the Apache License, Version 2.0;
> you may not use this file except in compliance with the License.
> You may obtain a copy of the [License](http://www.apache.org/licenses/LICENSE-2.0).
>
> You are free to reproduce the content of this page on copyleft websites such as Wikipedia.

<small>Generated with the translator io.sarl.maven.docs.generator 0.7.2.</small>