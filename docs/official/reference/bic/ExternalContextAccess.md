---
title: "ExternalContextAccess Capacity"
layout: default
---

# ExternalContextAccess Capacity

The built-in capacity `ExternalContextAccess` provides access to the
[context](../Space.html) that the agent is a part of, and actions
required to join new [contexts](../Space.html), and leave them.

The context supported by this built-in capacity is the "external context," illustrated by the
top-right context in the figure above.





## 1. Retrieving a Context

For retrieving the context with a particular ID, this built-in capacity provides the following function:

```sarl
def getContext(contextID : UUID) : AgentContext
```



The agent must have joined (see below) the context before calling this action. Or, the agent
may use its `getParentID` for accessing the context in which it is located (the default context).



```sarl
agent A {
	uses ExternalContextAccess
	var id : UUID
	var c : AgentContext
	def myaction {
		id = getParentID
		c = getContext(id)
	}
}
```



## 2. Retrieving the Universe Context

In all the SARL application, a default context exists. It's name is the Universe context.
It is fully managed by the SARL run-time environment.
For retrieving this particular context, this built-in capacity provides the following function:

```sarl
def getUniverseContext() : AgentContext
```



## 3. Retrieving the Contexts of an Agent

The following function enables an agent to retrieve all the contexts in which it is involved:

```sarl
def getAllContexts : ConcurrentCollection<AgentContext>
```



The default context is included in the replied collection.

```sarl
agent A {
	uses ExternalContextAccess
	var c : ConcurrentCollection<AgentContext>
	def myaction {
		c = getAllContexts
	}
}
```



## 4. Joining an Existing Context

Agents must be able to join a new parent context. The following function gives this capability to them:

```sarl
def join(contextID : UUID, expectedDefaultSpaceID : UUID) : AgentContext
```



This action registers the agent in the default space of the context.

The agent will be involved in the context with the ID given by `contextID`.
The parameter `expectedDefaultSpaceID` is only used to check if the caller of this function
knows the ID of the default space in the context to be involved in. 
If the given `expectedDefaultSpaceID` does not match the ID of the default space in the context
`contextID`, then the access to the context is forbidden.

The `join` function replies the reference to the joined context.

<p markdown="1"><span class="label label-warning">Important Note</span> The context must already exist, and the default space inside this context must have the same ID as `expectedDefaultSpaceID`.</p>

This action fires two events:

* `ContextJoined` in the inner context's default space.
* `MemberJoined` in the parent context's default space.




Example:
```sarl
agent A {
	uses ExternalContextAccess
	var idc : UUID
	var ids : UUID
	def myaction {
		idc = UUID::randomUUID
		ids = UUID::randomUUID
		join(idc, ids)
	}
}
```



## 5. Leaving a Context

When an agent wants to leave a context, it must invoke:

```sarl
def leave(contextID : UUID)
```



This action fires two events:

* `ContextLeft` in the inner context's default space.
* `MemberLeft` in the parent context's default space.




Example:
```sarl
agent A {
	uses ExternalContextAccess
	var idc : UUID
	def myaction {
		idc = UUID::randomUUID
		leave(idc)
	}
}
```



## 6. Testing if an element is related to an external context

The `ExternalContextAccess` provides a collection of utility functions that test if their
parameters are related to the any external context.


| Function                        | Explanation                                                                  |
| ------------------------------- | ---------------------------------------------------------------------------- |
| `isInSpace(Event, Space)`   | tests if the given event was emitted in the given space.                     |
| `isInSpace(Event, SpaceID)` | tests if the given event was emitted in the space with the given identifier. |
| `isInSpace(Event, UUID)`    | tests if the given event was emitted in the space with the given identifier. |


The following example illustrates the use of the `isInSpace` function in the guard
of an behavior unit. In this example, the behavior unit is run only if the event
of type `AnEvent` was emitted in the space `myspace` (declared as attribute in
the container).

```sarl
on AnEvent [ isInSpace(occurrence, myspace) ] {
	// Do something with the event when it was emitted in the space myspace
}
```



## 7. Helper for firing an event in a space

Regarding the definition of the `EventSpace` type, the event emiting function takes at least two parameters:

* the identifier of the entity, which is firing the event, and
* the event to be fired.

The first parameter is used for setting the event's source when it was not already done.

The `ExternalContextAccess` provides the `emit` function for helping to fire events into an event space:
```sarl
^space.emit(^event)
```


A call to the `emit` function takes two parameters:

* `^space` is the variable which contains the reference to the space in which the event should be fired.
* `^event` is the variable which contains the event to fire.

This function call is equivalent to:
```sarl
^space.emit(getID, ^event)
```



The `getID` function is provided by the current entity, e.g. an agent, for obtaining the identifier of the emitter.

From a syntactic point of view, the two calls look similar. But, the call to the `ExternalContextAccess` function uses
the extension method syntax: the first argument to the function is written prior to the function's name.


## 8. Legal Notice

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.13
* Status: Stable Release
* Release: 2023-09-19

> Copyright &copy; 2014-2023 [SARL.io, the Original Authors and Main Authors](https://www.sarl.io/about/index.html).
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

<small>Generated with the translator docs.generator 0.13.0.</small>
