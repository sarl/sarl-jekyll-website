---
title: "SARL Documentation"
layout: default
---

# SARL Documentation


<ul class="page_outline" id="page_outline">

<li><a href="#1-getting-started">1. Getting Started</a></li>
<li><a href="#2-frequently-asked-questions-faq">2. Frequently Asked Questions (FAQ)</a></li>
<li><a href="#3-tutorials">3. Tutorials</a></li>
<ul>
  <li><a href="#31-event-communication">3.1. Event Communication</a></li>
  <li><a href="#32-parallel-execution">3.2. Parallel Execution</a></li>
  <li><a href="#33-organizational-patterns">3.3. Organizational Patterns</a></li>
</ul>
<li><a href="#4-best-practices-with-sarl">4. Best Practices with SARL</a></li>
<li><a href="#5-reference-documentation">5. Reference Documentation</a></li>
<ul>
  <li><a href="#51-general-syntax">5.1. General Syntax</a></li>
  <li><a href="#52-agent-oriented-programming">5.2. Agent-Oriented Programming</a></li>
  <li><a href="#53-object-oriented-programming">5.3. Object-Oriented Programming</a></li>
</ul>
<li><a href="#6-compilation-and-generation-infrastructure">6. Compilation and Generation Infrastructure</a></li>
<ul>
  <li><a href="#61-run-time-behavior-of-sarl-programs">6.1. Run-time Behavior of SARL Programs</a></li>
</ul>
<li><a href="#7-other-tools">7. Other Tools</a></li>
<ul>
  <li><a href="#71-syntax-highlightning">7.1. Syntax Highlightning</a></li>
  <li><a href="#72-apache-maven">7.2. Apache Maven</a></li>
  <li><a href="#73-command-line-tools">7.3. Command Line Tools</a></li>
</ul>
<li><a href="#8-documentation-format">8. Documentation Format</a></li>
<li><a href="#9-legal-notice">9. Legal Notice</a></li>

</ul>


## 1. Getting Started

* [Install SARL Tools](./gettingstarted/InstallSARLTools.html)
* [Create First Project](./gettingstarted/CreateFirstProject.html)
* [Agent Definition Introduction](./gettingstarted/AgentIntroduction.html)
* [Run SARL Agent in the Eclipse IDE](./gettingstarted/RunSARLAgentEclipse.html)
* [Run SARL Agent from the Command Line](./gettingstarted/RunSARLAgentCLI.html)
* [Run SARL Agent from a Java Program](./gettingstarted/RunSARLAgentJava.html)

## 2. Frequently Asked Questions (FAQ)

* [General FAQ on SARL](./faq/GeneralFAQ.html)
* [SARL Syntax FAQ](./faq/SyntaxFAQ.html)
* [Runtime Environment FAQ](./faq/RuntimeEnvironmentFAQ.html)

## 3. Tutorials

### 3.1. Event Communication

* [Agent Communication with the Ping Pong Agents](./tutorials/PingPong.html)
* [Agent Communication in Sub-Space with the Ping Pong Agents](./tutorials/PingPongSpace.html)

### 3.2. Parallel Execution

* [Parallel execution within the agents](./tutorials/ParallelExecution.html)
* [Initialization of a multiagent system](./tutorials/MASInitialization.html)

### 3.3. Organizational Patterns

* [English Auction with Holons](./tutorials/HolonicAuction.html)

## 4. Best Practices with SARL

* [Event Creation with a Builder](./bestpractices/EventBuilder.html)
* [Event Handler Overriding](./bestpractices/EventHandlerOverriding.html)
* [Creating Space with Operation User Accessibility](./bestpractices/SpaceWithCallerIdentity.html)

## 5. Reference Documentation

### 5.1. General Syntax

* [General Syntax Reference](./reference/GeneralSyntax.html)
* Structural elements;
	* [Script format](./reference/general/Script.html)
	* [Function declaration](./reference/general/FuncDecls.html)
	* [Synthetic Functions](./reference/general/SyntheticFunctions.html)
* Type system:
	* [Supported Types for Variables and Parameters](./reference/general/Types.html)
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
	* [Assertions](./reference/general/Assertion.html)
* Meta-programming:
	* [Active annotations](./reference/general/ActiveAnnotations.html)
* [Compiler Errors](./reference/CompilerErrors.html)
* [Comparison between SARL and other Languages](./reference/LanguageComparison.html)

### 5.2. Agent-Oriented Programming

* [Event Reference](./reference/Event.html)
* [Capacity Reference](./reference/Capacity.html)
* [Skill Reference](./reference/Skill.html)
* [Agent Reference](./reference/Agent.html)
* [Behavior Reference](./reference/Behavior.html)
* [Built-in Capacity Reference](./reference/BIC.html)
* [Space Reference](./reference/Space.html)
* [Compiler Errors](./reference/CompilerErrors.html)

### 5.3. Object-Oriented Programming

* [Basic Object-Oriented Programming Support](./reference/OOP.html)
* [Comparison between SARL and other Languages](./reference/LanguageComparison.html)
* [Compiler Errors](./reference/CompilerErrors.html)

## 6. Compilation and Generation Infrastructure

* [Compiler Errors](./reference/CompilerErrors.html)
* [Basics of the SARL Compilation Process](./compilation/Basics.html)
* [Generation to the Python Language](./compilation/PythonGeneration.html)

### 6.1. Run-time Behavior of SARL Programs

* [Run-time Behavior of SARL Programs](./reference/Runtime.html)

## 7. Other Tools

### 7.1. Syntax Highlightning

* [Syntax highlighting styles for SARL inside other tools](./tools/SyntaxHighlightning.html)

### 7.2. Apache Maven

* [maven-sarl-plugin](./tools/MavenSarlPlugin.html): the Maven plugin for the SARL compiler.

### 7.3. Command Line Tools

* [sarlc](./tools/Sarlc.html): command-line SARL compiler.
* [sarldoc](./tools/Sarldoc.html): command-line SARL documentation generator.
* [janus](./tools/Janus.html): launching SARL agents with the Janus platform.

## 8. Documentation Format

* [Specific Markdown format for the documentation](./DocumentationContribution.html)


## 9. Legal Notice

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.12
* Status: Draft Release
* Release: 2020-08-18

> Copyright &copy; 2014-2020 [the original authors or authors](http://www.sarl.io/about/index.html).
>
> Licensed under the Apache License, Version 2.0;
> you may not use this file except in compliance with the License.
> You may obtain a copy of the [License](http://www.apache.org/licenses/LICENSE-2.0).
>
> You are free to reproduce the content of this page on copyleft websites such as Wikipedia.

<small>Generated with the translator io.sarl.maven.docs.generator 0.12.0-SNAPSHOT.</small>