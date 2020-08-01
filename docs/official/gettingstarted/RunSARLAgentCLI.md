---
title: "Run SARL Agent from the Command Line"
layout: default
---

# Run SARL Agent from the Command Line


<ul class="page_outline" id="page_outline">

<li><a href="#1-use-the-janus-command-line-tool">1. Use the Janus command-line tool</a></li>
<ul>
  <li><a href="#11-download-the-janus-command-line-tool">1.1. Download the janus command-line tool</a></li>
  <li><a href="#12-launching-the-agent">1.2. Launching the agent</a></li>
</ul>
<li><a href="#2-use-the-standard-java-method">2. Use the standard java method</a></li>
<ul>
  <li><a href="#21-boot-of-janus">2.1. Boot of Janus</a></li>
  <li><a href="#22-specify-the-agent-to-launch">2.2. Specify the Agent to Launch</a></li>
  <li><a href="#23-what-is-app-jar">2.3. What is app.jar?</a></li>
  <li><a href="#24-janus-command-line-options">2.4. Janus Command Line Options</a></li>
</ul>
<li><a href="#3-use-maven-execution-plugin">3. Use Maven Execution Plugin</a></li>
<ul>
  <li><a href="#31-boot-of-janus">3.1. Boot of Janus</a></li>
  <li><a href="#32-specify-the-agent-to-launch">3.2. Specify the Agent to Launch</a></li>
  <li><a href="#33-janus-command-line-options">3.3. Janus Command Line Options</a></li>
</ul>
<li><a href="#4-what-s-next">4. What's next?</a></li>
<li><a href="#5-legal-notice">5. Legal Notice</a></li>

</ul>


For running an agent, you must launch this agent on the runtime environment.
This document explains how to launch an agent on the
[Janus platform](http://www.janusproject.io) from the command line.

Three methods could be used for launching an agent with Janus:

* [Using the provided janus command-line tool](#1-use-the-janus-command-line-tool);
* [Using the standard java method](#2-use-the-standard-java-method);
* [Using Maven execution plugin](#3-use-maven-execution-plugin).



## 1. Use the Janus command-line tool

The SARL project provides a [command-line tool for launching agents](../tools/Janus.html) on the Janus runtime environment.


### 1.1. Download the janus command-line tool

You could download this command line tool, named "janus" on the [downloading page of SARL](http://www.sarl.io/download/index.html).

### 1.2. Launching the agent

For launching an agent, you must launch the command-line tool with the fully-qualified
name of the agent as parameter, `myapp.MyAgent` in the following example.


	janus myapp.MyAgent


The janus command-line tool provides options that will enable you to tune the launching configuration:


	janus --help


One of the command-line options that is usually mandatory is the --jar option, which enables you to specify the jar files that contains your application:


	janus --jar path/to/myapp.jar myapp.MyAgent


If the `janus` script indicates to you an error "agent not found", most of the time it is because your application's jar file is not on the class path.
The --jar option becomes mandatory for specifying the jar file.


## 2. Use the standard java method

### 2.1. Boot of Janus

The Janus platform provides a `Boot` class. For launching the platform, you must execute this
boot class in a Java Virtual Machine.

The typical command line is:


	java -cp app.jar io.sarl.sre.boot.Boot



The option `-cp` specifies the Jar file that contains
the compiled classes. The given `app.jar` file is a Jar file that is containing the Janus
platform, the SARL libraries, and the application classes.
The last argument is the fully qualified name of the booting class of Janus: `io.sarl.sre.boot.Boot`


### 2.2. Specify the Agent to Launch

The example given in the previous section causes an error. Indeed, it is mandatory to
specify the fully qualified name of the agent to launch:


	java -cp app.jar io.sarl.sre.boot.Boot myapp.MyAgent


<veryimportant>The Janus platform allows to start only one agent from the command line.
If you want to start a collection of agents, you must select one of the following approaches:

* launch a separate Janus platform instance for each agent, or
* launch an agent that is spawning the other agents.
</veryimportant> 


### 2.3. What is app.jar?

In the previous section, we assume that all the application binary files are
contained into the `app.jar` file.

You may replace the `app.jar` in the previous command lines by the classpath
that is containing all the jar files required for running your application, including
the Janus jar file(s):


	java -cp /path/to/myapplication.jar:/path/to/io.janusproject.kernel-<version>-with-dependencies.jar io.sarl.sre.boot.Boot myapp.MyAgent

The `io.janusproject.kernel-<version>-with-dependencies.jar` file may be dowloaded from the [Janus website](http://www.janusproject.io/)

You may also create the `app.jar` file with Maven by using the assembly plugin for creating a jar file with all the dependencies inside.


### 2.4. Janus Command Line Options

The Janus platform provides a collection of command line options.
For obtaining the list of these options, you should type:


	java -cp app.jar io.sarl.sre.boot.Boot --help


## 3. Use Maven Execution Plugin

Maven provides a plugin for launching an application after automatically building
the application's classpath. This plugin may be used for launching an agent.

### 3.1. Boot of Janus

Based on the fact that the Janus platform provides a `Boot` class for launching itself,
you may use the Maven execution plugin for classing this booting class.

The typical command line is:


	mvn exec:exec -Dexec.executable=java -Dexec.args="-cp %classpath io.sarl.sre.boot.Boot"




The option `-Dexec.executable` specifies the Java executable.

The option `-Dexec.args` contains the command line arguments to pass to Java.
The first argument is the classpath of the project. You must not change `%classpath` because it will be dynamically
replaced by the Maven plugin. 


### 3.2. Specify the Agent to Launch

The example given in the previous section causes an error.
Indeed, it is mandatory to specify the fully qualified name
of the agent to launch:


	mvn exec:exec -Dexec.executable=java -Dexec.args="-cp %classpath io.sarl.sre.boot.Boot <qualified_name_of_the_agent>"


<veryimportant>The Janus platform allows to start only one agent from the command line.
If you want to start a collection of agents, you must select
one of the following approaches:

* launch a separate Janus platform instance for each agent, or
* launch an agent that is spawning the other agents.
</veryimportant> 


### 3.3. Janus Command Line Options

The Janus platform provides a collection of command line options.
For obtaining the list of these options, you should type:


	mvn exec:exec -Dexec.executable=java -Dexec.args="-cp %classpath io.sarl.sre.boot.Boot --help"



## 4. What's next?

In the next section, we will learn how to launch your SARL project from a Java program.

[Next>](./RunSARLAgentJava.html)


## 5. Legal Notice

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.12
* Status: Draft Release
* Release: 2020-08-01

> Copyright &copy; 2014-2020 [the original authors or authors](http://www.sarl.io/about/index.html).
>
> Licensed under the Apache License, Version 2.0;
> you may not use this file except in compliance with the License.
> You may obtain a copy of the [License](http://www.apache.org/licenses/LICENSE-2.0).
>
> You are free to reproduce the content of this page on copyleft websites such as Wikipedia.

<small>Generated with the translator io.sarl.maven.docs.generator 0.12.0-SNAPSHOT.</small>