---
title: "Parallel execution within the agents"
layout: default
---

# Parallel execution within the agents


<ul class="page_outline" id="page_outline">

<li><a href="#1-event-firing-dispatching-and-handling">1. Event Firing, Dispatching and Handling</a></li>
<li><a href="#2-agent-spawning">2. Agent Spawning</a></li>
<li><a href="#3-agent-killing">3. Agent Killing</a></li>
<li><a href="#4-legal-notice">4. Legal Notice</a></li>

</ul>


This document describes the key features of SARL that are run in parallel on the SARL Runtime Environment (SRE).
Before reading this document, it is recommended reading
the [General Syntax Reference](../reference/GeneralSyntax.html).

Each SRE provides a support for running the agents. Depending on the specifications of the SRE, the
parallel execution of the agent's components may be used at different places.
Nevertheless, according the SARL language's specifications, several features are assumed to be run in parallel.
They are briefly explained below. 

## 1. Event Firing, Dispatching and Handling

In SARL, event-based communication is the interaction mechanism that is provided by default.
Firing an event is done within an interaction space by calling one of the dedicated function that are defined within
the [`DefaultContextInteractions`](../reference/bic/DefaultContextInteractions.html),
[`ExternalContextAccess`](../reference/bic/ExternalContextAccess.html) and
[`InnerContextAccess`](../reference/bic/InnerContextAccess.html) capacities.

The event firing mechanism could be divided into three steps:
1. Event firing: the event is fired by a source object;
2. Event dispatching: the event is routed to the agents that should receive the event; and
3. Event handling: the event is provided to each agent, and the defined event handlers (named behavior units) are run.

Each of these steps are basically run in different threads.
Let the following code:

```sarl
agent MyAgent {
	uses DefaultContextInteractions, Logging
	on Initialize {
		emit(new MyEvent)
		info("Event sent")
	}
	on MyEvent {
		info("Event received")
	}
}
```



The call to `emit` is run within the thread of the calling block, i.e. `on Initialize`.
The event is provides to the SRE, that is routing this event within a dedicated "hidden" thread.
Consequently, the call to `emit` returns quickly. And, there is no warranty that the event's routing
is started nor terminated when the function returns. 

In order to allow the parallel treatment of the events by an agent, each event handler, e.g. `on MyEvent`
is run in a dedicated thread.

<p markdown="1"><span class="label label-danger">Caution</span> In the previous example, there is no warranty about the order of printing of the two messages. Because of the parallel execution of the threads, the `"Agent was spawned"` message may be displayed before the `"Spawn query called"` message.</p>

## 2. Agent Spawning

Agent spawning is the action to create and start an agent from another agent.
The spawning function is provided by the 
[`Lifecycle`](../reference/bic/Lifecycle.html) capacity.

The agent spawning process is divided into several steps:
1. Call of the spawning function;
2. Creation of the agent within the computer memory;
3. SRE-specific initialization of the agent capacities and internal fields;
4. Synchronous execution of the [:initializeblock] of the agent;
5. Firing of the AgentSpawned event.

Step 1 is run within the thread of the caller.
Steps 2 to 5 are run within an internal thread of the SRE.

Let the following code:

```sarl
agent MyAgent {
	uses Lifecycle, Logging
	on Initialize {
		spawn(typeof(MyAgent2))
		info("Spawn query called")
	}
	on AgentSpawned {
		info("Agent was spawned")
	}
}
agent MyAgent2 {
	uses Logging
	on Initialize {
		info("Do initialization")
	}
}
```


The `"Do initialization"` message is always logged before the `"Agent was spawned"` message because the executed code corresponds to
steps 5 and 4, respectively. These steps are run on the same thread.

But, there is no warranty about when the `"Do initialization"` message is logged. According to the parallel execution,
it may be logged at any time. Consequently, the possible output cases are:
* `"Spawn query called"`, `"Do initialization"`, `"Agent was spawned"`
* `"Do initialization"`, `"Spawn query called"`, `"Agent was spawned"`
* `"Do initialization"`, `"Agent was spawned"`, `"Spawn query called"`


## 3. Agent Killing

Agent killing is the action to stop and destroy an agent.
The killing function is provided by the 
[`Lifecycle`](../reference/bic/Lifecycle.html) capacity.

The agent killing process is divided into several steps:
1. Call of the killing function (possibly with the abnormal termination cause);
2. Synchronous execution of the [:destroyblock] of the agent;
3. Destruction of the agent within the SRE;
4. Firing of the AgentKilled event (possibly with the abnormal termination cause).

Step 1 is run within the thread of the caller.
Steps 2 to 4 are run within an internal thread of the SRE.

Let the following code:

```sarl
agent MyAgent {
	uses Lifecycle, Logging
	on Initialize {
		killMe
	}
	on Destroy {
		info("Do destruction")
	}
	on AgentKilled {
		info("Agent was killed")
	}
}
```



The `"Agent was killed"` message is always logged after the `"Do destruction"` message because the executed code corresponds to
steps 4 and 3, respectively. These steps are run on the same thread.


## 4. Legal Notice

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
