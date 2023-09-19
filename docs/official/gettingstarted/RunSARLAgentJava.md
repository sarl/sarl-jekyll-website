---
title: "Run SARL Agent from a Java or SARL Program"
layout: default
---

# Run SARL Agent from a Java or SARL Program


<ul class="page_outline" id="page_outline">

<li><a href="#1-definition-of-the-sre-bootstrap">1. Definition of the SRE Bootstrap</a></li>
<li><a href="#2-using-the-sre-bootstrap">2. Using the SRE Bootstrap</a></li>
<li><a href="#3-direct-access-to-the-api-of-the-janus-sre">3.  Direct Access to the API of the Janus SRE</a></li>
<li><a href="#4-what-s-next">4. What's next?</a></li>
<li><a href="#5-legal-notice">5. Legal Notice</a></li>

</ul>


For running an agent, you must launch this agent on the runtime environment.
This document explains how to launch an agent on any SARL Run-time Environment (SRE)
from a Java program or SARL class.

The default SRE is the [Janus platform](http://www.janusproject.io). 


## 1. Definition of the SRE Bootstrap

In the SARL API, a bootstrap definition is provided.
It represents an access point to the SRE from any program.
This access point may be used for accessing by code the features of the underlying SRE,
independently of the concrete implementation.
In other words, the SRE Bootstrap gives access to the standard SRE functions without
forcing you to add an explicit dependency to the SRE Library, e.g. Janus, into your
application classpath.

The definition of the SARL API for using the bootstrap is detailled in the [reference page on SRE](../api/SRE.html).


## 2. Using the SRE Bootstrap

In order to help you to use the bootstrap functions, the SARL API provides a static utility type, named `SRE`.
In the following Java code, the `SRE` utility type is used for retrieving the bootstrap.
 


```java
public class MyProgram {

	public static void main(String[] arguments) {
		SREBootstrap bootstrap = SRE.getBootstrap();
	}

}
```


Then, it is possible to use the bootstrap for launching an agent. In the following example, a agent of type
`MyAgent` is launched. Please note that you must not create an instance of an agent by yourself.
It is the role of the SARL run-time environment to create this instance for you, with the proper initialization.



```java
SREBootstrap bootstrap = SRE.getBootstrap();
bootstrap.startAgent(MyAgent.class)
```


In the case you want to launch more than one agent programmatically,
you could call the `startAgent` function with the number of agent instances you need.


## 3.  Direct Access to the API of the Janus SRE

<p markdown="1"><span class="label label-danger">Caution</span> : Using the API of Janus within your program is not recommended by the SARL team, because the API of the Janus framework is considered as private and may evolve quickly. Prefer to use the Bootstrap API that is described into the previous section.</p>



The Janus platform provides a `Boot` class. For launching the platform, you must use this boot class.

The `Boot` class provides the `startAgent` function, which permits to launch Janus programmatically.


Let consider you want to launch your agent, defined in the `MyAgent` class.
The following SARL code gives you an example of how to launch this agent in Janus.

The first parameter of the `startAgent` function is the Java type of the agent
to launch.

The second parameter of the `startAgent` function is the list of parameters to
pass with the `Initialize` event to the launched agent.



<p markdown="1"><span class="label label-danger">Very Important Note</span> The Janus platform enables to launch a single agent at start-up. If you want to launch more agents, please read the next section.</p>



```java
import io.sarl.sre.boot.Boot;
import myprogram.MyAgent;
public class MyProgram {
 	public static void main(String[] args) {
		Boot.createMainObject.startAgent(MyAgent.class, args);
	}
}
```


In  the case you want to launch more than one agent programmatically,
you could use the `SreMain` instance provided by Janus.
This instance is replied by the `getKernel` function of the `Boot` class.




## 4. What's next?

Now, you are ready for developing agents with the SARL language.
Please read the rest of the documentation for obtaining more details.

[Next>](../index.html)


## 5. Legal Notice

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
