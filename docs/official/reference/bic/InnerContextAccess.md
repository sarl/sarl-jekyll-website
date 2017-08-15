---
title: "InnerContextAccess Capacity"
layout: default
---

# InnerContextAccess Capacity


<ul class="page_outline" id="page_outline">

<li><a href="#1-retrieving-the-inner-context">1. Retrieving the Inner Context</a></li>
<li><a href="#2-members-of-an-agent">2. Members of an Agent</a></li>
<li><a href="#3-testing-if-an-element-is-related-to-the-inner-context">3. Testing if an element is related to the inner context</a></li>
<li><a href="#4-legal-notice">4. Legal Notice</a></li>

</ul>


The built-in capacity `InnerContextAccess` provides access to the inner context of the agent.
This is a key feature for creating holonic agent implementation.
The context supported by this built-in capacity is the "inner context," illustrated by the
bottom context in the figure above.




##1. Retrieving the Inner Context

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



##2. Members of an Agent

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
	def getMemberAgents : SynchronizedSet<UUID>
```



Examples:

```sarl
	agent A {
		uses InnerContextAccess
		var b : boolean
		var n : int
		var m : SynchronizedSet<UUID>
		def myaction {
			b = hasMemberAgent
			n = getMemberAgentCount
			m = getMemberAgents
		}
	}
```



##3. Testing if an element is related to the inner context

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

<note>According to the [General Syntax Reference](../GeneralSyntax.html),
the `event.isInnerDefaultSpace` is equivalent to `isInnerDefaultSpace(event)`.</note>

```sarl
	on AnEvent [ occurrence.inInnerDefaultSpace ] {
		// Do something with the event when it was emitted in the inner default space
	}
```




##4. Legal Notice

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.5
* Status: Stable Release
* Release: 2017-08-15

> Copyright &copy; 2014-2017 [the original authors or authors](http://www.sarl.io/about/index.html).
>
> Licensed under the Apache License, Version 2.0;
> you may not use this file except in compliance with the License.
> You may obtain a copy of the [License](http://www.apache.org/licenses/LICENSE-2.0).
>
> You are free to reproduce the content of this page on copyleft websites such as Wikipedia.

<small>Generated with the translator io.sarl.maven.docs.generator 0.5.7.</small>