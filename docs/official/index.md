---
title: "SARL Documentation"
layout: default
---

#SARL Documentation


<ul class="page_outline" id="page_outline">

<li><a href="#1-getting-started">1. Getting Started</a></li>
<li><a href="#2-frequently-asked-questions-faq">2. Frequently Asked Questions  (FAQ)</a></li>
<li><a href="#3-tutorials">3. Tutorials</a></li>
<ul>
  <li><a href="#3-1-event-communication">3.1. Event Communication</a></li>
  <li><a href="#3-2-organizational-patterns">3.2. Organizational Patterns</a></li>
  <li><a href="#3-3-creating-a-sarl-run-time-environment">3.3. Creating a SARL Run-time Environment</a></li>
</ul>
<li><a href="#4-best-practices-with-sarl">4. Best Practices with SARL</a></li>
<li><a href="#5-reference-documentation">5. Reference Documentation</a></li>
<ul>
  <li><a href="#5-1-general-syntax">5.1. General Syntax</a></li>
  <li><a href="#5-2-agent-oriented-programming">5.2. Agent-Oriented Programming</a></li>
  <li><a href="#5-3-object-oriented-programming">5.3. Object-Oriented Programming</a></li>
</ul>
<li><a href="#6-compilation-and-generation-infrastructure">6. Compilation and Generation Infrastructure</a></li>
<li><a href="#7-other-tools">7. Other Tools</a></li>
<ul>
  <li><a href="#7-1-syntax-highlightning">7.1. Syntax Highlightning</a></li>
  <li><a href="#7-2-command-line-tools">7.2. Command Line Tools</a></li>
</ul>
<li><a href="#8-documentation-format">8. Documentation Format</a></li>
<li><a href="#9-legal-notice">9. Legal Notice</a></li>

</ul>


##1. Getting Started

* [Install SARL Tools](./gettingstarted/InstallSARLTools.html)
* [Create First Project](./gettingstarted/CreateFirstProject.html)
* [Agent Definition Introduction](./gettingstarted/AgentIntroduction.html)
* [Run SARL Agent in the Eclipse IDE](./gettingstarted/RunSARLAgentEclipse.html)
* [Run SARL Agent from the Command Line](./gettingstarted/RunSARLAgentCLI.html)
* [Run SARL Agent from a Java Program](./gettingstarted/RunSARLAgentJava.html)

##2. Frequently Asked Questions  (FAQ)

* [General FAQ on SARL](./faq/GeneralFAQ.html)
* [SARL Syntax FAQ](./faq/SyntaxFAQ.html)
* [Runtime Environment FAQ](./faq/RuntimeEnvironmentFAQ.html)

##3. Tutorials

###3.1. Event Communication

* [Agent Communication with the Ping Pong Agents](./tutorials/PingPong.html)
* [Agent Communication in Sub-Space with the Ping Pong Agents](./tutorials/PingPongSpace.html)

###3.2. Organizational Patterns

* [English Auction with Holons](./tutorials/HolonicAuction.html)

###3.3. Creating a SARL Run-time Environment

* [Creating a SARL Run-time Environment for the tinyMAS platform](./tutorials/CreateSREWithTinyMAS.html)

##4. Best Practices with SARL

* [Event Creation with a Builder](./bestpractices/EventBuilder.html)
* [Event Handler Overriding](./bestpractices/EventHandlerOverriding.html)

##5. Reference Documentation

###5.1. General Syntax

* [General Syntax Reference](./reference/GeneralSyntax.html)
* Structural elements;
	* [Script format](./reference/general/Script.html)
	* [Function declaration](./reference/general/FuncDecls.html)
	* [Synthetic Functions](./reference/general/SyntheticFunctions.html)
* Constant expressions:
	* [Numerical, string, and collection literals](./reference/general/Literals.html)
* Structuring expressions:
	* [Block expression](./reference/general/Block.html)
	* [If-then-else expression](./reference/general/IfExpression.html)
	* [Switch expression](./reference/general/SwitchExpression.html)
	* [Loops](./reference/general/LoopExpression.html)
	* [Lambda expressions](./reference/general/Lambda.html)
* Standard expressions:
	* [Variable and attribute declarations](./reference/general/VarDecls.html)
	* [Operators](./reference/general/Operators.html)
	* [Type casting](./reference/general/Cast.html)
	* [Access to object members](./reference/general/MemberAccess.html)
	* [Extension methods](./reference/general/Extension.html)
	* [Synchronization expression](./reference/general/Synchronization.html)
* Errors and exceptions:
	* [Exceptions](./reference/general/Exception.html)

###5.2. Agent-Oriented Programming

* [Event Reference](./reference/Event.html)
* [Capacity Reference](./reference/Capacity.html)
* [Skill Reference](./reference/Skill.html)
* [Agent Reference](./reference/Agent.html)
* [Behavior Reference](./reference/Behavior.html)
* [Built-in Capacity Reference](./reference/BIC.html)
* [Space Reference](./reference/Space.html)

###5.3. Object-Oriented Programming

* [Basic Object-Oriented Programming Support](./reference/OOP.html)

##6. Compilation and Generation Infrastructure

* [Basics of the SARL Compilation Process](./compilation/Basics.html)
* [Generation to the Python Language](./compilation/PythonGeneration.html)

##7. Other Tools

###7.1. Syntax Highlightning

* [Syntax highlighting styles for SARL inside other tools](./tools/SyntaxHighlightning.html)

###7.2. Command Line Tools

* [sarlc](./tools/Sarlc.html): command-line SARL compiler.
* [janus](./tools/Janus.html): launching SARL agents with the Janus platform.

##8. Documentation Format

* [Specific Markdown format for the documentation](./DocumentationContribution.html)


##9. Legal Notice

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.6
* Status: Draft Release
* Release: 2017-08-31

> Copyright &copy; 2014-2017 [the original authors or authors](http://www.sarl.io/about/index.html).
>
> Licensed under the Apache License, Version 2.0;
> you may not use this file except in compliance with the License.
> You may obtain a copy of the [License](http://www.apache.org/licenses/LICENSE-2.0).
>
> You are free to reproduce the content of this page on copyleft websites such as Wikipedia.

<small>Generated with the translator io.sarl.maven.docs.generator 0.6.0-SNAPSHOT.</small>