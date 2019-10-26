---
title: "Space Reference"
layout: default
---

# Space Reference


<ul class="page_outline" id="page_outline">

<li><a href="#1-types-of-spaces">1. Types of Spaces</a></li>
<ul>
  <li><a href="#1-1-space">1.1. Space</a></li>
  <li><a href="#1-2-event-space">1.2. Event Space</a></li>
  <li><a href="#1-3-open-event-space">1.3. Open Event Space</a></li>
  <li><a href="#1-4-restricted-access-event-space">1.4. Restricted Access Event Space</a></li>
</ul>
<li><a href="#2-defining-a-space">2. Defining a Space</a></li>
<ul>
  <li><a href="#2-1-defining-the-physicspace">2.1. Defining the PhysicSpace</a></li>
  <li><a href="#2-2-basic-implementation">2.2. Basic Implementation</a></li>
  <li><a href="#2-3-basic-network-support">2.3. Basic Network Support</a></li>
  <li><a href="#2-4-defining-a-spacespecification">2.4. Defining a SpaceSpecification</a></li>
  <li><a href="#2-5-access-to-the-default-space-instance-within-a-space-specification">2.5. Access to the Default Space Instance within a space specification</a></li>
</ul>
<li><a href="#3-legal-notice">3. Legal Notice</a></li>

</ul>


This document describes the features related to the definition of a space in SARL.
Before reading this document, we recommend that you read the [General Syntax Reference](./GeneralSyntax.html),
and the [Agent Reference](./Agent.html).

One of the key elements that characterize and differentiate the main 
multi-agent approaches is how interactions between agents are described.
Some researchers focus on agent-to-agent interactions and corresponding 
protocols. Within organizational approaches, some consider the 
organization as a static partition of agents where agents interact in 
groups through the roles they play. Others focus on dynamic 
organizations and normative aspects. 

Another essential aspect of the interaction is the interaction 
Agent-Environment, especially in agent-based simulations.
Each of these trends of multi-agent systems has led to numerous 
fruitful and innovative contributions.
To remain generic, SARL therefore not imposes a single way of 
describing the interaction among agents, but rather attempt to 
provide means to implement each of these approaches.

It is in this perspective that the concepts of `Space`
and `SpaceSpecification` were defined.

__A Space is the support of the interaction between agents respecting the rules defined in a Space Specification.__

__A Space Specification defines the rules (including action and
perception) for interacting within a given set of spaces respecting 
this specification.__

SARL natively defines a particular type of `Space` called
*Event Space* to provide a support to event-driven interactions.
Within an event space, agents communicate using events, the 
[built-in capacity `DefaultContextInteractions`](./BIC.html)
provides the agent with the means to emit and receive events, respectively 
using the `emit` actions and the `on` keyword
in behavior definition.
A __Default Space__ is precisely an event space.

Within an event space, the notion of `Scope` enables to 
precisely control/filter the potential recipients of an event.
__A Scope is a predicate used to filter the potentially called 
listeners for a given event.__
The most basic scope is represented by a collection of addresses.


##1. Types of Spaces

SARL provides a collection of interfaces that are representing different types of spaces.


###1.1. Space

SARL provides an interface that is representing all the spaces:

```sarl
interface Space {
	def getParticipants : SynchronizedSet<UUID>
	def getSpaceID : SpaceID
}
```




The `getSpaceID` function replies the identifier of the space.
The `getParticipants` function replies the identifiers
of the agents belonging to the space.


###1.2. Event Space

Spaces that are based on event propagation mechanism are defined as:

```sarl
interface EventSpace {
	def emit(UUID, Event)
	def emit(UUID, Event, Scope<Address>)
	def getAddress(UUID) : Address
}
```






The `getAddress` function replies the address in the space of the agent that has the given identifier.
The `emit` functions permits fire of an event in the space.


###1.3. Open Event Space

Event spaces that are allowing the agents to be register and unregister are "open event spaces":

```sarl
interface OpenEventSpace {
	def register(EventListener) : Address
	def unregister(EventListener) : Address
}
```




The functions `register` and `unregister` permit an agent to be involved or not.
The function `register` fires the event `ParticipantJoined`.
And, the function `unregister` fires the event `ParticipantLeft`.





###1.4. Restricted Access Event Space

When an event space needs to control the registration access, it should be a "restricted access event space":

```sarl
interface RestrictedAccessEventSpace {
	def register(EventListener, Principal) : Address
	def register(Object) : Address
	def unregister(EventListener) : Address
}
```


The functions given by this type of space permits implementing a space with restricted access, based on the standard Java API.


##2. Defining a Space

The definition of a new space must be done with object-oriented language's features.

For defining a space, three steps must be followed:

* Definition of the interface of the space;
* Implementation of the space on a specific runtime environment;
* Definition of the space specification.

In the rest of this section, we use the example of the definition of a physic space: a space in which objects have a 
spatial position. 


###2.1. Defining the PhysicSpace

The first step for the definition of a new type of space is the specification of the interface that is describing
the functions provided by the space.

The new space type must extend one of the predefined types, below `Space`. In the following example, the new space
is related to the physic environment in which the agents may evolve.

```sarl
interface PhysicSpace extends Space {
	def moveObject(identifier : UUID, x : float, y : float, z : float)
	def bindBody(^agent : EventListener)
	def unbindBody(^agent : EventListener)
}
```


This space permits to move an object, i.e. the physical representation of the agent 
(named body). Additionally, the space gives to the agent the ability to be binded to its body, and
to release the control of its body.
The `EventListener` type is the event listening mechanism associated to the agent. It may be obtained with
the `Behaviors` built-in capacity (see the corresponding
[built-in capacity reference](./bic/Behaviors.html) for details).




###2.2. Basic Implementation

The definition of the space implementation depends upon the runtime environment.

<caution>This section of the space reference document may evolved in future releases of SARL. Please activate
the "deprecated feature use" warning in your compilation configuration for ensuring
that you will be notified about any major changes on this part of the API.</caution>

Below, the implementation extends one of the abstract classes provided by the [Janus Platform](http://www.janusproject.io).

```sarl
class PhysicSpaceImpl extends AbstractEventSpace implements PhysicSpace {
	val entities = <UUID, PhysicObject>newHashMap
	def moveObject(identifier : UUID, x : float, y : float, z : float) {
		synchronized (this.entities) {
			var o = this.entities.get(identifier)
			if (o !== null) {
				o.move(x, y, z)
			}
		}
	}
	def bindBody(listener : EventListener) {
		synchronized (this.entities) {
			entities.put(listener.ID, new PhysicObject)
		}
	}
	def unbindBody(listener : EventListener) {
		synchronized (this.entities) {
			entities.remove(listener.ID)
		}
	}
}
```



The physic space contains a collection of objects, namely `entities`.
Each object is identified by an `UUID`. It is assumed that the `PhysicObject` class provides a method for moving it:
`move(float, float, float)`.
When an agent wants to move an object by calling the `moveObject` method,
the space is retrieving the instance of this object in the `entities`, and
move it. 

<important>The previous implementation has a major problem: it does not permit
to distribute the information and the interaction objects over a computer network. The space is
the support of the interaction. Consequently, it should provide the mechanisms for
routing the events to all the agents other the computer network.</important>


###2.3. Basic Network Support

As described in the previous section, the space implementation should route the information among the agents over a computer
network.

<caution>This section of the space reference document may evolved in future releases of SARL. Please activate the
"deprecated feature use" warning in your compilation configuration for ensuring that you will be notified
about any major changes on this part of the API.</caution>

Below, the implementation extends one of the abstract classes provided by the [Janus Platform](http://www.janusproject.io).

```sarl
class NetworkPhysicSpaceImpl extends AbstractEventSpace implements PhysicSpace {
	val entities : Map<UUID,PhysicObject>
	
	public new(id : SpaceID, factory : DistributedDataStructureService,
	        lockProvider : Provider<ReadWriteLock>) {
		super(id, factory, lockProvider)
		this.entities = factory.getMap(id.toString + "-physicObjects")
	}
	
	def bindBody(entity : EventListener) {
		this.entities.put(entity.ID, new PhysicObject)
		var a = new Address(spaceID, entity.ID)
		synchronized (this.participantInternalDataStructure) {
			return this.participantInternalDataStructure.registerParticipant(a, entity)
		}
	}
	
	def unbindBody(entity : EventListener) {
		this.entities.remove(entity.ID)
		synchronized (this.participantInternalDataStructure) {
			return this.participantInternalDataStructure.unregisterParticipant(entity)
		}
	}
	
	def moveObject(identifier : UUID, x : float, y : float, z : float) {
		var o = this.entities.remove(identifier)
		if (o !== null) {
			o.move(x, y, z)
			this.entities.put(identifier, o)
		}
	}
}
```


<important>The collection of the physic objects is a distributed map over the computer network. It means that each node
of the platform has a direct access to the objects' instances. If whose to say that is implementation may face some problems,
such as the serialization of the physic objects, and the scalability of the distributed map.</important>


###2.4. Defining a SpaceSpecification

For creating instances of spaces, it is necessary to define a space specification.
This specification may create the space instance according to rules, or provide information and rules to the spaces.

```sarl
class PhysicSpaceSpecification implements SpaceSpecification<PhysicSpace> {
	def create(id : SpaceID, params : Object*) : PhysicSpace {
		return new PhysicSpaceImpl(id)
	}
}
```


The example above is the specification related to the first implementation of the `PhysicSpace`.

```sarl
class NetworkPhysicSpaceSpecification implements SpaceSpecification<PhysicSpace> {
	@Inject
	var factory : DistributedDataStructureService
	def create(id : SpaceID, params : Object*) : PhysicSpace {
		return new NetworkPhysicSpaceImpl(id, factory)
	}
}
```


The example above is the specification that permits to create a physic space with networking. It retrieves
by injection the factory of distributed data structures provided by the Janus platform.


###2.5. Access to the Default Space Instance within a space specification

If the space instance needs to be linked to the default space of the context, it is 
necessary to retrieve the instance of the default space within the space specification.
Then, this specification is in charge of passing the default space instance to the 
space instance.

By contract, the default space instance could be []injected into the space specification 
instance](https://en.wikipedia.org/wiki/Dependency_injection). The following constraints 
apply:

1. The injected feature is an object field of the space specification, or a formal parameter;
2. The injected feature must be of type `OpenEventSpace`;
3. The injected feature must be marked with one of the two following methods:
   a. annotated with `@Named("defaultSpace")`, or
   b. annotated with `@DefaultSpace`.

The following example illustrates the first method of marking of an object field:

```sarl
class MySpaceSpecification implements SpaceSpecification<MySpace> {
    @Inject
    @Named("defaultSpace")
    var defaultSpace : OpenEventSpace
    def create(id : SpaceID, params : Object*) : MySpace {
        return new MySpaceImpl(this.defaultSpace)
    }
}
```




The following example illustrates the second method of marking of an object field:

```sarl
class MySpaceSpecification implements SpaceSpecification<MySpace> {
    @Inject
    @io.sarl.util.DefaultSpace
    var defaultSpace : OpenEventSpace
    def create(id : SpaceID, params : Object*) : MySpace {
        return new MySpaceImpl(this.defaultSpace)
    }
}
```




##3. Legal Notice

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.10
* Status: Stable Release
* Release: 2019-10-26

> Copyright &copy; 2014-2019 [the original authors or authors](http://www.sarl.io/about/index.html).
>
> Licensed under the Apache License, Version 2.0;
> you may not use this file except in compliance with the License.
> You may obtain a copy of the [License](http://www.apache.org/licenses/LICENSE-2.0).
>
> You are free to reproduce the content of this page on copyleft websites such as Wikipedia.

<small>Generated with the translator io.sarl.maven.docs.generator 0.10.0.</small>