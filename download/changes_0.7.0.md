---
layout: default
title: Changes in 0.7.0
---

# Changes in 0.7.0

Release date: 2018-02-22.

## SARL Language

### SARL Language Grammar
* Add the `continue` keyword. ([details](http://github.com/sarl/sarl/commit/76c7c7d145456639698c455937272cd83c146d11))
* Add number method extensions that are implicitly imported. ([details](http://github.com/sarl/sarl/commit/6a0c4db7335f50989dfddf72a3b930558df8115d))
* Add implicit casting functions for numbers. ([details](http://github.com/sarl/sarl/commit/b55347201623a8eeba14d2cf65dc4075de8cdf3e))
* Fixing the operator precedence. ([details](http://github.com/sarl/sarl/commit/75bef312fd0f720efaf8a074171c8dfea98ef992))
* Apply JLS 8.4.8. ([details](http://github.com/sarl/sarl/commit/c809657775de5765550a44484c87ff93b115bf76))

  Xtext library partly implements the JLS 8.4.8, related to inheritance mechanisms. SARL compiler includes a patch until Xtext is fixed.

* Avoid the invalid report of a dupliciate interface or capacity implementation. ([details](http://github.com/sarl/sarl/commit/c73f91e611faed91a507d3f357ca4bd565fe6450))
* Fixing the equality tests for `Address` and `SpaceID`. ([details](http://github.com/sarl/sarl/commit/cec4db68138b8c30eefd0e5c6ed9895704f9fdc5))
* Do not create shadow variables for `break` and `continue` keywords. ([details](http://github.com/sarl/sarl/commit/4c22c3330b6b5c7e2809983f7bd3e3bbfdde72cf))
* Output the Ecore data structure when one Ecore element was not found. ([details](http://github.com/sarl/sarl/commit/9143146995a0c4fe6596b1381f0074d90c1b770d))

### SARL Validator
* Add detection of the potential field synchronization problems. ([details](http://github.com/sarl/sarl/commit/f9f24feba49a1de2687afd6544c83c9f389ca3c9))

  The SARL validator analyzes the usages of the declared fields. When a field is read and written outside a synchronized block, the validator outputs a warning.

* Adding tests on field read accesses for preparing a Xtext pull request. ([details](http://github.com/sarl/sarl/commit/f4708c52194d0b3b2185aa7620ba98c3274d2af1))
* A field is not detected as used when it is assigned. ([details](http://github.com/sarl/sarl/commit/9d96829622eec412b2effc21c8a2ececcf274cfa))

### Java Model Inferrer
* Cloning of type references with full type parameter support. ([details](http://github.com/sarl/sarl/commit/084c13f0286fa17edc19b8fa13e56ab115ac0c31))

  The cloning function of the type references did not clone the generic type's parameters. In this release the generic type's parameters are cloned.

* Avoid class cast exception in SARLJvmModelAssociations for source elements. ([details](http://github.com/sarl/sarl/commit/c5263c643ae3fdd7209d2d5f3820f2e690171708))
* Move early-exit detector within an utility class. ([details](http://github.com/sarl/sarl/commit/e2b87ebfd52548b912a5aee3ffcacdb5564985f5))

### SARL Core Library
* Add `org.eclipse.xtend.lib` to the standard SARL Libraries. ([details](http://github.com/sarl/sarl/commit/e1581d54c9be7fe1124f8235423bb3142d987890))
* Programmatic Bootstrap:
  * Move the bootstrap from the core library to the lang library. ([details](http://github.com/sarl/sarl/commit/f0d7ccf112f1a8894c4a61a602df3517096fff2f))
  * Enable basic configuration of the SARL bootstrap (offline, etc.) ([details](http://github.com/sarl/sarl/commit/fcaa4d07b81c9e0a578f3c908da81af473d7479b))
  * Add `startWithoutAgent()` function to the SRE bootstrap utility class. ([details](http://github.com/sarl/sarl/commit/424fbf587b7baba6b73e795dad5cecc9a6ee4de3))
* Add [DefaultSkill](http://github.com/DefaultSkill) annotation. ([details](http://github.com/sarl/sarl/commit/ca92975a5f18491a8ca0ba31dc42b0c210089a5d))

  This annotation enables to specify a default skill for a capacity.

* Enable the access to the `getCaller()` function from a skill. ([details](http://github.com/sarl/sarl/commit/eb5b0c2c5fd66e0fe417825d2433c24cce15cd15))
* Change the private API for exhibiting a concurrent map of skills. ([details](http://github.com/sarl/sarl/commit/b529116ae6309cfe6d017286974628ed9e21fccc))
* Cleaning the `MapExtensions` for submission to Xtext. ([details](http://github.com/sarl/sarl/commit/6f3c6094860f2495b5822094dcbedc9bef356942))
* Fix resource names for English version ([details](http://github.com/sarl/sarl/commit/0c3f1a06ad5449f23ad15a759491682f58c20083))

### SARL Formatter
* Enable an empty line before multiline comments. ([details](http://github.com/sarl/sarl/commit/390ef9d48d4ae4fdcd8baaa7fbaf8a123ac982d2))

### SARL Batch Compiler
* Update the messages given by the SARL batch compiler. ([details](http://github.com/sarl/sarl/commit/608b48f2a79dd0ee7e818762379c9cbe9e1d331b))
* Internal Xtext info messages are logged at debug level within the batch compiler. ([details](http://github.com/sarl/sarl/commit/ef1e1618548e63383577cb565c1227c5a6fa08bb))

## SARL Development Toolkit (SDK)

### New Features
* Add `io.sarl.javafx` library into the SDK. ([details](http://github.com/sarl/sarl/commit/355e24148a1520078e942bf07eb26c22f2ca7ede))

  This library provides the basic implementation of a JavaFX-based application that is able to launch SARL agents.

### Logging Capacity
* Add more functions within Logging capacity. ([details](http://github.com/sarl/sarl/commit/5b3a41f3b0760879b1150914b9e77eb68cabd88f))
* Fixing the Logging documentation. ([details](http://github.com/sarl/sarl/commit/e2bbe5a00458b43442e2165953b27596ac3a2cbd))

### Lifecycle Capacity
* Fixing the invalid prototype of `spawnInContext`. ([details](http://github.com/sarl/sarl/commit/e3faa7e390f3a7918e9c149a1ce383786a135a47))
* Update documentation about the parallel execution behavior of the spawning functions. ([details](http://github.com/sarl/sarl/commit/574c8e49ebe0b2d583c0f37d3fe222706e6782ff))

### ExternalContextAccess Capacity
* Add `getUniverseContext` within `ExternalContextAccess`. ([details](http://github.com/sarl/sarl/commit/fea2155cbc861bdbdf5117c679432b0bc7eae127))

  This function enables the agent to retrieve the Universe context, i.e. the root context for all the agents.

### Events
* Update the documentation of the events. ([commit 1](http://github.com/sarl/sarl/commit/1ebe70b4ce205e3ce3b47353742731d1fdb28482), [commit 2](http://github.com/sarl/sarl/commit/6dbf9eb66bc92189101a14573aa33192a804f0d8))

### AgentTask
* THe function `setName` of in `AgentTask` is now private API. ([details](http://github.com/sarl/sarl/commit/41f95f6da74ffc085cf8fe63751fc1c93cd7ba8c))

### Deprecations
* Deprecation of agentID field within AgentKilled. ([details](http://github.com/sarl/sarl/commit/a42f06b9e2f7c2b6d28eb7f918215f4e7878c5c4))
* Deprecation of `getSpaceId` in `Address` in favor of `getSpaceID`. ([details](http://github.com/sarl/sarl/commit/ff9e80e1db1fa66b970869cb4eea32736b726b21))
* Deprecate the event scoping implementations. ([details](http://github.com/sarl/sarl/commit/586e911b8b4306f82697533d479b1903020842c6))

  The definition of a event scoping function with a lambda expression is possible. The `Scopes` utility class provides implementation that are deprecated, and should be replaced by lambda expressions.

## SARL User Interface

### UI Components
* Remove the imports from the outline to mimic the Java outline component. ([details](http://github.com/sarl/sarl/commit/0cc3dcf3b17f90c7ccef16d5ab03b55ed217b64b))
* Add "Correct indentation" menu item. ([details](http://github.com/sarl/sarl/commit/6a49d2cac09607b39de05c7ccab25cca07f26457))

  The "correct indentation" tools is based on the SARL formatter. The associated shortcut is `Ctrl+i`.

### Internal UI Implementation
* Add Eclipse extension for detecting SARL files faster. ([details](http://github.com/sarl/sarl/commit/76d133ee9784706fec5dfd8bdabde346c366ffaf))

  Xtext infrastructure provides this extension to DSL languages in order to obtain a faster detection of a DSL file before opening it. This extension is used for detecting SARL files.

* Use Eclipse platform-uri syntax in image loader. ([details](http://github.com/sarl/sarl/commit/4956d687222f03dfbab719f08c2c23a728928597))

  The image loader, which is provided by Xtext API supports the specification of a platform-uri for loading an image from another plugin. This update is pull requested to Xtext.

* Add preference accessor for SARL source viewer. ([details](http://github.com/sarl/sarl/commit/4c8fc5842fe5c3e0d92357bc3c99f4e834203377))


### Eclipse Product

#### Launching Configurations
* Add SARL application launch configuration. ([commit 1](http://github.com/sarl/sarl/commit/eedfcb6dae08fb15deb5abdad62009dfd20e7bac), [commit 2](http://github.com/sarl/sarl/commit/73a56841960d7de27221ad27686c650e830de593), [commit 3](http://github.com/sarl/sarl/commit/19919c930c824aa88d591c6ea78f00994237a79c), [commit 4](http://github.com/sarl/sarl/commit/91263cceb21df798eb1dc9711ea441d882f2a26e), [commit 5](http://github.com/sarl/sarl/commit/cb5206671cfef9e8421cf2cb83c54650ea1ecdda))

  Until now, launching a SARL program means launching a single agent. The classpath of the application is dynamically updated for replacing the SARL libraries by the SRE's libraries (for example the Janus framework).
  In several cases, a standard application should be launched before the first agent is created. Then, this application is in charge of launching the agents with the programmatic bootstrap. A standard Java application cannot be used because the need of the dynamic replacement of the SARL libraries by the SRE's libraries is still present. A new type of launching configuration is introduced: SARL application launching configuration (the previous type is now named SARL agent launching configuration).

* Fixing issue when selecting a project SRE setting in launch configuration. ([details](http://github.com/sarl/sarl/commit/c569d435c362fa4b0cac08b32187ce400d884587))
* Add a provider of SRE, which is based on the defined SRE bootstraps as JRE services. ([details](http://github.com/sarl/sarl/commit/c819bc9fdc6e2eff0adc802c730f435547325618))

### Preferences
* Add preference page for the SARL editors. ([details](http://github.com/sarl/sarl/commit/eb38a8943cd13b677ca558e3e9f0f5da96f39db6))

### UI Components

* Move the "Open Type Hierarchy" item within the popup menu. ([commit 1](http://github.com/sarl/sarl/commit/bfe3871fb6858f10360dc287535df093d407178c), [commit 2](http://github.com/sarl/sarl/commit/c2fe4e9204ac3c8eb20d2110f41e3dd30002e204))
* Add the SRE classpath entries to the "Run as SARL application" launch configuration. ([details](http://github.com/sarl/sarl/commit/4065ed9c0071b690230bcb026e528e8c1b208821))
* Attach `F4` shortcut to the SARL open type hierarchy command. ([details](http://github.com/sarl/sarl/commit/c98314f2ca70d8e058f17698da9755c3a18c8445))
* New splash screen with date. ([details](http://github.com/sarl/sarl/commit/77106a45f99f03f1665d33ed715c91271001b08e))

### Internal Eclipse Implementation
* Fixing the invalid type of library for SARL Libraries. ([details](http://github.com/sarl/sarl/commit/9d5a1c93e0d19fdd7814d558ef60a9ea44fbb8c6))

  The SARL libraries were defined as system libraries. This choice avoids to detect them within the classpath in order to be replaced by the SRE's libraries.

* Rename `StandardProjectSREProvider` to `EclipseIDEProjectSREProvider`. ([details](http://github.com/sarl/sarl/commit/54b497fcbfad2b6c37b1380f328eec9057c6d06a))
* Move implementation from `getName` to `getNameNoDefault` in `ISREInstall` implementation. ([details](http://github.com/sarl/sarl/commit/6950e5341acf603e78fc49c81aa426f40d7dcec3))
* Remove standalone flag in `ISREInstall`. ([details](http://github.com/sarl/sarl/commit/f133dd4be9a963be0cdf7a7b7da9b3e7ae7e0f8a))

## External Contributions to SARL

### Examples
* Add template for a SARL application using JavaFX. ([details](http://github.com/sarl/sarl/commit/0a7f3a4e7a688d4197184027d9e9ab2ead8e7fb1))

  An example of SARL code is added for providing a template of a JavaFX-based application to the SARL developers.

* Reimplement the Fireworks example for using the new SARL-JavaFX API and the SARL bootstrap. ([details](http://github.com/sarl/sarl/commit/2356bf7a7b6397294854c54db2f9f2a1ac5f7d72))
* Reimplement the Sierpinski fractals example for using the new SARL-JavaFX API and the SARL bootstrap. ([details](http://github.com/sarl/sarl/commit/44773331ac7b1e05b870323f0e990b597e0ebfa8))

## Janus Run-time Environment

* Multiple spawned agents have different identifiers. ([details](http://github.com/sarl/sarl/commit/46ce8647fadae343d5cd8cc9ba4b5ef938b11544))

  Spawning of multiple agents had a buggy assignment of the agent identifier to the spawned agents.
  This change ensures that each agent has a unique identifier.

* Force the execution of the rejected tasks. ([details](http://github.com/sarl/sarl/commit/e15c3384134c0af1661f9dff2035ca90ebda3089))

  In several cases, the Java executor service is not able to assign a task to a thread. It is then rejected.
  In this case, the Janus framework ensures that the task is run by using the thread of the task's submitted.
  It partly introduces a synchronous execution of the tasks but ensures that all tasks are run by the Janus framework.

* Move the Eclipse integration of Janus into a separate plugin. ([details](http://github.com/sarl/sarl/commit/01b5278293c41ae58c5b7d8d89a8f71f25193c5d))

* Redefine the logging system for enabling agents to change the logging level. ([details](http://github.com/sarl/sarl/commit/cda3728f46fd403366f543d1aff519d4860a7712))
* Fixing the invalid update of the class path in the Boot. ([details](http://github.com/sarl/sarl/commit/fb41b2d2c4251eb648fc015d4621f50c6c3ed1cc))
* Janus command-line shows logo on Unix platforms. ([details](http://github.com/sarl/sarl/commit/318addaa4cf0de3f7f8fd42204a751137cbb5392))
* Fixing the buggy definition of the Janus SRE. ([details](http://github.com/sarl/sarl/commit/c45c02e365219bcd20dcec02475f4c3e1f0cf437))
* Show the Janus version when it crashes at start-up. ([details](http://github.com/sarl/sarl/commit/894b1c80535316bcb47ed984d6014f7fa3fa0065))

## Maven Tools

* Remove reference to Arakhne libraries within sarl-maven-plugin. ([details](http://github.com/sarl/sarl/commit/1379ec83c98ae51daca88c4e540748be2873fb52))
* Enable unit tests for the maven-sarl-plugin. ([details](http://github.com/sarl/sarl/commit/a24d15e360d0e735ae1378275656ce320506adfc))
* Update messages on the SARL maven plugin. ([details](http://github.com/sarl/sarl/commit/04ab10aebb33b2e6e3cdc01dd3ebcfcf263a3f6b))
* Internal Xtext messages are logged into the Maven CLI compiler's logger. ([details](http://github.com/sarl/sarl/commit/8d1fe926ea92c29ec16b8c23d7676ca955b9c003))

## SARL Documentation

### Documentation of the SARL Language
* Add the documentation on active annotations. ([details](http://github.com/sarl/sarl/commit/2268e7166e660d27016dc7ecece66ae87bcd8759))
* Validate the documented operator precedence. ([commit 1](http://github.com/sarl/sarl/commit/8c859f78f77f4537257cbc0488390cf66b3e6e90), [commit 2](http://github.com/sarl/sarl/commit/6ca600057e7326b37e93819df7492097754dccc6))
* Add the documentation of variables' types. ([details](http://github.com/sarl/sarl/commit/4eb69c21878983e8c648c5943c6a9156bbc04b88))
* Add the missed documentation on the numbers' extension methods. ([details](http://github.com/sarl/sarl/commit/b2db082f00baba22aa90a1e2fabe786dfce0240f))

### Documentation of the SARL Core Library
* Add documentation on the creation of function-caller-aware space. ([details](http://github.com/sarl/sarl/commit/83121f5431f6cebbf8f8003dbe190e0bcdea0df6))
* Add documentation on the SRE's bootstrap. ([details](http://github.com/sarl/sarl/commit/06d62a855a4c1773ee2a3be219a43f2cb88ad334))
* Add [privateapi](http://github.com/privateapi) within the API documentation. ([details](http://github.com/sarl/sarl/commit/27e7c917949dff7fdbd3e31c8ae7c35a2d1f494c))
* Use Java code when explaining the API access from Java. ([details](http://github.com/sarl/sarl/commit/cf287b130ac778c1aa2a045fdf76d00746e614e0))

### FAQ
* Fixing invalid FAQ text on the SARL syntax. ([details](http://github.com/sarl/sarl/commit/70f35f7377c0dc95bb5a2a3de802ec2d16aaa1d8))

### Documentation for SRE
* Provide explanations on the --jar option for janus. ([details](http://github.com/sarl/sarl/commit/9723dbb03d168dbe1b6a11b28da7aa9e4d37ad33))

### Documentation for SARL Contributors
* Add explanation for using the SARL release script. ([details](http://github.com/sarl/sarl/commit/205eb767163059907dfa0aea47562e1fb9ae1026))

### Documentation Generators
* Fail when a referenced file is not found into the documentation folder. ([details](http://github.com/sarl/sarl/commit/ca64d49ac84e07d5b742d062f91ef3f5aa0f69cc))
* Create a doclet for creating an API documentation with SARL syntax inside. ([details](http://github.com/sarl/sarl/commit/b41a53a1c75ae192ad584088bd8300a5d1bdebf7))
* Remove references to deprecated classes from Java doclet. ([details](http://github.com/sarl/sarl/commit/ca7eb7fe4171e8bc58cb91fd223d1caced9f4f7c))
* Prepare for the addition of hyperlinks for generated operation names. ([details](http://github.com/sarl/sarl/commit/9d2eb6a320ce5aaa633d4409f28b0b06d0386241))
* Remove hidden features from the API documentation. ([details](http://github.com/sarl/sarl/commit/0e77e4aba14877094b0e130a8c69b4ed2685605c))

## Community

### Github
* Add template for issues. ([details](http://github.com/sarl/sarl/commit/bc692f4f411ad3bfb73002c72e8f63faeac5b584))

### Google Drive
* Update the release guidelines for including Google Drive deployment. ([details](http://github.com/sarl/sarl/commit/c8c3f4e95386538bd3799c28a708893728d71cc4))

  Google Drive is now used as the main storage system for the SARL products.

## Tools for SARL Contributors

### All Platforms

#### Dependencies
* Upgrade to Xtext 2.13.0. ([details](http://github.com/sarl/sarl/commit/ef86f59c6570afbb47883260278c3c522ffefae6))
* Upgrade to checkstyle 8.7. ([details](http://github.com/sarl/sarl/commit/221d125c824f5305019bbab0e33b3279103e6896))
* Upgrade to AFC lib 14.0. ([details](http://github.com/sarl/sarl/commit/e6d352a92325797b661f3fb0083ce78c0e84fec0))
* Upgrade the Eclipse JDT plugins. ([details](http://github.com/sarl/sarl/commit/86fa24feb7647883b618d4d3fc24a6a53a023d95))
* Downgrade the Maven Java compiler. ([details](http://github.com/sarl/sarl/commit/5d3c0875aa8a413d25c7fe1dff187c7d0e985ead))

  The recent Maven Java Compiler uses a part of the SDK from Java 9. It is incompatible with the Java 8 compiler, and consequently cannot be used for compiling SARL.

* Upgrade to Maven 3.5.2 ([details](http://github.com/sarl/sarl/commit/d2090faf5c8f1349c91a165a0d01bc9a58224df7))
* Upgrade the Travis configuration for using Xcode 8.3. ([details](http://github.com/sarl/sarl/commit/718f491832522d25182da2682dc5044d1e61dcdf))

#### General Changes
* Replace the attributesToString() function by the Xbase ToStringBuilder. ([details](http://github.com/sarl/sarl/commit/37543e871ad92576c9f76e0e0da5117eea93daaf))
* Do not force to have "T" at the end of the generic type parameters' names. ([details](http://github.com/sarl/sarl/commit/555c7eb75d2791d77a566aac0e0f335c80171606))
* Removing void TODOs and create issues for the remainings. ([details](http://github.com/sarl/sarl/commit/3f1041e166a1f8ff7a447bb12f96b76b9f08b0fc))
* Add description of a contributor. ([details](http://github.com/sarl/sarl/commit/b441955e96982fdc83548e6d24c8ec36d3a1a468))
* Reorganize the package structure for the formatter's tests. ([details](http://github.com/sarl/sarl/commit/ccbbfd144922ae69d0b05be819b9c80222907320))
* Update the error message of `assertContains()` to output all the actual and expected elements. ([details](http://github.com/sarl/sarl/commit/20f94b75f8abd4f46a3f279db175e5beadb1d89b))

### MacOS Platform
* Downgrade Launch4j version because the latest version has invalid configuration for MacOS. ([details](http://github.com/sarl/sarl/commit/e9781fd160f3e3d4f226cec8555f86e823395186))

### Generator of the SARL Compiler (MWE2 Tools) 
* Use the StandardLanguage configuration. ([details](http://github.com/sarl/sarl/commit/6693776d83f742adba8e8ff264e3a888fa566f49))
* Explicit declaration of the formatter fragment for binding SARLFormatter. ([details](http://github.com/sarl/sarl/commit/ed86eb98ce867857b6129400ce60f448a0b54c9d))
* Fixing invalid plugin's exported folders. ([details](http://github.com/sarl/sarl/commit/0a3974838cf5cdf3001ba0b670145d88731a1e5b))
* Fixing the documentation for the VIM's formatter. ([details](http://github.com/sarl/sarl/commit/af2ce3fdb444f52d23f14e94de7b3448eb8a8a5f))



## Changes in the Previous Versions

* [Changes in the version 0.6.1](./changes_0.6.1.html)

