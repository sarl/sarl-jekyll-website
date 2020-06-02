---
layout: default
title: Changes in 0.11.0
---

# Changes in 0.11.0

Release date: 2020-05-31.

## 1. Major Changes

Number of major changes: 4.

### 1.1. Janus version 3

Janus is the official SARL run-time environment (aka. SARL virtual machine).
This release of SARL provides a **MAJOR NEW IMPLEMENTATION** of Janus with its version **3**.

In the past, the change from version 1 to version 2 was due to a total re-implementation of Janus in order to follow and support the SARL metamodel.
This time, Version 3 of Janus is a total re-implementation with the SARL language, i.e. we have written the code with SARL not anymore with Java.

The major benefits of the new implementation with the SARL language are:
* Direct usage of the SARL concepts and statements;
* Ability to generate the same SRE to different target platforms (Java, Python, etc.);
* Proof-of-concept related to the capabilities of the SARL language to cover complex application's implementation.

In addition to the total re-implementation with SARL language, the software architecture of Janus was re-thinking and optimized in order to improve the global run-time performances of the SRE, and to be more modular in order to extend modules of Janus with new third-party modules (based on Bootique modules).

### 1.2. New types of participants in spaces

From the SARL metamodel, spaces are entities in which the agents are able to interact or communicate.
The agents that are part of a space are named *participants*.

From our experience during the past years, different types of participants may be involved into a space.
First, the agents constitute the largest part of these participants.
Second, external software, such as an graphical user interface (GUI), may have to listen for events or emit them into a space in order to setup an interaction with the agents.

Nevertheless, having only a single type of participant defined causes issues into the SARL run-time environment (SRE) when it is time to decide if a space should be destroyed or not. Indeed, the SRE is in charge of destroying the spaces when they are not used anymore (usually when there is no more agent inside).

A problem occurs when all the agents have leaved the space, and only GUI remain. In this case, the SRE was not able to detect this case and to destroy the space. This issue could be seen because the SRE never stops to run, even when all the agents were killed.

In order to solve this issue, two types of participants are defined:
* **Strong Participant:** it corresponds to the regular meaning of a participant (and the default one). When a strong participant is involved into a space, the SRE cannot destroy the space. Typical strong participants are the application agents.
* **Weak Participant:** it is a participant that is considered as optional by the SRE. In other words, when a space has only weak participants, it is considered as releasable by the SRE. Typical weak participants are GUI objects.

Whatever the type of participant, they have the same level of abilities for using the space. For example, in the case of an event space, the strong and weak participants have all the abilities to emit events, and receive them.

### 1.3. New agent spawning API

The spawning functions of the agents have encountered a big change: they are not replying anymore the unique identifier of the just spawned agents. Now, the spawning functions return `void`.


This change was forced by the need to execute in parallel the different spawning processes when multiple agents are spawned at the same time. In this case, it is almost impossible to retreive the unique identifiers of the agents before returning from the spawning function.

In order to use the unique identifier of the just spawned agent after the call to the spawning function, the new guideline is to generate the identifier, give it to the spawning function, and use it after, as illustrated by the following example:
```sarl
var agentIdentifier = UUID::randomUUID
typeof(MyAgentType).spawnInContextWithID(defaultContext, agentIdentifier)
doSomething(agentIdentifier)
```

### 1.4. New tool for SARL contributors: an Eclipse DSL with embedded SARL

In past, it was not so easy to install and set-up an complete and working development environment for the SARL contributors. It was due to the usage of different technologies such as Eclipse DSL, Java, Maven and Xtext.

In order to have a ready-to-use environment, as much as possible, a specific Eclipse product is now available into the SARL project: `sarl-dsl`.
This new product includes:
* Regular Eclipse framework for domain specific language implementation, that includes:
	* Eclipse environment,
	* Java development environment,
	* Maven integration into Eclipse, and
	* Xtext libraries;
* SARL compiler integration into Eclipse;
* Janus run-time environment;
* Eclipse Checkstyle.

## 2. Detailed Changes

### 2.1. SARL Language

#### 2.1.1. SARL Language Grammar

* Add specific Java cast into the generated Java code for avoiding compilation error ([1](http://github.com/sarl/sarl/commit/88997da0257a5da3ec8987c20f2d8563c3ba9f35), [2](http://github.com/sarl/sarl/commit/22625ed057aa778785bbdebe893390c93c131e43)).
* Remove any reference to Eclipse JDT from `io.sarl.lang` module ([1](http://github.com/sarl/sarl/commit/a91b3de04b9caf10e2ad06cb0b2f001421af8094), [2](http://github.com/sarl/sarl/commit/92af3362657c21bedb011c96839c5d7065cb8a69)).
* Change the generation of `hashCode` and `equals` to avoid null pointer exception when running them into the SRE ([details](http://github.com/sarl/sarl/commit/d678403edbacb94384eb2282659a4b6feed344fe)).

#### 2.1.2. SARL Core Library

* All:
  * Removing all locks and synchronized collections ([1](http://github.com/sarl/sarl/commit/7c2458a65708bbecfb991aa6a19394b6ff7ff6ad), [2](http://github.com/sarl/sarl/commit/7c54888310a2ecffd50996d6c98afa8219340829), [3](http://github.com/sarl/sarl/commit/b91cf33113fa2796f0da1c65ac763509888f61b0), [4](http://github.com/sarl/sarl/commit/f146f5d61240b1f43831742fffca18467a04fe95), [5](http://github.com/sarl/sarl/commit/2431587bebf568bea9fb7df9b650e8bcfe7f6780))
* Spaces:
  * Add the concepts of strong and weak participants into the spaces ([1](http://github.com/sarl/sarl/commit/b092cf4a673676252d6473e354095494038b96cc), [2](http://github.com/sarl/sarl/commit/0b2f660d3b35e87f44c545285f8f0b1b59048ed9), [3](http://github.com/sarl/sarl/commit/0afefb791e7b612fec82bd37c712e27cad169087), [4](http://github.com/sarl/sarl/commit/a17f5203eeedc44c0917b7dcddf26413d0855b89)). Both of these types correspond to participants into a space. When a space has at least one strong participant, it cannot be destroyed and removed from the ststem. When a space has only weak participants, it could be removed from the system. A typical strong participants may be a regular agent. And, a typical weak participants may be an user interface that is interacting with agents.
  * Remove the deprecated spaces implementation ([details](http://github.com/sarl/sarl/commit/e412ee5dca63aa34ddf348cdd44749efa978a2e0)).
* Bootstrap:
  * Add observer on the SRE start and stop ([details](http://github.com/sarl/sarl/commit/bfabc217b8c50683a3f77729eedc6137d97396a9)).
  * Remove the function `getBootAgentId` from the SARL programmatic bootstrap ([details](http://github.com/sarl/sarl/commit/ccc5dfdb16410a88b7d61a9b15e2ef6247751ed4)).
  * Add a timeout parameter to the `shutdown` function of the SRE bootstrap ([details](http://github.com/sarl/sarl/commit/f8c550c0a8f6472f8770f9de96d13d1bc10741e1)).
* Events:
  * Fixing the invalid value for the field `parentContentId` of the `MemberJoined` event ([details](http://github.com/sarl/sarl/commit/1a52e4e5d139d5ea21047083601cbc67a62f6d29)).
  * Fixing the invalid value of the `Memberleft` source ([details](http://github.com/sarl/sarl/commit/272840f37de730a149845b917249c4a6afb08012)).
* Agent:
  * Add the function `setSkillIfAbsent` into the Agent API ([details](http://github.com/sarl/sarl/commit/4979bf258597ed475a8ec8c649a497f59fb00c5e)).
  * When the skill references were cleared from any part of the agent, the `getSkill` function of the
agent does not thrown `UnimplementedCapacityException` exception anymore ([details](http://github.com/sarl/sarl/commit/dbed9270f2430f3c1cd7394db4e508fd18b263d7)).
  * Updating skill management with a conccurent set/queue instead of a non-thread safe implementation ([details](http://github.com/sarl/sarl/commit/62c3b68e50bcffaf80654f700e5fb9bc0b9cb010)).
* Skill:
  * Tuning the skill uninstallation process to prevent null pointer exception ([details](http://github.com/sarl/sarl/commit/1c263c90a3f0b491a5ab8c1754b9d60cf62d9c7b)).
  * Introduce a new class for representing a skill containe, and update the skill lifecycle accordingly ([details](http://github.com/sarl/sarl/commit/1b4089497b7001c6fc0121d7d078a2baae990541)).
* Agent Tasks:
  * Force the agent tasks to have a not-empty name ([details](http://github.com/sarl/sarl/commit/95f73e935b954a06e1234f44d6b0d952f21dc085)).
  * Tuning the `every` tasks stopping process ([details](http://github.com/sarl/sarl/commit/aa2f37987afe854b2415a167fee265c2a64b188f)).
* Address:
  * Rename the field `agentId` to `participantId` into the `Address` class ([details](http://github.com/sarl/sarl/commit/dc92d68230c93e6f79426a7690463a5dbebe03e6)).
* Others:
  * Make as volatile the field that may contain internal SRE data into the `SRESpecificDataContainer` class ([details](http://github.com/sarl/sarl/commit/25a08955b984e9dc38bddbc50917161737d1e16a)). This change enables a better synchronization of the attached SRE data's field when it is accessed from multiple threads.
  * Make the `ClearableReference` atomic ([details](http://github.com/sarl/sarl/commit/74236267f9cd15a00e779700edd330b7153a44b1)).

### 2.2. SARL Development Toolkit (SDK)

#### 2.2.1 Core Library

* Remove the returned addresses from the spawning functions ([details](http://github.com/sarl/sarl/commit/e5b335f9d1fd465c8f63342841391d7573c870b0)). The spawning functions are now returning nothing. It means that it is not any more possible to retrieve the UUID of a just spawned agent from the spawning function itself. A better practise is to computer the UUID before calling the spawning function, and pass the UUID to this function.

#### 2.2.2 Utility Library

* Remove deprecated classes ([details](http://github.com/sarl/sarl/commit/b4f7e0df300ddaeb148c47288379c61e42f507ff)).

### 2.3. SARL User Interface

#### 2.3.1. UI Components

* General:
  * Avoid to reply extra-language output configurations from the project's preferences when the general SARL output configuration is requested ([details](http://github.com/sarl/sarl/commit/c72030808b463e4f89452c50011350767b92d9c7)).

* Module eclipse-slf4j:
  * Create the Eclipse bundle `eclipseslf4j` that provides a correct integration of SLF4J (old API version and new API version) into the Eclipse product ([1](http://github.com/sarl/sarl/commit/4975b32b9ad27dcb2c3cd017be8c8872347d7311), [2](http://github.com/sarl/sarl/commit/a75d2bc159396e2550dc9de00b2dc1e00365a544)).
  * Use the SLF4J API for formatting the messages intead of Java API ([details](http://github.com/sarl/sarl/commit/6b6b3374d22ac2961f018c9d8febf07b3add9856)).

#### 2.3.2. Eclipse Product

##### 2.3.2.1. Launching Configurations

* Rename `StandardSREInstall` to `ManifestBasedSREInstall` ([details](http://github.com/sarl/sarl/commit/e8b297a0fa5f03fe8353c517d4a82d54791aa44b)).
* Update the run configuration in order to show the SRE command line options into the wizard ([details](http://github.com/sarl/sarl/commit/2fecd72a657b55eee31a4e883769b3cff981193e)).

##### 2.3.2.2. UI Components

* Fixing the splash screen ([1](http://github.com/sarl/sarl/commit/9a38f0ba04089f26cdbf72c0f90ec3b1df379ff4), [2](http://github.com/sarl/sarl/commit/b9baea8b0505c8e33f4b2449611137a60b0dbe68), [3](http://github.com/sarl/sarl/commit/828b959bba19b96adb0f78af3a7e81574fb68b20)).

##### 2.3.2.3. Wizards

* New Project:
  * Avoid null pointer exception when creating a new empty project ([details](http://github.com/sarl/sarl/commit/e68f45a23381957b03fd70df5e860d598e974312)).
  * Add support for test generation folder ([details](http://github.com/sarl/sarl/commit/82d98a824316d2904ac171b0211b7e510ce1e8b7)).
* Code templates:
  * Do not add `extends Object` into the class's code template ([details](http://github.com/sarl/sarl/commit/f068c6e7ad7d076e22646148d6bb7fe2d599317a)).
  * Add the function `prepareUnistallation` into the code template of the skills ([details](http://github.com/sarl/sarl/commit/222ea1a556ef5aeaa605e03bad0484108627e263)).
  * Remove 32bit platforms from the template ([details](http://github.com/sarl/sarl/commit/e94efea8954464bcc32ebfc5e0878b2be8b0159f))
* Export to runnable Jar:
  * Restrict the selectable launch configurations to the selected projects when exporting to a SARL runnable JAR ([details](http://github.com/sarl/sarl/commit/d226c5693de61097d39eb58a2bc51005d7f3997c)).
  * Disable the "export into runnable JAR file" for an 'SARL Agent' launch configuration ([details](http://github.com/sarl/sarl/commit/2e33893882008181e59a999068cc1f739e279368)). In other word, it will not be possible to generate a runnable Jar based on the launch configuration of an agent. It is possible to create a runnable jar from a 'SARL Application' launch configuration. 

##### 2.3.2.4. Maven Integration in Eclipse (m2e)

* Support of Eclipse bundles:
  * The m2e connector supports the Eclipse Bundle projects ([details](http://github.com/sarl/sarl/commit/6145c100e213132b3b85796f862c0f0090c40253)).
  * When compiling a SARL project that is also an Eclipse plugin, the m2e plugin should apply a specific compilation sequence to properly compile the project ([details](http://github.com/sarl/sarl/commit/4b533d34d94973060889daf2181d51eee86fadef)).
* Test source code in SARL project:
  * Goal `testCompile` is defined into the Maven plugin for SARL. This goal was missed into the m2e plugin, and it is added by this commit ([1](http://github.com/sarl/sarl/commit/967eff41ca96766ed65ad775043f7881bb6f7491), [2](http://github.com/sarl/sarl/commit/26211983a78cfcb1d1f2c840e776648d2cf508f8)).
* General changes:
  * Rename `StandardSREInstall` to `ManifestBasedSREInstall` ([details](http://github.com/sarl/sarl/commit/e53eab5698d9e2272494e04ed9b00bf513d70ce6)).
  * Change the configuration of the source folders ([1](http://github.com/sarl/sarl/commit/cc98568cf29ceaac592d9f57a809fe1d8e8df066), [2](http://github.com/sarl/sarl/commit/dd0cd89817bced02bff4abb9d19495cdfd7e8b99)).
  * Delete any previous declaration of the source folders prior to its addition into the classpath ([details](http://github.com/sarl/sarl/commit/58df131b4cc7f9e8c0bc636d91e9a3e312b066cd)).

### 2.4. External Contributions to SARL

#### 2.4.1. Examples

* Fixing the syntax errors due to the recent changes in the spawning and space API ([1](http://github.com/sarl/sarl/commit/5f1fef1f66d2f6cf1acf5fdce8b7d71ef741cfe7), [2](http://github.com/sarl/sarl/commit/9bd67df4888d18e779aa967efa4d620989bb814d)).
* Add a test about the specification of the wizard classname into the file `plugin.xml` in order to validate that the provided classname exists ([details](http://github.com/sarl/sarl/commit/5f39b74d074279d4d044a876ddb12ebf57140732)).
* Add the missed injection factory for the Boids example ([details](http://github.com/sarl/sarl/commit/37b946cf2201f0f0213f228ce70fd4c3ab402dc2)).
* Add the launch configuration for the Boids example ([details](http://github.com/sarl/sarl/commit/02b97db4345caaaee07b8a136143971bcbce08fd)).
* Enable compilation on OpenJDK 8 ([details](http://github.com/sarl/sarl/commit/27bd76b78bcc0e83761b5ee3de0388f69e1d679f)).
* Do not specify in hard-coded constant the command line for launching maven tool ([details](http://github.com/sarl/sarl/commit/9752c544391c6577202d57d0122c8cffda62a19b)).
* Sovling the bug in Ping-Pong demo where an event was not correctly sent due to a problem of weak reference ([details](http://github.com/sarl/sarl/commit/4c9d8faa45e6389fa8e724490df5478d0358a1fc)).

#### 2.4.2. Experience Index Plugin

* The project structure of `io.sarl.experienceindex.plugin` is rearrange to fit the SARL standard ([details](http://github.com/sarl/sarl/commit/e7795493995d05c52a676d711f3f84ba1eb341cb)).

### 2.5. Janus Run-time Environment

#### 2.5.1. General

* Janus 3 is released and included into the SARL framework ([1](http://github.com/sarl/sarl/commit/41bb27d78bb031d3da68d31b6bd149b494538fff), [2](http://github.com/sarl/sarl/commit/79d50f2ba5ac8ce6b85976fbc36a2a49f68d3091), [3](http://github.com/sarl/sarl/commit/36a2cfdaa5ab82e868cf7662ac161431fbec4220), [4](http://github.com/sarl/sarl/commit/99056e863711c3898db168f2a22d2117b8bd4851), [5](http://github.com/sarl/sarl/commit/8c9c8ee225d680852b0eede0aae4d3447b53d27d)). Janus 3 is fully implemented in SARL. This new SRE was the result of the redesign of the previous version of Janus in order to obtain better performances and stability.
* Remove references to Hazelcast and ZeroMQ ([details](http://github.com/sarl/sarl/commit/d3152f010ad38237710010da0e8a5f60bcc505cc)).
* New function is provided to shutdown the whole kernel ([details](http://github.com/sarl/sarl/commit/d2827f9c8d83f05d500187dfddae100875db51f9)).

#### 2.5.2. Event Spaces

* Creation of a factory for the space specifications ([details](http://github.com/sarl/sarl/commit/3e4ddfe160a8b7abe9046268f2ad4bd759ac9568)).
* The abstract implementation of the event spaces has been fixed in order to really remove a participant to a space when its event listener is unregistered from the space ([details](http://github.com/sarl/sarl/commit/ee97929ceebb80aa1118611d610366e9cc7b8d90)).
* Ensure that a event listener is not registered as weak and strong participant to a space ([details](http://github.com/sarl/sarl/commit/29ce34edcb80972a581e971704e9881c30be76ef)).
* Add configuration for the space repository ([details](http://github.com/sarl/sarl/commit/10b0cf6f3266913c4581ebb35f887fee5275dd01)).

#### 2.5.3. Events

* Parallel execution of the "on" handlers is now done through the agent's `InternalSchedules` capacity: in `EventBus`, the ad-hoc implementation is replaced by calls to the `executeBlockingTasks` function of `InternalSchedules` capacity ([1](http://github.com/sarl/sarl/commit/53434149c835eaedb651f8b040bbbdf0af3cfb35), [2](http://github.com/sarl/sarl/commit/3bf9858fb41ffb6e75fcc4fea4b996d19218a8e3)).
* Move the guard evaluator into the SRE internal package from the `io.sarl.util` module ([details](http://github.com/sarl/sarl/commit/da632f2197ec7d2d1672b5b77a26a5a8d6a102f1)).
* Correcting the bug preventing `ParticpantLeft` to be fired in the default space of the default context. The particular case of the default space of the default context haven't been managed, since it is the first space created its parent ([1](http://github.com/sarl/sarl/commit/2c49996679f2200ca6b9305981b8db8396fde565), [2](http://github.com/sarl/sarl/commit/7e7a1814978a9f7a648f87ab58c1914425ac4551)).
* Fixing the invalid emitting of `ParticipantJoined` events ([details](http://github.com/sarl/sarl/commit/97a982c32846211684540cddaf27066441cae4c7)).
* Fixing the source of the `MemberLeft` and `MemberJoined` events ([details](http://github.com/sarl/sarl/commit/bf2f41306eae3a2426228b11311c9e79c40ce8f3)).
* Fixing implementation of and calls to `BehaviorGuardEvaluatorRegistry` ([1](http://github.com/sarl/sarl/commit/6fe8ce8d1e32dff822f37264d9f91c64e713a50f), [2](http://github.com/sarl/sarl/commit/7c9044b6b21be44c9bdf91478032b94d4d59f034), [3](http://github.com/sarl/sarl/commit/406a26993b76da954c174631803527ef081ac89c))
* Tuning the function `compareTo` into the `BehaviorGuardEvaluator` and the management of the registry concerning inherited ancestors methods ([details](http://github.com/sarl/sarl/commit/ccd97d242b2d643ecc257786bdb4254b6ed59de3)).
* Fixing the filtering of the event handlers when dispatching events ([details](http://github.com/sarl/sarl/commit/4c0c637302a1794b29cc88aa2bcbd3bc71b62a38)).
* Avoid the use of Java streams for looping ([details](http://github.com/sarl/sarl/commit/fa4e2eaffb264f1dd3813e3ff46e8898fd0d0f24)).

#### 2.5.4. Tasks

* Set the default maximal number of threads to 512 ([details](http://github.com/sarl/sarl/commit/449b50d5c55309274e901514531a8eba06fd645f)).
* `InternalSchedules` capacity provides the `executeBlockingTasks` function ([details](http://github.com/sarl/sarl/commit/613b7b077f2df29dde17cac168135f8f2dd967c0)).
* Changing the conditions to stop a task by testing if the task was registered previously ([details](http://github.com/sarl/sarl/commit/8876b0a962811bb219d460f97a8be2cc3b2f9282)).
* Changing Task ID generation to save performances: Adding a specific uuid generator in place of the standard Java generator because it is too much time costly ([1](http://github.com/sarl/sarl/commit/585ee2f1cc96096fc93bfe8ce4b165cb8db86b50), [2](http://github.com/sarl/sarl/commit/c80f03493e28bd2698f125a61654544d2919cca7), [3](http://github.com/sarl/sarl/commit/3a85195992992860b20a452aaf95273f1c48e4f8)).
* Homogenizing task execution, generalizing the use of SRERunnable ([details](http://github.com/sarl/sarl/commit/1c6aeb16c6e40bc247c0254a154e375138c05191)).
* Removing `ThreadExecutorService`'s purge that was too costly ([details](http://github.com/sarl/sarl/commit/ab07034b7e94b8c50a8beb147c40876e67b143be)).
* Correcting exception management in Janus boot that was preventing some exception to be seen ([details](http://github.com/sarl/sarl/commit/17ed7c8ac4905a8e90485d982861b1054754c03b)).
* Start the thread pool purge depending on the executor configuration when shuting down the executor service ([details](http://github.com/sarl/sarl/commit/0626d3b05b7264ae7efc431863973fbff3b4ea94)).

#### 2.5.5. Skills

* Re-implement `DynamicSkillProvider` classes to create skills and not install them ([details](http://github.com/sarl/sarl/commit/62094f45c9f09803e0b23522c05e8a6b7983187a)).
* Do not uninstall the same skill multiple times when it registered for mutiple capacities ([details](http://github.com/sarl/sarl/commit/6f215c609b95ba2fa466ae4ae53761dcb7d4bcac)).

#### 2.5.6. Agent Lifecycle

* Multiple agent spawning is now run in parallel for each agent ([details](http://github.com/sarl/sarl/commit/355ba422b98a27f9d6257dd4b5316a27d205321f)).
* Avoid null pointer exception on the event bus listener when stoping the agent ([details](http://github.com/sarl/sarl/commit/145ed53d90ee4be99631b52725ff73487595a58c)).
* Schedules and EventBus skills must be released after all the other skills ([details](http://github.com/sarl/sarl/commit/07eb18b357907ac5d2f5bf70f0ea5b53cafc613f)).
* Change the prototype of the protected `spawnAgent` function ([details](http://github.com/sarl/sarl/commit/163ca3cd51760be2dc0b31a0f9b37945c89f42d8)).
* Adding a double lock in agent spawn function. It fixes a bug where the number of effectively spawn agents was different than the number of spawn calls ([details](http://github.com/sarl/sarl/commit/ad2c130e3b30e88b9d2cbce737c39a2e0b4ec35b)).
* Changing weak reference to normal reference in order to avoid null pointer exception: `AgentLife` ([1](http://github.com/sarl/sarl/commit/f0b4141470fe0813022a7872acffa4e357556f77)); `ScheduleSkill` ([2](http://github.com/sarl/sarl/commit/0fa5f0ac1423dce9ca7675b127d3d25da35a13d5)).
* Add the output of warning messages when an agent cannot be killed ([details](http://github.com/sarl/sarl/commit/2efcfbb4c563a146fcea9dfe284c8280d39a65b3)).
* Rearrange the code of the dying stage in order to be consistant with the expected agent state ([details](http://github.com/sarl/sarl/commit/a42cd756b9a702fb9cb5754297f769547255421a)).
* Avoid the skipping of the agent stopping process when an exception occurs in `on Initialize` ([details](http://github.com/sarl/sarl/commit/f960e277e723d97072167027c74daeb32190b72b)).

#### 2.5.7. Probe Service

* Avoid synchronization problems into the probe service ([details](http://github.com/sarl/sarl/commit/e6f274deb4fe3bb691d7a67b7bf4cc588f050564)).
* Avoid NPE in probe service when the agent is not yet alive ([details](http://github.com/sarl/sarl/commit/22d105b922f5addf8f3596415d3d0b859b420198)).
* Add `findObject` functions with string of characters as parameter for representing the URI ([details](http://github.com/sarl/sarl/commit/98db4415d6ceccb809b6dcc11751b55c003dca1f)).

#### 2.5.8. Logging Service

* The SRE loggers are now named ([details](http://github.com/sarl/sarl/commit/46684342d65fc46ebe54ccd9d6dafc2e9bc46b5f)).
* Move all the JUL implementation into a dedicated package ([details](http://github.com/sarl/sarl/commit/4648093066e69a8a33a8a1bfd53f19a43631248a)).
* Rearrange JUL to uses the proper formatting ([details](http://github.com/sarl/sarl/commit/1303e675f0d7393b027c804b3a3ece333f22aed6)).

#### 2.5.9. Infrastructure

* General:
  * Update of the SRE main that was actively waiting the termination of all
running commands before do a system exit. The active wait has been
removed as well as the system exit ([details](http://github.com/sarl/sarl/commit/220785d6a888164cc1864e6185985bf961336694)).
  * Shutdown of the SRE is killing agents asynchronously ([details](http://github.com/sarl/sarl/commit/a210a4487765db4e2ebc755c7e9a1e39e4bec05f)).
  * Add a timeout parameter to the shutdown function of the SRE bootstrap ([details](http://github.com/sarl/sarl/commit/f8c550c0a8f6472f8770f9de96d13d1bc10741e1)).
  * Apply GNU standards regarding the naming of the CLI options ([details](http://github.com/sarl/sarl/commit/16db1b52a2d6bc3192817be6a89678fef946e372)).
  * Add the lifecycle configuration command line option `--Xinjectagents` ([details](http://github.com/sarl/sarl/commit/be6db6a89c8d6d84fd281bf1a9171923e1e757fe)).
  * Provide the Janus command-line options to the Eclipse wizards ([details](http://github.com/sarl/sarl/commit/eb8580301173451649eebc924ba9b210fc3542fe)).
* Windows Operating System:
  * Fixing issue on Windows operating system when there are spaces in the path of the SRE ([details](http://github.com/sarl/sarl/commit/2d3d5196e2cc7043d2802ace4fccaab7ff364724)).
* Networking:
  * A first implementation of the networking module of Janus 3 is added into the source code repository ([1](http://github.com/sarl/sarl/commit/a30b85da6e4d3df01be929f7681ff6e202029cea), [2](http://github.com/sarl/sarl/commit/309d1f14a3ae9ab110ad9c92e926ff9625434207), [3](http://github.com/sarl/sarl/commit/26a5af36f481a6f7ce2841b045bb9fa0398b2fc5)). This module is not yet activated and included into the SARL products because it is still under development and testing.

### 2.6. Maven Tools

#### 2.6.1. SARL Batch Compiler

* Move the batch compiler from the `io.sarl.lang` Eclipse plugin into the `io.sarl.maven.batchcompiler` module. ([1](http://github.com/sarl/sarl/commit/21105ce40a9a69b79130f4a9311aefa041ff8c9d), [2](http://github.com/sarl/sarl/commit/232005be0b8ec971004871b9cf10b79f5ed4d5d1)).

#### 2.6.2. Maven SARL Compiler

* Add the support of the `skip` flag and of the system property `maven.test.skip` in order to enable or disable the tests that were written with SARL ([1](http://github.com/sarl/sarl/commit/84c03d910b032940cbf39d108fc35a7af55277fb), [2](http://github.com/sarl/sarl/commit/24923deb4cf4cf753b57424976a24070b3d0d292)).
* The version of the Maven compiler (linked to Java compiler) is injected from the pom configuration into the Java code of the `maven-sarl-plugin` module ([1](http://github.com/sarl/sarl/commit/3e32d3b5bb1f4395e095d3b36a1396e81349e32b), [2](http://github.com/sarl/sarl/commit/23872aa6811bcbd451b6db1e8add5ca7198ab969)).
* Updating pom file to prevent tycho compiler from being executed before the sarl compilation ([details](http://github.com/sarl/sarl/commit/7915e6f2536c0500702b43e90d69f90c5f90bb7f)).

#### 2.6.3. JavaFX Module

* Enable the JavaFX UI controller to emit an event into the dedicated communication space (between the JavaFX UI and any application agent), and to emit an event into the global communication space (shared by all root agents) ([details](http://github.com/sarl/sarl/commit/e43f9d2a9a2e6185bc430e166b5be42087204d26)).
* Remove the returned addresses from the spawning functions ([details](http://github.com/sarl/sarl/commit/e5b335f9d1fd465c8f63342841391d7573c870b0)).

#### 2.6.4. Bootique Utilities

* Enable the overriding of the bootique "version" command by moving the most usefull peace of code into protected functions ([details](http://github.com/sarl/sarl/commit/39b357814c5a12db3f7b70d2bf8fcb2dad0ae4e1)).

### 2.7. Command-Line Tools

#### 2.7.1 sarlc

* Apply GNU standards regarding the naming of the CLI options ([1](http://github.com/sarl/sarl/commit/28b148d5654dc41337ff9961fd90b45e0b372f97), [2](http://github.com/sarl/sarl/commit/a369f2783decbec9f08af78d2550dbb19a211f09)).
* Force the use of version 2.10 of Jackson lib ([details](http://github.com/sarl/sarl/commit/f2a263e19e821e4e98427b75e0ea9215bc74d23c)).
* Fixing errors in the help text ([details](http://github.com/sarl/sarl/commit/1bea8c6e743a00e43da996827c92bcd7de5d8baf)).

#### 2.7.2 sarldoc

* Fixing errors in the help text ([details](http://github.com/sarl/sarl/commit/6204bfeea75db7fe40532d3cadbbe0a90f6bc24c)).
* Fixing code for passing tests ([details](http://github.com/sarl/sarl/commit/6e1ade9da2ce9f745e0b4e78d4431ba42caa429b)).


#### 2.7.3 VIM Syntax Highlighting

* Add the link to the vim Operator syntax color ([details](http://github.com/sarl/sarl/commit/246cf868a5725c7a638b3c3a2491f0bf53b16742)).

### 2.8. SARL Documentation

#### 2.8.1. Documentation of the SARL Language

* Add the CIAD's CI badge into README file ([details](http://github.com/sarl/sarl/commit/3eaec34634dfc08ef090f2ae41642a1fd5b9560b)).
* Fixing the generation of the Javadoc ([details](http://github.com/sarl/sarl/commit/6ebc3e97f0227fb52381d30f7c113e664ddc9615)).

#### 2.8.2. Documentation of the SARL Core Library

* Fixing the javadoc generation in order to generate it for all the bundles published on Maven Central ([details](http://github.com/sarl/sarl/commit/85dd56cdcc8a21394b24d413346dac08f4fce7e8)).
* Move the properties files within JavaFX Maven project to be included into the Jar file ([details](http://github.com/sarl/sarl/commit/420124b42df6d4a1985aefbb0c92d56b58b69d80)).
* Fixing the code in order to fullfil the changes in the SARL API ([1](http://github.com/sarl/sarl/commit/93bbbd9510358ba8ac49f69d7b39007b59088ba1), [2](http://github.com/sarl/sarl/commit/d2938e19c34047e9ba914efbe6ada8bd82defa96), [3](http://github.com/sarl/sarl/commit/6ac9bd95eebf340bdb642c3ee4ae56310070111e), [4](http://github.com/sarl/sarl/commit/007e574e6beb7dce010e5ccc69826f314e1bd511)).
* Remove the references to the restricted spaces ([details](http://github.com/sarl/sarl/commit/379a3dcd80f73e1af08f5437f2c0d43eb4ebc1c0)).
* Tuning the documentation on the newly introduced concept of weak/strong participants of a space ([details](http://github.com/sarl/sarl/commit/809956f0159ccf22880efac0c842598aba246fc1)).

#### 2.8.3. Documentation of the Janus SRE

* Fixing the documentation of Janus ([details](http://github.com/sarl/sarl/commit/5defeb99e2616032161de4dfec0eea237daa6198)).

#### 2.8.4. Documentation Generators

* Fixing the generation of the section heading keys into the documentation in order to be parsable by a Markdown transcoder ([details](http://github.com/sarl/sarl/commit/271f2019cc5da52635412e76e61086cd58e17123)).
* Update the name of the tests to see the name and path of the tested page ([details](http://github.com/sarl/sarl/commit/7e0e7ba6990325e667f935947b18588c7a2568fd)).

### 2.9. Tools for SARL Contributors

#### 2.9.1. Coding Convention and Changes

* Using `ConcurrentMap` interface instead of its implementation ([details](http://github.com/sarl/sarl/commit/8a0b01720f5618ae06cfce67dac6dde2916d5705)).
* Updating and improving the code of `evaluateGuard` when a single evaluator is present, that represents a lot of cases ([1](http://github.com/sarl/sarl/commit/b0821ec39e8840575fd7aff2524ecfe023907786), [2](http://github.com/sarl/sarl/commit/d48853d5917db29a1946ce41e4b4fa67b0d12805)).
* Converting a weak reference into a normal one into the SRE's `AgentLife` in order to avoid null pointer exception ([details](http://github.com/sarl/sarl/commit/657b711f5f9abe25d9773481181bfa27fff40712)).
* Using the Java path separator instead of an hard-coded `:` when building paths ([details](http://github.com/sarl/sarl/commit/cb768718d3241c489a676b112a71b3fd41866815)).

#### 2.9.2. New Eclipse DSL with embedded SARL

* Create a specific product that is dedicated to the SARL contributors. This Eclipse DSL product for SARL includes Eclipse, Java, Xtext, and SARL ([1](http://github.com/sarl/sarl/commit/d00f8babeffc460514c50e97614077d306951bfd), [2](http://github.com/sarl/sarl/commit/5d671a1d47849cf64f80cd9bdbaabd6c15672fae), [3](http://github.com/sarl/sarl/commit/13dd3ba17584fba5a7e676618d05a88c3db11284), [4](http://github.com/sarl/sarl/commit/54832b808e6e6580b1cc153daf8d2314119a4113))

#### 2.9.3. Regular SARL Eclipse Product
* Remove references to local folders into the templates of Eclipse preferences ([details](http://github.com/sarl/sarl/commit/0c8f0433f47240fe145371ab5bdbba59ddffab72)).
* Removing all the product customizations that were specific to sgalland ([details](http://github.com/sarl/sarl/commit/a12ce55d8651b38325be9bc0b62df22c12dfa2da)).

#### 2.9.4. Generic User Interface

* Re-enable the tests of the formatter's facade ([details](http://github.com/sarl/sarl/commit/2108324d40b06a7a6f959c41b9a74762be0e9af0)).

#### 2.9.5. Tests

* Upgrade JUnit to version 5 ([details](http://github.com/sarl/sarl/commit/ee79f2e97a2a210fc74726e552c98096fca527be)).
* Enable Surefire to display the value of [DisplayName](http://github.com/DisplayName) for tests ([details](http://github.com/sarl/sarl/commit/c9f2c6a56890ca76b7b9d5c47603f1353971bfa6))
* Deep cleaning of the tests ([1](http://github.com/sarl/sarl/commit/282ec38acd6efc379f2b260d21a359ca76684843), [2](http://github.com/sarl/sarl/commit/b878d121a7d25b707fdfdb11e55f2c87362267f1), [3](http://github.com/sarl/sarl/commit/2108324d40b06a7a6f959c41b9a74762be0e9af0), [4](http://github.com/sarl/sarl/commit/39d9367b905f0f7ddb04c7c71b979abb760bc269), [5](http://github.com/sarl/sarl/commit/2bd7e7134cacbe2472266b936a576ddb3866a2aa), [6](http://github.com/sarl/sarl/commit/fe9852641b064e40a203bfed350552451a6e24a0), [7](http://github.com/sarl/sarl/commit/b564fd58ca1d53bc928a9833a0c4e9ea1d94ec33), [8](http://github.com/sarl/sarl/commit/1c0439cebe3bf6ccb8922e251af6b2eea59160af), [9](http://github.com/sarl/sarl/commit/9ca46cf920217a5bcfc6233c4e255b7a236ebba3), [10](http://github.com/sarl/sarl/commit/7df54ad8edcd0479319280588eff9f33de35ec0f), [11](http://github.com/sarl/sarl/commit/fae05665b063ad295809fdb6d75672d71a6d1308), [12](http://github.com/sarl/sarl/commit/4b89ec12df4793c6c27b4a52a74c448ed6894e1f), [13](http://github.com/sarl/sarl/commit/46d3ea45a6fceec48bdea09761250fdae9252066), [14](http://github.com/sarl/sarl/commit/8a5393376163db5e834f3882c811ab8ab8e6e053), [15](http://github.com/sarl/sarl/commit/07d75353e862cb88a7b5eae15ddf6dd220cab99f), [16](http://github.com/sarl/sarl/commit/7342404d845d78fbc7adbc63b6c487c6e53dfaeb), [17](http://github.com/sarl/sarl/commit/6e5de68a5b417c85ee60ad464af2c1501fd4f989), [18](http://github.com/sarl/sarl/commit/72cb4d956065bb8f9ad0764ef23dfdc9aff7750f), [19](http://github.com/sarl/sarl/commit/bcab4881960af369597103578a00a1ee13a14e91), [20](http://github.com/sarl/sarl/commit/c78e23653881299e86e3eeff1220e15a4e459dee), [21](http://github.com/sarl/sarl/commit/ec7245904cbd735865fd3b39940ea55adfe936eb), [22](http://github.com/sarl/sarl/commit/c98990533f4cbb463d2b9a0275a2c0ec044f8db3)).

#### 2.9.6. Continuous Integration
* Fixing the release scripts for CI ([1](http://github.com/sarl/sarl/commit/8b66727c0c1241c37cf8312f89dabc23d79a1478), [2](http://github.com/sarl/sarl/commit/fdfe54bf7bb7ba834a5173d81c5bee00bb951809), [3](http://github.com/sarl/sarl/commit/6cc432883e44cca6f64dd36261a1071599e6638a), [4](http://github.com/sarl/sarl/commit/f0af94d416d1db1e4de45ff946d75f0ee2c6d3cd), [5](http://github.com/sarl/sarl/commit/d3b3863281ade5ca2bd022c7a3f7df020c0b0bc5), [6](http://github.com/sarl/sarl/commit/09000ffe3e48c60104bc02b8a5fa556576587106)).

##### 2.9.7. Dependencies

* Upgrade to Eclipse 2019-12 ([details](http://github.com/sarl/sarl/commit/2233960a010320e9a5eb8d989cdb0b1f46dc8ba9)).
* Remove references to SLF4J when it is not mandatory by code ([details](http://github.com/sarl/sarl/commit/cde1099b9588a5dd2d52ed094c5c4a0266ab9da2)).
* Upgrade to Xtext 2.20 ([details](http://github.com/sarl/sarl/commit/4836e1e33d07b4f4bd72ea7d62445254c389b977)).
* Updating mockito version ([details](http://github.com/sarl/sarl/commit/1b7bfee4b96579ce1da409029ab93e8d3c79e5df)).
* Updating target platform to integrate Janus v3 new p2 dependencies from arakhne ([details](http://github.com/sarl/sarl/commit/2cc74b310e4f943557e3b222fbc8c9f44843cbda)).
* Remove logback dependencies ([1](http://github.com/sarl/sarl/commit/8417e4966eaba73624632a5bd1d2ba29536b0580), [2](http://github.com/sarl/sarl/commit/e8acd9a3c290e3b70fb3db472d57ca0cbdaf143a)).
* Updating dependencies and provided packages ([details](http://github.com/sarl/sarl/commit/00e44f89183613d758925adeef327bee829c655f))
* Updating checkstyle version, config and adapting the code to respect new introduced rules ([details](http://github.com/sarl/sarl/commit/2664f5f41cf35bc5f09f858a1743a4fb2870693c)).

## 3. Changes in the Previous Versions

* [Changes in the version 0.10.1](./changes_0.10.1.html)

