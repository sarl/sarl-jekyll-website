---
title: "Run SARL Agent from a Java Program"
layout: default
---

# Run SARL Agent from a Java Program


<ul class="page_outline" id="page_outline">

<li><a href="#1-boot-of-janus">1. Boot of Janus</a></li>
<li><a href="#2-launching-more-agents-programmatically-with-janus">2. Launching more agents programmatically with Janus</a></li>
<li><a href="#3-what-s-next">3. What's next?</a></li>
<li><a href="#4-legal-notice">4. Legal Notice</a></li>

</ul>


For running an agent, you must launch this agent on the runtime environment.
This document explains how to launch an agent on the
[Janus platform](http://www.janusproject.io) from a Java program.


##1. Boot of Janus

The Janus platform provides a `Boot` class. For launching the platform, you must use this boot class.

The `Boot` class provides the `startJanus` function, which permits to launch Janus programmatically.


Let consider you want to launch your agent, defined in the `MyAgent` class.
The following SARL code gives you an example of how to launch this agent in Janus.

The first parameter of the `startJanus` function is the Java type of the agent
to launch.

The second parameter of the `startJanus` function is the list of parameters to
pass with the `Initialize` event to the launched agent.



<importantnode>The Janus platform enables to launch a single agent at start-up.
If you want to launch more agents, please read the next section.</importantnote>

```sarl
import io.janusproject.Boot
import myprogram.MyAgent
class MyProgram {
 	static def main(args : String*) {
		Boot::startJanus(
			typeof(MyAgent),
			args)
	}
}
```



##2. Launching more agents programmatically with Janus

In  the case you want to launch more than one agent programmatically,
you could use the `Kernel` instance provided by Janus.

This instance is replied by the `startJanus` function of the `Boot` class.

The `Kernel` type provides the `spawn` functions, which permit launching
an agent programmatically.

The previous example could be updated for launching two agents of the same type.
The resulting code is shown below.

The first parameter of the `spawn` function is the Java type of the agent to launch.

The second parameter of the `spawn` function is the list of parameters to
pass with the [:initevent] event to the launched agent.

<important>that the first agent is launched by the `startJanus` function, and the 
second agent is launched by the `spawn` function.</important>


```sarl
import io.janusproject.Boot
class MyProgram {
	static def main(args : String*) {
		var janusKernel = Boot::startJanus(
			typeof(MyAgent),
			args)
		janusKernel.spawn(typeof(MyAgent), args)
	}
}
```



##3. What's next?

Now, you are ready for developing agents with the SARL language.
Please read the rest of the documentation for obtaining more details.

[Next>](../index.html)


##4. Legal Notice

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.6
* Status: Draft Release
* Release: 2017-08-21

> Copyright &copy; 2014-2017 [the original authors or authors](http://www.sarl.io/about/index.html).
>
> Licensed under the Apache License, Version 2.0;
> you may not use this file except in compliance with the License.
> You may obtain a copy of the [License](http://www.apache.org/licenses/LICENSE-2.0).
>
> You are free to reproduce the content of this page on copyleft websites such as Wikipedia.

<small>Generated with the translator io.sarl.maven.docs.generator 0.6.0-SNAPSHOT.</small>