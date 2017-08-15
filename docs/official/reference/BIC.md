---
title: "Built-in Capacity Reference"
layout: default
---

# Built-in Capacity Reference


<ul class="page_outline" id="page_outline">

<li><a href="#1-details-on-the-built-in-capacities">1. Details on the Built-In Capacities</a></li>
<li><a href="#2-use-of-the-built-in-capacities">2. Use of the Built-in Capacities</a></li>
<li><a href="#3-legal-notice">3. Legal Notice</a></li>

</ul>


This document describes the built-in capacities in SARL.
Before reading this document, we recommend that you read
the [General Syntax Reference](./GeneralSyntax.html), the [Capacity Reference](./Capacity.html),
and the [Skill Reference](./Skill.html).

A *Capacity* is the specification of a collection of actions. This specification makes no assumptions about
its implementation. It could be used to specify what an agent can do, what a behavior requires for its execution.

A *Skill* is a possible implementation of a capacity fulfilling all the 
 * constraints of this specification.

In SARL, every agent has a set of *built-in capacities* considered essential 
to respect the commonly accepted competencies of agents.
These capacities are considered the main building blocks on top of which other 
higher level capacities and skills can be constructed.
They are defined in the SARL language, but the skills implementing them are provided 
by the runtime environment, e.g. the [Janus platform](http://www.janusproject.io).
This runtime environment is responsible for creating them and injecting them in 
the agent before their execution begins.
Therefore, when the agent receives the `Initialize` event they are
already available.

The following figure presents the different contexts associated to an agent `A`.
Several built-in capacities permit accessing and manage these contexts.
The agents are represented by stylized humans, the contexts by the blue boxes,
and the spaces by the small color boxes in the contexts.

![Contexts](./contexts.png)


##1. Details on the Built-In Capacities

Each built-in capacity is detailed inside a dedicated section:

* [Behaviors](./bic/Behaviors.html)
* [DefaultContxtInteractions](./bic/DefaultContextInteractions.html)
* [ExternalContextAccess](./bic/ExternalContextAccess.html)
* [InnerContextAccess](./bic/InnerContextAccess.html)
* [Lifecycle](./bic/Lifecycle.html)
* [Logging](./bic/Logging.html)
* [Schedules](./bic/Schedules.html)
* [Time](./bic/Time.html)


##2. Use of the Built-in Capacities

Details on the use of the built-in capacities may be found in the references of the major
behavior-based concepts of SARL:

* [Agent](./Agent.html)
* [Behavior](./Behavior.html)



##3. Legal Notice

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