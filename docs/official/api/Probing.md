---
title: "SRE Observing and Probes"
layout: default
---

# SRE Observing and Probes


<ul class="page_outline" id="page_outline">

<li><a href="#1-what-is-observable">1. What is Observable?</a></li>
<li><a href="#2-probe-generic-observer-implementation">2. Probe: generic observer implementation</a></li>
<ul>
  <li><a href="#21-general-principles">2.1. General Principles</a></li>
  <li><a href="#22-concrete-definition">2.2. Concrete Definition</a></li>
  <li><a href="#23-observe-the-probe">2.3. Observe the Probe</a></li>
</ul>
<li><a href="#3-probing-service">3. Probing Service</a></li>
<li><a href="#4-legal-notice">4. Legal Notice</a></li>

</ul>


The multi-agent system is composed of multiple elements, including agents, behaviors, contexts and spaces, but not limited to.
Organizational models in multi-agent systems usually position agents as actors-observers within environments shared
by multiple agents and organizational structures at different levels of granularity.
Then, the agents may have the capacity to observe the environment and the other agents, without directly interacting
with them. The observing agent is able to extract information from another agent or from a society of agents, that could be opaque
according to a possible holonic architecture of the system.

Observation means that data or information could be extracted from the observed object without filtering from this latter.
The observer is not intrusive from the agent point of view. In other words, the observed agent has no knowledge about the fact it
is observed or not. In this case, it cannot adapt its behavior on its observation status.

Because an agent is defined as an autonomous entity, the agent is supposed to be enabled to specify if a part of itself
is observable or not, i.e. to specify the access rights.

<p markdown="1"><span class="label label-danger">Caution</span> The right access management is not yet supported by the SARL API.</p>

## 1. What is Observable?

The first question arising when considering the concept of observable multi-agent system is: what is observable?

Any object within the multi-agent system that could be referred with a name is possibly subject of an observation.
The objects are referred according to a [specific naming convention](./Naming.html).

Because observation is related to data extraction, only fields could be observed at the concrete level.
Consequently, the observable objects a the fields declared within an:
* agent
* behavior
* skill
* agent context
* space
* service
* artifact (if the SRE supports this concept)

## 2. Probe: generic observer implementation

### 2.1. General Principles

A probe is an implementation of the proxy and observer software design patterns for observable multi-agent system.
It is a software tool that extracts the data from the observed object and provide the data to the observer.
Since a probe is a proxy, it filters the interaction from the observer to the observed object by enabling the first
only to get the data (no other function declared into the observed object is accessible).
The implementation of a probe ensures that it is not intrusive to the observed object. 

The observer has to create a probe on a field of the observable object (agent, behavior, etc.).
Then, the probe could be read to obtain the data, or the observer could be notified each time the data has changed
(according to the observer software design pattern).

### 2.2. Concrete Definition

A probe is defined as:

```sarl
interface Probe<T> {
	def addProbeListener(IProbeListener)
	def addProbeReleaseListener(IProbeReleaseListener)
	def getName : String
	def getType : Class<T>
	def getUri : URI
	def getValue : T
	def isActive : boolean
	def isInvalid : boolean
	def release
	def removeProbeListener(IProbeListener)
	def removeProbeReleaseListener(IProbeReleaseListener)
	def setValue(T)
	def sync(boolean, boolean)
}
```


The functions are:
* `getName`: Reply the name of the probe, that is constant.
* `getUri`: Reply the URI of the observed object.
* `getValue` : Reply the observed value.
* `getType` : Reply the type of the observed value.
* `sync`: Force the synchronization of the observed value.
* `release`: Release any resource associated to the probe.
* `isActive`: Reply if this probe is active. When a probe is active, it could be synchronized to the observed object.
* `isInvalid`: Reply if this probe is invalid. When a probe is invalid, the value replied by `getValue` may not corresponds to the observed element's value.

The following function is provided for convenience, but it should be used with caution:
* `setValue`: Force the observed field to have a specific value (brokes the agent's autonomy)

### 2.3. Observe the Probe

The observer software design pattern that enables to be notified when the observed value changed in implemented into the probe.
According to the standard implementation best practices of the Java programming language, an observer (in this design pattern)
is named a listener, and it is defined by an interface. Two types of observers are defined on probes: `IProbeListener`
and `IProbeReleaseListener`.

`IProbeListener` is defined as:

```sarl
interface IProbeListener {
	def probeValueChanged(Probe<Object>, boolean)
}
```



It corresponds to the observer on value changes.


`IProbeReleaseListener` is defined as:

```sarl
interface IProbeReleaseListener {
	def onProbeReleasedProbe(Probe<Object>)
}
```



It corresponds to the observer on the release of a probe.


The functions `addProbeListener`, `addProbeReleaseListener`, `removeProbeListener` and `removeProbeReleaseListener` enable to (un)register an event listener on the probe.


## 3. Probing Service

In order to manage and run the different probes, the SRE must implement a dedicated service: the `ProbeService`.
It is defined as:

```sarl
interface ProbeService {
	def getProbes : Collection<Probe<Object>>
	def probe(SarlName, Class<T>, String) : Probe<T> with T
	def probe(String, Class<T>, String) : Probe<T> with T
	def probe(URI, Class<T>, String) : Probe<T> with T
	def releaseAllProbes
	def sync
}
```




Creating a probe is done by calling the `probe` function. Basically, you need to specify the [name](./Naming.html) of the
observed field, the expected type of the value, and optionally the name of the probe. 

Through the probe service, you could force the synchronization of all the managed probes by calling the `sync` function.
This function forces all the probes to write the new values into the observed fields and to read the lastest values
of these fields.

Finally, two functions are provided:
* `getProbes` for retrieving the list of the managed probes
* `releaseAllProbes` releasing all the probes such that they become inactive.

To use the probe service, you have to get it from the SRE, as illustrated below:

```sarl
var bootstrap = SRE::getBootstrap
var probeService = bootstrap.getService(typeof(ProbeService))
```



Then, an probe is attached to the field named `emergency` of type `Integer` that is defined within the agent `a7fbd4cc-9e1a-48c3-8ee8-3a7974ccb05c`.
The name `My Probe` is given to the probe. 
The example loops for displaying the observed value (of course it is not the most efficient usage of a probe).

```sarl
var probe = probeService.probe("agent:a7fbd4cc-9e1a-48c3-8ee8-3a7974ccb05c#emergency", typeof(Integer), "My Probe")
```



Then, you could use the value that is extracted by the probe. The example below loops for displaying the observed
value (of course it is not the most efficient usage of a probe).

```sarl
while (true) {
	println("Probe: " + probe.value)
}
```



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
