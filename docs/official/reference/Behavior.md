---
title: "Behavior Reference"
layout: default
---

# Behavior Reference


<ul class="page_outline" id="page_outline">

<li><a href="#1-defining-a-behavior">1. Defining a Behavior</a></li>
<ul>
  <li><a href="#11-defining-an-empty-behavior">1.1. Defining an empty behavior</a></li>
  <li><a href="#12-behavior-attributes">1.2. Behavior Attributes</a></li>
  <li><a href="#13-behavior-actions">1.3. Behavior Actions</a></li>
  <li><a href="#14-extending-a-behavior">1.4. Extending a Behavior</a></li>
  <li><a href="#15-instancing-and-use-of-a-behavior">1.5. Instancing and Use of a Behavior</a></li>
  <li><a href="#16-modifiers">1.6. Modifiers</a></li>
</ul>
<li><a href="#2-behavior-units-of-a-behavior">2. Behavior Units of a Behavior</a></li>
<ul>
  <li><a href="#21-initialization-handler">2.1. Initialization Handler</a></li>
  <li><a href="#22-destruction-handler">2.2. Destruction Handler</a></li>
  <li><a href="#23-reactive-behavior-units">2.3. Reactive Behavior Units</a></li>
  <li><a href="#24-parallel-execution-of-the-reactive-behavior-units">2.4. Parallel Execution of the Reactive Behavior Units</a></li>
  <li><a href="#25-pro-active-behavior-units">2.5. Pro-active Behavior Units</a></li>
</ul>
<li><a href="#3-capacities-and-skills">3. Capacities and Skills</a></li>
<ul>
  <li><a href="#31-defining-a-capacity-and-a-skill">3.1. Defining a Capacity and a Skill</a></li>
  <li><a href="#32-giving-a-skill-to-the-associated-agent">3.2. Giving a Skill to the Associated Agent</a></li>
  <li><a href="#33-using-a-capacity-with-the-getters">3.3. Using a Capacity with the Getters</a></li>
  <li><a href="#34-using-a-capacity-with-the-extension-methods">3.4. Using a Capacity with the Extension Methods</a></li>
</ul>
<li><a href="#4-legal-notice">4. Legal Notice</a></li>

</ul>


This document describes the features related to the definition of a behavior in SARL.
Before reading this document, we recommend that you read
the [General Syntax Reference](./GeneralSyntax.html),
and the [Agent Reference](./Agent.html).

A Behavior is the specification of a collection of behavior units (or event handlers).
This Behavior may be used by an agent for building its global behavior.


## 1. Defining a Behavior

A behavior is declared with the `behavior` keyword. In the behavior's body block, we can declare Mental States
(in the form of attributes), Actions and Behaviors.


### 1.1. Defining an empty behavior

The following code illustrates the definition of a behavior named [:behaviortype1], and that is empty.

Basically, this behavior does nothing, and does not react on events.

```sarl
behavior MyBehavior {
}
```



### 1.2. Behavior Attributes

The mental state of an agent is composed by the data in the knowledge of the agent. A behavior may contain
a part of this mental state. Most of the time, it is implemented as a collection of attributes.

According to the [General Syntax Reference](./GeneralSyntax.html), the attributes may be
modifiable (when declared with the `var` keyword), or unmodifiable (when declared with the
`val` keyword).

```sarl
behavior MyBehavior {
	// Defining a modifiable element of the mental state
	var mentalStateElement1 : String
	// Defining an unmodifiable element of the mental state
	val mentalStateElement2 : boolean = true
}
```



### 1.3. Behavior Actions

It is allowed to define actions (methods) in the behavior. The syntax described in the
[General Syntax Reference](./GeneralSyntax.html) is used.

The example below illustrates the creation of type actions.

```sarl
behavior MyBehavior {
	uses Logging
	// Defining an action without parameter nor return type
	def myAction1 {
		info("Hello world")
	}
	// Defining an action with a variadic parameter and no return type
	def myAction2(param : int*) {
		info("params are " + param)
	}
}
```



### 1.4. Extending a Behavior

In some use cases, it is useful to specialize the definition of a behavior. This mechanism is supported
by the inheritance feature of SARL, which has the same semantic as the inheritance
mechanism as the Java object-oriented language.

The extended behavior is specified just after the `extends` keyword.

<veryimportantnote> A behavior type can extend __only one__ other behavior type. This is close
to the constraint on the extension of classes in the Java language.</veryimportantnote>

In the following code, a first behavior is defined with the name `MyBehavior` and an attribute named `attr`.
A second behavior MySubBehavior is defined as the extension of the first behavior. It contains a function named
`action`, which is displaying the inherited attribute.

```sarl
behavior MyBehavior {
	protected var attr : String
}
behavior MySubBehavior extends MyBehavior {
	uses Logging
	def action {
		info(attr)
	}
}
```



### 1.5. Instancing and Use of a Behavior

A behavior is always owned by an agent. Consequently, it is mandatory to pass the agent as parameter
of the behavior's constructor.

In the following example, a behavior of type `MyBehavior` is instanced (with the agent as the
owner/parameter). This new behavior is then registered into the agent for enabling the reception of
the events in the behavior.

```sarl
agent MyAgent {
	uses Behaviors
	on Initialize {
		// Create the instance of the behavior
		var beh = new MyBehavior(this) // <- the parameter is the agent
		
		// Register the behavior for receiving the events.
		// This function is given by the Behaviors capacity
		registerBehavior(beh)
	}
}
```



### 1.6. Modifiers

Modifiers are used to modify declarations of types and type members.
This section introduces the modifiers for the behavior. The modifiers are usually
written before the keyword for defining the behavior.

The complete description of the modifiers' semantic is available in
[this section](./OOP.html#definition-of-all-the-supported-modifiers).


#### Behavior Modifiers

A behavior may be declared with one or more modifiers, which affect its runtime behavior:

* Access modifiers:
	* `public`: the behavior is accessible from any other type (default);
	* [:packagemodifier]: the behavior is accessible from only the types in the same package.
* `abstract`: the behavior is abstract and cannot be instanced.
* `final`: avoid to be derived.

Examples:

```sarl
public behavior Example1 {
}
package behavior Example2 {
}
abstract behavior Example3 {
}
final behavior Example4 {
}
```



#### Field Modifiers

The modifiers for the fields in a behavior are:

* Access modifiers:
	* `public`: the field is accessible from everywhere;
	* `protected`: the field is accessible within the same package, and derived agents;
	* `package`: the field is accessible only within the same package of its agent;
	* `private`: the field is accessible only within its agent (default).

Examples:

```sarl
public var example0 : Object
protected var example1 : Object
package var example2 : Object
private var example3 : Object
```



#### Method Modifiers

The modifiers for the methods in a behavior are:

* Access modifiers:
	* `public`: the method is accessible from everywhere;
	* `protected`: the method is accessible within the same package, and derived classes (default);
	* `package` the method is accessible only within the same package as its class;
	* `private`: the method is accessible only within its class.
* `abstract`: the method has no implementation in the class.
* `dispatch`: the method provides an implementation for the dispatch method mechanism.
* `final`: the method cannot be overridden in derived classes.

Examples:

```sarl
// Public access function
public def example0 { }
// Protected access function
protected def example1 { }
// Package access function
package def example2 { }
// Private access function
private def example3 { }
// Abstract function
abstract def example4
// Not-overridable function
final def example5 { }
// Dispatch functions
dispatch def example7(p : Integer) { }
dispatch def example7(p : Float) { }
```



## 2. Behavior Units of a Behavior

The behaviors of an agent correspond to the units that are executed by the agent for exhibiting
its general behavior.

The Behavior statement permits specifying a subset of the agent's behavior inside a single syntactic entity.
Two types of behaviors are considered:

* reactive: the agent react when it is receiving events, and
* pro-active: the agent executes by itself one of its behaviors.


The definition of the reactive behaviors is based on the event handling
mechanism of SARL. Events may be emitted in [spaces](./Space.html),
and received by the agents, and their behaviors, belonging to these spaces.
A behavior may indicate that it is interesting for receiving an event by specifying
an event handler using the following syntax:

```sarl
on EventName [ Guard ] {
	Statements
}
```



`EventName` is the name of event to wait for `Guard` is the optional specification of a predicate
that may be true for executing the `Statements`.
The statements are executed only if an event with the given name is received, *and* if the guard is true.

In the guard and the statements, it is possible to use the instance of the received event:
the occurrence. This instance is represented by the `occurrence` keyword. It is an implicit
variable as the keywords `this` and `it`.


### 2.1. Initialization Handler

#### General Description

When a behavior is ready to be executed by the runtime environment, usually when it
is registered in its owning agent, it receives the `Initialize` event.
This event is defined as:

```sarl
interface Initialize extends Event {
}
```



It contains the list of the parameters given that are never set for behaviors.

```sarl
behavior MyBehavior {
	uses Logging
	on Initialize {
		info("I'm initializing my behavior")
	}
}
```



#### Guarded Initialization Handler

Because `Initialize` is an event, the handler in the behavior could use a guard. This feature enables
the developer to write different initialization blocks depending on the guards of the handlers.

In the following example, the first event handler is executed when the `Initialize` event has
no parameter. The second event handler is executed when the event has at least one parameter.

```sarl
behavior MyBehavior {
	uses Logging
	on Initialize [ occurrence.parameters.empty ] {
		info("First initialization")
	}
	on Initialize [ ! occurrence.parameters.empty ] {
		info("First initialization")
	}
}
```



#### Execution of the Initialization Handler

The `on Initialize` event handler in behaviors is a bit special, as it is the code run when a behavior is attached to its agent.
As such, its execution is more "synchronous" than other on-behavior rules. In particular:

1. Any event emitted within an `on Initialize`, will not be processed until that
   `on Initialize` code finishes. So, your behavior initialization should not depend
   (and wait) on any fired event being processed, as they won't!
2. When spawning an agent in `on Initialize`, the spawn instructions will return only
   after the agent has been created. However, creation of the agent (i.e., of the
   corresponding object) does not include initialization of the agent via its 
   `on Initialize` handler. Said so, the Java thread manager may process those
   initialization processes of the new agent before continuing with the execution
   of the spawning agent (and this seems to be the case in many Linux boxes
   where the executor service of Java tends to have the same behavior during
   all the runs). If you change computer, it may be different. 


#### Multiple Initialization Handlers

It is allowed to declare multiple initialization handlers into a single behavior type, as illustrated by:

```sarl
behavior Beh1 {
	uses Logging
    on Initialize {
        info("1")
    }
    on Initialize {
        info("2")
    }
    on Initialize {
        info("3")
    }
}
```


According to the SARL operational semantic, the three event handlers for `Initialize` are run in parallel.
The initialization event handlers are not constructors (as defined in object-oriented programming paradigm),
they are reacting to the receiving of an `Initialize` occurrence.


#### Initialization Handler within the Inheritance Hierarchy

The example in the previous section could be extended in order to illustrate how the initialization handlers
are run when the type of the behavior (here `Beh2`) is declared within a inheritance hierarchy.

```sarl
behavior Beh2 extends Beh1 {
	uses Logging
    on Initialize {
        info("4")
    }
    on Initialize {
        info("5")
    }
}
```


According to the SARL operational semantic, all the initialization handlers are run in parallel.
In the previous example, five event handlers will be run: three are defined into `Beh1`, and
two are defined into `Beh2`. This mechanism is generalized to all the events within a behavior.


### 2.2. Destruction Handler

#### General Description

The counterpart of `Initialize` is the event `Destroy`. This event is defined as:

```sarl
interface Destroy extends Event {
}
```



Example:

```sarl
behavior MyBehavior {
	uses Logging
	on Destroy {
		info("Destroying the behavior")
	}
}
```



#### Guarded Destruction Handler

As for `Initialize`, the handlers of the `Destroy` event could be guarded.

In the following example, the first event handler is executed when the `Destroy` is received
and there is resource stored in the corresponding field. The second event handler is executed
when there is no resource.

```sarl
behavior MyBehavior {
	uses Logging
	var resource : Object
	on Destroy [ resource !== null ] {
		info("Destroying the behavior when there is a resource")
	}
	on Destroy [ resource === null ] {
		info("Destroying the behavior when there is no resource")
	}
}
```



### 2.3. Reactive Behavior Units

The reactive behavior is specified with a collection of event handlers. The principle of a reactive behavior
is to execute a part of the behavior when something has happening in the behavior, the agent or in its environment.

In the following example, the behavior is reacting to the reception of the `SomethingChanged` event.

As for all the event handlers, it could be guarded by a predicate.

```sarl
behavior MyBehavior {
	uses Logging
	on SomethingChanged {
		info("Reactive behavior")
	}
}
```



### 2.4. Parallel Execution of the Reactive Behavior Units

When an event is received and the guard of the corresponding handler is true, the event handler is said to be triggered.

When multiple event handlers are triggered at the same time, they are all executed in parallel.
In the following example, the two handlers for the `SomethingChanged` event are executed in parallel.

```sarl
behavior MyBehavior {
	uses Logging
	on SomethingChanged {
		info("First reactive behavior")
	}
	on SomethingChanged {
		info("Second reactive behavior")
	}
}
```



### 2.5. Pro-active Behavior Units

A proactive behavior is a part of the global behavior of an agent that the
agent is deciding to execute by itself.
The execution of a reactive behavior is initiated by a part of
the code external to this behavior. In opposite, the initiator
of the execution of a proactive behavior is the agent itself.

In SARL, a proactive behavior is a behavior that is scheduled
by the agent or one of its behaviors. The schedule mechanism is provided by the
[`Schedules` built-in capacity](./BIC.html).
In the following example, the agent execute its proactive behavior every second.

```sarl
behavior MyBehavior {
	uses Schedules, Logging
	on Initialize {
		every(1000) [
			info("Run a pro-active behavior")
		]
	}
}
```



## 3. Capacities and Skills

An agent is an autonomous entity having a set of skills to realize the capacities it exhibits.
An agent has a set of built-in capacities considered essential to respect the commonly accepted
competencies of agents, such autonomy, reactivity, pro-activity and social capacities. 

Consequently, a behavior associated to an agent is able to use the skills of this agent.


### 3.1. Defining a Capacity and a Skill

The definition of a capacity or a skill is out of the scope of this reference document. For details, please read
the [Capacity Reference](./Capacity.html), and the [Skill Reference](./Skill.html).

In the rest of this section, it is assumed that the following capacity and skill are defined:

```sarl
capacity Cap {
	def action
}

skill Ski implements Cap {
	uses Logging
	def action {
		info("Action")
	}
}
```



### 3.2. Giving a Skill to the Associated Agent

When a behavior must use a capacity, its agent must own an implementation of this capacity: a skill.
It is possible for a behavior to assign a skill to its agent.

```sarl
behavior MyBehavior {
	new (owner : Agent) {
		super(owner)
		var theSkill = new Ski
		setSkill( theSkill, Cap )
	}
}
```






If some cases, you may want to set the skill if one was not set up before. The specific behavior
is supported by `setSkillIfAbsent(Skill, Class<? extends Capacity>*)`.

```sarl
behavior MyBehavior {
	new (owner : Agent) {
		super(owner)
		var theSkill = new Ski
		setSkillIfAbsent( theSkill, Cap )
	}
}
```



### 3.3. Using a Capacity with the Getters

For invoking a function implemented by a skill, the two following steps must be done:

* Retrieve the skill instance: the function `getSkill(Class<? extends Capacity>)` permits retrieving the skill associated to the given capacity;
* Invoke the capacity's action on the retrieved skill.

<note>This method of invocation is not recommended by the SARL developers.
You should prefer the use of the extension methods (see below).</note>

```sarl
behavior MyBehavior {
	on SomeEvent {
		// Retreive the capacity implementation
		var s = getSkill(Cap)
		// Run the action of the skill
		s.action
	}
}
```



### 3.4. Using a Capacity with the Extension Methods

Invoking a capacity/skill with the getter method is not user-friendly. Since the
[General Syntax Reference](./GeneralSyntax.html) describes the "extension method"
mechanism, it is possible to use it for invoking the capacities.

But, instead of using an `import` directive, the `uses` keyword is provided for importing the
capacities into the agent. In the following example, the `Cap` capacity is imported.

After a capacity was "imported", it is possible to directly call the functions of the capacity
(according to the extension method syntax). In the following example, the action
with the name `action` is invoked. This action is defined in the `Cap` capacity. 

```sarl
behavior MyBehavior {
	uses Cap
	on SomeEvent {
		// Run the action of the skill
		action
	}
}
```




## 4. Legal Notice

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.12
* Status: Draft Release
* Release: 2020-08-18

> Copyright &copy; 2014-2020 [the original authors or authors](http://www.sarl.io/about/index.html).
>
> Licensed under the Apache License, Version 2.0;
> you may not use this file except in compliance with the License.
> You may obtain a copy of the [License](http://www.apache.org/licenses/LICENSE-2.0).
>
> You are free to reproduce the content of this page on copyleft websites such as Wikipedia.

<small>Generated with the translator io.sarl.maven.docs.generator 0.12.0-SNAPSHOT.</small>