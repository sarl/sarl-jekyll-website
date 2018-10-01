---
layout: default
title: Changes in 0.8.2
---

# Changes in 0.8.2

Release date: 2018-10-01.

## 1. SARL Language

* In synthetic functions that are generated for supporting the default valued parameters, the returned type of the automatically generated functions delegate to the original (typed by the SARL developer) function's return type when this return type is inferred from the context. ([details](http://github.com/sarl/sarl/commit/30421ae95b7efe3e398888fdadd55ccca6172128))

## 2. Eclipse Product

* Fixing the invalid command into the launching script for Ubuntu OS. ([details](http://github.com/sarl/sarl/commit/32a5d65495fd289e41215058ee90dd1063120704))

## 3. Janus Run-time Environment

* Revert Java stream usage in the Event dispatching in AbstractEventSpace. This issue caused events to be never delivered, including the `Initialize` events. ([details](http://github.com/sarl/sarl/commit/658bd4628b09afcb400e31777299ee79b2441c10))
* Ensure an agent killing in "on Initialize" has effects. ([details](http://github.com/sarl/sarl/commit/d44010c16973436378d0a4e936e8a7f3af88a062))
* When the `killMe` function is called multiple times, a debug message is output for notifying that the agent was already killed. In older versions, this state was output into an information message. ([details](http://github.com/sarl/sarl/commit/81bf1af8ae5de010e8df588a6afd2ef1c17f4bd2))



## 4. Changes in the Previous Versions

* [Changes in the version 0.8.1](./changes_0.8.1.html)
* [Changes in the version 0.8.0](./changes_0.8.0.html)
* [Changes in the version 0.7.2](./changes_0.7.2.html)
* [Changes in the version 0.7.1](./changes_0.7.1.html)
* [Changes in the version 0.7.0](./changes_0.7.0.html)

