---
title: "Janus Command-line Launcher with Network Support - janusnode"
layout: default
---

# Janus Command-line Launcher with Network Support - janusnode


<ul class="page_outline" id="page_outline">

<li><a href="#1-basics-of-the-networking-feature">1. Basics of the Networking Feature</a></li>
<li><a href="#2-note-on-the-application-classpath">2. Note on the application classpath</a></li>
<li><a href="#3-usage">3. Usage</a></li>
<li><a href="#4-command-line-options">4. Command-Line Options</a></li>
<li><a href="#5-list-of-errors-and-warnings">5. List of Errors and Warnings</a></li>
<li><a href="#6-configuration-of-the-networking-feature">6. Configuration of the networking feature</a></li>
<li><a href="#7-version-specification">7. Version Specification</a></li>
<li><a href="#8-legal-notice">8. Legal Notice</a></li>

</ul>


[Janus](http://www.sarl.io/runtime/janus/) is an open-source multi-agent platform fully implemented in SARL. 
Janus could be used as an agent-oriented platform, an organizational platform, and/or an holonic platform. 
It also natively manages the concept of recursive agents and holons.
Janus platform was initially published during the 2007-2008 period as a pure Java framework. Since 2014, Janus is fully reimplemented to
support the SARL Agent-Oriented Programming Language. And since 2020, it is fully re-implemented using the SARL language.

Janus implementation follows the standards of software engineering as much as possible. Basically, the key
implementation choices of Janus that are under interest in this tutorial are:
1. [*Microkernel architecture*](http://www.fipa.org/repository/standardspecs.html): Janus implementation is based on a microkernel that provides the key features of an agent framework, and that could be easily extended. The key features are implemented as services.
2. [*Service-based architecture*](https://en.wikipedia.org/wiki/Service-oriented_architecture): The main features of the Janus framework are implemented as services, e.g. context management, agent lifecycle, logging, etc.
3. [*Dependency Injection*](https://en.wikipedia.org/wiki/Dependency_injection): Modules (and services) are injected into the using objects with [Google Guice](https://github.com/google/guice). It provides support for dependency injection using annotations to configure Java objects. Dependency injection is a design pattern whose core principle is to separate behavior from dependency resolution.



The [`janus`](./Janus.html) tool is the base command-line tool for launching the SRE.
But, it does not provide a support for exchanging events over a computer
network. If you would like to have benefit of this feature, you should use one of the following
methods:

1. Add on the classpath of the `janus` command the [library that includes the networking feature](./JanusNetworkExtension.html) to the SRE; or
2. Use the version of the SRE that already includes the [standard network feature](./JanusNetworkExtension.html): `janusnode`.

The `janusnode` is explained on this page.

## 1. Basics of the Networking Feature

Basically, the networking feature of the Janus SRE enables you to launch instances of the Janus kernel on different
computers, and exchange events between these instances.

![General Networking Architecture](./janusnetworkextension.png)

In order to implement this feature, the [Hazelcast](http://www.hazelcast.com) library is used.
Hazelcast is an open source in-memory data grid based on Java. In a Hazelcast grid, data is
evenly distributed among the nodes of a computer cluster, allowing for horizontal scaling of
processing and available storage. Backups are also distributed among nodes to protect against
failure of any single node.

In addition to the data-sharing and efficient communication means, Hazelcast provides the ability
to build the node network automatically. Each Hazelcast node that is associated to a given cluster
name is *connected automatically* to the other nodes in the same cluster on the local network.
It means that you do not need to provide a network configuration to the Janus SRE.


## 2. Note on the application classpath

The `janusnode` command-line tool adds automatically the Jar files of Janus on the application classpath.
It means that you don't need to add any SRE, including Janus, in the dependencies of your project if you plan to use the Janus command line tool.

For other methods for launching a SARL application, please refer to one of:

* [Running an agent from the command-line shell](../getstarted/RunSARLAgentCLI.html)
* [Running an agent inside SARL Eclipse environment](../getstarted/RunSARLAgentEclipse.html)
* [Running an agent from a Java program progammatically](../getstarted/RunSARLAgentJava.html)

## 3. Usage

The `janusnode` tool takes arguments:

```text
janusnode [OPTIONS] <agent_fully_qualified_name>
```


The `agent_fully_qualified_name` is the name of the agent to launch. This name is equal to the
fully qualified name of the agent's type.

<p markdown="1"><span class="label label-info">Note</span> Janus enables to launch only one agent from the command-line shell. If you want to launch more than one agent, you should launch a first agent, which will create the other agents.</p>

You could change the behavior of the `janusnode` tool with the command-line options.
For obtaining a list of the options, type:

```text
janusnode -help
```


## 4. Command-Line Options

The Janus framework provides options on the command-line.
The list of the options is displayed below. This list includes
all the standard modules of Janus, and the networking features.
If you add an extra module into the classpath of your application,
more options may become available.



| Option | Description |
| ------ | ----------- |
| --agent-spawns-per-thread=number | Specify the maximal number of agent spawns that must be supported by a single thread into the life-cycle service; Default is 128. |
| --async-probe-update={true&#124;false} | Specify if the probe service should update asynchronously the probed values, or not; Default is true. |
| -b method<br>--boot-type=method | Specify the method for selecting the identifier of the default context; The possible values are default, random, boot_agent_name; Default is 'default'. |
| --classpath=path | Specifies where to find user class files, and source files. This class path overrides the user class path in the SRE_CLASSPATH environment variable. If neither SRE_CLASSPATH, --cp nor --classpath is specified, then the user class path is built upon the current folder. If a user class path is specified, it must contains the the user libraries and the standard SARL libraries. |
| --config=yaml_location | Specifies YAML config location, which can be a file path or a URL. |
| --cp=path | Specifies where to find user class files, and source files. This class path overrides the user class path in the SRE_CLASSPATH environment variable. If neither SRE_CLASSPATH, --cp nor --classpath is specified, then the user class path is built upon the current folder. If a user class path is specified, it must contains the the user libraries and the standard SARL libraries. |
| -d uuid<br>--default-space-id=uuid | Specify the identifier (UUID) of the default space into the root context; Default is 7ba8885d-545b-445a-a0e9-b655bc15ebe0. |
| -e {reflect, polymorphic}<br>--event-bus={reflect, polymorphic} | Specify the type of event bus to create for each agent; Default is reflect. |
| --generatemarkdownconfighelp | Prints the configuration parameters using a Markdown table. |
| --generatemarkdownhelp | Prints the list of the command-line options using a Markdown table. |
| -h<br>--help | Prints this message. |
| -H [prefix]<br>--help-config[=prefix] | Prints information about application modules and their configuration options. Optionally, you can provide a 'prefix' argument to print only the specified config. |
| --inject-agents={true&#124;false} | Specify if the agents should be injected with field values by the SRE; Default is false. |
| --internal-error-log-level=level | Specify the logging level for the internal errors within the parallel executors; Default is: all. |
| -j<br>--json | When present, the output of the configuration has the Json format. |
| -k duration<br>--keep-alive=duration | Specify the duration in seconds during which a thread is staying alive even if there is not task to be run; After this duration, iddle threads are destroyed by the SRE; Default value is 60. |
| -l level<br>--log=level | Specifies the level of logging of the application. This log level could be also controlled by setting the environment variable LOG_LEVEL. If neither LOG_LEVEL nor --log is specified, then the default log level set to info is used. The accepted values are: off, error, warning, info, debug, trace, all. |
| --max-threads=number | Specify the maximal number of threads that could be created by the SRE; Default is 512. |
| --min-threads=number | Specify the minimal number of threads that should be created by the SRE; Default is 1. |
| --name=name | Specify the name of the program that is shown into the logs for example; Default is 'SARL Run-time Environment'. |
| --network=true&#124;false | Specifies if the networking features of the SRE are enabled or disabled. If the given value is "true", the features are enable. If the given value is "false", the features are disable. The value could also be changed with the SRENETWORK_ENABLE environment variable. The default value for the enabling flag is false. |
| --no-agent | Start the SRE without agent at boot time. In this case, the fully qualified name that may be provided on the command line is simply ignored. Agents should be spawned later by calling the programmatic API of the SRE. |
| -o {true&#124;false}<br>--on-processors={true&#124;false} | Specify if the executor service maps thread number to available processor number; Default is: false. |
| -C<br>--printconfig | Print the current configuration. The output format is Yaml by default. See --json for a Json output, and --xml for a XML output. |
| -r uuid<br>--root-context-id=uuid | Specify the identifier (UUID) of the root context; Default is 2c38fb7f-f363-4f6e-877b-110b1f07cc77. |
| --service-start-timeout=timeout | Specify the timeout for waiting a service to be started (in milliseconds); A value equal to zero means that the SRE waits for ever; Default is 0. |
| --service-stop-timeout=timeout | Specify the timeout for waiting a service to be stopped (in milliseconds); A value equal to zero means that the SRE waits for ever; Default is 10 000. |
| --thread-purge={true&#124;false} | Specify if the executor service is periodically purging the thread pools; Default is: true. |
| --thread-timeout=timeout | Specify the numbers of seconds that the SRE is waiting for thread terminations before timeout; Default is: 30. |
| -v<br>--version | Prints release information. |
| -x<br>--xml | When present, the output of the configuration has the XML format. |





## 5. List of Errors and Warnings

The list of error and warning messages that may be generated by Janus are provided on the
help page of the [main command-line tool](./Janus.html).

## 6. Configuration of the networking feature

The configuration of the networking feature is explained on this [page](./JanusNetworkExtension.html).


## 7. Version Specification

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.15
* Status: Stable Release
* Release: 2025-09-10

## 8. Legal Notice

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

<small>Generated with the translator docs.generator 0.15.0.</small>
