---
title: "Agent-Oriented Programming in SARL"
layout: default
---

# Agent-Oriented Programming in SARL

Agent-Oriented Programming (AOP) is a paradigm that focuses on the development of software systems composed of autonomous, interacting agents. The SARL programming language is designed to facilitate the creation of such systems by providing a robust and expressive syntax for defining agents, their behaviors, interactions, and environments.

This collection of documentation pages serves as a foundational reference for developers and researchers working with SARL. Each document delves into a specific aspect of agent-oriented programming, offering detailed explanations and practical insights into the language's features and capabilities.

## 1. Core Concepts and Features

### 1.1. Agents

Agents are the fundamental building blocks of SARL applications. They encapsulate state, behavior, and communication capabilities, enabling them to act autonomously and interact with other agents or their environment. The [Agent Reference](./Agent.html) document provides a thorough exploration of agent definition, lifecycle, and the mechanisms for agent interaction and coordination.

### 1.2. Behaviors

Behaviors define how agents respond to stimuli, such as events or messages. In SARL, behaviors are modular and can be dynamically added or removed, allowing agents to adapt their actions based on context. The [Behavior Reference](./Behavior.html) document outlines the syntax and semantics of behavior definition, including event handling and action execution.

### 1.3. Capacities and Skills

Capacities and skills extend the functionality of agents by providing reusable and composable units of behavior. Capacities represent high-level abilities, while skills offer specific implementation of capacities. The [Capacity Reference](./Capacity.html) and [Skill Reference](./Skill.html) documents detail how to define, implement, and utilize these constructs to enhance agent capabilities.

#### Built-in Capacities

SARL includes a set of built-in capacities that provide essential functionalities, such as logging, lifecycle management, and interaction with the environment. The [Built-in Capacity Reference](./BIC.html) document offers an overview of these capacities, their usage, and how they can be integrated into agent designs.

### 1.4. Events

Events are the primary mechanism for communication among agents. They can represent external stimuli, internal state changes, or messages from other agents. The [Event Reference](./Event.html) document describes the syntax for defining events, their propagation, and how agents can react to them.

### 1.5. Spaces

Spaces in SARL represent the environments in which agents can communicate. They provide a context for agent interactions, resource sharing, and coordination. The [Space Reference](./Space.html) document explores the definition and management of spaces.

### 1.6. Failure Management

Robustness is a critical aspect of agent-oriented systems, particularly in handling failures and validation errors. The [Management of the Failures and Validation Errors](./Failures.html) document discusses strategies for fault tolerance, error recovery, and the maintenance of system integrity in the face of unexpected events.


## 2. Version Specification

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.15
* Status: Stable Release
* Release: 2025-09-11

## 3. Legal Notice

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
