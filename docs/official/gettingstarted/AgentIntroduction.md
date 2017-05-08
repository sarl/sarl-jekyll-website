---
title: "Agent Definition Introduction"
layout: default
---

# Agent Definition Introduction


<ul class="page_outline" id="page_outline">

<li><a href="#1-basic-agent-definition">1. Basic agent definition</a></li>
<li><a href="#2-package-definition">2. Package definition</a></li>
<li><a href="#3-agent-perceptions">3. Agent Perceptions</a></li>
<ul>
  <li><a href="#3-1-declare-an-event">3.1. Declare an Event</a></li>
  <li><a href="#3-2-define-an-agent-perceptions">3.2. Define an agent Perceptions</a></li>
  <li><a href="#3-3-lifecycle-events">3.3. Lifecycle events</a></li>
  <li><a href="#3-4-accessing-the-event-s-occurrence">3.4. Accessing the event's occurrence</a></li>
</ul>
<li><a href="#4-agent-communication">4. Agent Communication</a></li>
<ul>
  <li><a href="#4-1-use-the-capacity-to-send-an-event-in-the-default-space">4.1. Use the capacity to send an event in the default space</a></li>
  <li><a href="#4-2-send-an-event-in-the-default-space">4.2. Send an event in the default space</a></li>
</ul>
<li><a href="#5-what-s-next">5. What's next?</a></li>
<li><a href="#6-legal-notice">6. Legal Notice</a></li>

</ul>


To create our first agent, right click on the project and follow **New > File**. Name the file `myproject.sarl`.

The SARL default editor will open.

##1. Basic agent definition

Agents are defined using the `agent` keyword.

`agent MyAgent {
			}`

##2. Package definition

SARL elements are organized in packages. You can define the package using the `package` keyword.

The following code will define an agent with a fully qualified name of `io.sarl.docs.gettingstarted.^agent`.
The character `^` in the package name permits to use a SARL keyword into a package name.

<importantnote>The package keyword defines the package for all elements in the same SARL file (see the
[General Syntax Reference](../reference/GeneralSyntax.html) for details).
Therefore FirstAgent and SecondAgent belong to the same package, i.e. `io.sarl.docs.gettingstarted.^agent`.</importantnote>

```sarl
	
```


##3. Agent Perceptions

Agents need to perceive their environment in order to react to external stimuli. Perceptions take the form of events
(see [Event](../reference/Event.html) and [Agent](../reference/Agent.html) References for details).

###3.1. Declare an Event

To declare a new event use the `event` keyword. The following code defines a new event `MyEvent`.

`event MyEvent`

###3.2. Define an agent Perceptions

Now, we will want our agent to react to `MyEvent` and print a message on the console.

To define this event handler, we must use the `on` keyword, and provide the associated code block.

<note>The `println` function is provided by the `Logging` capacity. It permits printing a message
on the log output.</note>

```sarl
	import io.sarl.core.Logging
	agent MyAgent {
		uses Logging
		on MyEvent {
			println("Received MyEvent")
		}
	}
```



###3.3. Lifecycle events

SARL defines two **lifecycle** events :

* `Initialize`:  Notifies the creation of the agent, and passes the initialization parameters to the agents.
* `Destroy`: Notifies the destruction of the agent.

This means that when agent has been spawned and it is ready to begin its execution, it will receive an `Initialize` event.
You can react to this event just like with any other event defined in SARL.

Likewise, when the agent is going to stop its execution (we will see how to stop an agent later on), it will receive
a `Destroy` Event. The purpose of this event is to release any system resource properly.

```sarl
	import io.sarl.core.Logging
	import io.sarl.core.Initialize
	import io.sarl.core.Destroy
	agent MyAgent {
		uses Logging
		on Initialize {
			println("MyAgent spawned")
		}
		on Destroy {
			println("MyAgent destroyed")
		}
	}
```



###3.4. Accessing the event's occurrence

Inside a behavior declaration you may need to access the event instance the agent is reacting to.

This instance is called an `occurrence`.

In the case of an Initialize events you can access the arguments for the agent spawn using `occurrence.parameters`).

```sarl
	import io.sarl.core.Logging
	import io.sarl.core.Initialize
	import io.sarl.core.Destroy
	agent MyAgent {
		uses Logging
		on Initialize {
			println("MyAgent spawned")
			println("My Parameters are :" + occurrence.parameters.toString)
		}
		on Destroy {
			println("MyAgent destroyed")
		}
	}
```



##4. Agent Communication

Agents need to send data and stimuli to other agents. This communication takes the form of event sending
(see [Event](../reference/Event.html) and [Agent](../reference/Agent.html) References for details).

###4.1. Use the capacity to send an event in the default space

Now, we will want our agent to send data to other agents. The data are embedded into events. The definition of an
event is described above.

<note>In this document, we limit our explanation to the sending of the events in the default space of the default context
of the agent.</note>

For sending an event in the default space, the `DefaultContextInteractions` built-in capacity should be used.

Below, we define an agent that is using this capacity.

```sarl
	import io.sarl.core.DefaultContextInteractions
	agent MyAgent {
		uses DefaultContextInteractions
	}
```



###4.2. Send an event in the default space

The `DefaultContextInteractions` built-in capacity provides functions for sending events in the default space.

Below, we define an action in which an instance of `MyEvent` is created, and then sent into the default space with the function
call `emit(e)`.

```sarl
	agent MyAgent {
		uses DefaultContextInteractions
		def doSomething {
			var e = new MyEvent
			emit(e)
		}
	}
```


##5. What's next?

In the next section, we will learn how to start a SARL agent on the command line.

[Next>](./RunSARLAgentEclipse.html)

##6. Legal Notice

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.6
* Status: Draft Release
* Release: 2017-04-21

> Copyright &copy; 2014-2017 [the original authors or authors](http://www.sarl.io/about/index.html).
>
> Licensed under the Apache License, Version 2.0;
> you may not use this file except in compliance with the License.
> You may obtain a copy of the [License](http://www.apache.org/licenses/LICENSE-2.0).
>
> You are free to reproduce the content of this page on copyleft websites such as Wikipedia.

<small>Generated with the translator io.sarl.maven.docs.generator 0.6.0-SNAPSHOT.</small>