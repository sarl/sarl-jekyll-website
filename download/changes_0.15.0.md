---
layout: default
title: Changes in 0.15.0
---

# Changes in 0.15.0

Release date: 2025-09-09.

## Major Changes

Number of major changes: 4

### Generation of implicit event constructors

In SARL, events are fundamental constructs for agent communication, often requiring explicit constructor definitions to initialize their fields. Prior to this change, developers had to manually define constructors for every event, even when the event's structure was simple or followed a predictable pattern. This manual process introduced several inefficiencies:

* Repetitive constructor definitions for events with standard field initializations.
* Manual constructor writing increased the risk of inconsistencies or omissions, especially in large codebases.
* Developers spent unnecessary time on repetitive tasks, detracting from core logic implementation.

To streamline event definition and improve developer productivity, SARL introduced automatic constructor generation for events. This feature:

* Infers Constructors from Field Declarations:

The compiler automatically generates constructors based on an event's declared fields, eliminating the need for manual implementation.
Example:

```sarl
event MyEvent {
	var description : String
	var payload : double
}
```

The SARL compiler now automatically generates constructors that are equivalent to the following SARL code:

```sarl
event MyEvent {
	var description : String
	var payload : double
	new (description : String = null, payload : double = 0.0) {
		this.description = description
		this.payload = payload
	}
}
```


### Space API outside the Janus SRE

In earlier versions of SARL, the Space Implementation API was tightly coupled with the Janus SRE (SARL Runtime Environment). This design choice introduced several limitations:

* The API's integration within SRE-specific code restricted its reusability in alternative runtime environments or custom implementations.
* Developers could not leverage the Space API independently of SRE, limiting the portability of agent-based systems.
* Changes to the SRE could inadvertently affect the Space API, complicating updates and extensions.

These constraints hindered SARL's goal of providing a generic, modular, and runtime-agnostic agent programming framework.
To address these issues, the Space Implementation API was moved from the SRE codebase to the SARL SDK.
The Space API is now part of the SARL standard library, making it independent of any specific runtime environment.
The API was redesigned to rely on abstract interfaces and runtime-agnostic contracts, ensuring compatibility with any SARL-compliant environment. Key abstractions, such as Space and SpaceSpecification, are now defined in the SARL SDK, while concrete implementations (e.g., SRE-based) are provided as plugins or extensions.

Existing SRE-based applications continue to function seamlessly, as the SRE now implements the generic Space API rather than defining it.


### Library for creating agent working memory

Agent-based systems often require temporary storage and efficient manipulation of data during their execution, particularly for tasks such as reasoning, decision-making, or maintaining contextual state.
Prior to this change, SARL lacked built-in utilities for managing such short-term data structures. Developers had to rely on ad-hoc solutions—such as custom collections or external libraries.

SARL 0.15 introduced a simple "working memory" utility toolset. The working memory utilities are directly accessible within agent behaviors with the `WorkingMemory` capacity, enabling seamless interaction with other SARL constructs. A default skill is provided for implementing the `WorkingMemory` capacity based on data structure that maps knowledge names (or identifiers) to their values.


### Robust Type Checker for Type Parameters

SARL supports generic constructs, such as parameterized events, to enable flexible and reusable agent-based systems. However, prior to the recent update, SARL's type checking mechanism—built on the Xtext framework—lacked robust validation for type parameter conformance. This limitation led to several challenges:

* Insufficient compile-time validation of type parameters could result in undetected type mismatches, manifesting as runtime exceptions.
* Developers could not fully leverage advanced generic programming features, such as bounded polymorphism or variance annotations, due to the absence of a dedicated type conformance checker.

To overcome these limitations, SARL implemented a dedicated type checker that builds upon the existing Xtext framework. This enhanced checker ensures that generic type arguments adhere to their specified bounds (for example, `T extends Number`). Additionally, it validates conformance in subtype hierarchies and enforces correct type relationships within inheritance chains and interface implementations, including complex scenarios.


## Detailed Changes

### 1. SARL Language

#### 1.1. SARL Language and Grammar

* Add the automatic generation of events' constructors. [[more details](https://github.com/sarl/sarl/commit/afb20ea576f7cccb510fdb4efc51a701e30a6bbf)]
* Accept different syntaxes for the specification of a main function in a class. [[more details](https://github.com/sarl/sarl/commit/3ed2e4b3d18125fb00f9a493b376fac4d4c81ed5)]
* Remove references to protocol features in the SARL metamodel. [[1](https://github.com/sarl/sarl/commit/0c8cdb38dd2426a0fdcd3b82830c1c02142c8a46), [2](https://github.com/sarl/sarl/commit/4bbfbe3cf3c848213bed6631e43421a09863de4e), [3](https://github.com/sarl/sarl/commit/b8a9fff6794d078933bcd1899058b6773e3b9daf)]

#### 1.2. SARL Validator

* Implementation of a robust type checker for type parameters' conformance. [[more details](https://github.com/sarl/sarl/commit/271cda14b1b351034046f74c7c118e8d3a9cde98)]
* Ensure singleton for the provider of configurable issue severities. [[more details](https://github.com/sarl/sarl/commit/53e132df3ec2754042046cd2cd72e0f853fd4b87)]

#### 1.3. Java Model Inferrer

* Enable the generation of multiple Java files from a single SARL construct. [[more details](https://github.com/sarl/sarl/commit/54b43e718fadfb3445d83b28fc9fa1c1b4797039)]
* Introduce fragments in the code of the `JvmModelInferrer` for enabling eaiser extension and specialization of the inferring process. [[1](https://github.com/sarl/sarl/commit/bc7880f8b0d605526eb50cf5999fe80c6c9b3a66), [2](https://github.com/sarl/sarl/commit/b720de66bca33ad56e7431ccaae29339955d4a99)]
* Avoid Null Pointer Exception when the supertype of a event in unspecified in the compiled code. [[more details](https://github.com/sarl/sarl/commit/df269b82cc0e4cffd1ed1bf1fc3afad67cf85742)]

#### 1.4. Programmatic Code Builder

* Code builder includes new function that take JVM type references as arguments in addition to the String names. [[more details](https://github.com/sarl/sarl/commit/d31f1a35a0cd0d0368c34bcec4d91ec23d449a7d)]
* Regenerate the code builders for SARL for fixing the support of type parameters. [[1](https://github.com/sarl/sarl/commit/e2f8dc29cfe161f216f5a0717f40eb1c2be66536), [2](https://github.com/sarl/sarl/commit/c25ad70ed18a9a6d5066bec4d9322f66dff1455a)]
* Avoid to create multiple `XBlockExpression` when calling the getter function of the code builder. [[more details](https://github.com/sarl/sarl/commit/07f3ec5c3ea2b39e6d6fd378755cbd7e556f0d93)]
* Avoid NPE when retreiving the resource from an expression builder. [[more details](https://github.com/sarl/sarl/commit/2fa0b810793df2e243f38abf10089c762eb69474)]
* Add tests of the support of type parameters by the code builders [[more details](https://github.com/sarl/sarl/commit/ba4a8e7880d660108cbdf932021c2344f9a60172)]

#### 1.5. Third-party Syntax Color Style

* Add configuration expansion macros in the SARL's TeX style for specifying font size of the SARL code. [[more details](https://github.com/sarl/sarl/commit/d42864890b81124182b94a62259686455fb8a063)]

### 2. SARL Development Toolkit (SDK)

* Add the library for creating an agent "working memory". [[more details](https://github.com/sarl/sarl/commit/fba9336537ef0032548c0a3e83b98a0cf6137700)]
* Move the space implementation API from the SRE code to the SARL API to be more generic and SRE-independent. [[1](https://github.com/sarl/sarl/commit/93f49ca27abcc1e4ebd7c54fcbc06a674955e186), [2](https://github.com/sarl/sarl/commit/2eed39ad06649be4b40f9f3094f7a2e015297235)]
* Add the function `injectMembers(Object)` in the `SRE` utility class to enable to inject the SRE-dependent objects. [[more details](https://github.com/sarl/sarl/commit/5bfb53ffd21241a6af8e6a34dd6d9bc43390a779)]
* Add the class `MutableOptional`. [[more details](https://github.com/sarl/sarl/commit/e6bae4e68d25cde59f7abfb4ec3c68f3895f59d2)]

#### 3. Eclipse Products

* Avoid duplicate source folders when SARL and project extension have the same folders. [[more details](https://github.com/sarl/sarl/commit/33163a21fc77b2c4d5a8e3c3d6f75d81306a7682)]
* Decrease the memory footprint for the SARL image provider. [[more details](https://github.com/sarl/sarl/commit/473df66ae69ea6689e8c374b1afb97202c4f5115)]
* Fixing the implementation type of the default SARL editor in the plugin definition. [[more details](https://github.com/sarl/sarl/commit/0edede757389ed2588d0760fafcf02124c302ae7)]
* Remove uncessary event constructors from the embedded examples. [[more details](https://github.com/sarl/sarl/commit/8c3c1d551249ad59d19152d32f6f76f595277ea4)]
* Remove references to protocol features in the standard SARL UI and Eclipse plugins. [[1](https://github.com/sarl/sarl/commit/4bbfbe3cf3c848213bed6631e43421a09863de4e), [2](https://github.com/sarl/sarl/commit/b8a9fff6794d078933bcd1899058b6773e3b9daf)]
* Use of the new code builder API in the Eclipse wizard when generating SARL files. [[more details](https://github.com/sarl/sarl/commit/e5eb86699a35b289566e29ebd303fb77ba151236)]
* Disable the warning related to the usage of javax inject annotations. [[more details](https://github.com/sarl/sarl/commit/97fccec08c6415aa288344db98f289c91e681883)]

### 4. Janus Run-time Environment

* Add the function `injectMembers(Object)` in the `SRE` utility class to enable to inject the SRE-dependent objects. [[more details](https://github.com/sarl/sarl/commit/5bfb53ffd21241a6af8e6a34dd6d9bc43390a779)]
* Upgrade to Bootique 3.0-RC1. [[more details](https://github.com/sarl/sarl/commit/7ab9e1b9fbbdd3f1f0256f0dd74e3bac49374cfe)]
* Fixing the name of the integration tests in the code repository. [[more details](https://github.com/sarl/sarl/commit/689817897222c0c1eb27463a71e4830fff8ded7a)]

### 5. Maven Compiler Plugin

* Add a configuration parameter in the Maven compiler plugin for specifying the issue severities in the POM file. [[more details](https://github.com/sarl/sarl/commit/7816fe0a73d406a21339493aa67f19e931ebee4c)]

### 6. SARL Documentation

* Refactoring of the structure of the official documentation for making it easier to read. [[1](https://github.com/sarl/sarl/commit/225a2ac58ed663a5c3d81990460ce5fc8bc17524), [2](https://github.com/sarl/sarl/commit/83da817d85db60548f3df1f0ba6eef0ed0f53314)]
* Extension of the documentation of the keywords `this`, `super`, `it` and `occurrence`. [[more details](https://github.com/sarl/sarl/commit/090b4739ba72c91359e4ab2f782933e975555052)]
* Update the documentation related to the automatic generation of the event constructors. [[more details](https://github.com/sarl/sarl/commit/df127814ddfb4cb42ba0848b4da2ec95a3224a73)]

### 7. For SARL Contributors

* Upgrade major libraries:
  * Eclipse 2025-09. [[more details](https://github.com/sarl/sarl/commit/bdf5d65d2ba10557024993b9866df56cd7995bc2)]
  * Xtext 2.40.0. [[more details](https://github.com/sarl/sarl/commit/bdf5d65d2ba10557024993b9866df56cd7995bc2)]
  * Maven 3.9.11.
* Create the `uiextensions` and `eclipseextensions` modules for helping the extension of the SARL IDE by third-party modules. [[1](https://github.com/sarl/sarl/commit/7809fabf53dd8a8d0df5fda3b9266b9b23125573), [2](https://github.com/sarl/sarl/commit/661fd25d1646051367ba6a27907f72afc953bc37)]
* Add `fileGen` functions in the testing API for SARL projects. These functions enables to obtain an `EObject` instance from a SARL code. [[more details](https://github.com/sarl/sarl/commit/c39c6e55ac626d8be86dd0eae0ee7c9ec19e04f2)]
* Fixing unit tests in the compiler module because of the upgrade of the version of Jupiter Junit. [[more details](https://github.com/sarl/sarl/commit/6da1032bb16f261682446cf3119c1b58b7ffd7d9)]
* Fixing variable definition in the developer's launching scripts for the SARL IDE. [[more details](https://github.com/sarl/sarl/commit/0570908a4738b483d3f093db26a6ab9b2b6c1558)]
* Update the versions of the plugins in the Maven extension specifications. [[more details](https://github.com/sarl/sarl/commit/3e60339663dd756471c5ec68064782642ad1d4a2)]
* Change copyrights in file headers. [[1](https://github.com/sarl/sarl/commit/f18ea85c156ba5aaa6cf473063988bcbbdbe6df1), [2](https://github.com/sarl/sarl/commit/5156c538c1c7f0e5c9382dd00daf7a4138ec82a3)]
* Add missed tests for the generic event serialization. [[more details](https://github.com/sarl/sarl/commit/96e4607b08485c5a6fa75433871d1ce8494063f2)]
* Add missed tests for generic event formatting. [[more details](https://github.com/sarl/sarl/commit/8f7f1ae89565d570bc0136f06b0369a1242631de)]
* Fixing invalid carriage-return character for Windows OS. [[more details](https://github.com/sarl/sarl/commit/b8ef0f9fbf17db6373260164ecad8c5f21e830d4)]
* Fixing the deployment configuration. [[more details](https://github.com/sarl/sarl/commit/1e7c88db6e66bcb69e2ca7179d637f8f0a0c931b)]
* Fixing the Powershell script for CI. [[1](https://github.com/sarl/sarl/commit/038d711a70d6433a172f5b9af157ad45370a9637), [2](https://github.com/sarl/sarl/commit/5b8321eda79ba7a022c765aea57b40928437fcd9)]
* Enable CI on multiple OS. [[more details](https://github.com/sarl/sarl/commit/bbfc7c006c77e56efb94b39faae7cad6d1ecdbc0)]

## 8. Changes in the Previous Versions

* [Changes in the version 0.14.0](./changes_0.14.0.html)

