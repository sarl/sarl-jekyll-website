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

## 1. Usage

The `janus` tool takes arguments:


	janus [OPTIONS] <agent_fully_qualified_name>


The `agent_fully_qualified_name` is the name of the agent to launch. This name is equal to the
fully qualified name of the agent's type.

<note>Janus enables to launch only one agent from the command-line shell. If you want to launch
more than one agent, you should launch a first agent, which will create the other agents.</note>

You could change the behavior of the `janus` tool with the command-line options.
For obtaining a list of the options, type:

	janus -help


## 2. Command-Line Options

The Janus framework provides options on the command-line.
The list of the options is displayed below. This list includes
all the standard modules of Janus. If you add an extra module into
the classpath of your application, more options may become available.



| Option | Description |
| ------ | ----------- |





## 3. Legal Notice

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.11
* Status: Stable Release
* Release: 2020-06-02

> Copyright &copy; 2014-2020 [the original authors or authors](http://www.sarl.io/about/index.html).
>
> Licensed under the Apache License, Version 2.0;
> you may not use this file except in compliance with the License.
> You may obtain a copy of the [License](http://www.apache.org/licenses/LICENSE-2.0).
>
> You are free to reproduce the content of this page on copyleft websites such as Wikipedia.

<small>Generated with the translator io.sarl.maven.docs.generator 0.11.0.</small>