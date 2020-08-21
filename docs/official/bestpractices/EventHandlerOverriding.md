---
title: "Event Handler Overriding"
layout: default
---

# Event Handler Overriding


<ul class="page_outline" id="page_outline">

<li><a href="#1-operational-semantic-of-the-event-handlers">1. Operational semantic of the event handlers</a></li>
<li><a href="#2-defining-the-super-behavior-in-a-function">2. Defining the super behavior in a function</a></li>
<li><a href="#3-overriding-the-super-function">3. Overriding the super function</a></li>
<li><a href="#4-legal-notice">4. Legal Notice</a></li>

</ul>


This document describes the basics of the overriding of the event handlers.
The key feature that is considered in this document is the overriding of the behavior associated to an event handler.
Let an event occurrence of `MyEvent`. In the definition of the abstract agent named `MySuperAgent`, the message
"hello world" is printed out when an occurrence of `MyEvent` is received.
Let consider that you want to avoid this message printing in a sub-type of `MySuperAgent`, but do something other.

In the SARL language, it is impossible to override the event handlers, i.e. the `on` statements.
So, __how to override the behavior of an inherited `on` statement?__

In this document, the operational semantic of the event handlers is reminded. Then, the best practice for overriding
the event handler behavior is explained.


## 1. Operational semantic of the event handlers

The operational semantics of the event handler is the following:
when an event is received by an agent (or a behavior), all the event handlers matching the
event type and with a valid guard on the event occurrence are run in parallel.

The event handlers from the current agent type, and from all the super agent types are considered.
Let the example below. When the agent `MyAgent` receives an occurrence of `MyEvent`, the two
event handlers are runs. It means that the CODE1 is run and the message "hello world" is printed out.
These two event handlers are run in parallel.

```sarl
event MyEvent

agent MySuperAgent {
  uses Logging
  on MyEvent {
	info("hello world")
  }
}

agent MyAgent extends MySuperAgent {
  on MyEvent {
	// CODE1
  }
}
```



## 2. Defining the super behavior in a function

For overriding the behavior associated to an event handler, it is mandatory to use the function overriding mechanism
that is provided by the SARL language.

A function must be defined in the super type for each event handler that could be overridden.
In the following example, the function is named `myEventBehavior`. The code of this function is the code
of the event handler from the previous section. The event handler invokes the defined function.

```sarl
event MyEvent

agent MySuperAgent {
  uses Logging
  on MyEvent {
	myEventBehavior
  }
  def myEventBehavior {
	info("hello world")
  }
}
```



## 3. Overriding the super function

For overriding the behavior, the function `myEventBehavior` could be overridden in the sub-type.
With the example below, the message "hello world" is no more printed out because of the function overriding.

```sarl
agent MyAgent extends MySuperAgent {
  def myEventBehavior {
	// CODE1
  }
}
```



## 4. Legal Notice

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.12
* Status: Draft Release
* Release: 2020-08-21

> Copyright &copy; 2014-2020 [the original authors or authors](http://www.sarl.io/about/index.html).
>
> Licensed under the Apache License, Version 2.0;
> you may not use this file except in compliance with the License.
> You may obtain a copy of the [License](http://www.apache.org/licenses/LICENSE-2.0).
>
> You are free to reproduce the content of this page on copyleft websites such as Wikipedia.

<small>Generated with the translator io.sarl.maven.docs.generator 0.12.0-SNAPSHOT.</small>