---
title: "Override the Agent Event Bus with the Behaviors Capacity"
layout: default
---

# Override the Agent Event Bus with the Behaviors Capacity


<ul class="page_outline" id="page_outline">

<li><a href="#1-role-of-the-behavior-built-in-capacity">1. Role of the Behavior Built-in Capacity</a></li>
<li><a href="#2-definition-of-a-behaviors-capacity">2. Definition of a Behaviors capacity</a></li>
<ul>
  <li><a href="#21-declaration-and-link-to-the-default-skill">2.1. Declaration and Link to the Default Skill</a></li>
  <li><a href="#22-declaration-of-the-event-listener">2.2. Declaration of the event listener</a></li>
  <li><a href="#23-upgrading-the-skill-implementation-with-the-new-event-listener">2.3. Upgrading the skill implementation with the new event listener</a></li>
  <li><a href="#24-implementation-of-the-over-capacity-functions">2.4. Implementation of the over capacity functions</a></li>
</ul>
<li><a href="#3-using-the-overriding-skill-in-the-agent">3. Using the overriding skill in the agent</a></li>
<li><a href="#4-legal-notice">4. Legal Notice</a></li>

</ul>


By default, the SARL agents are exchanging data and information by using [events](../reference/Event.html).
These events are received by the agent event handlers that are declared with the `on` keyword.
In order to invoke these handlers, the SARL Run-time Environment (SRE) implements an event bus that is in
charge of routing the events for an agent.

This tutorial page explains how to override the event routing mechanism by defining a new [skill](../reference/Skill.html)
for the [standard built-in capacities](../reference/bic/Behaviors.html) in charge of the event routing in the agent.

## 1. Role of the Behavior Built-in Capacity

The `Behaviors` built-in capacity provides the tools to the agents for dynamically
registering and unregistering sub-behaviors, and it provides the *event listener that could
be used by external entities (such as the SRE's communication service)
to give the events to the agents.

The key function that must be overridden is related to this last feature. The name of the
function is `asEventListener`. This function replies an internal object that implements
the `EventListener` interface. This object is invoked each time an event should delivered
to the agent. 


## 2. Definition of a Behaviors capacity

This section describes step-by-step on to create a new `Behaviors` implementation,
that is of course an agent skill.

### 2.1. Declaration and Link to the Default Skill

Since the default built-in skill that is implementing the `Behaviors` capacity is provided
by the SRE, it may be based on internal features that is neither accessible nor visible.
That's why it is preferable to keep the reference to the original `Behaviors` implementation
in order to let us invoking these low-level features.

<p markdown="1"><span class="label label-info">Note</span> In this tutorial, the new `Behaviors` implementation will filter the incoming events according to a given type. In order words, only the events of the given type will pass through.</p>

The SARL code of the new `Behaviors` implementation is written into the skill with the name
`FilteringEventDispatchingBehavior`:

```sarl
skill FilteringEventDispatchingBehavior implements Behaviors {
	val acceptedType : Class<? extends Event>
	val behaviorDelegate : Behaviors
	new (acceptedType : Class<? extends Event>, behaviorDelegate : Behaviors) {
		this.acceptedType = acceptedType
		this.behaviorDelegate = behaviorDelegate
	}
}
```


In the previous code, the `FilteringEventDispatchingBehavior` skill is an implementation of the built-in `Behaviors` capacity.
It take as argument of its constructor the type of event that is accepted, and the reference to the original
`Behaviors` implementation that is provided by the SRE.
There two arguments are stored into local attributes of the skill.

### 2.2. Declaration of the event listener

In the implementation of the `Behaviors` capacity, the function `asEventListener` is defined for
returning the event listener associated to the agent.
Thus, it is necessary to define this event listener.
We decided to declare it as an *inner class* of `FilteringEventDispatchingBehavior`.

```sarl
private static class FilteringEventListener implements EventListener {
	val parent : FilteringEventDispatchingBehavior
	new (parent : FilteringEventDispatchingBehavior) {
		this.parent = parent
	}
	
	override receiveEvent(occ : Event) {
		if (this.parent.acceptedType.isInstance(occ)) {
			this.parent.behaviorDelegate.asEventListener.receiveEvent(occ)
		}
	}
	@Pure
	override getID : UUID {
		this.parent.ID
	}
}
```


This internal implementation of `EventListener` has a reference to its containing skill, as argument of
the constructor. This reference is defined in order to have access to the filtering type and to the
original implementation of the `Behaviors` capacity.

The type `FilteringEventListener` must implement the function `receiveEvent` that is invoked
each time an event must be delivered to the agent (either internal or external event).
The code of this function checks if the type of the event is compatible with the filtering type.
And, if it is compatible, it delivers the event to the agent by using the original `Behaviors` capacity.


### 2.3. Upgrading the skill implementation with the new event listener

Now, it is necessary to reply an instance of the event listener (that is defined in the previous section) in
the `FilteringEventDispatchingBehavior` skill.

```sarl
@Pure
override asEventListener : EventListener {
	new FilteringEventListener(this)
}
```


### 2.4. Implementation of the over capacity functions

Several functions must be implemented into the `FilteringEventListener` skill in order
to have a complete implementation of the `Behaviors` capacity.
All the functions invoke their equivelent functions into the original built-in
capacity.

```sarl
override hasRegisteredBehavior : boolean {
	this.behaviorDelegate.hasRegisteredBehavior
}
override getRegisteredBehaviors : ConcurrentCollection<Behavior> {
	this.behaviorDelegate.getRegisteredBehaviors
}
override registerBehavior(attitude : Behavior, filter : (Event) => boolean, initializationParameters : Object*) : Behavior {
	this.behaviorDelegate.registerBehavior(attitude, filter, initializationParameters)
}
override unregisterBehavior(attitude : Behavior) : Behavior {
	this.behaviorDelegate.unregisterBehavior(attitude)
}
override wake(^event : Event, scope : Scope<Address>) {
	this.behaviorDelegate.wake(^event, scope)
}
override wake(beh : Behavior, ^event : Event) {
	this.behaviorDelegate.wake(beh, ^event)
}
override wake(behs : Iterable<Behavior>, ^event : Event) {
	this.behaviorDelegate.wake(behs, ^event)
}
```



## 3. Using the overriding skill in the agent

The last step to implement in this tutorial is the registration of the new `FilteringEventDispatchingBehavior` in place of the
built-in `Behaviors` capacity.
This action is usually done during the initialization stage of the agent.
In the following code, the `MyEvent` is assumed to be defined as a SARL event that is the only
one type of event accepted by the agents of type `FilteringEventAgent`.

```sarl
agent FilteringEventAgent {
	on Initialize {
		val originalSkill = getSkill(typeof(Behaviors))
		val newSkill = new FilteringEventDispatchingBehavior(typeof(MyEvent), originalSkill)
		setSkill(newSkill)
	}
}
```


The initialization process does the following steps:

1. Retrieve the original implementation of the `Behaviors` capacity that is provided by the SRE, into the local variable `originalSkill`.
2. Create the instance of the new `FilteringEventDispatchingBehavior` skill by passing the event type under interest, and the reference to the original skill.
3. Register the new instance of `FilteringEventDispatchingBehavior` skill, that will cause the replacement of the `Behaviors` skill provided by the SRE.


## 4. Legal Notice

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
