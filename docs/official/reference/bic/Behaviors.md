---
title: "Behaviors Capacity"
layout: default
---

# Behaviors Capacity


<ul class="page_outline" id="page_outline">

<li><a href="#1-registering-a-behavior">1. Registering a Behavior</a></li>
<li><a href="#2-unregistering-a-behavior">2. Unregistering a Behavior</a></li>
<li><a href="#3-registering-a-behavior-with-an-event-filter">3. Registering a Behavior with an event filter</a></li>
<li><a href="#4-executing-a-behavior">4. Executing a Behavior</a></li>
<ul>
  <li><a href="#41-awaking-all-behaviors-and-sub-agents">4.1. Awaking all behaviors and sub-agents</a></li>
  <li><a href="#42-awaking-a-specific-behavior">4.2. Awaking a specific behavior</a></li>
  <li><a href="#43-awaking-multiple-specific-behaviors">4.3. Awaking multiple specific behaviors</a></li>
</ul>
<li><a href="#5-creating-an-event-listener">5. Creating an Event Listener</a></li>
<li><a href="#6-accessing-to-the-collection-of-the-registered-behaviors">6. Accessing to the collection of the registered behaviors</a></li>
<li><a href="#7-legal-notice">7. Legal Notice</a></li>

</ul>


The built-in capacity `Behaviors` provides the tools to the agents for dynamically
registering and unregistering sub-behaviors.

This capacity is closely related to the `InnerContextAccess` for enabling a
high-level abstraction for holonic multi-agent system development.



The definition of a behavior is not detailed in this reference document.
Please read the [Behavior Reference](../Behavior.html) for details.





## 1. Registering a Behavior

Assuming that a behavior was already defined, it is possible for an agent to register this behavior:

```sarl
def registerBehavior(attitude : Behavior) : Behavior
```



This function takes the behavior to be registered, and replies the same behavior.
When a behavior is registered, it is receiving the events in the default space of
the inner context of the agent, or received by the agent itself.

An example of call to the registration function is:

```sarl
var beh = new MyBehavior
registerBehavior(beh)
```



According to the SARL syntax reference, the example could be also written as: 

```sarl
var beh = new MyBehavior
beh.registerBehavior
```



## 2. Unregistering a Behavior

Assuming that a behavior was already registered, it is possible for an agent to unregister it:

```sarl
def unregisterBehavior(attitude : Behavior) : Behavior
```



This function takes the behavior to be unregistered, and replies the same behavior.
When a behavior is unregistering, it is no more receiving the events
in the default space of the inner context of the agent, and the ones received by the
agent itself.

```sarl
agent A {
	uses Behaviors
	var b : MyBehavior
	var c : Behavior
	def myaction {
		b = new MyBehavior
		c = unregisterBehavior(b)
	}
}
```



## 3. Registering a Behavior with an event filter

Assuming that a behavior was already defined, it is possible for an agent to
register this behavior that may received only the events matching a specific
filtering function. For registering such a behavior with its filter, the
following function could be used:

```sarl
def registerBehavior(attitude : Behavior, filter : (Event) => boolean) : Behavior
```



This function takes the behavior to be registered, and replies the same behavior.
When a behavior is registered, it is receiving the events that are matching the given
filter in the default space of the inner context of the agent, or received by the agent
itself.
The filtering function is invoked for each event that should be given to the behavior.
If the filtering function replies `true`, the event is really dispatching into the behavior.
If the function replies `false`, the event is discarded to the behavior.

An example of call to the registration function is:

```sarl
var beh = new MyBehavior
registerBehavior(beh, [^event | ^event instanceof MyEvent])
```



According to the SARL syntax reference, the example could be also written as: 

```sarl
var beh = new MyBehavior
beh.registerBehavior [^event | ^event instanceof MyEvent]
```



## 4. Executing a Behavior

A behavior is executed through its event handlers. Consequently, for running a behavior, it is mandatory
to wake it with an event. 
This section describes the functions for awaking
the behaviors with an event occurrence.


### 4.1. Awaking all behaviors and sub-agents

The regular way for awaking agent behaviors is to fire an event into all the registered behaviors.
This particular feature is supported by:

```sarl
def wake(evt : Event, scope : Scope<Address> = null)
```



This function emits the given event into the inner context of the agent (in the default space).

If a scope is provided, it is used for filtering the agents that will
receive the event. The filterable agents are the current agent itself, and
all the sub-agents (sub-holons) that were created inside the current agent.

<p markdown="1"><span class="label label-warning">Important Note</span> Because a behavior has no associated address, it cannot be filtered by the scope. All the agent's behaviors that are waiting for a given event will be executed.</p>

```sarl
var e : Event
e = new MyEvent
wake(e)
wake(e, null)
var scope : Scope<Address> = [ it.ID !== null ]
wake(e, scope)
```



### 4.2. Awaking a specific behavior

In some specific cases, you may want to wake up a single specific behavior with an event, such that, the other
behaviors of the agents and its sub-agents are not receiving the event occurrence.
This particular feature is supported by:

```sarl
def wake(beh : Behavior, evt : Event)
```



This function emits the given event into the given behavior, and neither in the inner space of the agent nor the other
registered behaviors of the agent.


### 4.3. Awaking multiple specific behaviors

As an extension of the `wake` function that is presented into the previous section, you could wake up multiple
behaviors with a single event occurrence, assuming that the list of the behaviors to wake up is known and provided.
This feature is implemented by:

```sarl
def wake(behs : Iterable<Behavior>, evt : Event)
```



This function emits the given event into each of the given behaviors, and neither in the inner space of the agent nor the other
registered behaviors of the agent that are not specified into the `behs` argument.


## 5. Creating an Event Listener

Sometimes, it is useful or mandatory for an agent to listen on the events in a
given space. The following function permits retrieving the event listener of
the agent:

```sarl
def asEventListener : EventListener
```



The listener replied by this function is the one used by the agent (and its behaviors)
for listening events related to all the contexts (default, external, and inner).

```sarl
var l : EventListener
l = asEventListener
```



## 6. Accessing to the collection of the registered behaviors

Two functions are provided for accessing to the collection of the registered behaviors:

```sarl
def hasRegisteredBehavior : boolean
def getRegisteredBehaviors : ConcurrentCollection<Behavior>
```



The hasRegisteredBehavior replies a boolean value, which is indicating if
a behavior is registered.
The getRegisteredBehaviors replies an unmodifiable collection of the registered behaviors.

```sarl
var b : boolean = hasRegisteredBehavior
var c : ConcurrentCollection<Behavior> = getRegisteredBehaviors
```




## 7. Legal Notice

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
