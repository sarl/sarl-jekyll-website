---
title: "Programmatic Access to the SARL Run-time Environment"
layout: default
---

# Programmatic Access to the SARL Run-time Environment


<ul class="page_outline" id="page_outline">

<li><a href="#1-definition-of-the-sre-bootstrap">1. Definition of the SRE Bootstrap</a></li>
<li><a href="#2-static-access-to-the-bootstrap-the-sre-class">2. Static Access to the Bootstrap: the SRE class</a></li>
<li><a href="#3-description-of-the-sre-bootstrap-features">3. Description of the SRE Bootstrap features</a></li>
<ul>
  <li><a href="#31-starting-the-sre-programmatically">3.1. Starting the SRE Programmatically</a></li>
  <li><a href="#32-activity-access-functions">3.2. Activity Access Functions</a></li>
  <li><a href="#33-stopping-the-sre-programmatically">3.3. Stopping the SRE Programmatically</a></li>
  <li><a href="#34-configuration-functions">3.4. Configuration Functions</a></li>
  <li><a href="#35-sre-logging-system">3.5. SRE Logging System</a></li>
  <li><a href="#36-access-to-the-sre-services">3.6. Access to the SRE Services</a></li>
  <li><a href="#37-observe-the-sre-events">3.7. Observe the SRE events</a></li>
</ul>
<li><a href="#4-legal-notice">4. Legal Notice</a></li>

</ul>


For running an agent, you must launch this agent on the runtime environment.
This run-time environment is named the SARL Run-time Environment (SRE).
The default SRE is the [Janus platform](http://www.janusproject.io). 


## 1. Definition of the SRE Bootstrap

In the SARL API, a bootstrap definition is provided.
It represents an access point to the SRE from any SARL or Java program.
This access point may be used for accessing by code the features of the underlying SRE,
independently of the concrete implementation.
In other words, the SRE Bootstrap gives access to the standard SRE functions without
forcing you to add an explicit dependency to the SRE Library, e.g. Janus, into your
application classpath.

The SARL API defines the SRE bootstrap as:

```sarl
interface SREBootstrap {
	def addSREListener(SREListener)
	def getKernelLogger : Logger
	def getService(Class<T>) : T with T
	def getUniverseContextUUID : UUID
	def getUniverseSpaceUUID : UUID
	def isActive : boolean
	def isRunning : boolean
	def removeSREListener(SREListener)
	def setBootAgentTypeContextUUID
	def setRandomContextUUID
	def setSpecificContextUUID
	def setUniverseContextUUID(UUID)
	def setUniverseSpaceUUID(UUID)
	def setVerboseLevel(int)
	def shutdown
	def shutdown(boolean)
	def shutdown(int)
	def startAgent(Class<Agent>, Object[])
	def startAgent(int, Class<Agent>, Object[])
	def startAgentWithID(Class<Agent>, UUID, Object[])
	def startWithoutAgent : AgentContext
}
```



A run-time environment, such as [Janus](http://www.janusproject.io) must provide an implementation of this bootstrap interface.
In order to find this implementation, the [standard Java service management feature](https://docs.oracle.com/javase/8/docs/api/java/util/ServiceLoader.html)
is used. In other words, the SRE should declare a service implementation for
`io.sarl.bootstrap.SREBootstrap` into its `META-INF/services/io.sarl.bootstrap.SREBootstrap` file (for Java 8) or in its service declaration into the module definition (for Java 9 and above):


		module mymodule {
			provides io.sarl.bootstrap.SREBootstrap with mypackage.MyServiceImplementation
		}


## 2. Static Access to the Bootstrap: the SRE class

In order to help you to use the bootstrap functions, the SARL API provides a static utility, named `SRE`.
In the following SARL code (it may be Java or Groovy code), the `SRE` utility type is used for retrieving the bootstrap.
 
```sarl
static def main(arguments : String*) {
	var bootstrap = SRE::getBootstrap
}
```



Then, it is possible to use the `bootstrap` variable for launching an agent or accessing to any of the SRE
features that is detailed below.
In the following example, a agent of type `MyAgent` is launched. Please note that you cannot not create an instance of an agent by yourself.
It is the role of the SRE to create this instance for you, with the proper initialization.

```sarl
static def main(arguments : String*) {
	var bootstrap = SRE::getBootstrap
	bootstrap.startAgent(typeof(MyAgent))
}
```



In the case you want to launch more than one agent programmatically,
you could call the `startAgent` function with the number of agent instances you need.


## 3. Description of the SRE Bootstrap features

This section describes the major features of the SRE bootstrap.

### 3.1. Starting the SRE Programmatically

In order to run agents, you must start the SRE before launching an agent inside.
There is two major methods for starting the SRE: without or with agent(s).
The first method could be used to launch an empty SRE that is waiting for the launch of a first agent that may occur later in time.
The second version is the standard launching method.

#### Start without agent

For starting the SRE without agent, you have to invoke `startWithoutAgent`:

```sarl
var bootstrap = SRE::getBootstrap
var context = bootstrap.startWithoutAgent
```


The `startWithoutAgent` function takes no argument and returns the root context that is created by the SRE.


#### Start with agent

For launching the SRE with an instance of agent, you have to use one of the `startAgent` and `startAgentWithID` functions.
Both of them are launching an agent of a given type. For example, the following code starts the agent of type `MyAgent`.

```sarl
var bootstrap = SRE::getBootstrap
bootstrap.startAgent(typeof(MyAgent))
```


In the case you would like to create multiple instances of agents of a given type, you could specify the number as first argument of `startAgent`.
In the following example, 5 agents are launched into the SRE.

```sarl
var bootstrap = SRE::getBootstrap
bootstrap.startAgent(5, typeof(MyAgent))
```


It may be useful to give some values to the agent when it is launched. These values are named the initialization arguments for the agent(s).
You could pass a list of values to the launched agent by typing these values at the end of the arguments of the `startAgent` function.
In the following example, two initialization arguments are passed. The first is the string of characters `"arg1"`; and the second is the double
precision floating point number `4.5`.

```sarl
var bootstrap = SRE::getBootstrap
bootstrap.startAgent(typeof(MyAgent), "arg1", 4.5)
```


The initialization arguments are received by the launched agent(s) into the `Initialize`, and more precisely into the field
`parameters` of this event.
In the following example, the agent of type `MyAgent` has an handler on the `Initialize` event in which two initialization arguments
are retrieved:

```sarl
agent MyAgent {
	on Initialize {
		var arg1 = occurrence.parameters.get(0) as String
		var arg0 = occurrence.parameters.get(1) as Double
	}

}
```


In some cases, you would like that the launched agent instance having a specific identifier, and not any more a randomly generated identifier.
You could invoke the `startAgentWithID` function for launching the agent with the identifier that your have choosen.
This function enables to pass initialization arguments to the launched agent.
 
```sarl
var theIdentifier : UUID = computeOrGetTheAgentIdentifier()
var bootstrap = SRE::getBootstrap
bootstrap.startAgentWithID(typeof(MyAgent), theIdentifier)
```



### 3.2. Activity Access Functions

Two functions are provided to determine if the SRE is running or not:
* `isRunning`: replies a boolean value that indicates if the kernel is running (`true`) or not (`false`).
* `isActive`: replies a boolean value that indicates if the kernel accepts launchs of agents (`true`) or not (`false`).




### 3.3. Stopping the SRE Programmatically

Stopping the SRE programmatically is possible, even if it is not the best way according the SARL developers' best practices.
Indeed, it is always preferable to let the SRE stops itself when no more agent is running inside.
Stopping the SRE programmatically forces the agents to be stopped whatever their internal states.
All the behaviors that were launched by the agents are also stopped.

The function `shutdown` is provided to stop the SRE. By default, this function is blocking, i.e., it is returning when
the SRE is stopping. The following code shows you the start and stop of the SRE.

```sarl
var bootstrap = SRE::getBootstrap
bootstrap.startAgent(5, typeof(MyAgent))
bootstrap.shutdown
```


If you need the function `shutdown` to be not blocking, you could invoke the `shutdown` with a timeout delay (in milliseconds).
When this delay is reached, the `shutdown` forces the stop of the SRE (even if an agent is not yet fully destroyed) and returns.
In the following example, we are waiting 15 seconds for stopping the SRE.

```sarl
var bootstrap = SRE::getBootstrap
bootstrap.startAgent(5, typeof(MyAgent))
bootstrap.shutdown(1500)
```


If the provided timeout value is strictly positive, it is the number of milliseconds to wait for the termination of the shutdown.
If the provided timeout value is equal to `0`, the function returns as soon as the shutdown process is launch
(no waiting for the termination of the shutdown). If the timeout value is strictly negative, the function waits forever for the
termination of the shutdown process.


### 3.4. Configuration Functions

**Prior to the first launch of an agent**, it is possible to change programmatically several elements of the SRE configuration.
The following functions are provided on the SRE bootstrap to change the SRE configuration.

* `setRandomContextUUID` forces the SRE to use a random identifier for its default context.
* `setBootAgentTypeContextUUID` forces the SRE to use a default context identifier that is build upon the class name of the first launched agent, i.e. the UUID is always the same for a given class name.
* `setSpecificContextUUID` forces the SRE to use the identifier hard-coded in the source code for its default context. This identifier was chosen by the SRE creators and it is constant.
* `setUniverseContextUUID` forces the identifier of the SRE's default context. This function takes one argument value of type `UUID`. You could retrieved the identifier by calling `getUniverseContextUUID`.
* `setUniverseSpaceUUID` forces the identifier of the default space of the SRE's default context. This function takes one argument value of type `UUID`. You could retrieved the identifier by calling `getUniverseSpaceUUID`.





### 3.5. SRE Logging System

The SRE should have a logging system in order to provide to you information, warning and error messages.
You could have access to the SRE logger by calling the `getKernelLogger`. If this function returns `null`,
it means that the SRE was not launched.

```sarl
var bootstrap = SRE::getBootstrap
var logger : Logger = bootstrap.getKernelLogger
logger.info("my message")
```


You could control in a generic way the verbose level of the kernel logger by calling the function
`setVerboseLevel`.

```sarl
var bootstrap = SRE::getBootstrap
bootstrap.setVerboseLevel(2)
```


This function takes an integer argument that specifies the requested level of verbose of the logger:

| Verbose Level | Description                                                                |
| ------------- | -------------------------------------------------------------------------- |
| <= 0          | Off, no logging                                                            |
| 1             | Error messages only                                                        |
| 2             | Errors and warning messages                                                |
| 3             | Error, warning and information messages                                    |
| 4             | Error, warning, information and major debugging messages                   |
| 5             | Error, warning, information and major+intermediate debugging messages      |
| 6             | Error, warning, information and major+intermediate+fine debugging messages |
| >= 7          | All messages                                                               |


### 3.6. Access to the SRE Services

The SRE may provide specific service implementation (naming, namespace, communication, etc.).
In order to enable you to have access to the SRE services, the SRE bootstrap provides the
function `getService`.
It takes an argument that is the type of the service to search for.
And, it returns the instance of the service if it is defined into the underlying SRE.
If the service type is not supported by the SRE, the `null` value is returned. 

In the following example, a service of type `MyService` is declared.

```sarl
interface MyService {
	def use() : void
}
```


Assuming that the SRE is implementing this service, you could get the service's instance and use it as illustrated below:

```sarl
var bootstrap = SRE::getBootstrap
bootstrap.startWithoutAgent
var serv = bootstrap.getService(typeof(MyService))
serv.use
```


The rest of the SARL's API documentation provides description of specific services, e.g. the [naming service](./Naming.html).

### 3.7. Observe the SRE events

Observer design pattern is common in software engineering and development. It enables to be notified when some events occur into the target system.
By default the SRE implements this design pattern on specific events:

* SRE started
* SRE stopped 

The SARL API assumes an implementation of the observer design pattern that follows the Java programming standard:
1. The observer is represented by an interface that is named the "listener".
2. For each type of event, a function is declared into the listener interface.
3. The observed object provides functions for registering and unregistering the listeners.
4. The observed object invokes the right function of the listener interface when the event occured. 

According to these general principles, the listener for the SRE events is defined as:

```sarl
interface SREListener {
	def sreStarted(SREBootstrap)
	def sreStopped(SREBootstrap)
}
```


Both declared functions takes the SRE bootstrap as parameter.

The SRE bootstrap provides the registration function `addSREListener` and the unregistration function `removeSREListener`.

The typical usage of this listening framework is illustrated by the code below.
First an implementation of listener is written. Basically, this implementation output on the program console messages that indicate the SRE start and stop.

```sarl
class MyListener implements SREListener {
	override sreStarted(bs : SREBootstrap) {
		System::out.println("The SRE was started");
	}
	override sreStopped(bs : SREBootstrap) {
		System::out.println("The SRE was stopped");
	}
}
```


Then, you could register the listener on the SRE as illustrated below:

```sarl
var listener = new MyListener

var bootstrap = SRE::getBootstrap

bootstrap.addSREListener(listener)

bootstrap.startWithoutAgent
```


Please note that if you register the listener before the start of the SRE, the listener will be notified of the SRE start.
But, if you register the listener when the SRE is already launched, when the SRE start event will not be notified.


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