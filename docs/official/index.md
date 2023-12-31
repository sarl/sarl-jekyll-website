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
  <li><a href="#31-base-exercises">3.1. Base Exercises</a></li>
  <li><a href="#32-event-communication">3.2. Event Communication</a></li>
  <li><a href="#33-parallel-execution">3.3. Parallel Execution</a></li>
  <li><a href="#34-action-selection-architectures">3.4. Action Selection Architectures</a></li>
  <li><a href="#35-organizational-patterns">3.5. Organizational Patterns</a></li>
  <li><a href="#36-sarl-run-time-environment">3.6. SARL Run-time Environment</a></li>
</ul>
<li><a href="#4-best-practices-with-sarl">4. Best Practices with SARL</a></li>
<li><a href="#5-reference-documentation">5. Reference Documentation</a></li>
<ul>
  <li><a href="#51-general-syntax">5.1. General Syntax</a></li>
  <li><a href="#52-agent-oriented-programming">5.2. Agent-Oriented Programming</a></li>
  <li><a href="#53-object-oriented-programming">5.3. Object-Oriented Programming</a></li>
  <li><a href="#54-sarl-development-toolkit-sdk-and-programming-interface-api">5.4. SARL Development Toolkit (SDK) and Programming Interface (API)</a></li>
</ul>
<li><a href="#6-compilation-and-generation-infrastructure">6. Compilation and Generation Infrastructure</a></li>
<li><a href="#7-execution-and-run-time-environment">7. Execution and Run-Time Environment</a></li>
<ul>
  <li><a href="#71-run-time-behavior-of-sarl-programs">7.1. Run-time Behavior of SARL Programs</a></li>
  <li><a href="#72-janus-sre">7.2. Janus SRE</a></li>
</ul>
<li><a href="#8-other-tools">8. Other Tools</a></li>
<ul>
  <li><a href="#81-syntax-highlightning">8.1. Syntax Highlightning</a></li>
  <li><a href="#82-apache-maven">8.2. Apache Maven</a></li>
  <li><a href="#83-command-line-tools">8.3. Command Line Tools</a></li>
</ul>
<li><a href="#9-documentation-format">9. Documentation Format</a></li>
<li><a href="#10-legal-notice">10. Legal Notice</a></li>

</ul>


## 1. Getting Started

* [Install SARL Tools](./gettingstarted/InstallSARLTools.html)
* [Create First Project](./gettingstarted/CreateFirstProject.html)
* [Agent Definition Introduction](./gettingstarted/AgentIntroduction.html)
* [Run SARL Agent in the Eclipse IDE](./gettingstarted/RunSARLAgentEclipse.html)
* [Run SARL Agent from the Command Line](./gettingstarted/RunSARLAgentCLI.html)
* [Run SARL Agent from a Java Program or a SARL class](./gettingstarted/RunSARLAgentJava.html)

## 2. Frequently Asked Questions (FAQ)

* [General FAQ on SARL](./faq/GeneralFAQ.html)
* [SARL Syntax FAQ](./faq/SyntaxFAQ.html)
* [Runtime Environment FAQ](./faq/RuntimeEnvironmentFAQ.html)
* [What are the deprecated and removed features?](./faq/DeprecatedAPI.html)

## 3. Tutorials

### 3.1. Base Exercises

* [Base of syntax](./tutorials/IntroductionBase.html)
* [Strings of characters](./tutorials/IntroductionString.html)
* [Lists](./tutorials/IntroductionList.html)
* [Maps or dictionaries](./tutorials/IntroductionMap.html)
* [Functions or actions](./tutorials/IntroductionFunction.html)
* [Lambda Expressions](./tutorials/IntroductionFunction.html)
* [Object-Oriented Classes](./tutorials/IntroductionClass.html)

### 3.2. Event Communication

* [Agent Communication with the ping-pong agents](./tutorials/PingPong.html)
* [Agent Communication in sub-space with the ping-pong agents](./tutorials/PingPongSpace.html)
* [Override the agent event bus with the Behaviors capacity](./tutorials/EventBusOverrideWithCapacity.html)

### 3.3. Parallel Execution

* [Parallel execution within the agents](./tutorials/ParallelExecution.html)
* [Initialization of a multiagent system](./tutorials/MASInitialization.html)

### 3.4. Action Selection Architectures

* [Goal-oriented Action Selection from Video Game Field](./tutorials/GameTGob.html)

### 3.5. Organizational Patterns

* [English Auction with Holons](./tutorials/HolonicAuction.html)

### 3.6. SARL Run-time Environment

* [Creating a runnable application file with embedded SRE](./tutorials/CreateRunnableJar.html).
* [Creating an extension for the Janus SRE](./tutorials/SreExtension.html)

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
* [Management of the Failures and Validation Errors](./reference/Failures.html)
* [Compiler Errors](./reference/CompilerErrors.html)

### 5.3. Object-Oriented Programming

* [Basic Object-Oriented Programming Support](./reference/OOP.html)
* [Comparison between SARL and other Languages](./reference/LanguageComparison.html)
* [Compiler Errors](./reference/CompilerErrors.html)

### 5.4. SARL Development Toolkit (SDK) and Programming Interface (API)

* [Programmatic Access to the SARL Run-time Environment](./api/SRE.html)
* [Naming and Namespaces](./api/Naming.html)
* [SRE Observation and Probes](./api/Probing.html)

## 6. Compilation and Generation Infrastructure

* [Compiler Errors](./reference/CompilerErrors.html)
* [Basics of the SARL Compilation Process](./compilation/Basics.html)
* [Generation to the Python Language](./compilation/PythonGeneration.html)

## 7. Execution and Run-Time Environment

### 7.1. Run-time Behavior of SARL Programs

* [Run-time Behavior of SARL Programs](./reference/Runtime.html)

### 7.2. Janus SRE

* [Janus SRE Official Page](http://www.sarl.io/runtime/janus/index.html)
* [Creating extensions for Janus](./tutorials/SreExtension.html)
* Official Janus Extensions:
  * [Connecting Janus nodes over a computer network](./tools/JanusNetworkExtension.html)
* Command-line Tools:
  * [janus](./tools/Janus.html): launching SARL agents with the Janus platform.
  * [janusnode](./tools/Janusnode.html): launching SARL agents with the Janus platform over a computer network.

## 8. Other Tools

### 8.1. Syntax Highlightning

* [Syntax highlighting styles for SARL inside other tools](./tools/SyntaxHighlightning.html)

### 8.2. Apache Maven

* [maven-sarl-plugin](./tools/MavenSarlPlugin.html): the Maven plugin for the SARL compiler.

### 8.3. Command Line Tools

* [sarlc](./tools/Sarlc.html): command-line SARL compiler.
* [sarldoc](./tools/Sarldoc.html): command-line SARL documentation generator.

## 9. Documentation Format

* [Specific Markdown format for the documentation](./DocumentationContribution.html)


## 10. Legal Notice

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.14
* Status: Draft Release
* Release: 2023-09-26

> Copyright &copy; 2014-2023 [SARL.io, the Original Authors and Main Authors](https://www.sarl.io/about/index.html).
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

<small>Generated with the translator docs.generator 0.14.0-SNAPSHOT.</small>
