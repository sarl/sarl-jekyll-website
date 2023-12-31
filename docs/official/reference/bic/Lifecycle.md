---
title: "Lifecycle Capacity"
layout: default
---

# Lifecycle Capacity


<ul class="page_outline" id="page_outline">

<li><a href="#1-stopping-the-agent-execution">1. Stopping the Agent Execution</a></li>
<li><a href="#2-spawning-in-the-default-context">2. Spawning in the default context</a></li>
<li><a href="#3-spawning-with-a-specific-agent-identifier-in-the-default-context">3. Spawning with a specific agent identifier in the default context</a></li>
<li><a href="#4-spawning-in-a-specific-context">4. Spawning in a specific context</a></li>
<li><a href="#5-spawning-with-a-specific-agent-identifier-in-a-specific-context">5. Spawning with a specific agent identifier in a specific context</a></li>
<li><a href="#6-legal-notice">6. Legal Notice</a></li>

</ul>


The built-in capacity `Lifecycle` provides actions for spawning new agents on different external contexts and
the inner context, as well as the `killMe` action to stop the execution of an agent.





## 1. Stopping the Agent Execution

Because of the autonomy property of an agent, it can be stopped only by committing a suicide. It means that
it is impossible to stop an agent from another agent: the agent to stop must be able to accept or reject
this query.

The `Lifecycle` capacity provides the following function for committing a suicide:

```sarl
def killMe(abnormalTerminationCause : Throwable = null)
```



This action automatically unregisters the calling agent from the default context, and therefore all its
spaces including the default space.

<p markdown="1"><span class="label label-danger">Very Important Note</span> If the killed agent was a composed agent, it must not have members any more before calling this action, otherwise a `RuntimeException` is thrown.</p>

This action fires two events in case of success, and one event in case of failure:

* `AgentKilled` is fired in case of success in the default space of all contexts to which the calling agent belongs.
* `Destroy` is fired in case of success inside the killed agent agent.
* `AgentKillFailure` is fired in case of failure into the default space of the inner context of the agent; This event contains the cause of the failure.





Example:
```sarl
agent A {
	uses Lifecycle
	def myaction {
		killMe
	}
}
```



The optional argument of the `killMe` function enables to provide the cause of an abnormal termination of the agent.
This cause must be a throwable object, e.g. an exception.
If the argument `abnormalTerminationCause` is provided, its value is put into the field `abnormalTerminationCause` of the fired `AgentKilled`
event.


## 2. Spawning in the default context

Many time, it is useful for agent to create a new agent into the default context. The following
functions are provided for this task:

```sarl
def spawn(agentType : Class<? extends Agent>, parameters : Object*)
def spawn(nbAgents: int, agentType : Class<? extends Agent>, parameters : Object*)
```



This action creates one to `nbAgents` instance(s) of the given agent type, and launches the agent(s)
into the default context.
The first `spawn` function above is spawning a single agent.
The second `spawn` function is spawning the given number of agents.
The `parameters` are passed to the spawned agent inside the `Initialize` event: the `parameters` field.



This action fires two events:

* `AgentSpawned` in the default space of the default context. The source of the event is this spawner.
* `Initialize` in spawned agent.




Example:
```sarl
agent A {
	uses Lifecycle
	def myaction {
		var type : Class<? extends Agent>
		var p1 : Object
		var p2 : Object
		type = typeof(A)
		p1 = new Object
		p2 = new Object
		spawn(type, p1, p2)
		spawn(5, type, p1, p2)
	}
}
```



## 3. Spawning with a specific agent identifier in the default context

Some time, it is useful to create an agent with a specific identifier. The following function permits to spawn an agent
with a given identifier in the default context:

```sarl
def spawnWithID(agentType : Class<? extends Agent>,
agentId : UUID,
      parameters : Object*)
```



This action creates an instance of the given agent type, with the given identifier, and launches the agent
into the default context.
The parameters are passed to the spawned agent inside the `Initialize` event: the `parameters` field.

This action fires two events:

* `AgentSpawned` in the default space of the context. The source of the event is the calling agent.
* `Initialize` in spawned agent.

Example:
```sarl
agent A {
	uses Lifecycle
	def myaction {
		var aid : UUID
		var type : Class<? extends Agent>
		var p1 : Object
		var p2 : Object
		type = typeof(A)
		p1 = new Object
		p2 = new Object
		spawnWithID(type, aid, #[p1, p2])
	}
}
```




## 4. Spawning in a specific context

When one or more agents should be spawned into a specific agent context, the two following functions
could be used for launching the agents:

```sarl
def spawnInContext(agentType : Class<? extends Agent>,
                   context : AgentContext,
                   parameters : Object*)
def spawnInContext(nbAgents : int,
                   agentType : Class<? extends Agent>,
                   context : AgentContext,
                   parameters : Object*)
```



This action creates one to `nbAgents` instance(s) of the given agent type, and launches the agent(s)
into the given `context`.
The first `spawn` function is spawning a single agent.
The second `spawn` function is spawning the given number of agents.
The `parameters` are passed to the spawned agent inside the `Initialize` event: the
`parameters` field.

This action fires two events:

* `AgentSpawned` in the default space of the context. The source of the event is the calling agent.
* `Initialize` in spawned agent.

Example:
```sarl
agent A {
	uses Lifecycle
	def myaction {
		var c : AgentContext
		var type : Class<? extends Agent>
		var p1 : Object
		var p2 : Object
		type = typeof(A)
		p1 = new Object
		p2 = new Object
		spawnInContext(type, c, p1, p2)
		spawnInContext(5, type, c, p1, p2)
	}
}
```



## 5. Spawning with a specific agent identifier in a specific context

Some time, it is useful to create an agent with a specific identifier. The following function permits to spawn an agent
with a given identifier in a specific context:

```sarl
def spawnInContextWithID(agentType : Class<? extends Agent>,
agentId : UUID,
context : AgentContext,
parameters : Object*)
```



This action creates an instance of the given agent type, with the given identifier, and launches the agent
into the given context.
The parameters are passed to the spawned agent inside the `Initialize` event: the `parameters` field.

This action fires two events:

* `AgentSpawned` in the default space of the context. The source of the event is the calling agent.
* `Initialize` in spawned agent.

Example:
```sarl
agent A {
	uses Lifecycle
	def myaction {
		var c : AgentContext
		var aid : UUID
		var type : Class<? extends Agent>
		var p1 : Object
		var p2 : Object
		type = typeof(A)
		p1 = new Object
		p2 = new Object
		spawnInContextWithID(type, aid, c, #[p1, p2])
	}
}
```



## 6. Legal Notice

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
