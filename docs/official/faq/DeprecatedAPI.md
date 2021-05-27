---
title: "Deprecated API and Major Changes"
layout: default
---

# Deprecated API and Major Changes


<ul class="page_outline" id="page_outline">

<li><a href="#1-changes-in-the-sarl-api">1. Changes in the SARL API</a></li>
<ul>
  <li><a href="#11-since-0-12">1.1. Since 0.12</a></li>
  <li><a href="#12-since-0-11">1.2. Since 0.11</a></li>
  <li><a href="#13-since-0-10">1.3. Since 0.10</a></li>
  <li><a href="#14-since-0-5">1.4. Since 0.5</a></li>
</ul>
<li><a href="#2-changes-in-the-sarl-run-time-environment">2. Changes in the SARL Run-time Environment</a></li>
<li><a href="#3-since-0-10-janus-3-0-10-0">3. Since 0.10 (Janus 3.0.10.0)</a></li>
<li><a href="#4-legal-notice">4. Legal Notice</a></li>

</ul>


This page provides the major changes into the SARL API that needs to update your source code
(deprecated API, major changes, etc.).

This page is divided into two parts: the deprecated features from the SARL API, and the deprecated features from
the SARL Run-time Environment (SRE).

## 1. Changes in the SARL API

### 1.1. Since 0.12

<table>
<thead>
<tr><th>Deprecated Type or Module</th><th>Deprecated Feature</th><th>Replacement</th></tr>
</thead><tbody>


<tr><td>AbstractDocumentationMojo</td><td>getBootClassPath</td>
	<td>No replacement.
	</td></tr>



<tr><td>AbstractSARLLaunchConfiguration</td><td>getClasspath</td>
	<td>Replace `getClasspath(...)` by `getClasspathAndModulepath(...)`.
	</td></tr>



<tr><td>Address</td><td>getUUID</td>
	<td>Replace `getUUID` by `getID`.
	</td></tr>




<tr><td>Module io.sarl.eclipse-slf4j</td><td>all</td>
	<td>No replacement.
	</td></tr>



<tr><td>OpenEventSpace</td><td>register</td>
	<td>Replace `register(listener, true)` by `registerWeakParticipant(listener)`, and `register(listener, false)` by `registerStrongParticipant(listener)`.
	</td></tr>





<tr><td>ReflectExtensions</td><td>getDefaultNameFormatter</td>
	<td>Replace `getDefaultNameFormatter` by `getDefaultMethodNameFormatter`.
	</td></tr>
<tr><td>ReflectExtensions</td><td>setDefaultNameFormatter</td>
	<td>Replace `setDefaultNameFormatter` by `setDefaultMethodNameFormatter`.
	</td></tr>



<tr><td>SarlBatchCompiler</td><td>getJavaBootClasspath</td>
	<td>No replacement.
	</td></tr>
<tr><td>SarlBatchCompiler</td><td>setJavaBootClasspath</td>
	<td>No replacement.
	</td></tr>



<tr><td>SarlcConfig</td><td>getJavaBootClasspath</td>
	<td>No replacement.
	</td></tr>
<tr><td>SarlcConfig</td><td>setJavaBootClasspath</td>
	<td>No replacement.
	</td></tr>



<tr><td>SARLClasspathProvider</td><td>getJavaBootClasspath</td>
	<td>No replacement.
	</td></tr>
<tr><td>SARLClasspathProvider</td><td>setJavaBootClasspath</td>
	<td>No replacement.
	</td></tr>



<tr><td>ScriptExecutor</td><td>setBootClassPath</td>
	<td>No replacement.
	</td></tr>



<tr><td>SREBootstrap</td><td>setOffline</td>
	<td>No replacement.
	</td></tr>


</tbody></table>

### 1.2. Since 0.11

<table>
<thead>
<tr><th>Deprecated Type</th><th>Deprecated Feature</th><th>Replacement</th></tr>
</thead><tbody>
<tr><td>DefaultContextInteractions</td><td>willReceive</td>
	<td>Replace `receiver.willReceive(new MyEvent)` by `emit(new MyEvent) [it.ID == receiver]`.
	The number of functions in the API should be limited. This function is assumed to be redundant with `emit`.
	</td></tr>




<tr><td>Lifecycle</td><td>return type of `spawn`</td>
	<td>In SRE 2.x, we could spawn an agent and get their assigned UUID code via the spawn method
	the `Lifecycle` capacity, e.g.:
<pre><code>val agent_UUID = spawn(typeof(MyAgent))
</code></pre>
	Because of problems and inconsistencies caused by the parallel execution of the `spawn` function,
	the return value of this method has been deprecated. The `spawn` function replies nothing since version
	0.11 of the API.
	To spawn an agent and grab its UUID code, we first generate the identifier and then spawn the agent with it:
```sarl
val agent_UUID = UUID::randomUUID
spawnInContextWithID(typeof(MyAgent), agent_UUID, defaultContext)
```

	(`defaultContext` is the short for `getDefaultContext` provided by `DefaultContextInteractions`)
	<br>
	or, with the version 0.12 of the API:
```sarl
val agent_UUID = UUID::randomUUID
spawnWithID(typeof(MyAgent), agent_UUID)
```

	</td></tr>


<tr><td>OpenEventSpace</td><td>register</td>
	<td>Replace `space.register(participant, isWeak)` by `registerStrongParticipant(participant)`
	if `isWeak` is true, or `registerWeakParticipant(participant)` if `isWeak` is false. This change
	is applied by internal design on the space implementation.
	</td></tr>



</tbody></table>


### 1.3. Since 0.10

<table>
<thead>
<tr><th>Deprecated Type</th><th>Deprecated Feature</th><th>Removal Version</th><th>Replacement</th></tr>
</thead><tbody>
<tr><td>DefaultContextInteractions</td><td>spawn</td><td></td>
	<td>Replace `spawn(type, args)` by `Lifecycle.spawn(type, args)`.
	The definition of the `spawn`into `DefaultContextInteractions` is not expected by SARL
	users since this capacity seems to be
	dedicated to interactions. `Lifecycle` capacity is a better place for defining the `spawn`
	functions.



	</td></tr>
<tr><td>Logging</td><td>println</td><td></td>
	<td>Replace `println(msg)` by `info(msg)`. The semantic of `println` is linked to the system console.
	Agents are supposed to log their messages on the agent console.



	</td></tr>
<tr><td>SarlSpecificationChecker</td><td>getSarlSpecificationVersion</td><td></td>
	<td>Replaced by `getSarlSpecificationVersionObject`. Change due to the change of the return type
	that is now of type `Version`.



	</td/></tr>
</tbody></table>


### 1.4. Since 0.5

<table>
<thead>
<tr><th>Deprecated Type</th><th>Deprecated Feature</th><th>Removal Version</th><th>Replacement</th></tr>
</thead><tbody>
<tr><td>DefaultContextInteractions</td><td>receive</td><td>0.10</td>
	<td>Replace `receiver.receive(new Event)` by `emit(new Event) [it.ID == receiver]`. The number of
	functions in the API should be limited. This function is assumed to be redundant with `emit`.
	</td></tr>
</tbody></table>


## 2. Changes in the SARL Run-time Environment

## 3. Since 0.10 (Janus 3.0.10.0)

<table>
<thead>
<tr><th>Deprecated Type</th><th>Deprecated Feature</th><th>Removal Version</th><th>Replacement</th></tr>
</thead><tbody>
<tr><td>Boot</td><td>setOffline(boolean)</td><td>0.10</td>
	<td>This parameter is not any more needed in the kernel of Janus v3. Indeed, the Janus v3 kernel is now
    based on a new plugin architecture (based on the <a href="https://bootique.io/">Bootique API</a>).
	With this plugin API, we could write a core software (the kernel) with a minimum set of features and
	that could be extended with plugins by only adding these plugins on the classpath of the application.
	In the context of Janus, the network features were moved into a plugin. One could easily add the
	network feature by adding the corresponding plugin jar file in the classpath (equivalent to the old
	`Boot.offline = false`) or remove it from the classpath (equivalent to `Boot.offline = true`), or
	even add another networking plugin that is based on another technology (e.g. MQTT, etc.).
	So, `Boot.offline` function is not any more into the Janus kernel (i.e. the Boot class, see below)
	but into the configuration of the networking plugin. This plugin is under validation and is planned
	to be back in SARL 0.12.
	</td></tr>
<tr><td>Boot</td><td>setVerboseLevel(level)</td><td>0.10</td>
	<td>This function is removed from `Boot`. The `SRE` utility class provides the replacing function.
	Note that it must be called before any launch of agent since the configuration level of Janus is set at start up.



	</td></tr>
<tr><td>Boot</td><td>startJanus(type)</td><td>0.10</td>
	<td>In the old SRE 2.x, one would start an agent from Java by directly using the <code>Boot</code>
	class in Janus:
<pre><code>import io.janusproject.Boot
Boot.startJanus(typeof(MyAgent))
	</code></pre>
	In order to avoid any problems due to changes into the Janus implementation, in SRE 3.x it is preferable to use the SRE
	utility class as follows:
```sarl
var sre = SRE::bootstrap
sre.startAgent(typeof(MyAgent))
```

	</td></tr>
</tbody></table>


## 4. Legal Notice

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.12
* Status: Stable Release
* Release: 2021-05-27

> Copyright &copy; 2014-2021 [the original authors or authors](http://www.sarl.io/about/index.html).
>
> Licensed under the Apache License, Version 2.0;
> you may not use this file except in compliance with the License.
> You may obtain a copy of the [License](http://www.apache.org/licenses/LICENSE-2.0).
>
> You are free to reproduce the content of this page on copyleft websites such as Wikipedia.

<small>Generated with the translator io.sarl.maven.docs.generator 0.12.0.</small>
