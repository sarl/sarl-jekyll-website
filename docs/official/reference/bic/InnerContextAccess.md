---
title: "InnerContextAccess Capacity"
layout: default
---

# InnerContextAccess Capacity


<ul class="page_outline" id="page_outline">

<li><a href="#1-retrieving-the-inner-context">1. Retrieving the Inner Context</a></li>
<li><a href="#2-retrieving-the-default-space-of-the-inner-context">2. Retrieving the Default Space of the Inner Context</a></li>
<li><a href="#3-members-of-an-agent">3. Members of an Agent</a></li>
<li><a href="#4-testing-if-an-element-is-related-to-the-inner-context">4. Testing if an element is related to the inner context</a></li>
<li><a href="#5-legal-notice">5. Legal Notice</a></li>

</ul>


The built-in capacity `InnerContextAccess` provides access to the inner context of the agent.
This is a key feature for creating holonic agent implementation.
The context supported by this built-in capacity is the "inner context," illustrated by the
bottom context in the figure above.





## 1. Retrieving the Inner Context

For retrieving the inner context of an agent, this built-in capacity provides the following function:

```sarl
def getInnerContext : AgentContext
```



Example:
```sarl
agent A {
	uses InnerContextAccess
	var c : AgentContext
	def myaction {
		c = getInnerContext
	}
}
```



## 2. Retrieving the Default Space of the Inner Context

For retrieving the default space of the inner context, this built-in capacity provides the following function:

```sarl
def getInnerDefaultSpace : EventSpace
```



Example:
```sarl
agent A {
	uses InnerContextAccess
	var s : EventSpace
	def myaction {
		s = getInnerDefaultSpace
	}
}
```



## 3. Members of an Agent

For retrieving information on the member agents of the current agent, several functions are
provided by this built-in capacity.
A member agent is an agent that is not the calling agent, and is a member of at least
one space of the inner context.

The first function replies if the calling agent has other agents as members of its inner context:
```sarl
def hasMemberAgent : boolean
```



The second function replies the number of agents that are members of the inner context of the calling agent:
```sarl
def getMemberAgentCount : int
```



The third function replies all the member agents in the inner context:
```sarl
def getMemberAgents : ConcurrentSet<UUID>
```



Examples:
```sarl
agent A {
	uses InnerContextAccess
	var b : boolean
	var n : int
	var m : ConcurrentSet<UUID>
	def myaction {
		b = hasMemberAgent
		n = getMemberAgentCount
		m = getMemberAgents
	}
}
```



## 4. Testing if an element is related to the inner context

The `InnerContextAccess` provides a collection of utility functions that test if their parameters
are related to the inner context.


| Function                           | Explanation                                                                     |
| ---------------------------------- | ------------------------------------------------------------------------------- |
| `isInnerDefaultSpace(Space)`   | tests if the given space is the default space of the inner context.             |
| `isInnerDefaultSpace(SpaceID)` | tests if the default space of the inner context has the given identifier.       |
| `isInnerDefaultSpace(UUID)`    | tests if the default space of the inner context has the given identifier.       |
| `isInInnerDefaultSpace(Event)` | tests if the given event was emitted in the default space of the inner context. |


The following example illustrates the use of the `isInInnerDefaultSpace` function in the guard
of an behavior unit. In this example, the behavior unit is run only if the event
of type `AnEvent` was emitted in the default space of the inner context.

<p markdown="1"><span class="label label-info">Note</span> According to the [General Syntax Reference](../GeneralSyntax.html), the `event.isInnerDefaultSpace` is equivalent to `isInnerDefaultSpace(event)`.</p>

```sarl
on AnEvent [ occurrence.inInnerDefaultSpace ] {
	// Do something with the event when it was emitted in the inner default space
}
```



## 5. Legal Notice

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.14
* Status: Draft Release
* Release: 2023-09-26

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

<small>Generated with the translator docs.generator 0.14.0-SNAPSHOT.</small>
