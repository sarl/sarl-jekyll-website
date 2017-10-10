---
title: "DefaultContextInteractions"
layout: default
---

# DefaultContextInteractions


<ul class="page_outline" id="page_outline">

<li><a href="#1-retrieving-the-default-context-and-space">1. Retrieving the Default Context and Space</a></li>
<li><a href="#2-sending-an-event-in-the-default-space">2. Sending an Event in the Default Space</a></li>
<li><a href="#3-sending-an-event-to-specific-agents-in-the-default-space">3. Sending an Event to Specific Agents in the Default Space</a></li>
<ul>
  <li><a href="#3-1-function-with-a-scoping-parameter">3.1. Function with a Scoping Parameter</a></li>
  <li><a href="#3-2-creation-of-scopes-with-the-predefined-api">3.2. Creation of scopes with the predefined API</a></li>
  <li><a href="#3-3-creation-of-developer-specific-scopes">3.3. Creation of developer-specific scopes</a></li>
  <li><a href="#3-4-inverted-syntax-for-emiting-an-event">3.4. Inverted syntax for emiting an event.</a></li>
</ul>
<li><a href="#4-testing-if-an-element-is-related-to-the-default-context">4. Testing if an element is related to the default context</a></li>
<li><a href="#5-legal-notice">5. Legal Notice</a></li>

</ul>


The `DefaultContextInteractions` capacity is actually provided
for convenience. It assumes that the action will be performed on the 
agent __default context__ or its __default space__. These context and space
are illustrated by the top-left context in the figure above. 

For instance, the `emit` action is a shortcut for:

```sarl
defaultContext.defaultSpace.emit(getID, ^event)
```


Therefore, it is actually created on top of the other built-in capacities.





##1. Retrieving the Default Context and Space

For retrieving the default context of an agent, this built-in capacity provides the following function:

```sarl
def getDefaultContext : AgentContext
```



For retrieving the default space in the default context of an agent, this built-in capacity provides
the following function:

```sarl
def getDefaultSpace : EventSpace
```


For obtaining the address of the agent in the default space, the following function is provided:

```sarl
def getDefaultAddress : EventSpace
```



##2. Sending an Event in the Default Space

The core mechanism for information exchanges among agents is [event-based](../Event.html).
For sending an event in the default space of the default context, the following function is provided:

```sarl
def emit(^event : Event)
```



This function emits the given event with no scope (i.e., all registered agent will receive the
event) in the default space of the default context.

Example:

```sarl
agent A {
	uses DefaultContextInteractions
	def myaction {
		var ^event : Event = new MyEvent
		emit(^event)
	}
}
```

		

The call to `emit` is equivalent to:

```sarl
defaultContext.defaultSpace.emit(getID, ^event)
```



##3. Sending an Event to Specific Agents in the Default Space

###3.1. Function with a Scoping Parameter

The previous sending function assumes that there is no restriction on the set of the receivers of the event.
It is possible to specify a `Scope` for applying a restriction.

```sarl
def emit(e : Event, scope : Scope<Address>)
```



A scope is a predicates that is evaluated against the addresses of the receivers. It is defined as:
```sarl
interface Scope<T> extends Serializable {
	def matches(element : T) : boolean
}
```


###3.2. Creation of scopes with the predefined API

It is recommended using the SARL utility functions for creating scopes.
They are defined in the class `io.sarl.util.Scopes`.
The following example is equivalent to the feature call of `emit` without the scoping parameter:

```sarl
emit(new MyEvent, Scopes::allParticipants)
```



A default implementation of a scope using addresses, of `Address` type is implemented in the class `io.sarl.util.AddressScope`.
The utility class `Scopes` provides the `addresses` function for creating an instance of `AddressScope`.

```sarl
emit(new MyEvent, Scopes::addresses(a1, a2))
```


Another default implementation of a scope using identifiers, of `UUID` type is implemented in the class `io.sarl.util.IdentifierScope`.
The utility class `Scopes` provides the `identifiers` function for creating an instance of `IdentifierScope`.

```sarl
emit(new MyEvent, Scopes::identifiers(id1, id2))
```


The complete list of the functions that are provided by the `Scopes` class is
accessible on the [Scopes API documentation](http://www.sarl.io/docs/api/index.html?io/sarl/util/Scopes.html).

###3.3. Creation of developer-specific scopes

You are free to create new implementation of `Scope` in order to filter the receivers of an
event according to your own criteria. The easier approach is to write a lambda expression for the scope.
The previous line of code becomes:

```sarl
emit(new MyEvent) [ it == a1 || it == a2 ]
```


In the previous code, the lambda expression is written outside the list of the `emit` parameters.
But it corresponds to the last formal parameter of type `Scope<Address>`.
The `it` variable in the lambda expression is the default name given to the formal parameter of 
the `matches` function, which is defined in the `Scope` interface.


###3.4. Inverted syntax for emiting an event.

According to the [extension method mechanism](../general/Extension.html), it is possible to call
the `emit` function with the event instance as the receiver expression. The previous
example becomes:

```sarl
agent A {
	uses DefaultContextInteractions

	def myaction(receiverId : UUID) {
		var ^event : Event = new MyEvent
		^event.emit [ it.UUID == receiverId ] 
	}
}
```



In the previous code, the receiver of the event is given by the formal parameter `receiverId`.
The scope restricts the receiver according to this identifier.


For an abstract point of view, the previous emiting call may be explained with "the event is emited to the receiver".
Sometimes, the developer would like to write a code that corresponds to the sentence "the receiver will receive the event".
In order to enable this approach to the developer, the SARL API provides the function:

```sarl
def willReceive(receiverId : UUID, ^event : Event) {
	emit(^event) [ it.UUID == receiverId ]
}
```


The initial example in this section becomes:

```sarl
agent A {
	uses DefaultContextInteractions

	def myaction(receiverId : UUID) {
		var ^event : Event = new MyEvent
		receiverId.willReceive(^event) 
	}
}
```




##4. Testing if an element is related to the default context

The `DefaultContextInteractions` provides a collection of utility functions that test if
their parameters are related to the default context or the default space.


| Function                             | Explanation                                                                       |
| ------------------------------------ | --------------------------------------------------------------------------------- |
| `isDefaultContext(AgentContext)` | tests if the given context is the default context.                                |
| `isDefaultContext(UUID)`         | tests if the default context has the given identifier.                            |
| `isDefaultSpace(Space)`          | tests if the given space is the default space of the default context.             |
| `isDefaultSpace(SpaceID)`        | tests if the default space of the default context has the given identifier.       |
| `isDefaultSpace(UUID)`           | tests if the default space of the default context has the given identifier.       |
| `isInDefaultSpace(Event)`        | tests if the given event was emitted in the default space of the default context. |


The following example illustrates the use of the `isInDefaultSpace` function in the guard of
an behavior unit. In this example, the behavior unit is run only if the event of type `AnEvent`
was emitted in the default space.

<note>According to the [General Syntax Reference](../GeneralSyntax.html),
the `event.isInDefaultSpace` is equivalent to `isInDefaultSpace(event)`.</note>

```sarl
on AnEvent [ occurrence.inDefaultSpace ] {
	// Do something with the event when it was emitted in the default space
}
```




##5. Legal Notice

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.7
* Status: Draft Release
* Release: 2017-10-08

> Copyright &copy; 2014-2017 [the original authors or authors](http://www.sarl.io/about/index.html).
>
> Licensed under the Apache License, Version 2.0;
> you may not use this file except in compliance with the License.
> You may obtain a copy of the [License](http://www.apache.org/licenses/LICENSE-2.0).
>
> You are free to reproduce the content of this page on copyleft websites such as Wikipedia.

<small>Generated with the translator io.sarl.maven.docs.generator 0.7.0-SNAPSHOT.</small>