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
  <li><a href="#24-splitting-app-jar-in-separated-jar-files-by-hand">2.4. Splitting app.jar in separated jar files by hand</a></li>
  <li><a href="#25-creating-app-jar-with-maven-assembly-plugin">2.5. Creating app.jar with maven-assembly-plugin</a></li>
  <li><a href="#26-janus-command-line-options">2.6. Janus Command Line Options</a></li>
</ul>
<li><a href="#3-use-maven-execution-plugin">3. Use Maven Execution Plugin</a></li>
<ul>
  <li><a href="#31-boot-of-janus">3.1. Boot of Janus</a></li>
  <li><a href="#32-specify-the-agent-to-launch">3.2. Specify the Agent to Launch</a></li>
  <li><a href="#33-janus-command-line-options">3.3. Janus Command Line Options</a></li>
</ul>
<li><a href="#4-what-s-next">4. What's next?</a></li>
<li><a href="#5-version-specification">5. Version Specification</a></li>
<li><a href="#6-legal-notice">6. Legal Notice</a></li>

</ul>


For running an agent, you must launch this agent on the runtime environment.
This document explains how to launch an agent on the
[Janus platform](http://www.sarl.io/runtime/janus/) from the command line.

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


```text
janus myapp.MyAgent
```


The janus command-line tool provides options that will enable you to tune the launching configuration:

```text
janus --help
```


One of the command-line options that is usually mandatory is the --jar option, which enables you to specify the jar files that contains your application:

```text
janus --jar path/to/app.jar myapp.MyAgent
```


If the `janus` script indicates to you an error "agent not found", most of the time it is because your application's jar file is not on the class path.
The --jar option becomes mandatory for specifying the jar file.


<p markdown="1"><span class="label label-danger">Very Important Note</span> The Janus command-line tool adds automatically the Jar files of the SRE (i.e., Janus) on the application classpath. It means that you don't need to add any SRE, including Janus, in the dependencies of your project if you plan to use the Janus command line tool.</p>


## 2. Use the standard java method

### 2.1. Boot of Janus

The Janus platform provides a `Boot` class. For launching the platform, you must execute this
boot class in a Java Virtual Machine.

The typical command line is:

```text
java -cp app.jar io.sarl.sre.janus.boot.Boot
```



The option `-cp` specifies the Jar file that contains
the compiled classes. The given `app.jar` file is a Jar file that must contain the Janus
platform, the SARL libraries, and the application classes.
The creation of this `app.jar` file is explained in this [tutorial](../tutorials/runtime/CreateRunnableJar.html).
The last argument is the fully qualified name of the booting class of Janus: `io.sarl.sre.janus.boot.Boot`

<p markdown="1"><span class="label label-danger">Very Important Note</span> With this method, you must add the SRE, e.g., Janus, on the classpath (or in the dependencies) of your project.</p>


### 2.2. Specify the Agent to Launch

The example given in the previous section causes an error. Indeed, it is mandatory to
specify the fully qualified name of the agent to launch:

```text
java -cp app.jar io.sarl.sre.janus.boot.Boot myapp.MyAgent
```


<p markdown="1"><span class="label label-danger">Very Important Note</span> The Janus platform allows to start only one agent from the command line. If you want to start a collection of agents, you must select one of the following approaches:  * launch a separate Janus platform instance for each agent, or * launch an agent that is spawning the other agents.</p>


### 2.3. What is app.jar?

In the previous section, we assume that all the application binary files are
contained into the `app.jar` file.

### 2.4. Splitting app.jar in separated jar files by hand

You may replace the app.jar in the previous command lines by the classpath
that is containing all the jar files required for running your application, including
the Janus jar file(s):

```text
java -cp /path/to/myapplication.jar:/path/to/janus.kernel-<version>-with-dependencies.jar io.sarl.sre.janus.boot.Boot myapp.MyAgent
```

The `janus.kernel-<version>-with-dependencies.jar` file must be dowloaded from the [Janus website](http://www.sarl.io/runtime/janus/)

### 2.5. Creating app.jar with maven-assembly-plugin

You may also create the app.jar file with Maven by using the assembly plugin for creating a jar file with all the dependencies inside.
To do so, you have to update the `pom.xml` file of your project and to define the assembly specification.

The content of the `pom.xml` must include the assembly plugin definition:

```xml
<plugin>
  <groupId>org.apache.maven.plugins</groupId>
  <artifactId>maven-assembly-plugin</artifactId>
  <version>3.3.0</version>
  <executions>
    <execution>
      <id>make-assembly-with-deps</id>
      <phase>package</phase>
      <goals>
        <goal>single</goal>
      </goals>
      <configuration>
        <descriptors>
          <descriptor>with-dependencies.xml</descriptor>
        </descriptors>
      </configuration>
    </execution>
  </executions>
</plugin>
```

The previous definition mentions the file `with-dependencies.xml` that contains the assembly specification.
The content of this file could be:

```xml
<assembly xmlns="http://maven.apache.org/plugins/maven-assembly-plugin/assembly/1.1.0"
 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
 xsi:schemaLocation="http://maven.apache.org/plugins/maven-assembly-plugin/assembly/1.1.0 http://maven.apache.org/xsd/assembly-1.1.0.xsd">
  <id>with-dependencies</id>
  <formats>
    <format>jar</format>
  </formats>
  <includeBaseDirectory>false</includeBaseDirectory>
  <dependencySets>
    <dependencySet>
      <unpack>true</unpack>
      <scope>runtime</scope>
    </dependencySet>
  </dependencySets>
  <containerDescriptorHandlers>
    <!-- Merge service description's files in a proper way -->
    <containerDescriptorHandler>
      <handlerName>metaInf-services</handlerName>
    </containerDescriptorHandler>
  </containerDescriptorHandlers>
</assembly>
```

The tag `containerDescriptorHandlers` is **very important** to be present into the definition.
Without this tag, the SARL and Janus services will not be correctly merged into the
generated Jar file with all the dependencies.

<p markdown="1"><span class="label label-danger">Caution</span> You must use the version 3.3.0 (or higher) of `maven-assembly-plugin` to have access to the mentioned capability.</p>


### 2.6. Janus Command Line Options

The Janus platform provides a collection of command line options.
For obtaining the list of these options, you should type:

```text
java -cp app.jar io.sarl.sre.janus.boot.Boot --help
```


## 3. Use Maven Execution Plugin

Maven provides a plugin for launching an application after automatically building
the application's classpath. This plugin may be used for launching an agent.

### 3.1. Boot of Janus

Based on the fact that the Janus platform provides a `Boot` class for launching itself,
you may use the Maven execution plugin for classing this booting class.

The typical command line is:

```text
mvn exec:exec -Dexec.executable=java -Dexec.args="-cp %classpath io.sarl.sre.janus.boot.Boot"
```



The option `-Dexec.executable` specifies the Java executable.

The option `-Dexec.args` contains the command line arguments to pass to Java.
The first argument is the classpath of the project. You must not change `%classpath` because it will be dynamically
replaced by the Maven plugin. 

<p markdown="1"><span class="label label-danger">Very Important Note</span> With this method, you must add the SRE, e.g., Janus, on the classpath (or in the dependencies) of your project.</p>



### 3.2. Specify the Agent to Launch

The example given in the previous section causes an error.
Indeed, it is mandatory to specify the fully qualified name
of the agent to launch:

```text
mvn exec:exec -Dexec.executable=java -Dexec.args="-cp %classpath io.sarl.sre.janus.boot.Boot <qualified_name_of_the_agent>"
```


<p markdown="1"><span class="label label-danger">Very Important Note</span> The Janus platform allows to start only one agent from the command line. If you want to start a collection of agents, you must select one of the following approaches:  * launch a separate Janus platform instance for each agent, or * launch an agent that is spawning the other agents.</p>


### 3.3. Janus Command Line Options

The Janus platform provides a collection of command line options.
For obtaining the list of these options, you should type:

```text
mvn exec:exec -Dexec.executable=java -Dexec.args="-cp %classpath io.sarl.sre.janus.boot.Boot --help"
```



## 4. What's next?

In the next section, we will learn how to launch your SARL project from a Java program or a SARL class.

[Next>](./RunSARLAgentJava.html)


## 5. Version Specification

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.15
* Status: Stable Release
* Release: 2025-09-11

## 6. Legal Notice

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
