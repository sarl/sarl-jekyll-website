---
title: "Deprecated API and Major Changes"
layout: default
---

# Deprecated API and Major Changes


<ul class="page_outline" id="page_outline">

<li><a href="#1-changes-in-the-sarl-api">1. Changes in the SARL API</a></li>
<ul>
  <li><a href="#11-since-0-15">1.1. Since 0.15</a></li>
  <li><a href="#12-since-0-13">1.2. Since 0.13</a></li>
  <li><a href="#13-since-0-12">1.3. Since 0.12</a></li>
  <li><a href="#14-since-0-11">1.4. Since 0.11</a></li>
  <li><a href="#15-since-0-10">1.5. Since 0.10</a></li>
  <li><a href="#16-since-0-5">1.6. Since 0.5</a></li>
</ul>
<li><a href="#2-changes-in-the-sarl-run-time-environment">2. Changes in the SARL Run-time Environment</a></li>
<li><a href="#3-since-0-10-janus-3-0-10-0">3. Since 0.10 (Janus 3.0.10.0)</a></li>
<li><a href="#4-version-specification">4. Version Specification</a></li>
<li><a href="#5-legal-notice">5. Legal Notice</a></li>

</ul>


This page provides the major changes into the SARL API that needs to update your source code
(deprecated API, major changes, etc.).

This page is divided into two parts: the deprecated features from the SARL API, and the deprecated features from
the SARL Run-time Environment (SRE).

## 1. Changes in the SARL API

### 1.1. Since 0.15

<table>
<thead>
<tr><th>Deprecated Type</th><th>Removal?</th><th>Replacement</th></tr>
</thead><tbody>
<tr><td>io.sarl.api.core.OpenEventSpace</td><td>Yes</td>
	<td>Replace with <code class="language-sarl">io.sarl.api.core.spaces.OpenEventSpace</code>.
	</td></tr>
<tr><td>io.sarl.api.core.OpenEventSpaceSpecification</td><td>Yes</td>
	<td>Replace with <code class="language-sarl">io.sarl.api.core.spaces.OpenEventSpaceSpecification</code>.
	</td></tr>
</tbody></table>

### 1.2. Since 0.13

<table>
<thead>
<tr><th>Deprecated Type</th><th>Deprecated Feature</th><th>Removal?</th><th>Replacement</th></tr>
</thead><tbody>
<tr><td>io.sarl.lang.util.Utils</td><td>compareVersions(String, String)</td><td>Yes</td>
	<td>Replace with <code class="language-sarl">compareMajorMinorVersions(String, String)</code>.
	</td></tr>
<tr><td>io.sarl.docs.validator.DocumentationLogger</td><td>setLogger(Logger)</td><td>Yes</td>
	<td>No replacement.
	</td></tr>
</tbody></table>


### 1.3. Since 0.12

<table>
<thead>
<tr><th>Deprecated Type or Module</th><th>Deprecated Feature</th><th>Replacement</th></tr>
</thead><tbody>


<tr><td>AbstractDocumentationMojo</td><td>getBootClassPath</td>
	<td>No replacement.
	</td></tr>



<tr><td>AbstractSARLLaunchConfiguration</td><td>getClasspath</td>
	<td>Replace <code class="language-sarl">getClasspath(...)</code> by <code class="language-sarl">getClasspathAndModulepath(...)</code>.
	</td></tr>



<tr><td>Address</td><td>getUUID</td>
	<td>Replace <code class="language-sarl">getUUID</code> by <code class="language-sarl">getID</code>.
	</td></tr>




<tr><td>Module io.sarl.eclipse-slf4j</td><td>all</td>
	<td>No replacement.
	</td></tr>



<tr><td>OpenEventSpace</td><td>register</td>
	<td>Replace <code class="language-sarl">register(listener, true)</code> by <code class="language-sarl">registerWeakParticipant(listener)</code>, and <code class="language-sarl">register(listener, false)</code> by <code class="language-sarl">registerStrongParticipant(listener)</code>.
	</td></tr>





<tr><td>ReflectExtensions</td><td>getDefaultNameFormatter</td>
	<td>Replace <code class="language-sarl">getDefaultNameFormatter</code> by <code class="language-sarl">getDefaultMethodNameFormatter</code>.
	</td></tr>
<tr><td>ReflectExtensions</td><td>setDefaultNameFormatter</td>
	<td>Replace <code class="language-sarl">setDefaultNameFormatter</code> by <code class="language-sarl">setDefaultMethodNameFormatter</code>.
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

### 1.4. Since 0.11

<table>
<thead>
<tr><th>Deprecated Type</th><th>Deprecated Feature</th><th>Replacement</th></tr>
</thead><tbody>
<tr><td>DefaultContextInteractions</td><td>willReceive</td>
	<td>Replace <code class="language-sarl">receiver.willReceive(new MyEvent)</code> by <code class="language-sarl">emit(new MyEvent) [it.ID == receiver]</code>.
	The number of functions in the API should be limited. This function is assumed to be redundant with <code class="language-sarl">emit</code>.
	</td></tr>




<tr><td>Lifecycle</td><td>return type of <code class="language-sarl">spawn</code></td>
	<td>In SRE 2.x, we could spawn an agent and get their assigned UUID code via the spawn method
	the <code class="language-sarl">Lifecycle</code> capacity, e.g.:
<pre><code class="language-sarl">val agent_UUID = spawn(typeof(MyAgent))
</code></pre>
	Because of problems and inconsistencies caused by the parallel execution of the <code class="language-sarl">spawn</code> function,
	the return value of this method has been deprecated. The <code class="language-sarl">spawn</code> function replies nothing since version
	0.11 of the API.
	To spawn an agent and grab its UUID code, we first generate the identifier and then spawn the agent with it:
```sarl
val agent_UUID = UUID::randomUUID
spawnInContextWithID(typeof(MyAgent), agent_UUID, defaultContext)
```

	(<code class="language-sarl">defaultContext</code> is the short for <code class="language-sarl">getDefaultContext</code> provided by <code class="language-sarl">DefaultContextInteractions</code>)
	<br>
	or, with the version 0.12 of the API:
```sarl
val agent_UUID = UUID::randomUUID
spawnWithID(typeof(MyAgent), agent_UUID)
```

	</td></tr>


<tr><td>OpenEventSpace</td><td>register</td>
	<td>Replace <code class="language-sarl">space.register(participant, isWeak)</code> by <code class="language-sarl">registerStrongParticipant(participant)</code>
	if <code class="language-sarl">isWeak</code> is true, or <code class="language-sarl">registerWeakParticipant(participant)</code> if <code class="language-sarl">isWeak</code> is false. This change
	is applied by internal design on the space implementation.
	</td></tr>



</tbody></table>


### 1.5. Since 0.10

<table>
<thead>
<tr><th>Deprecated Type</th><th>Deprecated Feature</th><th>Removal Version</th><th>Replacement</th></tr>
</thead><tbody>
<tr><td>DefaultContextInteractions</td><td>spawn</td><td></td>
	<td>Replace <code class="language-sarl">spawn(type, args)</code> by <code class="language-sarl">Lifecycle.spawn(type, args)</code>.
	The definition of the <code class="language-sarl">spawn</code> into <code class="language-sarl">DefaultContextInteractions</code> is not expected by SARL
	users since this capacity seems to be
	dedicated to interactions. <code class="language-sarl">Lifecycle</code> capacity is a better place for defining the <code class="language-sarl">spawn</code>
	functions.



</td></tr>

<tr><td>Logging</td><td>println</td><td></td>
	<td>Replace <code class="language-sarl">println(msg)</code> by <code class="language-sarl">info(msg)</code>. The semantic of <code class="language-sarl">println</code> is linked to the system console.
	Agents are supposed to log their messages on the agent console.



</td></tr>

<tr><td>SarlSpecificationChecker</td><td>getSarlSpecificationVersion</td><td></td>
<td>Replaced by <code class="language-sarl">getSarlSpecificationVersionObject</code>. Change due to the change of the return type that is now of type <code class="language-sarl">Version</code>.



</td></tr>

</tbody></table>



### 1.6. Since 0.5

<table>
<thead>
<tr><th>Deprecated Type</th><th>Deprecated Feature</th><th>Removal Version</th><th>Replacement</th></tr>
</thead><tbody>
<tr><td>DefaultContextInteractions</td><td>receive</td><td>0.10</td>
	<td>Replace <code class="language-sarl">receiver.receive(new Event)</code> by <code class="language-sarl">emit(new Event) [it.ID == receiver]</code>. The number of
	functions in the API should be limited. This function is assumed to be redundant with <code class="language-sarl">emit</code>.
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
	<code class="language-sarl">Boot.offline = false</code>) or remove it from the classpath (equivalent to <code class="language-sarl">Boot.offline = true</code>), or
	even add another networking plugin that is based on another technology (e.g. MQTT, etc.).
	So, <code class="language-sarl">Boot.offline</code> function is not any more into the Janus kernel (i.e. the Boot class, see below)
	but into the configuration of the networking plugin. This plugin is under validation and is planned
	to be back in SARL 0.12.
	</td></tr>
<tr><td>Boot</td><td>setVerboseLevel(level)</td><td>0.10</td>
	<td>This function is removed from <code class="language-sarl">Boot</code>. The <code class="language-sarl">SRE</code> utility class provides the replacing function.
	Note that it must be called before any launch of agent since the configuration level of Janus is set at start up.



	</td></tr>
<tr><td>Boot</td><td>startJanus(type)</td><td>0.10</td>
	<td>In the old SRE 2.x, one would start an agent from Java by directly using the <code class="language-sarl">Boot</code>
	class in Janus:
<pre><code class="language-sarl">import io.janusproject.Boot
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


## 4. Version Specification

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.15
* Status: Stable Release
* Release: 2025-09-11

## 5. Legal Notice

> Copyright &copy; 2014-2025 [SARL.io, the Original Authors and Main Authors](http://www.sarl.io/about/index.html).
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

<small>Generated with the translator docs.generator 0.15.1.</small>
