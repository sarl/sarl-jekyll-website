---
title: "Event Creation with a Builder"
layout: default
---

# Event Creation with a Builder


<ul class="page_outline" id="page_outline">

<li><a href="#1-definition-of-the-event">1. Definition of the event</a></li>
<li><a href="#2-definition-of-the-event-builder">2. Definition of the event builder</a></li>
<li><a href="#3-use-of-the-event-builder">3. Use of the event builder</a></li>
<li><a href="#4-legal-notice">4. Legal Notice</a></li>

</ul>


This document describes the basics of the creation of events with a builder.
In some cases, each event must have a unique identifier.
But because static fields are not allowed in the event definitions,
it is impossible to store the next available event ID in a static field.
The best way for creating events with unique identifiers is to apply the
[builder design pattern](https://en.wikipedia.org/wiki/Software_design_pattern).  

The elements that are explained in this document are:

* the definition of an event;
* the definition of an event builder;
* the use of the event builder.


## 1. Definition of the event

The purpose of this document is to create an event, which has a unique identifier.
This identifier is an integer number that should be incremented each time an
event instance is created.

The definition of the event should define the event with a read-only identifier (`val`).
Because the identifier is a value, it must be initialize in the constructor of the event.
Consequently, a constructor is defined with the identifier value as parameter.

```sarl
event MyEvent {
	val id : long
	new (id : long) {
		this.id = id
	}
}
```



## 2. Definition of the event builder

For creating the event instances, we apply the
[builder design pattern](https://en.wikipedia.org/wiki/Software_design_pattern)

A builder is a class that is able to create an instance of the event when it is invoked.
The next available unique identifier for the events is stored into a field of the builder (`id`).

```sarl
class MyEventBuilder {
	private var id : long = 0
	def newInstance : MyEvent {
		val eventId = id
		id++
		return new MyEvent(eventId)
	}
}
```


The function `newInstance` is defined for creating an instance of the event. This function
gets the next available global identifier to give it to the event instance, and it increments
the next available global identifier for the next call to `newInstance`.
Finally, the `newInstance` function create the event instance with the appropriate identifier. 


## 3. Use of the event builder

For using the event builder, you have simply to create an instance of the `MyEventBuilderUser`
class, and use it as follow (two events are created in the example):

```sarl
val builder = new MyEventBuilder
var event1 = builder.newInstance
var event2 = builder.newInstance
```




## 4. Legal Notice

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.11
* Status: Draft Release
* Release: 2020-03-25

> Copyright &copy; 2014-2020 [the original authors or authors](http://www.sarl.io/about/index.html).
>
> Licensed under the Apache License, Version 2.0;
> you may not use this file except in compliance with the License.
> You may obtain a copy of the [License](http://www.apache.org/licenses/LICENSE-2.0).
>
> You are free to reproduce the content of this page on copyleft websites such as Wikipedia.

<small>Generated with the translator io.sarl.maven.docs.generator 0.11.0-SNAPSHOT.</small>