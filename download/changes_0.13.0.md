---
layout: default
title: Changes in 0.13.0
---

# Changes in 0.13.0

Release date: 2023-09-19.

## 1. Major Changes

Number of major changes: 3

### 1.1. Transition from Java 8 to Java 17

Since the beginning of its life, SARL supports version 8 of Java.
However, Java has considerably evolved during the past decade; And the lastest long-time-support version of Java is 17.
New features have been added and enhancements have been made since Java 8.
These features and enhancements improve startup, performance, memory usage, and provide better integration with containers.
Moreover, the recent tools such as Eclipse and Xtext require to use at least the version 17 of Java to have benefits of the feature enhancements and bug fixes.

Consequently, the SARL development team as decided in 2021 to apply to SARL a transition from Java 8 to Java 17.
Moving from Java 8 to Java 17 was a significant amount of work (approximatively 18 months) and will apply major changes in all the SARL projects.

**Version 0.13.0 requires Java 17 as a minimum requirement.**

**Many the modules and artifacts of SARL have change of their names to obtain a unified naming convention that is also compatible with those that must be used for Java modules.**

Details: [[1](http://sarl.io/sarl/sarl/commit/079af872c0c1f8f063c0925a629bf96177386e78), [2](http://sarl.io/sarl/sarl/commit/b2cb9bd8a27a7f49712f82f76ec814b66784d408), [3](http://sarl.io/sarl/sarl/commit/3170b8426f0949938711df74ced0da4936b576ed), [4](http://sarl.io/sarl/sarl/commit/8ac12eb1f94eedfdca3c86de1c517752ff08e6df), [5](http://sarl.io/sarl/sarl/commit/5f2a09a6a631b10968e34e518d94ee768f1cca48), [6](http://sarl.io/sarl/sarl/commit/708960de1ad87f18698b7427a051bcaf1d7a80fe), [7](http://sarl.io/sarl/sarl/commit/ea2f6bf8e0aa054f7a90e2dec259274c3e5b9862), [8](http://sarl.io/sarl/sarl/commit/38a48bf4ce9c3e24c2e29c3a5de99b803d08b3b2), [9](http://sarl.io/sarl/sarl/commit/2c037bbc9f574ccbae0984203681096909d51db8)].


### 1.2. Novel SARL Project Structure

Since few years, contributors to SARL notify the high complexity of the SARL project structure.
It was almost impossible to compile a sub-project of SARL without downloading and compiling all the sub-projects.

The transition from Java 8 to Java 17 gives us the opportunity to rethink the structure of the SARL project and its sub-projects.
There is not any more a single project for all SARL (with its associated root pom file).
The SARL project is splitted into different sub-projects that may be compiled independently.
Each project is dedicated to a specific set of features and tools. These sub-projects are:

* [sarl-bom](https://github.com/sarl/sarl/tree/master/sarl-bom): Provide the Build-of-Material, i.e., a shared list of Maven dependency, for all the SARL sub-projects;
* [sarl-baseutils](https://github.com/sarl/sarl/tree/master/sarl-baseutils): Set of Maven artifacts that are independent of SARL but needed to build the SARL artifacts;
* [sarl-lang](https://github.com/sarl/sarl/tree/master/sarl-lang): Provides the language definition, the associated compiler (including the Maven plugin) and code formatting styles for different text editors;
* [sarl-sdk](https://github.com/sarl/sarl/tree/master/sarl-sdk): Set of Maven artifacts that constitute the SDK for all the SARL developers;
* [sarl-apputils](https://github.com/sarl/sarl/tree/master/sarl-apputils): Shared projects for building applications that are using a SARL compiler;
* [sarl-sre](https://github.com/sarl/sarl/tree/master/sarl-sdk): SARL runtime environment (or SARL virtual machine);
* [sarl-docs](https://github.com/sarl/sarl/tree/master/sarl-docs): Tools and Doclet for the generation of the documentation, including the API documentation pages;
* [sarl-cli](https://github.com/sarl/sarl/tree/master/sarl-cli): Set of command-line tools (sarlc, sarldoc, janus...);
* [sarl-eclipse](https://github.com/sarl/sarl/tree/master/sarl-eclipse): Eclipse-based editor for SARL;
* [sarl-officialdoc](https://github.com/sarl/sarl/tree/master/sarl-officialdoc): Markdown files of the official documentation of SARL.

### 1.3. Integration of a Goal-oriented Behavior in the SARL API

The SARL Standard Development Kit (SDK) includes a novel API dedicated to time-based goal-oriented behaviors.
Goal-Oriented Behavior (GOB) is a general term that covers any technique taking into account goals of the agents.
GOB is not supported by a single technique.
This new feature of the SARL API corresponds to a standard GOB that is used in video game applications.
This API equips the agents with an action selection mechanism to select the best action to be realized for archieving one of the agent goals.

Documentation: [SARL website](http://www.sarl.io/docs/official/reference/gob/Gob.html)


## 2. Detailed Changes

### 2.1. SARL Language

#### 2.1.1. SARL Language and Grammar

* Enable the `static` modifier for the members of agent-oriented type declarations. [[more details](http://sarl.io/sarl/sarl/commit/9af132e078d6be1aa0226edf3b81bed868298801)]
* Add automatic variable converters from `Object` type to base/native types. [[more details](http://sarl.io/sarl/sarl/commit/00698d4771147d5d1dcce6c22970c86f5b990d00)]

#### 2.1.2. SARL Validator

* When the unary minus operator and a call to an extension method are used in the same expression, the operational semantic of this expression may be not the one expected by the developper, e.g., `-2.abs`. In the example, according to the priorities of the SARL operators, it must be interpreted as `-abs(2) == -2`. However, some developper could misinterpret this expression as `abs(-2) == 2`. When this type of expression is found in the code, the SARL compiler generates a warning to notify the deveopper that he/she may have not coded the correct expression. [[more details](http://sarl.io/sarl/sarl/commit/b2fe5288671aeb26c063e2b8c2100d3ae8ebcbdf)]

#### 2.1.3. Java Model Inferrer

* The detector of pure functions that is embedded in SARL may cause a stack-overflow error when it is analysis a recursive function. The code of the detector was rewritten to avoid this error. [[more details](http://sarl.io/sarl/sarl/commit/521947a7d0618a75f688ff601e790f44b22d4519)]
* Several null-pointer exception were fixed in the SARL compiler. [[1](http://sarl.io/sarl/sarl/commit/51ed8bbfbc48a7c6933e751af19b69f7be62cc4a), [more details](http://sarl.io/sarl/sarl/commit/362ec750fc1e653a5caa4cbab8734192aab4ab7f), [3](http://sarl.io/sarl/sarl/commit/2aa42acc2e089158c220dcb69889ba3fbd7939a3), [4](http://sarl.io/sarl/sarl/commit/1ec99f928d453fffa74c681a1808aa68ba40712c)]
* Do not generate import statements for types that are declared in the default package. [[more details](http://sarl.io/sarl/sarl/commit/f094ad531a7141c67ba7df69a3d60bdf386b5c0a)]

#### 2.1.4. SARL Batch Compiler

* Add an option for converting the warnings to errors. [[more details](http://sarl.io/sarl/sarl/commit/df805b7e4b6410ac1542e47bb7d04c334891853f)]

### 2.2. SARL Development Toolkit (SDK)

* Add in the SARL API an implementation of the time-based goal-oriented behavior that is used in video games. [[more details](http://sarl.io/sarl/sarl/commit/873886e5b1311902c7f478d15dd68578a785c3d7)]

### 2.3. SARL User Interface

#### 2.3.1. Eclipse Products

* Fixing the classpath containers of SARL and Janus for devel and release versions of the IDE. [[more details](http://sarl.io/sarl/sarl/commit/85a1342a7d1d20ee539fb1814b2d1154f5d7c2c0)]

##### 2.3.2. Maven Integration in Eclipse

* Fixing the m2e configurator to properly set the classpath for a SARL project. [[more details](http://sarl.io/sarl/sarl/commit/f4a0dcd67f025dde0b66a9ce523b93f432232d57)]
* Integration tests are usually coded in the source folder `src/it`. These folders are now supported by the SARL m2e plugin and automatically created. [[more details](http://sarl.io/sarl/sarl/commit/6d8454793334168fabbfdae53919486be5924f66)]

##### 2.3.3. Launching Configurations

* Ensure that the classpaths that are used for launching an application in the Eclipse IDE contain unique bundle entries. [[more details](http://sarl.io/sarl/sarl/commit/bf61181a4e9fae33b8634e4fa32216a5107a3643)]

##### 2.3.4. Preferences

* When the SRE is preinstalled in the Eclipse IDE (as it is the case for Janus), the property page associated to this SRE must not allow to change the name and location of the SRE. A read-only editing page for the preinstalled SRE's properties has been included in the Eclipse products. [[more details](http://sarl.io/sarl/sarl/commit/266b5c06e1dc8565c5084bc5ad62a270a712091c)]
* When the page for editing the SRE properties cannot be created, an error message is shown in a dialog box. [[more details](http://sarl.io/sarl/sarl/commit/fe4a880c6e0624be977b2067f2bd86ed3d1628f5)]

##### 2.3.5. Wizards

* In the dialog box that permits to create a SARL Maven project, the box "Create simple Maven project" is now selected by default. [[more details](http://sarl.io/sarl/sarl/commit/43e5f8d2d8ed107461782892662804cdc765d809)]
* When a SARL Maven project is created, the wizard creates by default the all folders for SARL code. [[more details](http://sarl.io/sarl/sarl/commit/274860efcdccb5c6f4fb3f4800fd0d04b77eb6ae)]

##### 2.3.6. Other UI Components

* The Xtext editor that is used for editing SARL code is extended to avoid null-pointer exception and the loose of the link between the SARL file and the editor. [[1](http://sarl.io/sarl/sarl/commit/0c7bdc5577a4bb5f417d189a789169ed08fbb102), [2](http://sarl.io/sarl/sarl/commit/fca1921a239284736399b34d21a905ac9840e365)]
* Fixing the condition for enabling the popup-menu action dedicated to the transformation of a regular SARL project to SARL Maven project. [[more details](http://sarl.io/sarl/sarl/commit/f2ad4d771f642afda0e794ece528d0f7c3c8cf67)]
* The Java package explorer is located in the bottom panel. [[more details](http://sarl.io/sarl/sarl/commit/3122c1c76e16f469ccc6fbbdbde52aed105db05c)]
* Add onboarding images in SARL perspectives. [[1](http://sarl.io/sarl/sarl/commit/9ae9702068576257f3b280fc572d51c401124e4c), [2](http://sarl.io/sarl/sarl/commit/0ee5d5885229eca591983e6b605e71568bb84fc1)]

### 2.4. External Contributions to SARL

* An example of the usage of the new API dedicated to time-based goal-oriented behavior is introduced. [[more details](http://sarl.io/sarl/sarl/commit/a4fdc1cabea3258e0afe00f3de39ce39b9806655)]

### 2.5. Janus Run-time Environment

* Replace the Google Service Manager by a specific service manager. The Google Service Manager launches the services asynchronously with a thread that is not marked as daemon. This thread avoids the SRE to stop its run when no more agent is alive. For solving this problem, a simple service manager is implemented in the Janus SRE [[more details](http://sarl.io/sarl/sarl/commit/6e21380804dc1d46e419394b96c500c3d73e93e1)]

### 2.6. Maven Tools

* The `sarl-maven-plugin` is printing out a warning message when it does not detect a SRE inthe project classpath. This message notifies the developper that it is necessary to use a specific tool for launching the SARL program, e.g. `janus` or a launch configuration the Eclipse product. [[more details](http://sarl.io/sarl/sarl/commit/acd8ca32c882c7cb89454c298b25acdf4e99253f)]
* Add an option for converting the warnings to errors. [[more details](http://sarl.io/sarl/sarl/commit/df805b7e4b6410ac1542e47bb7d04c334891853f)]

### 2.7. Command-Line Tools

#### 2.7.1. sarlc

* Add current directory in the default classpath of `sarlc`. [[more details](http://sarl.io/sarl/sarl/commit/27a01163fe127f93c16b5c286391d9b972db7d72)]
* Add an option for converting the warnings to errors. [[more details](http://sarl.io/sarl/sarl/commit/df805b7e4b6410ac1542e47bb7d04c334891853f)]

#### 2.7.2. sarldoc

* Add current directory in the default classpath of `sarldoc`. [[more details](http://sarl.io/sarl/sarl/commit/27a01163fe127f93c16b5c286391d9b972db7d72)]

#### 2.7.3. janus

* Add current directory in the default classpath of `janus` and `janusnode`. [[more details](http://sarl.io/sarl/sarl/commit/27a01163fe127f93c16b5c286391d9b972db7d72)]

### 2.8. SARL Documentation

#### 2.8.1. Documentation of the SARL SDK

* Add a reference documentation for the time-based goal-oriented behavior that is usually used in video game agents. [[more details](http://sarl.io/sarl/sarl/commit/ebdbd13393a9f2a7ffa1898251e78ddfaad908b8)]

#### 2.8.2. Documentation of tutorials

* Add tutorial for creating a runnable file for SARL application. [[more details](http://sarl.io/sarl/sarl/commit/a755b1331ba7e264e25d0908cbfa318fe0ee3f81)]
* Add a tutorial for creating an agent that is deciding of the next actions using a time-based goal-oriented behavior. [[more details](http://sarl.io/sarl/sarl/commit/ebdbd13393a9f2a7ffa1898251e78ddfaad908b8)]

#### 2.8.3. FAQ

* Update the FAQ for fixing the starting issue of the SARL product on MacOS. [[more details](http://sarl.io/sarl/sarl/commit/f61b623555e532aae03f031da3d798d37b5eef1b)]

#### 2.8.4. Documentation Generators

* Fixing the SARL doclet for being used on Java 17 platform. [[1](http://sarl.io/sarl/sarl/commit/4bebc5bcb4c11601b20341e4942015823fc5e162), [2](http://sarl.io/sarl/sarl/commit/a2d3601e9b3eabcf2152caf9767cff030cf978c5)]

### 2.9. Tools for SARL Contributors

* The new Eclipse plugin developement framework, and Tycho, now enable the directly include Maven artifacts in the target platform. This feature allows to avoid the create of specific P2 repositories for artifacts that are not bundlified. The SARL P2 repository will disappear in short time. [[more details](http://sarl.io/sarl/sarl/commit/89cb5a71be7bfb5012550375a6afb38e33be5e6b)]
* Add a specific product for SARL contributors. This products includes standard SARL IDE, Eclipse RCP and Eclipse DSL tools. [[1](http://sarl.io/sarl/sarl/commit/e69376bb4e29c6d6aea5d11550fae80ecb21e0b6), [2](http://sarl.io/sarl/sarl/commit/4978435f53c794e69d64393ca345c07f03f5fe57)]
* With the introduction of the BOM project for SARL, all the constants accross the SARL projects becomes unified. They are used by Maven for injecting the values in the code or property files. [[1](http://sarl.io/sarl/sarl/commit/d9fa6dca1f046f2beaacd6c9a8e772eef1f597c3), [more details](http://sarl.io/sarl/sarl/commit/56ae854f7694ec54ad9e77e53825003b1d0c3dc5)]
* Write the information arguments (since, isRemoval) for all the `Deprecated` annotations. These information arguments were introducted in recent Java API. [[1](http://sarl.io/sarl/sarl/commit/15f6a6383a56c8287073689b56270ccdeef9629d), [2](http://sarl.io/sarl/sarl/commit/8441b769ca0ac798356a6ff9e7bf50802f4f1755)]
* Replace the use of the Maven plugin `maven-bundle-plugin` by `bnd-maven-plugin`. The first plugin is no more maintained. The second plugin provides more configurations features than the first plugin. [[more details](http://sarl.io/sarl/sarl/commit/f218de07848b64047ce6524daf0fff696bf18df4)]
* Upgrade major libraries:
  * Eclipse 2023-06.
  * Xtext 2.31.0.
  * Maven 3.9.4. [[more details](http://sarl.io/sarl/sarl/commit/80eacd2cf871565768398cbb58c3d181b240746f)]
  * Guice 5.1. [[more details](http://sarl.io/sarl/sarl/commit/cc1f62abe8452e8ab0739d46e53373c61d38413a)]
  * Guava to 32.1. [[more details](http://sarl.io/sarl/sarl/commit/ea6c472edd8c43ba955dbae071a6e06f3e98720f)]

## 3. Changes in the Previous Versions

* [Changes in the version 0.12.0](./changes_0.12.0.html)

