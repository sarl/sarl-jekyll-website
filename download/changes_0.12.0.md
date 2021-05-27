---
layout: default
title: Changes in 0.12.0
---

# Changes in 0.12.0

Release date: 2021-05-27.

## 1. Major Changes

Number of major changes: 4.

### 1.1. Enable static and instance features in the parameters' default values

SARL allows you to specify a [default value for a formal parameter](http://www.sarl.io/docs/official/reference/general/FuncDecls.html#5-default-value-for-the-formal-parameters) of a function or a constructor.
When a default value is specified, it means that the caller of the action can skip passing a value for the corresponding argument. And, when the function is called, the default value is given to the skipped argument.

Up to the version 0.11 of SARL, the expressions that constitute the default values must reference static or constant expressions, and these features must not have border effect.

Since the version 0.12 of SARL, the first restriction is no more applied. Consequently, the default value expression could reference either static and instance features ([1](http://github.com/sarl/sarl/commit/6dbc11c17be01f4820badb6d6a56bf2e5bfef722), [2](http://github.com/sarl/sarl/commit/706cfa2d90e2c2c736b11bfddb77258a2e674a29)). The constraint on the feature's border effects is still valid.

For example, the following code is valid in SARL:
```sarl
agent A {

	var aField : int

	def aFunction(p : int = aField) {
	}

}
```
It means that the value of the `p` parameter is the value of the `aField` field when the `aFunction` function is invoked.

### 1.2. Add "abstract" into the modifiers for events

The `abstract` modifier is added into the list of the accepted modifiers for a SARL event ([details](http://github.com/sarl/sarl/commit/d2c1402670545a26fe01a7aec17d608437c8bd7c)). For example, the following code defines an abstract event with name `A`:

```sarl
abstract event A
```

An abstract event is an event that cannot be instantiated, but it can be derived. When an abstract event is derived, the subtype usually provides constructors that are compatible with the super type's constructor.

### 1.3. Agent Error Handling

In SARL, as for the [Akka actor framework](https://doc.akka.io/docs/akka/2.5/typed/fault-tolerance.html), there is an important distinction between failures and validation errors:
* A validation error means that the data of a command sent to an agent is not valid, e.g. an unexpected event according to a communication protocol. This should rather be modelled as a part of the agent protocol than make the agent throw exceptions.
* A failure is instead something unexpected or outside the control of the agent itself, for example a database connection that brokes. Opposite to validation errors, it is seldom useful to model such as parts of the protocol as a sending agent very seldom can do anything useful about it.

In order to make the agent able to react to failures, the [SARL API](http://www.sarl.io/docs/official/reference/Failures.html) defines a specific event that is representing any failure or validation error that the agent could handle if it is interested by: `Failure`.
Each time an agent needs to be notified about a fault (into its agent tasks for example), an occurrence of this event type is fired in the internal context of the agent.

Several failure events are pre-defined in the SARL API:

* `AgentKillFailure`: when the agent killing cannot be realized (the major cause of a killing failure is the fact that the agent to be killed contains sub-agents).
* `TaskFailure`: when an agent task (managed by the `Schedules` capacity) has failed.

Also, the `AgentKilled` event has been updated in order to provide the cause of the agent's killing.

Finally, the SARL API provides [tools](http://www.sarl.io/docs/official/reference/Failures.html) for propagating failures in the hierarchy of agents, to the parents and to the children.

### 1.4. Agent Observation and Probing

The multi-agent system is composed of multiple elements, including agents, behaviors, contexts and spaces, but not limited to. Organizational models in multi-agent systems usually position agents as actors-observers within environments shared by multiple agents and organizational structures at different levels of granularity. Then, the agents may have the capacity to observe the environment and the other agents, without directly interacting with them. The observing agent is able to extract information from another agent or from a society of agents, that could be opaque according to a possible holonic architecture of the system.

Observation means that data or information could be extracted from the observed object without filtering from this latter. The observer is not intrusive from the agent point of view. In other words, the observed agent has no knowledge about the fact it is observed or not. In this case, it cannot adapt its behavior on its observation status.

An [observation mecanism](http://www.sarl.io/docs/official/api/Probing.html) was defined into the Janus SRE. Since the version 0.12 of SARL, this observation mecanism is moved into the SARL SDK and transformed as an API that is independent to the SRE ([1](http://github.com/sarl/sarl/commit/bd6f1b4a1745a9adb5dc71221d532d98ed333d1f), [2](http://github.com/sarl/sarl/commit/596873bff5c28c7027f3fdfe719259795ad00103), [3](http://github.com/sarl/sarl/commit/39a4b69081f9745726487a46b9a7289c39522117)).
In the same set of commits, the [naming service](http://www.sarl.io/docs/official/api/Naming.html) for the multiagent system components has been moved from the Janus SRE to the SARL DSK.

Because an agent is defined as an autonomous entity, the agent is supposed to be able to specify if a part of itself is observable or not, i.e. to specify the access rights to its fields.
The concepts of "observable" and "not observable" field are introduced in SARL 0.12 ([1](http://github.com/sarl/sarl/commit/3f302c0bb6d36707877150ad1b0879d7e0a93aed), [2](http://github.com/sarl/sarl/commit/41705d445e56a167289218e320f0dc137916a1cc)).

This [observability flag](http://www.sarl.io/docs/official/api/Naming.html#32-capacity-to-manage-the-access-rights) could be defined statically by annotating the observable field, or one of its enclosing type, with the `@Observable` annotation. The second method is to implement a dedicated agent skill implementing the capacity `FieldAccessValidationCapacity` that enables the agent to manage the access rights to its fields dynamically.

## 2. Other Changes

### 2.1. SARL Programming Language

#### 2.1.1. SARL Language

##### a) Detection of pure functions
* The following function names are considered as standard names for pure functions ([1](http://github.com/sarl/sarl/commit/977c84a4f9fcdee8ae39b08ae204544e6e137023), [2](http://github.com/sarl/sarl/commit/35ade6c23fe481c475ab061dce2d69ea68984256)): `abs`,`acos`, `cos`, `asin`, `sin`, `atan`, `atan2`, `cbrt`, `ceil`, `compare`, `compareTo`, `cosh`, `empty*`, `exp`, `floor`, `hypot`, `log`, `log10`, `log1p`, `max`, `min`, `pow`, `random`, `rint`, `round`, `signum`, `signh`, `sqrt`, `tan`, `tanh`, `ulp`.
* The functions `toString(JsonBuffer)` was marked as pure but it has border effects. The `Pure` annotation is removed from the function ([details](http://github.com/sarl/sarl/commit/f7dfc75ea1755956303db868158e2d8e8815591f)).
  
##### b) Detection of immutable objects
* SARL compiler knows that objects of specific types are immutables, i.e. they cannot be modified. This immutability of objects is used in order to determine if an code expression has border effects or not, and possibly generate an error message when a border effect cannot be accepted.
* The following types have been added into the list of the immutable types ([1](http://github.com/sarl/sarl/commit/c64977457fdc769618faff3647493fe786beba3f), [2](http://github.com/sarl/sarl/commit/4424a12679764e1d1107d45f00d13aca99000bbd)): `Annotation`, `Boolean`, `Byte`, `Character`, `Clock`, `Double`, `Duration`, `Event`, `Float`, `Instant`, `Integer`, `LocalDate`, `LocalDateTime`, `Long`, `MonthDay`, `OffsetDataTime`, `OffsetTime`, `Pair`, `Period`, `Permission`, `Short`, `Year`, `YearMonth`, `ZoneDataTime`, `ZoneId`, `ZoneOffset`.
* Any type that is marked with the `@Data` annotation is implicitly considered as immutable ([details](http://github.com/sarl/sarl/commit/c95009479f26c178d3a8e2f49809a9ff2d719a0f)).

##### c) Automatic object conversions
* An Unique Universal IDentifier (UUID) may be represented by a string of characters or by an instance of the SARL/Java type `UUID`. The SARL compiler is able to do an automatic conversion from a string of characters to `UUID`, and from an `UUID` to a string of characters ([details](http://github.com/sarl/sarl/commit/f669a907199fc6f9b69c04a324059ba1fae07e43)).
* The SARL compiler is able to do an automatic conversion from a string of characters to a number and from a number to a string of characters ([details](http://github.com/sarl/sarl/commit/fbc4001635002ced33b55a84844456a192b426f2)).

##### d) Annotations of code
* Add the annotation `@SarlAsynchronousExecution` into the language API in order to help the SARL editor to show up the calls to functions that are run asynchronously ([details](http://github.com/sarl/sarl/commit/9bbb0ad9fd948220e0a8e7fd5bfafbd88fcf1bc6)). This annotation has no effect at run-time by itself. It is only a marker for the SARL code editing purpose.
* Replace the annotation `@IssueOnCall` by `@ErrorOnCall`, `@WarningOnCall` and `@InfoOnCall` ([details](http://github.com/sarl/sarl/commit/9174118f04f0a158223dca3df5e95c5bc9d9857f)). These annotations are used by the SARL compiler for generating an error, warning or information message when the annoted feature is invoked.

#### 2.1.2. SARL Validator

* Generate an error when a generic-type parameter is hiding another generic-type parameter ([details](http://github.com/sarl/sarl/commit/7e2f2bd82593997e662a8ca69beb87fc7943750e)).
* Do not warn if a called feature on `occurrence` is considered as an immutable object ([details](http://github.com/sarl/sarl/commit/87e699a73d660cb2a54fff359fd2066dd5b96853)).

#### 2.1.3. Java Model Inferrer

##### a) Polymorphic event dispatching
* Event dispatching mechanism is an internal tool that enables to reproduce the operational semantic of the `on` behavior units in a Java program. The original event dispatching mechanism (that becomes the default mechanism) is based on Java reflection. For each `on` behavior unit, an hidden Java method is generated. This method is called by reflection when an event should be dispatched.
* Add a novel event dispatching mechanism based on polymorphic method calls ([details](http://github.com/sarl/sarl/commit/91d72c4d11b2423baf53518632a8df92d99be52a)). Hidden polymorphic functions are generated into the Java code in order to dispatch the event along the full object hierarchy. This new event dispatching mecanism is available into the API and could be activated into the [Janus SRE configuration](http://www.sarl.io/docs/official/tools/Janus.html).
* Add the hidden function '$isSupportedEvent' in the generated Java code ([details](http://github.com/sarl/sarl/commit/c5457d16112022b032fe0fd3b7c58ec7d673df5e)). This function replies if the object contains a behavior unit for the given event that could be invoked with the polymorphic event dispatching mechanism.

##### b) Value casting
* Generate a valid Java code when a null value is casted, e.g. `null as Type` ([details](http://github.com/sarl/sarl/commit/c31bd95114093a45c9c3e4e2f9163da38752b945)).

##### c) Automatic annotations
* Create the annotation `@Injectable` for types for which fields should be injected according to the [inversion of control](https://en.wikipedia.org/wiki/Inversion_of_control) design pattern. This annotation is automatically added by the SARL compiler when the `@Inject` annotation is found into a type declaration ([details](http://github.com/sarl/sarl/commit/b7d4f5b9fca1cf3a32c045cb4be46441e297d563)). This annotation may be used by the SRE for managing the injection of the objects when it is needed.

##### d) Bug fixes
* Do not generate the local/anonymous classes in the constructor code in order to avoid inconsitencies into the generated Java code ([details](http://github.com/sarl/sarl/commit/8f49795cc29ceaa5e14c1d642ffc9f6abb27f8e0)).
* Add a Java cast operator to the returned value of the synthetic functions for the default-valued parameters in order to avoid Java type conversion error ([details](http://github.com/sarl/sarl/commit/863a215cd79071009ffb6ee946e665e11d5ce522)).
* Update the processor of the `@Accessors` annotation for adding the variadic parameter marker (`...`) to the setter functions when it has been found in an inherited prototype ([details](http://github.com/sarl/sarl/commit/d1a702ef6373d550032863d0b534b1caad28cf7e)).
* Avoid internal NPE into the JVM model inferrer ([details](http://github.com/sarl/sarl/commit/7878bdc4c50bfd87ab21191a34c02aed13383bae)).

#### 2.1.4. SARL Core Library

* Deprecate the function `register` in the `Space` type, and provide the functions `registerStrongParticipant` and `registerWeakParticipant` ([details](http://github.com/sarl/sarl/commit/ecc39bc1eeb2d5132bb56f2fd9bc088ce6c76dc1)). These functions permit to make a difference between a [strong participant](http://www.sarl.io/docs/official/reference/Space.html) and a [weak participant](http://www.sarl.io/docs/official/reference/Space.html). A space could be destroyed only if there is no more strong participants inside. If a space has only weak participants, it could be destroyed.
* Rename the functions with the name `getUUID` to `getID` accross the entire API ([details](http://github.com/sarl/sarl/commit/105dcb5677232a0e7da0ce14485b5b38a41f2bd8)).
* Major bug fix in the dynamic skill creator attached to the `@DefaultSkill` annotation ([details](http://github.com/sarl/sarl/commit/49bcc0d9423a24d42485ae4c518700858f596a6c)). This creator generates a NPE whatever the capacity or skill.
* The interface `SREBootstrap` provides tools for starting the SARL run-time environment programmatically. Several functions were added in this interface for starting the run-time environment as it is started from the command-line ([details](http://github.com/sarl/sarl/commit/8a2bdb278da9d188b39e13dfae34cc3a699c2e2b)): `setCommandLineArguments(String[])`, `startWithoutAgent(boolean)`.
* Make cloneable the types `Address` and `SpaceID` ([details](http://github.com/sarl/sarl/commit/405f915e172899b66060c106f1a5cf059adcc956)).

#### 2.1.5. SARL Formatter

* Into the LaTeX style, add the macro `\ignorespaces` at the end of the macro`\code` ([details](http://github.com/sarl/sarl/commit/3509953d8b7522a572509994045189f6b04ed0eb)).

#### 2.1.6. SARL Batch Compiler

* Since Java 11, the classpath is no more the single way for specifying the Java libraries to be loaded into the program. Indeed, the introduction of the Java modules in the Java specification causes the creation of a "module path". This module path specifies the list of the Java libraries that must be loaded as modules. In order to be used with a version of Java that is higher than or equal to 9, the SARL compilers (batch compiler and embedded in Eclipse) supports both the classpath and the module path, depending on the version of the Java execution framework that is used ([details](http://github.com/sarl/sarl/commit/0e6c1d46b1791d2b0a5d9fbf52ea2492ab59bb19)).
* According to the SARL toolchain, the SARL compiler generates Java code. Then, this Java code is compiled by a standard Java compiler. Two major standard compilers are available: Eclipse compiler (a.k.a. ecl or Java Development Toolkit - JDT), and Oracle compiler (a.k.a. javac). Up to the version 0.11 of SARL, the JDT compiler is used by default. In order to prepare future move from the version 8 to the version 11 of Java, javac becomes the default Java compiler ([details](http://github.com/sarl/sarl/commit/2f1eee9a0d364d191f051b8ad0f37b754c5d49f6)). Indeed, this compiler provides a complete support of the Java 11 (or higher) specifications.
* Environment variables are now supported by the Maven-based batch compiler, a.k.a. maven-sarl-plugin ([details](https://github.com/sarl/sarl/commit/1a2bfd34b7ebe9b93a708e3dc1ed43f650a6bd6d)):
  * `maven.test.skip`: it is an environment variable that is already know for Maven plugins. maven-sarl-plugin disables all the tests when this variable is set to `true`.
  * `sarl.test.skip`: same effect as `maven.test.skip`.
  * `sarl.compile.skip`: when this environment variable is set to `true`, maven-sarl-plugin does not run the JVM element generator, SARL validator on the SARL source code, and does not run the Java compiler on the generated Java code.
  * `sarl.jvminferrer.skip` : when this environment variable is set to `true`, maven-sarl-plugin does not run the JVM element generator, SARL validator on the SARL source code. The other components of maven-sarl-plugin are run, e.g. the Java compiler.
  * `sarl.clean.skip`: when this environment variable is set to `true`, maven-sarl-plugin does nothing at cleaning stage.

  All these environment variables must be defined from the shell command line, or with the `-D` option of the maven tool.
  

### 2.2. SARL Development Toolkit (SDK)

#### 2.2.1. Agent Context

* Add the function `isRootContext()` into the `AgentContext` type in order to determine if the agent context is the root context or not ([details](http://github.com/sarl/sarl/commit/19e4c81349beb2a296ded636e405d949d5d8ff17)).

#### 2.2.2. Agent Behaviors

* The `Behavior` type permits to specify an agent behavior. The life-cycle of a behavior is enhanced in order to have callbacks when the behavior is installed into and uninstalled from its agent ([details](http://github.com/sarl/sarl/commit/548ca2d30fcb2179fab77c800c21495cd71e0c16)):
  1. **Behavior construction:** the construction function of the behavior is invoked in order to create the behavior in the computer memory.
  2. **Behavior registration:** the behavior is registered into the agent with one of the functions of the `Behaviors` capacity. *Then, the protected function `install()` of the behavior itself is invoked.*
  3. **Behavior initialization:** the `on Initialize` handlers of the behavior are activated.
  4. **Behavior's life**
  5. **Behavior unregistration:** the behavior is unregistered from the agent with one of the functions of the `Behaviors` capacity. Then, the `on Destroy` handlers of the behavior are activated.
  6. **Behavior uninstallation:** *the protected function `uninstall()` of the behavior is invoked.*
* Add two `wake` functions for waking up a specific agent behavior that is passed as argument ([details](http://github.com/sarl/sarl/commit/17e6b18e08fd624b0660341501e8f83e3854d343)). These functions enable to provide an event to a specific behavior, and this event it provided neither to the other behaviors nor the agent itself.

#### 2.2.3. Agent Skills

* The `Skill` type permits to specify an agent skill. The life-cycle of a skill is enhanced in order to have a callback when a skill is installed into its agent ([details](http://github.com/sarl/sarl/commit/0c1076a1ac579b951143e3ac6295e5d6e11060dd)). This callback function may be defined and provided by the SRE's implementation in order to react to the installation of a skill into an agent.

#### 2.2.4. DefaultContextInteractions Capacity

* In order to make easier the interaction between an agent and its parent agent, several functions are added ([details](http://github.com/sarl/sarl/commit/ffa0738a4840a1ba70a2428052325d9f9c789423)): `getDefaultParentID`, `getDefaultParentScope`, `emitToParent`.

#### 2.2.5. Lifecycle Capacity

* Add the function `spawnWithID(type, id, parameters)` in the `Lifecycle` capacity in order to spawn an agent with a given identifier into the default context ([details](http://github.com/sarl/sarl/commit/8c5dcf9fb7d856707ef8b0f10d3c5d6d680d40a4)). This function complements the existing function `spawnInContextWithID(type, context, id, parameters)` that needs to give the receiving agent context and the identifier.
* The `killMe(cause)` function takes the cause of the agent killing. Before SARL 0.12, this reason must be of type `Throwable`, that indicates the cause is an error. Since SARL 0.12, the cause of the killing becomes of type `Object` ([details](http://github.com/sarl/sarl/commit/8420cfa8ad13023b6d51af4e70014355fee3fc3f)). It enables to provide a killing cause that is not an error from the computer programming point-of-view.

#### 2.2.6. InnerContextAccess Capacity

* Add the function `getInnerDefaultSpace` into the `InnerContextAccess` capacity ([details](http://github.com/sarl/sarl/commit/4f1614ad23fdd3073980aa57ce8a2b77056f210f)). This function is an helper for obtaining the default space of the inner context of the agent.

#### 2.2.7. ExternalContextAccess Capacity

* Replace the returned value of the `join` function from `boolean` to `AgentContext` ([details](http://github.com/sarl/sarl/commit/d44f073eecf6a5b19469dfc42a4b2dfa22bde69e)). The agent is now able to access the joined agent context directly after joining it.

#### 2.2.8. Naming API

* Move the naming API from the Janus SRE to the SARL SDK ([details](http://github.com/sarl/sarl/commit/596873bff5c28c7027f3fdfe719259795ad00103)).
* Add the support for the observability of fields ([details](http://github.com/sarl/sarl/commit/3f302c0bb6d36707877150ad1b0879d7e0a93aed)). See the description of the major changes above for details.
* Remove the `NameScheme` enumeration in order to add new schemes from API extensions ([details](http://github.com/sarl/sarl/commit/bfc9c5b6280e8b95e68ec0b5b78fde0be2f79000)).

#### 2.2.9. Coding Style with the SARL SDK

* Replace all the direct references to the implements of concurrent collections to equivalent interfaces ([1](http://github.com/sarl/sarl/commit/ca77aab1058e47fff2a02c97d735ca8bfb66a2f7), [2](http://github.com/sarl/sarl/commit/b679d4764970285ad9a9da3de1cb17988222fc3c), [3](http://github.com/sarl/sarl/commit/b13cd8c99987441785db583f3b7dc220d812ff06)).

#### 2.2.10. New Modules

* Create the module `io.sarl.api.bootiquebase` ([details](http://github.com/sarl/sarl/commit/b04ba014dfbcde7ce376c0bf729bbfd24271b5bb)) that provides the abstract types for implementing a bootique-based application. Bootique is a library for launching and configuring an application.

### 2.3. SARL User Interface

#### 2.3.1. UI Components

* When a method call cannot be resolved and linked to a method implementation, an compilation error is output. The called method could be provided by a capacity that is not "used" in the SARL code. Add a quick fix that automatically adds the statement `uses` for the relevant capacities that are providing the missed method ([details](http://github.com/sarl/sarl/commit/450d5788de57b60b8b183171ae54750c5696c69d)).
* In the SARL editor, display with a specific style, the names of the functions that were marked as asynchronuous ([1](http://github.com/sarl/sarl/commit/70df0f712214ea67178104898149881fa97bae37), [2](http://github.com/sarl/sarl/commit/23b728b2506e4d1b4ee59946295a760c9a184b47)). According to the specification of SARL, these functions are supposed to be run in parallel to their callers, e.g. emit an event. In order to help the editor to show up this specific status of these functions, they are annoted with the `@SarlAsynchronousExecution` annotation.
* In the SARL editor, a code (mining) decoration that shows up the names of the formal parameters just before the values that are passed to a function call ([details](http://github.com/sarl/sarl/commit/175863c4c2ff815b49b4a331ed1e3ccfd641e4c5)). For example, if the function `f(a : int, b : String)` is defined, and in your code you have the call `f(5, "a")`, then this call will be displaye by the editor as `f(a:5, b:"a")` in order to show the names of the arguments to you.
* Display an error message when the code mining mecanism has crashed ([details](http://github.com/sarl/sarl/commit/8aab3f59b1b932a8a671495389b2de8473b91e24)).
* Fixing the NPE when accessing the Eclipse platform logger ([details](http://github.com/sarl/sarl/commit/7f8510808290716536fab38617531a9d6e83b0a4)).
* Deprecate the `eclipse-slf4j` module ([details](http://github.com/sarl/sarl/commit/64abdf9e4f52e204fbcb2f5dfb7b8bff07659841)).

#### 2.3.3. Eclipse Product

##### c) Launch Configurations

* In the launch configuration of a SARL agent or a SARL application, the classpath provider was implemented for supported the classpath only. It is the standard mechanism for Java applications up to Java version 8. Since the version 9 of Java, modules are introduced, as well as a specific module-path for the specification of the modules' libraries. The previous implementation of the SARL classpath provider did not support the module-path. It is fixed in SARL 0.12 ([1](http://github.com/sarl/sarl/commit/416420c4e9eef2b72d0e0411424dc9721fa30ee9), [2](http://github.com/sarl/sarl/commit/b041cb6e1706e232fdfc556ad856285d4fad296f), [3](http://github.com/sarl/sarl/commit/c3a7d3d690707093330aef01687be6cb4c9de847)).
* In the launch configuration of a SARL agent or a SARL application, a combo box is added in order to select the log level of the run application ([details](http://github.com/sarl/sarl/commit/c173709dab26b17503ac470942b053c5cdfb1760)).
* In the launch configuration of a SARL agent or a SARL application, a check box is added in order to enable or disable the printing out of the launching arguments on the Eclipse console ([details](http://github.com/sarl/sarl/commit/0033c14d628429cdb59986f0e7a6a76d709a5e33)).
* In the launch configuration of a SARL agent or a SARL application, it is now possible to specify extra arguments for the Java Run-time Environment ([details](http://github.com/sarl/sarl/commit/d750e7214667a2d00e179aba9b0db3bddf4105cf)), in addition to the program arguments, and the SRE arguments.
* Fixing the rendering bug in the main tab of the SARL launch configuration related to the wrong rendering of the parentheses ([details](http://github.com/sarl/sarl/commit/a5c7b424a569fcf48522431422519924a7d42cb2)).
* The launch configuration window contains panels for configuring the application to be launched. The plugins and extensions of the SARL Run-time Environment may need to be configured. In order to inject specific configuration panels into the launch configuration, an Eclipse extension point is created ([1](http://github.com/sarl/sarl/commit/0d5f64d6de1c5b04d9dd96361d87be2bb789df69), [2](http://github.com/sarl/sarl/commit/ca8d8d2a343d52e722f0201818355ff2762cbb36)). This extension point could be implemented by SRE extensions for providing a configuration panel.
* Automatic binding of the main launch configuration panel and the SRE selection panel ([1](http://github.com/sarl/sarl/commit/77bf017661369eb98aec7d3f3129ef245b8cd9bb), [2](http://github.com/sarl/sarl/commit/512496fd71f4e11eef80b4629cb11cb5fcec2091)).
* Update the SARL embedded runner able to use the `-D` definitions from the command-line ([details](http://github.com/sarl/sarl/commit/df956d6a01a67bc4e0a153ca8744244c59d4c6b5)).

##### b) Commands

* Add the command "Generate Element Document" for adding a documentation for the selected element ([details](http://github.com/sarl/sarl/commit/eee2883db7236d660cb99790772686b52eaa0eba)).

##### c) Preferences

* Add check boxes for enabling and disabling the code mining components that add decorations in the SARL editor ([details](http://github.com/sarl/sarl/commit/c4889548e9718a0442038d7aad19a6abd98a6cbc)).
* Change the label of the code mining components in the SARL preference window ([details](http://github.com/sarl/sarl/commit/b33da306a3f3876ffca9d6f1bee33d6db3141fc0)).

##### d) Other Changes

* Enabling the support of JDK 12, 13 and 14 for the SARL users ([details](http://github.com/sarl/sarl/commit/b656b88f42885ae8d8ca4d35fde6047219a95c45)), i.e. the SARL products are updated in order to be run on these versions of the Java environment.
* Provide programmatic tools for formatting the command-line options in the messages that are displayed in the Eclipse SARL product ([details](http://github.com/sarl/sarl/commit/1fbe9df7c6e8f15df40d9f428a681dd111a90b66)).
* Update the launching script for MacOS in order to automatically detect and configure the Java environment ([1](http://github.com/sarl/sarl/commit/b9ad983efd75e859a12d29e99b88abd3d76878b6), [2](http://github.com/sarl/sarl/commit/12da2ef083c5627da943440d517f40281d8b994e)).
* Update the Linux launching scripts to make them more robust to the different versions of the Linux environments ([details](http://github.com/sarl/sarl/commit/69b0239d0b6b575c75d071696636d8697e2bf0b0)).

### 2.4. Examples of SARL projects

#### 2.4.1. Example code

* Fixing the code of the boids and fireworks examples to follow the new space API ([details](http://github.com/sarl/sarl/commit/14d34f7f2455922bfa03a0014555156466f63ff3)).

#### 2.4.2. JDK support

* The JDK version of the user is injected into the pom files of the examples ([details](http://github.com/sarl/sarl/commit/1a40f907d1f28fc1ce713c3c49526b628ae24318)).
* Ensure that the JDK used for creating the example projects is compliant with the minimum JDK for SARL ([details](http://github.com/sarl/sarl/commit/8678e8d8cd4fc6c6daf0e4af7ad7a63e8dda31d4)).

#### 2.4.3. JavaFX support

* Ensure that JavaFX is included as dependencies when JDK is 11 or higher ([details](http://github.com/sarl/sarl/commit/86d235af19f848b4c2609ce7d09ef745fe59d854)).

#### 2.4.4. Windows OS support

* The example wizard needs to find executable files (such as Maven) on the operating system in order to use them. The wizard code is refactored in order to search correctly the executable files on all the operating systems, and specifically on Windows OS ([1](http://github.com/sarl/sarl/commit/7aed85f4bd1556f0d92b4c1f4d2e533341db3e1a), [2](http://github.com/sarl/sarl/commit/f8b9c8610472b125644ebc35a707efd08bbc70c2)).

### 2.5. Janus Run-time Environment

#### 2.5.1. Bug fixes

* Major bug fix in the dynamic skill creator attached to the `@DefaultSkill` annotation ([details](http://github.com/sarl/sarl/commit/49bcc0d9423a24d42485ae4c518700858f596a6c)). This creator generates a NPE whatever the capacity or skill.
* Avoid NPE into the JUL formatter ([1](http://github.com/sarl/sarl/commit/cff9cd96a4986c439521aeb2029669fb96677725), [2](http://github.com/sarl/sarl/commit/fdb9a34eaca4ab2bcc1c30cdff5f98d4f7dc118f)).

#### 2.5.2. Entity Creation

* In relation with the `@Injectable` annotation that is supported by the SARL compiler, the Janus SRE is updated in order to inject objects when they are annoted with `@Injectable`. If they are not annoted, the objects are created without injection in order to obtain a faster run ([details](http://github.com/sarl/sarl/commit/d02b3e9755075a939214f988e665ce3f7374f848)).
* Remove the interface `BuiltinCapacitiesProvider` ([details](http://github.com/sarl/sarl/commit/43d4bb4eb4ecddec6ffd6ad52dab5670649c1799)).

#### 2.5.3. Context Service

* Refactor the context service by putting back the locks in order to avoid issues related to the parallel execution of the service ([1](http://github.com/sarl/sarl/commit/5eab6dba1dbd5899767bee45efcf24299a6ca05f), [2](http://github.com/sarl/sarl/commit/f58144b6c8a20e0b60f77381a1c04a0c57e43506)).

#### 2.5.4. Executor Service

* The prototype of the `neverReturn` function is changed in order to make its argument mandatory ([details](http://github.com/sarl/sarl/commit/8c50c3c1c260854f17e82cf3210dd0fcba566c00)).
* Fire an occurrence of the `TaskFailure` event when a background task has thrown an exception ([details](http://github.com/sarl/sarl/commit/74139cd0e19e58d2d1051069d518fac9991dd37c)).
* Add implementation of the `toString` function for the executor services ([details](http://github.com/sarl/sarl/commit/67eaa9c409ddccd3f2d17067a7512fdb4de2ac23)).

#### 2.5.5. Lifecycle Service

* The initialization process of the agent into `AgentLife` is refactoring in order to avoid the receiving of events before the initialization stage is finished ([1](http://github.com/sarl/sarl/commit/4572e114dac3ed5f9d9629295d759968f4d21d84), [2](http://github.com/sarl/sarl/commit/d028933c28d1be69078fc7f9153e0b098b00b981)).
* Fixing the locks into the stop function of the agent ([details](http://github.com/sarl/sarl/commit/b1afd087bacda988416278cb6486260fd7a15848)).
* Add a protected access to the executor service into the `Lifecycle` service ([details](http://github.com/sarl/sarl/commit/61902ce36e9e88262303f9427ac42e7cf056de86)).
* In the agent spawn process, the logging and the forwarding of exception from the parallel tasks are fixed in order to output them properly ([details](http://github.com/sarl/sarl/commit/37f2ec4ecb97798c55175679a826fadab361bf8f)).
* Add the firing of an `AgentSpawnFailure` occurrence when an agent spawn cannot succeed ([details](http://github.com/sarl/sarl/commit/6ebffe9f94fd449cac29101f79c4101207906bb3)).

#### 2.5.6. Naming and Probing Services

* Move the naming API from Janus SRE to the SARL SDK ([details](http://github.com/sarl/sarl/commit/596873bff5c28c7027f3fdfe719259795ad00103)).
* Move the probing API from Janus SRE to the SARL SDK ([details](http://github.com/sarl/sarl/commit/bd6f1b4a1745a9adb5dc71221d532d98ed333d1f)).

#### 2.5.7. Logging Service

* The Janus SRE modules are now able to log their messages into dedicated loggers ([details](http://github.com/sarl/sarl/commit/4aa678651ff05b2dfb9fe809d8121be1462f07a5)).

#### 2.5.8. Space Implementation

* Change the visibility of the function `getScopedParticipants` in the event space in order to be used by extensions of Janus, e.g. the networking module ([details](http://github.com/sarl/sarl/commit/f6ce7681520e74089386833a4b51b9a753dcf050)).
* The function for firring the events is changed in order to fire the event to a provided listener, even if it was not registered to on the agent's event bus ([details](http://github.com/sarl/sarl/commit/2c68ed1211d365a9c3436a27739aba155e10621b)). It enables to propagate events to specific objects without receiving the events that are fired through the agent's event bus.

#### 2.5.9. Internal API

* Replace Guice by Guice NO-AOP ([details](http://github.com/sarl/sarl/commit/b9001564346c20d0b13fd047ac8c6af5184275cc)).
* Upgrade to Guice 4.2.3 ([details](http://github.com/sarl/sarl/commit/d59fce3c0fd22593cae9f9f736fc2229dd5e1d32)).
* Remove `io.janusproject.eclipse` from the classpath of the applications when they are launched in the Eclipse SARL environment ([details](http://github.com/sarl/sarl/commit/0692efc9c8e59fdce9f1fbf6108d2f52280be336)).
* Rewrite the Janus classpath provider for supporting Java 11 ([2](http://github.com/sarl/sarl/commit/416420c4e9eef2b72d0e0411424dc9721fa30ee9), [2](http://github.com/sarl/sarl/commit/72c82bdb8bc4c34fd92d1f99c3bcc24bd2f3e4be)).
* Remove the dependency to Gson library because the Jackson library is included by the Bootique library, and it provides the same features for reading a Json file ([details](http://github.com/sarl/sarl/commit/cd53a8831eae24c168d615af5754186cdf962928)).
* Fixing the injection definition of the Janus commands ([details](http://github.com/sarl/sarl/commit/d57b5a11a44cabe4e3787d90deaf991ce70220d2)).
* Update the message that shows up the version of the `janus` command line tool ([details](http://github.com/sarl/sarl/commit/01f8dce62f69bbefa3f19983b5a1f3b1389788b6)).
* Avoid NPE related to the message of `CannotSpawnException` ([details](http://github.com/sarl/sarl/commit/4841dc699073c963afe219ea40d4bf8f87ec386a)).
* Clean the dependency tree of the Janus SRE ([1](http://github.com/sarl/sarl/commit/33b03e678fbda5a05a8c7d58144347917190fe5f), [2](http://github.com/sarl/sarl/commit/1e745f3703f1c400e6c381da262915ef8d4e1e5e), [3](http://github.com/sarl/sarl/commit/0d3d08a6960eec13b5840a4707db5fc15b427935)).

#### 2.5.10 Network Service for Janus SRE

The service-based architecture of the Janus SRE enables to provide specific services for running SARL agents.
The version 0.12 of SARL introduces a service for the communication over a computer network of different instances of the Janus SRE.

By default, Janus does not provide a support for exchanging events over a computer network. If you would like to have benefit of this feature, you should use the extension module, named "Janus Network", that is introduced in SARL 0.12 ([1](http://github.com/sarl/sarl/commit/50c1d759d423af12a4fb0e530d5599d4cf7fa917), [2](http://github.com/sarl/sarl/commit/cf17e7d99e7db5dfea3f269ff51ff04ed838136f), [3](http://github.com/sarl/sarl/commit/8bb52073ad244d079c0fd581f0b1704162e1f4c3), [4](http://github.com/sarl/sarl/commit/eb08545ecb8e1b656d6cf2df6dcd302ef37f92c0), [5](http://github.com/sarl/sarl/commit/e13cf47c1d2aa0d0932cc18ec303b05ec8b8dfc6), [6](http://github.com/sarl/sarl/commit/294cb9e747ce01eced99b24ff511988c0b2b2d64), [7](http://github.com/sarl/sarl/commit/cddc4e0b37d78823fe7f76f011abd749365e77a4), [8](http://github.com/sarl/sarl/commit/e5b76befa8c632fd4420635194343b1d7b217965), [9](http://github.com/sarl/sarl/commit/42637dae9ff9f26167eabca4c8ddb93cfa727a26), [10](http://github.com/sarl/sarl/commit/7cf054d48efd65a7d4e5d028f189013dfe27e89c), [11](http://github.com/sarl/sarl/commit/ec36924575ce34452c5e712a007005086d78582b), [12](http://github.com/sarl/sarl/commit/ca006a89dc7fe4eec60b7ccb06ef3fcf00fdfae4), [13](http://github.com/sarl/sarl/commit/38428fcabc4213806ea2516e941aff62d4b838d2), [14](http://github.com/sarl/sarl/commit/eed92c714b4a755c081ce20cca08610029af76b4), [15](http://github.com/sarl/sarl/commit/0bfe651368e0279eefbb6bd567d36588154d0adc), [16](http://github.com/sarl/sarl/commit/94f7ae7049b9d42a075e0ff2d45107df980989a1), [17](http://github.com/sarl/sarl/commit/321e93dc1b7057dca38e36d2cf5baa6263e9b41b), [18](http://github.com/sarl/sarl/commit/870c01a581f96b2e7089c0b78d195d51c9f0efff), [19](http://github.com/sarl/sarl/commit/d1b6916e99ecaae9c353bac9f0254ba24516d576), [20](http://github.com/sarl/sarl/commit/726eb841df22d68e05414ef9909d482b156a6c94), [21](http://github.com/sarl/sarl/commit/b35d0f864e01bbebc40deca5a06849bd1b4d4989), [22](http://github.com/sarl/sarl/commit/1fa6090e0d6323d5687daa401394dca68d2c44af), [23](http://github.com/sarl/sarl/commit/cae87c0aa4797ccb683b8e70f4612ceb6fc704af), [24](http://github.com/sarl/sarl/commit/d73c127b75f35e48710dbd2bdafee8cafc022c87), [25](http://github.com/sarl/sarl/commit/88e2839c9ff2a7c8c46b9a273763f9b57bee4bbf), [26](http://github.com/sarl/sarl/commit/d5d395e6d0565e44865a6a2eae6909a2fc768ded), [27](http://github.com/sarl/sarl/commit/e3191ad1045e7c9b133511bdc520b8ef6ec35571), [28](http://github.com/sarl/sarl/commit/73a3efb7705b3b59da28caf471ad7109bed18760), [29](http://github.com/sarl/sarl/commit/1405657536f4ab14d4867418adb19c9f3e07e7bb), [30](http://github.com/sarl/sarl/commit/abac031678498e682239fbabd86acf648a2a4c97), [31](http://github.com/sarl/sarl/commit/c711f01f15ab682e24e8c7e21144a83dcd2b79c0), [32](http://github.com/sarl/sarl/commit/75aa86d8a87fb057d3f856702c581f79aed79bca), [33](http://github.com/sarl/sarl/commit/1374a296403e32699d55a8f9c95d2082546c2e71), [34](http://github.com/sarl/sarl/commit/a6d1d8572ac5522c15cd2d8421a80ac6d83ced5b)).
The implementation of this module is based on the [Hazelcast](https://hazelcast.com) library in order to build the clusters of Janus nodes.

Thanks to its implementation, the network service has the following major properties:

* Share spaces (event-based or not) over the different instances of the Janus SRE.
* Route events over the computer network.
* Discover automatically the other instances of the Janus SRE in the local network.

### 2.6. Maven Tools

#### 2.6.1. Bootique Plugins

* Split the module `io.sarl.maven.bootiqueapp` in order to separate the Bootique-based library for building applications, and the SARL batch compiler library ([details](http://github.com/sarl/sarl/commit/e3ad180a0f37c83441262f5f2c56a5e274dd83e5)).
* Add CLI option `--generatemarkdownhelp` to the Maven bootique library ([details](http://github.com/sarl/sarl/commit/665de264f903386fbba7274e0cce72f722c2607c)). This option will be available to all the bootique-based applications, e.g. `janus` and `sarlc`.
* Add a command for displaying the configuration parameter of an application, usin a markdown syntax ([details](http://github.com/sarl/sarl/commit/00fefdf40900e3695de5b6da47064b82bdb4458d)).

#### 2.6.2. Documentation Generation Plugin

* Enable isolated class loaders when evaluating the SARL expressions into the documentation files ([details](http://github.com/sarl/sarl/commit/db1eb5c0761911cc04070dec409356f836d6fd94)).
* Add global system properties `SARL_DOC_CURRENT_FILE` and `SARL_DOC_CURRENT_FOLDER` that contains the parsing documentation file and its folder ([details](http://github.com/sarl/sarl/commit/30ad9046932a372c2cee6fd0995ec685bda1af45)).

### 2.7. Command-Line Tools

#### 2.7.1. sarlc

* Use the new Bootique application framework ([details](http://github.com/sarl/sarl/commit/ec20e18498f41261d645e5be615a49755e6b9f08)).
* Enable the reading of the `-D` parameters ([details](http://github.com/sarl/sarl/commit/9c1bf23db440b6b2b1081670fd3de6e644fac515))
* Deprecate the Java boot classpath ([details](http://github.com/sarl/sarl/commit/a7fd3ce63d4b23a52fded8de7b15b43b80f2f89c)).
* Use the Unix standard for naming the CLI options ([1](http://github.com/sarl/sarl/commit/41983c59dc83a59a1e52cb130451e9743e99adac), [2](http://github.com/sarl/sarl/commit/a4ec430d7a885917b305118a8deed479fac7db6c)).
* Add utility functions for accessing to the CLI options programmatically ([details](http://github.com/sarl/sarl/commit/c569d76f0a75dde77edabbcf3089786c9a471637)).
* Generate 64 bit executables ([details](http://github.com/sarl/sarl/commit/2edcbf108688d4e15e6af5dfdc31cd074c2737b3)).
* Force the MacOS X executable to use a version of the JRE that is compatible with the SARL tools ([details](http://github.com/sarl/sarl/commit/f66a68d79367d2a261e8885cbb001c0b1641622f)).

#### 2.7.2. sarldoc

* Use the new Bootique application framework ([details](http://github.com/sarl/sarl/commit/668911a31c15f803dc65f9c6449e257f34fda344)).
* Enable the reading of the `-D` parameters ([details](http://github.com/sarl/sarl/commit/9c1bf23db440b6b2b1081670fd3de6e644fac515)).
* Use the Unix standard for naming the CLI options ([1](http://github.com/sarl/sarl/commit/41983c59dc83a59a1e52cb130451e9743e99adac), [2](http://github.com/sarl/sarl/commit/a4ec430d7a885917b305118a8deed479fac7db6c)).
* Add utility functions for accessing to the CLI options programmatically ([details](http://github.com/sarl/sarl/commit/c569d76f0a75dde77edabbcf3089786c9a471637)).
* Generate 64 bits executable ([details](http://github.com/sarl/sarl/commit/37fecc27a0ba82833e7c10839fc3dd879490aa6f)).
* Force the MacOS X executable to use a version of the JRE that is compatible with the SARL tools ([details](http://github.com/sarl/sarl/commit/1afbce3986a7c141a5d8e9dec7417f82294dffed)).

### 2.8. SARL Documentation

* Add [list of errors and warnings](http://www.sarl.io/docs/official/reference/CompilerErrors.html) that could be output by the SARL compiler or the Janus SRE ([1](http://github.com/sarl/sarl/commit/e6863bc2f336bb7f953c6124fc39b115ce99cba0), [2](http://github.com/sarl/sarl/commit/3972b033f0a002648a386a4f2ab3d9de352a44a4), [3](http://github.com/sarl/sarl/commit/65d5ea8d5c4c408ff06b5a661e675c5a8cd8c976), [4](http://github.com/sarl/sarl/commit/5503a4f8884606a01bdc46550f5b2b75077567a8), [5](http://github.com/sarl/sarl/commit/772f7131422596745fedd93d49c0770a330739c5), [6](http://github.com/sarl/sarl/commit/8bf41ea2710dbb35d91bf0793debbee0313ad379), [7](http://github.com/sarl/sarl/commit/783220b5e2839636bd637c24fdf1debf9b511795)).
* Add [explanation](http://www.sarl.io/docs/official/faq/DeprecatedAPI.html) on deprecated and removed features ([details](http://github.com/sarl/sarl/commit/b0d8e6c953a00dea65d05cb33d73140491348064)).
* Add [section](http://www.sarl.io/docs/official/faq/SyntaxFAQ.html) related to the warning messages about the purity of behavior unit guards ([details](http://github.com/sarl/sarl/commit/e49ddb4d7948f24e4431da35cfaf890109e742c6)).
* Complete the [documentation](http://www.sarl.io/docs/official/reference/OOP.html) about the `volatile` keyword ([details](http://github.com/sarl/sarl/commit/6ad69efee307da219a4d9784ded4886290e7f099)).
* Add an [explanation](http://www.sarl.io/docs/official/faq/SyntaxFAQ.html) about how to restrict the list of agents that will receive an event ([details](http://github.com/sarl/sarl/commit/26783bcb1fe4dc952ca0e046668b5d5ab693cc12)).
* Add [documentation](http://www.sarl.io/docs/official/reference/Failures.html) on the management of the failures in the agents ([details](http://github.com/sarl/sarl/commit/9b6147eb6759a08a0ac2d8af356b6f480dd9126a)).
* Add [documentation](http://www.sarl.io/docs/official/api/Probing.html) on the probing API ([details](http://github.com/sarl/sarl/commit/149e0e4f3195bc7f38bfbfbaa58db102f0a6b9be)).
* Add [documentation](http://www.sarl.io/docs/official/api/Naming.html) on the naming conventions and the associated namespace service ([details](http://github.com/sarl/sarl/commit/570d0df63d40343477de44ed5f0f92ae68122329)).
* Add [documentation](http://www.sarl.io/docs/official/tutorials/EventBusOverrideWithCapacity.html) on the event bus overriding into the agents ([details](http://github.com/sarl/sarl/commit/75dbde250de46c3a5e1da0e1c58016910929ec73)).
* Add [explanations](http://www.sarl.io/docs/official/reference/Agent.md) on the multiple declaration of `on Initialize` ([details](http://github.com/sarl/sarl/commit/3eca5749ac70c6cc24bd1085a68ebae99926f42b)).
* Add [explanations](http://www.sarl.io/docs/official/reference/general/FuncDecls.html) about pure and impure functions ([1](http://github.com/sarl/sarl/commit/4668563b5f94c011187d5ce439c50821154dfae3), [2](http://github.com/sarl/sarl/commit/e49ddb4d7948f24e4431da35cfaf890109e742c6)).
* Add [explanations](http://www.sarl.io/docs/officialreference/general/Types.html) on immutable types ([details](http://github.com/sarl/sarl/commit/74e763986a026328085ee6eb57368704dc3fd670)).
* Add [explanations](http://www.sarl.io/docs/official/gettingstarted/RunSARLAgentCLI.html) about the use of the Maven assembly plugin for creating a standalone SARL application ([details](http://github.com/sarl/sarl/commit/c6102b9be7d5ad7229b6f390f3f9b9db9f849467)).
* Add [FAQ question](http://www.sarl.io/docs/official/faq/GeneralFAQ.html) related to the failure of SARL Eclipse launch on MacOS X ([1](http://github.com/sarl/sarl/commit/0c9defadb772240e73413d07a49f1ac54de0307d), [2](http://github.com/sarl/sarl/commit/8d975fddafaae63f4e50460bcfd8102e7a0006ad), [3](http://github.com/sarl/sarl/commit/f1bd0847a49d056e0d9fd4a3d49a971d90f57222)).
* Add a [question](http://www.sarl.io/docs/official/faq/GeneralFAQ.html) in the FAQ related to the freeze of SARL when the code mining is enabled ([details](http://github.com/sarl/sarl/commit/29ccbb0da9674bec0c820a538259faa12a29428f)).
* Fixing the [language comparison page](http://www.sarl.io/docs/official/reference/LanguageComparison.html) ([details](http://github.com/sarl/sarl/commit/3f31b34c8c47e39e4d73e1fe530f9446d58e3bd4)).
* Add a [documentation](http://www.sarl.io/docs/official/compilation/Basics.html) for explaining the run-time behavior of a SARL program ([details](http://github.com/sarl/sarl/commit/eb0cb1a621b4052cb2a5a4ef8e1756de4676f1ec)).
* Add [documentation](http://www.sarl.io/docs/official/api/SRE.html) on SARL SDK/API and the SRE bootstrap API ([details](http://github.com/sarl/sarl/commit/13a50a2b505312526ffffcbcd39156b9d2b47d2f)).
* Add [tutorial](http://www.sarl.io/docs/official/tutorials/SreExtension.html) for creating a SRE extension ([details](http://github.com/sarl/sarl/commit/640a6066a444354b7367e38981d10bc1e85ba093)).
* Add [documentation](http://www.sarl.io/docs/official/tools/JanusNetworkExtension.html) on the network extension of Janus ([details](http://github.com/sarl/sarl/commit/072cf83c51846996c20292b3792f830b6f4e3bfa)).
* Add [documentation](http://www.sarl.io/docs/official/tools/Janusnode.html) of `janusnode` tool ([details](http://github.com/sarl/sarl/commit/97b4a9a3c9b755304c51731d052aa87c3cddbe91)).

### 2.9. Tools for SARL Contributors

#### 2.9.1. Changes in the SARL Compiler Libraries

##### a) General Changes

* Upgrade to Eclipse 2020-06 and Xtext 2.22.0 ([details](http://github.com/sarl/sarl/commit/ba4bfed266d43e3a8fa9d55f919c085425b50c3e)).


##### b) Pure Functions

* Fixing the invalid detection of pure status for operations and provides an API for retreiving the side-effect expressions ([1](http://github.com/sarl/sarl/commit/a0c2dc8845617e3feb671a3c0e9ada0b00ef5838), [2](http://github.com/sarl/sarl/commit/46bc425614af64a1c91b036ecad653b0f7ecb2f8)).

##### c) Preparation for Java 11

* Remove the references to the `@Generated` annotation that is different between Java 8 and 11 ([details](http://github.com/sarl/sarl/commit/3447a1456a6dd31574789f5cbc5a726e01acd137)).
* Split the "ui" module into the "ui" and "ide" modules ([details](http://github.com/sarl/sarl/commit/6b9916af4db4ef257c4a5464acd41c4cd1180184)). This change is needed for the support of the modules implies by Java 11 in the recent versions of Xtext.
* Split the `Utils` class into the "lang-core" plugin and the "lang" plugin ([details](http://github.com/sarl/sarl/commit/9fd6b5b5567a044748bfa6e91d7180ca4806303f)).

##### d) Code Mining

* Add the definition of polymorphic methods for providing the code mining contributions ([details](http://github.com/sarl/sarl/commit/bfee1a9c3eea80433f2e7aa239c9c4fa9761dcd6)).

##### e) Logging

* Replace the references to Log4J and SFL4J by equivalent references to JUL ([1](http://github.com/sarl/sarl/commit/966c8c3bea76d865ece324943dcb0045aff5d84d), [2](http://github.com/sarl/sarl/commit/9e499ce1b61f70f0830a47d8fe323b9fc86af241)).

##### f) Other Changes

* Exhibit a SARL expression interpreter ([details](http://github.com/sarl/sarl/commit/b9af9a51fe980eae314f1aea02e7c12a7ae1709c)).
* Add utility functions to convert JVM type references to Lightweight type references ([details](http://github.com/sarl/sarl/commit/cc47b36adde89360123738274f0f9fd96afbb29b)).
* Add an utility function for obtaining a valid human readable string for error messages ([details](http://github.com/sarl/sarl/commit/070a7a4c91475f141661dc01b721aa843da87ed6)).
* Remove the unaccessible repository for the JBoss Eclipse plugins ([details](http://github.com/sarl/sarl/commit/076b8e1bd47e552d0b1e9e9de06fc465879e979f)).

#### 2.9.2. Build Tools

* Add scripts to change the JDK configuration of the SARL products ([1](http://github.com/sarl/sarl/commit/e3db95a7d2bfdc7764678c979567a2d600a7354e), [2](http://github.com/sarl/sarl/commit/7002f236a10ae438e2ac7b0d9b48d5725b8940a9), [3](http://github.com/sarl/sarl/commit/eecfe8d25770b7da10baa3bad121623c2ab098b7), [4](http://github.com/sarl/sarl/commit/820a4dc6cbd8d2edea6d72b0e8d4fb5c24450ede), [5](http://github.com/sarl/sarl/commit/af0faef26c345d326dffa0b7aebbc17998c3d406), [6](http://github.com/sarl/sarl/commit/c9fb9d71426cfae7d65426966d7138f12652ceb1), [7](http://github.com/sarl/sarl/commit/d1e54ee0baa82871a0f1a00f6c1a8c05ff3f2db5)).

## 3. Changes in the Previous Versions

* [Changes in the version 0.11.0](./changes_0.11.0.html)

