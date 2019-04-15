---
title: "Janus Command-line Launcher"
layout: default
---

# Janus Command-line Launcher


<ul class="page_outline" id="page_outline">

<li><a href="#1-usage">1. Usage</a></li>
<li><a href="#2-command-line-options">2. Command-Line Options</a></li>
<li><a href="#3-legal-notice">3. Legal Notice</a></li>

</ul>




[Janus](http://www.janusproject.io) is the default SARL Run-time Environment (SRE).
Its role is to provide all the libraries and plugins that are needed for running SARL agents.

For launching the Janus platform from a command-line shell, you could use the `janus` tool.

##1. Usage

The `janus` tool takes arguments:


	janus [OPTIONS] <agent_fully_qualified_name>


The `agent_fully_qualified_name` is the name of the agent to launch. This name is equal to the
fully qualified name of the agent's type.

<note>Janus enables to launch only one agent from the command-line shell. If you want to launch
more than one agent, you should launch a first agent, which will create the other agents.</note>

You could change the behavior of the `janus` tool with the command-line options.
For obtaining a list of the options, type:

	janus -help


##2. Command-Line Options

The complete list of the options is:



| Option | Description |
| ------ | ----------- |
| `-B`, `--bootid` | The Janus context UUID is computed from the classname of the boot agent. It is equivalent as setting the properties 'janus.context.id.boot' and 'janus.context.id.random' to true and false. |
| `-cp`, `--classpath` | Add entries to the Java classpath |
| `--cli` | Show the command line arguments received by Janus. |
| `-D`, `--define <property=value>` | Define a system property. |
| `-e`, `--embedded` | Janus is run inside another application. |
| `-f`, `--file` | Load system properties from a file. |
| `-h`, `--help` | Display this help. |
| `-l`, `--log` | Set the logging level. Default level is 'info'. The available logging levels are: none (0), error (1), warning (2), info (3), fine (4), finer (5), finest (6), all (7). |
| `--nologo` | Hide the Janus logo. |
| `-o`, `--offline` | Run the platform offline: it cannot communicate with other platform instances. It is equivalent as setting the property 'janus.network.offline' to true. |
| `-q`, `--quiet` | Decrease the logging level. |
| `-R`, `--randomid` | The Janus context UUID is computed randomly. It is equivalent as setting the properties 'janus.context.id.boot' and 'janus.context.id.random' to false and true. |
| `-showclasspath` | Show the classpath used by the application. |
| `-s`, `--showdefaults` | Show the default values of the system properties. |
| `-v`, `--verbose` | Increase the logging level. |
| `-version` | Display the version of Janus. |
| `-W`, `--worldid` | The Janus context UUID is the default hard-coded one. It is equivalent as setting the properties 'janus.context.id.boot' and 'janus.context.id.random' to false, both. |





##3. Legal Notice

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.9
* Status: Stable Release
* Release: 2019-04-15

> Copyright &copy; 2014-2019 [the original authors or authors](http://www.sarl.io/about/index.html).
>
> Licensed under the Apache License, Version 2.0;
> you may not use this file except in compliance with the License.
> You may obtain a copy of the [License](http://www.apache.org/licenses/LICENSE-2.0).
>
> You are free to reproduce the content of this page on copyleft websites such as Wikipedia.

<small>Generated with the translator io.sarl.maven.docs.generator 0.9.0.</small>