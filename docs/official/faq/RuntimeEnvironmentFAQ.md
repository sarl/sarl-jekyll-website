---
title: "FAQ related to the Runtime Environment"
layout: default
---

# FAQ related to the Runtime Environment 


<ul class="page_outline" id="page_outline">

<li><a href="#1-general-questions-about-janus">1. General Questions about Janus</a></li>
<ul>
  <li><a href="#1-1-what-is-the-sre">1.1. What is the SRE?</a></li>
  <li><a href="#1-2-what-is-janus">1.2. What is Janus?</a></li>
  <li><a href="#1-3-where-can-i-ask-my-question">1.3. Where can I ask my question?</a></li>
  <li><a href="#1-4-where-can-i-found-information-on-the-release-planning-of-janus">1.4. Where can I found information on the release planning of Janus?</a></li>
</ul>
<li><a href="#2-installation-and-execution">2. Installation and Execution</a></li>
<ul>
  <li><a href="#2-1-is-my-operating-system-compatible-with-janus">2.1. Is my operating system compatible with Janus?</a></li>
  <li><a href="#2-2-what-is-the-version-of-the-java-virtual-machine-to-install">2.2. What is the version of the Java virtual machine to install?</a></li>
  <li><a href="#2-3-how-to-launch-an-agent-in-janus">2.3. How to launch an agent in Janus?</a></li>
  <li><a href="#2-4-error-the-sre-is-not-standalone-it-does-not-contain-the-java-dependencies">2.4. Error: "The SRE is not standalone. It does not contain the Java dependencies."</a></li>
  <li><a href="#2-5-error-incompatible-sre-with-sarl-1-1-1-1-version-must-be-lower-than-0-0-0">2.5. Error: "Incompatible SRE with SARL 1.1.1.1. Version must be lower than 0.0.0."</a></li>
  <li><a href="#2-6-error-agent-class-not-found">2.6. Error: "Agent class not found."</a></li>
  <li><a href="#2-7-error-invalid-byte-2-of-4-byte-utf-8-sequence">2.7. Error: "Invalid byte 2 of 4-byte UTF-8 sequence."</a></li>
</ul>
<li><a href="#3-runtime-behavior-of-janus">3. Runtime Behavior of Janus</a></li>
<ul>
  <li><a href="#3-1-are-events-received-in-the-same-order-than-when-they-are-sent">3.1. Are events received in the same order than when they are sent?</a></li>
  <li><a href="#3-2-must-i-configure-the-janus-kernels-to-be-connected-to-other-janus-kernels">3.2. Must I configure the Janus kernels to be connected to other Janus kernels?</a></li>
</ul>
<li><a href="#4-contribute-to-janus">4. Contribute to Janus</a></li>
<ul>
  <li><a href="#4-1-where-are-the-sources-for-janus">4.1. Where are the sources for Janus?</a></li>
  <li><a href="#4-2-how-can-i-find-the-current-issues">4.2. How can I find the current issues?</a></li>
  <li><a href="#4-3-how-can-i-report-a-problem-or-a-bug-in-janus-components">4.3. How can I report a problem or a bug in Janus components?</a></li>
</ul>
<li><a href="#5-legal-notice">5. Legal Notice</a></li>

</ul>



##1. General Questions about Janus

###1.1. What is the SRE?

SRE stands for "SARL Runtime Environment". The SRE is an implementation of an agent platform, which is able to
run a SARL program. The official standard SRE supported by the SARL developers is the
[Janus platform](http://www.janusproject.io).


###1.2. What is Janus?

Janus is an open-source multi-agent platform fully implemented 
in Java 1.8. Janus enables developers to quickly create 
web, enterprise and desktop agent-based applications.


__Janus is an agent execution platform not an agent-oriented language.__

It provides a comprehensive set of features to develop, run, display and monitor agent-based applications.

Janus-based applications can be distributed across a network. 
Janus could be used as an agent-oriented platform, an 
organizational platform, and/or a holonic platform. It 
also natively manages the concept of recursive agents and 
holons.

Official website: [www.janusproject.io](http://www.janusproject.io)


###1.3. Where can I ask my question?

If you cannot find an answer to your question in the FAQ, nor the reference documents, nor
the [existing SARL issues](https://github.com/sarl/sarl/issues),
you may ask the SARL developers on 
[the SARL forum](https://groups.google.com/forum/#!forum/sarl).


###1.4. Where can I found information on the release planning of Janus?

Janus is now part of the SARL project.
The release planning of SARL is detailed on the [milestones page](https://github.com/sarl/sarl/milestones)
on Github.

##2. Installation and Execution

###2.1. Is my operating system compatible with Janus?

The [Janus runtime platform](http://www.janusproject.io)
is a Java application. Every operating system which has 
a Java Virtual Machine with at least with the 1.8
standard may be used to run Janus. 



###2.2. What is the version of the Java virtual machine to install?

Janus requires the JRE and the JDK 1.8 or higher to run and compile.
Note that if you plan to create Android applications, you may 
configure your JDK to produce 1.6 class files from 1.8 Java code,
depending of the current supported standard on Android platforms.



###2.3. How to launch an agent in Janus?

Three methods are available for launching one or more agents in the Janus platform:

* [From the command line](../gettingstarted/RunSARLAgentCLI.html).
* [Inside the Eclipse IDE](../gettingstarted/RunSARLAgentEclipse.html).
* [From a Java program](../gettingstarted/RunSARLAgentJava.html).


###2.4. Error: "The SRE is not standalone. It does not contain the Java dependencies."

This error occurs when there is no SARL Runtime Environment (SRE) installed on your
Eclipse environment, OR when the installed SRE is not compatible with the installed
version of the SARL tools, which are embedded in Eclipse.

For solving this problem, you must download the latest
[Janus platform](http://www.janusproject.io), and install it in your Eclipse
(Menu <code>Window&gt; Preferences&gt; SARL&gt; Installed SREs</code>).

<caution>If the latest stable version of Janus is not working, you should
download the latest development version.</caution>


###2.5. Error: "Incompatible SRE with SARL 1.1.1.1. Version must be lower than 0.0.0."

This error occurs when the SARL Runtime Environment (SRE) has a version lower than
the version of the SARL tools, which are embedded in the Eclipse IDE.
This difference of version may cause problems during the execution of your agents, since
the capacities' definitions may not be the same.

For solving this problem, you must download the version of the SARL Runtime Environment (SRE)
that is implementing the version of the SARL specification that you're using on Eclipse IDE.
For the Janus platform, the versions of the latest stable and development releases are displayed on
[this page](http://maven.janusproject.io/VERSION.txt).
For determining if the Janus platform implements the correct version of the SARL specification,
please read the explanation  on [how Janus version numbers are built](http://www.janusproject.io/#versionnumber).


###2.6. Error: "Agent class not found."

When the Janus platform cannot find the class file for the start-up agent, it
displays the error message `"Agent class not found"`.

For resolving this problem, you should check if:

* the class with the given name exists in the application's class path.
* the class name is given as the first command-line argument to your application.
* the class with the given name is a subtype of `Agent`.



For showing the arguments given to Janus, you could launch Janus with the command line option:
`--cli`. This option stops Janus after displaying the command line arguments,
including the `--cli` option.


###2.7. Error: "Invalid byte 2 of 4-byte UTF-8 sequence."

When installing Janus as an SRE in the Eclipse interface, the plugin loads the Jar file of the
SRE with the default API.
The Jar archiver uses the default file encoding of the operating system.
On Linux and MacOS 10, it is almost UTF-8. On Windows, it is Latin1. And on MacOS (before 10),
it is Mac-Roman.

Unfortunately, the Janus Jar file is generated on a Linux operating system (UTF-8).
When the Java virtual machine tries to uncompress and use the content of the Jar, it
complains about an invalid charset format.

For solving this issue, you could launch your Eclipse with the command line option
`-Dfile.encoding=UTF-8`, which is forcing the Eclipse product to consider the
file as encoded with the UTF-8 charset.


##3. Runtime Behavior of Janus

###3.1. Are events received in the same order than when they are sent?

__No__.

There is no warranty on the receiving order of the events.
This is a particular implementation choice of the runtime
environment. For example, the
[Janus runtime environment](http://www.janusproject.io) executes
the event handlers in parallel. The real order of execution depends on
how the Java executor is running the handlers on the threads.


###3.2. Must I configure the Janus kernels to be connected to other Janus kernels?

__No__.

Janus was designed to discover other kernels automatically.
By default, the different instances of the Janus platform
are connected together without any particular configuration.
The sole constraint is that the kernels must be on the
same local network.


##4. Contribute to Janus

###4.1. Where are the sources for Janus?

The sources for Janus are available inside the SARL project repository on
[Github](https://github.com/sarl/sarl/tree/master/sre/io.janusproject/).


###4.2. How can I find the current issues?

Janus Developers use [Github](https://github.com/sarl/sarl)
to manage bug tracking and project workflow. 
The issues are listed on [Github](https://github.com/sarl/sarl/issues). 


###4.3. How can I report a problem or a bug in Janus components?

You should submit your issue on 
[this page](https://github.com/sarl/sarl/issues/new).


##5. Legal Notice

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.7
* Status: Stable Release
* Release: 2018-02-22

> Copyright &copy; 2014-2017 [the original authors or authors](http://www.sarl.io/about/index.html).
>
> Licensed under the Apache License, Version 2.0;
> you may not use this file except in compliance with the License.
> You may obtain a copy of the [License](http://www.apache.org/licenses/LICENSE-2.0).
>
> You are free to reproduce the content of this page on copyleft websites such as Wikipedia.

<small>Generated with the translator io.sarl.maven.docs.generator 0.7.0.</small>