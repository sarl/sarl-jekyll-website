---
title: "Run SARL Agent from the Command Line"
layout: default
---

# Run SARL Agent from the Command Line


<ul class="page_outline" id="page_outline">

<li><a href="#1-use-the-janus-command-line-tool">1. Use the janus command-line tool</a></li>
<ul>
  <li><a href="#1-1-download-the-janus-command-line-tool">1.1. Download the janus command-line tool</a></li>
  <li><a href="#1-2-launching-the-agent">1.2. Launching the agent</a></li>
</ul>
<li><a href="#2-use-the-standard-java-method">2. Use the standard java method</a></li>
<ul>
  <li><a href="#2-1-boot-of-janus">2.1. Boot of Janus</a></li>
  <li><a href="#2-2-specify-the-agent-to-launch">2.2. Specify the Agent to Launch</a></li>
  <li><a href="#2-3-what-is-app-jar">2.3. What is app.jar?</a></li>
  <li><a href="#2-4-janus-command-line-options">2.4. Janus Command Line Options</a></li>
</ul>
<li><a href="#3-use-maven-executionplugin">3. Use Maven ExecutionPlugin</a></li>
<ul>
  <li><a href="#3-1-boot-of-janus">3.1. Boot of Janus</a></li>
  <li><a href="#3-2-specify-the-agent-to-launch">3.2. Specify the Agent to Launch</a></li>
  <li><a href="#3-3-janus-command-line-options">3.3. Janus Command Line Options</a></li>
</ul>
<li><a href="#4-what-s-next">4. What's next?</a></li>
<li><a href="#5-legal-notice">5. Legal Notice</a></li>

</ul>


For running an agent, you must launch this agent on the runtime environment.
This document explains how to launch an agent on the
[Janus platform](http://www.janusproject.io) from the command line.

Three methods could be used for launching an agent with Janus:

* [Using the provided janus command-line tool](#use_the_janus_command-line_tool);
* [Using the standard java method](#use_the_standard_java_method);
* [Using Maven execution plugin](#use_maven_execution_plugin).



##1. Use the janus command-line tool

The SARL project provides a [command-line tool for launching agents](../tools/Janus.html) on the Janus runtime environment.


###1.1. Download the janus command-line tool

You could download this command line tool, named "janus" on the [downloading page of SARL](http://www.sarl.io/download/index.html).

###1.2. Launching the agent

For launching an agent, you must launch the command-line tool with the fully-qualified
name of the agent as parameter, `myapp.MyAgent` in the following example.


	janus myapp.MyAgent


The janus command-line tool provides options that will enable you to tune the launching configuration:


	janus --help


##2. Use the standard java method

###2.1. Boot of Janus

The Janus platform provides a `Boot` class. For launching the platform, you must execute this
boot class in a Java Virtual Machine.

The typical command line is:


	java -cp app.jar io.janusproject.Boot



The option `-cp` specifies the Jar file that contains
the compiled classes. The given `app.jar` file is a Jar file that is containing the Janus
platform, the SARL libraries, and the application classes.
The last argument is the fully qualified name of the booting class of Janus: `io.janusproject.Boot`


###2.2. Specify the Agent to Launch

The example given in the previous section causes an error. Indeed, it is mandatory to
specify the fully qualified name of the agent to launch:


	java -cp app.jar io.janusproject.Boot myapp.MyAgent


<veryimportant>The Janus platform allows to start only one agent from the command line.
If you want to start a collection of agents, you must select one of the following approaches:

* launch a separate Janus platform instance for each agent, or
* launch an agent that is spawning the other agents.
</veryimportant> 


###2.3. What is app.jar?

In the previous section, we assume that all the application binary files are
contained into the `app.jar` file.

You may replace the `app.jar` in the previous command lines by the classpath
that is containing all the jar files required for running your application, including
the Janus jar file(s):


	java -cp /path/to/myapplication.jar:/path/to/io.janusproject.kernel-<version>-with-dependencies.jar io.janusproject.Boot myapp.MyAgent

The `io.janusproject.kernel-<version>-with-dependencies.jar` file may be dowloaded from the [Janus website](http://www.janusproject.io/)

You may also create the `app.jar` file with Maven by using the assembly plugin for creating a jar file with all the dependencies inside.


###2.4. Janus Command Line Options

The Janus platform provides a collection of command line options.
For obtaining the list of these options, you should type:


	java -cp app.jar io.janusproject.Boot --help


##3. Use Maven ExecutionPlugin

Maven provides a plugin for launching an application after automatically building
the application's classpath. This plugin may be used for launching an agent.

###3.1. Boot of Janus

Based on the fact that the Janus platform provides a `Boot` class for launching itself,
you may use the Maven execution plugin for classing this booting class.

The typical command line is:


	mvn exec:java -Dexec.mainClass="io.janusproject.Boot"



The option `-Dexec.mainClass` specifies the fully qualified name of `io.janusproject.Boot`.


###3.2. Specify the Agent to Launch

The example given in the previous section causes an error.
Indeed, it is mandatory to specify the fully qualified name
of the agent to launch:


	mvn exec:java -Dexec.mainClass="io.janusproject.Boot" -Dexec.args=myapp.MyAgent



<veryimportant>The Janus platform allows to start only one agent from the command line.
If you want to start a collection of agents, you must select
one of the following approaches:

* launch a separate Janus platform instance for each agent, or
* launch an agent that is spawning the other agents.
</veryimportant> 


###3.3. Janus Command Line Options

The Janus platform provides a collection of command line options.
For obtaining the list of these options, you should type:


	mvn exec:java -Dexec.mainClass="io.janusproject.Boot" -Dexec.args=--help




##4. What's next?

In the next section, we will learn how to launch your SARL project from a Java program.

[Next>](./RunSARLAgentJava.html)


##5. Legal Notice

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.6
* Status: Stable Release
* Release: 2017-09-14

> Copyright &copy; 2014-2017 [the original authors or authors](http://www.sarl.io/about/index.html).
>
> Licensed under the Apache License, Version 2.0;
> you may not use this file except in compliance with the License.
> You may obtain a copy of the [License](http://www.apache.org/licenses/LICENSE-2.0).
>
> You are free to reproduce the content of this page on copyleft websites such as Wikipedia.

<small>Generated with the translator io.sarl.maven.docs.generator 0.6.0.</small>