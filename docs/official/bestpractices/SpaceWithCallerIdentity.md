---
title: "Creating Space with Operation User Accessibility"
layout: default
---

# Creating Space with Operation User Accessibility 


<ul class="page_outline" id="page_outline">

<li><a href="#1-capacity-definition">1. Capacity Definition</a></li>
<li><a href="#2-space-definition">2. Space Definition</a></li>
<li><a href="#3-skill-definition">3. Skill Definition</a></li>
<li><a href="#4-accessing-to-the-function-caller-instance">4. Accessing to the function caller instance</a></li>
<li><a href="#5-legal-notice">5. Legal Notice</a></li>

</ul>


This document describes the basics of the writing of a space that is able to have the identity of
the caller of a space's function.

The concept is inspired by the Agents & Artifacts metamodel implemented by the [CArtAgO project](http://cartago.sourceforge.net/).
In this approach, artifacts have operations, properties an can trigger events. In addition, artifact implementations can
identify their operation callers in order to prevent agents to manipulate the artifact using someone else's identity.

The idea using a space is very similar: agents "register" in the space in order to receive its events, but cannot emit any,
and can invoke space operations like an artifact.
The question was regarding the identity parameter, since CArtAgO allows to determine the caller implicitly.

In this document, a space is defined with caller identity as parameter. An a capacity/skill is defined for invoking
the operation on the space.


## 1. Capacity Definition

The first step is the [definition of a capacity](../reference/Capacity.html) that enables an agent to access to
the operations of the space.

In the following example, the `MyCapacity` capacity is defined with the `functionAccessibleToTheAgent` function. 

```sarl
capacity MyCapacity {

	def functionAccessibleToTheAgent(parameter : Object)

}
```



## 2. Space Definition

Currently, the definition of a space into SARL with specific keywords is not yet supported.
You must define a space with the definition of a class that extends the `Space` type.
In the following example, the `MySpace` space is declared:

```sarl
class MySpace implements Space {

	val id : SpaceID
	new (id : SpaceID) {
		this.id = id
	}
    def getSpaceID : SpaceID {
    	this.id
    }
    def getParticipants : ConcurrentSkipListSet<UUID> {
    	null
    }
}
```


The `functionAccessibleToTheAgent` function, initially defined into the `MyCapacity` capacity must be defined into the
`MySpace` space. But for enabling the space to have the identity of the function caller, the identity
must be given as formal parameter, in addition to the already defined parameters.
Back to the example, the code becomes:

```sarl
class MySpace implements Space {

	def functionAccessibleToTheAgent(callerIdentity : UUID, parameter : Object) {
		// Do something
	}
	val id : SpaceID
	new (id : SpaceID) {
		this.id = id
	}
    def getSpaceID : SpaceID {
    	this.id
    }
    def getParticipants : ConcurrentSkipListSet<UUID> {
    	null
    }
}
```


In order to enable the creation of an instance of MySpace, a space specification must be defined:

```sarl
class MySpaceSpecification implements SpaceSpecification<MySpace> {
	def create(id : SpaceID, params : Object*) : MySpace {
		new MySpace(id)
	}
}
```




## 3. Skill Definition

In order to do a bridge between the defined capacity and the space, a skill must be defined.
The main role of this skill is to determine the identity of the operation's caller for giving
it to the space.
Back to the example, the code for the skill is:

```sarl
skill MySkill implements MyCapacity {
	var ^space : MySpace
	def functionAccessibleToTheAgent(parameter : Object) {
		this.^space.functionAccessibleToTheAgent(this.owner.ID, parameter)
	}
}
```


In the previous code, the reference to the space is put into a skill's field, named `^space`.
This field is not initialized in the previous example. You could initialize it into the installation function of
the skill : `def install() : void`

The definition of the functionAccessibleToTheAgent name is based on the delegation design pattern : the skill calls the similar space's function.
The difference is that the skill's call include the identifier of the function's caller, i.e. the agent's identifier.


## 4. Accessing to the function caller instance

Sometimes, it is useful to obtain the instance of the object, which has called the skill's function.
The caller may be the agent itself or one of its behaviors.
The definition of the abstract type `Skill` includes the `getCaller` function:



Into the skill's functions, you could use this function for obtaining the skill function's caller.
This function replies the behavior instance, which has called the function, or `ǹull` if the caller
is the agent.

Back to the previous example, let's change the type of caller identity from `UUID` to `Object` in order
to give the instance of the caller to the space. The code of the skill becomes:

```sarl
skill MySkill implements MyCapacity {

	var ^space : MySpace

	def functionAccessibleToTheAgent(parameter : Object) {
		var theCaller = getCaller ?: this.owner
		this.^space.functionAccessibleToTheAgent(theCaller, parameter)
	}
}
```




## 5. Legal Notice

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.12
* Status: Draft Release
* Release: 2020-06-28

> Copyright &copy; 2014-2020 [the original authors or authors](http://www.sarl.io/about/index.html).
>
> Licensed under the Apache License, Version 2.0;
> you may not use this file except in compliance with the License.
> You may obtain a copy of the [License](http://www.apache.org/licenses/LICENSE-2.0).
>
> You are free to reproduce the content of this page on copyleft websites such as Wikipedia.

<small>Generated with the translator io.sarl.maven.docs.generator 0.12.0-SNAPSHOT.</small>