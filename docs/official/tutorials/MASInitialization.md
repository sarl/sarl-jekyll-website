---
title: "Initialization of a Multiagent System"
layout: default
---

# Initialization of a Multiagent System


<ul class="page_outline" id="page_outline">

<li><a href="#1-example-of-a-problematic-system">1. Example of a problematic system</a></li>
<li><a href="#2-solution-waiting-for-the-agent-spawning">2. Solution: waiting for the agent spawning</a></li>
<li><a href="#3-legal-notice">3. Legal Notice</a></li>

</ul>


This document describes the key elements and the best practices for initializing and starting up a multiagent system.
Before reading this document, it is recommended reading
the [General Syntax Reference](../reference/GeneralSyntax.html).

Initialization of a multiagent system is a hard problem, and specifically with SARL in which the
[agent spawning is run in parallel](./ParallelExecution.html).

The problem is: how ensuring that all the agents on the system are alive before starting to run their
standard behaviors?

## 1. Example of a problematic system

First, let consider a SARL code that is not working well regarding the initialization of the system.
In the following code, the type of agent `MyAgent` is defined.
This type of agent emits an `MyEvent` event when the application starts, i.e. when the agent is initialized.
It also logs the message `"Event received"` when the agent is initialized.

```sarl
event MyEvent
agent MyAgent {
	uses DefaultContextInteractions, Logging
	on Initialize {
		emit(new MyEvent)
	}
	on MyEvent {
		info("Event received")
	}
}
```


For starting the system, we could define a booting agent that starts 100 agents of the previously defined type:

```sarl
agent BootAgent {
	uses Lifecycle
	on Initialize {
		for (i : 1..100) {
			spawn(typeof(MyAgent))
		}
		killMe
	}
}
```


There is no warranty that the following sentences are true:
* The order of the agent initialization is the same as the order of the `spawn` calls;
* When the spawning loop is finished, all agents are spawned.
* The number of logged messages is always equal to 100 * 100 = 10,000, i.o.w. 100 spawned agents that are receiving the events from itself and the other agents.

But, according to the operational semantic of the spawning loop, the number of received messages
is defined by the mathematical suite f(n) = f(n-1) + n = (n(n+1))/2, illustrated in the table below.
For 100 agents, the number of logged messages should be 5,050, not 10,000.


| Number of spawned agents    | 1 | 2 | 3 | 4  | 5  |
|-----------------------------|---|---|---|----|----|
| Number of received messages | 1 | 3 | 6 | 10 | 15 |


Moreover, According to the expected [agent spawning's parallel execution](./ParallelExecution.html), the calls to the
`spawn` function form a sequence of 100 calls; And, each call to the `spawn` function starts a spawning task that is run within a separate thread.
Consequently, the general behavior of the system is not deterministic.
We cannot infer the number of messages that will be logged because some event may be fired by agents when several
other agents are still waiting for their spawns. The only one fact is that the number of logged messages is lower than or equal to f(100).

## 2. Solution: waiting for the agent spawning

A possible solution to the previously mentionned problem is to split the starting up of the application into two steps:
1. Spawning of the agents: agents are spawn, and the system waits until all the agents are alive and ready.
2. Application start: a specific event is given to all the agents for notifying them that they could start their "standard" behaviors.

Consequently, the agent's code may be redefined as follow:

```sarl
event StartApplication
agent MyAgent {
	uses DefaultContextInteractions, Logging
	on StartApplication {
		emit(new MyEvent)
	}
	on MyEvent {
		info("Event received")
	}
}
```

		
The agent emits the `MyEvent` event only when the application has started.
This application-start event is represented by the `StartApplication` event.

The booting agent becomes:

```sarl
agent BootAgent {
	uses Lifecycle, DefaultContextInteractions
	
	var count = new AtomicInteger
	
	on Initialize {
		for (i : 1..100) {
			spawn(typeof(MyAgent))
		}
	}
	
	on AgentSpawned [it.agentID != ID] {
		var n = this.count.incrementAndGet
		if (n === 100) {
			emit(new StartApplication)
			killMe
		}
	}
}
```


The two major steps of the multiagent system initialization are implemented.
First, when the boot agent starts its life, it is spawning all the agents.
Each time an agent is spawned, the booting agent is notified with an `AgentSpawned` event.
When the number of spawned agents reaches 100, the booting agent notifies about the application start
and commits a suicide.

## 3. Legal Notice

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.11
* Status: Stable Release
* Release: 2020-06-02

> Copyright &copy; 2014-2020 [the original authors or authors](http://www.sarl.io/about/index.html).
>
> Licensed under the Apache License, Version 2.0;
> you may not use this file except in compliance with the License.
> You may obtain a copy of the [License](http://www.apache.org/licenses/LICENSE-2.0).
>
> You are free to reproduce the content of this page on copyleft websites such as Wikipedia.

<small>Generated with the translator io.sarl.maven.docs.generator 0.11.0.</small>