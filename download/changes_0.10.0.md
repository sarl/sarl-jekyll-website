---
layout: default
title: Changes in 0.10.0
---

# Changes in 0.10.0

Release date: 2019-10-26.

## 1. Major Changes

Number of major changes : 8


### 1.1. Support of Java 11

The entire SARL project was tested against the versions 8 and 11 of Java.
The version 8 must still be used for running the SARL DSL Environment in order to create SARL libraries that could be used on a JRE 1.8.

For application developers who are using SARL, they could use either Java 8 or Java 11 for running the SARL Development environment, or
the SARL applications that are the result of the SARL compilation.


### 1.2. Try-with-resources

The try-with-resources statement is a try statement that declares one or more resources.
A resource is an object that must be closed after the program is finished with it.
The try-with-resources statement ensures that each resource is closed at the end of the statement.
Any object that implements `AutoCloseable`, which includes all objects which implement `Closeable`, can be used as a resource.

The following example reads the first line from a file. It uses an instance of `BufferedReader` to read data from the file.
`BufferedReader` is a resource that must be closed after the program is finished with it:


	def readFirstLineFromFile(path : String) : String {
		try (var br = new BufferedReader(new FileReader(path))) {
			return br.readLine
		}
	}


In this example, the resource declared in the try-with-resources statement is a `BufferedReader`.
The declaration statement appears within parentheses immediately after the `try` keyword.
The class `BufferedReader`, inherited from Java libraries, implements the interface `AutoCloseable`.
Because the `BufferedReader` instance is declared in a try-with-resource statement, it will be closed regardless of
whether the `try` statement completes normally or abruptly.


### 1.3. Implicit Names for Lambda Formal Parameters

When a lambda (also known as closure) has multiple parameters, and no name is provided by the SARL developer, the SARL compiler in its previous version generates an error because it was able to consider only `it` as an implicitly declared variable, i.e. there was too many implicit parameter to declare by the compiler and it cannot do that.

In its version 0.10, the SARL compiler is able to a generate default name for each of the formal parameters of a lambda, even if there are multiple unnamed parameters.
The implicit name for the first parameter becomes `$0`, `$1` for the second, `$2` for the third, etc.

The example below shows the definition of an interface, a class that is calling an instance of the previous interface, and a piece of code that is invoking the class.
It is interesting to note that the arguments' values of the lambda expressions are accessed with their implicit names.


	interface MyInterface {
		def a(a : int, b : char, c : String)
	}
	
	class MyClass {
		def b(lambda : MyInterface) {
			lambda.a(1, '2', "3")
		}
	}
	
	var i = new Myclass
	i.b [
		println($0)
		println($1)
		println($2)
	]


### 1.4. Introduction of the two events ParticipantJoined and ParticipantLeft

The events `ParticipantJoined` and `ParticipantLeft` are introduced.
The first is fired when an agent has joined a space that has participants, e.g. an event space.
The second is fired when an agent has left a space.


### 1.5. Better Concurrent Execution with Read-Write Locks

The uses of mutual exclusion locks were replaced by similar uses of read-write locks.

A read-write lock maintains a pair of associated locks, one for read-only operations and one for writing.
The read lock may be held simultaneously by multiple reader threads, so long as there are no writers.
The write lock is exclusive.
The read-write lock implementation guarantees that the memory synchronization effects of `writeLock` operations also hold with respect to the associated `readLock`.
That is, a thread successfully acquiring the read lock will see all updates made upon previous release of the write lock.

A read-write lock allows for a greater level of concurrency in accessing shared data than that permitted by a mutual exclusion lock.
It exploits the fact that while only a single thread at a time (a writer thread) can modify the shared data, in many cases any number of threads can
concurrently read the data (hence reader threads). In theory, the increase in concurrency permitted by the use of a read-write lock will lead to
performance improvements over the use of a mutual exclusion lock.


### 1.6. Tool for generating the API documentation

Sarldoc is a documentation generator for the SARL language for generating API documentation in HTML format from SARL source code.
The HTML format is used for adding the convenience of being able to hyperlink related documents together.
To pass source code to sarldoc, you have to provide the names of the folders in which the SARL code files are located.
Then, the sarldoc tool generates a set of HTML files that contains the API documentation of your program.


### 1.7. Performance improvements

The SARL compiler was reviewed in order to remove several memory leaks that cause low performances when compiling large number of SARL files. Even if this task is always active, several improvements have been obtained in this version of SARL.


### 1.8. New demonstration: the Reynold's Boids

Boids is an artificial life program, developed by Craig Reynolds in 1986, which simulates the flocking behaviour of birds. The name "boid" corresponds to a shortened version of "bird-oid object", which refers to a bird-like object.
As with most artificial life simulations, Boids is an example of emergent behavior; that is, the complexity of Boids arises from the interaction of individual agents (the boids, in this case) adhering to a set of simple rules. The rules applied in the simplest Boids world are as follows:

* separation: steer to avoid crowding local flockmates;
* alignment: steer towards the average heading of local flockmates;
* cohesion: steer to move toward the average position (center of mass) of local flockmates.

The SARL development environment provides an implementation of the Reynold's Boids within the set of available "examples."
This version of the Boids is implemented with the Java AWT graphical library.


## 2. Detailed Changes

### 2.1. SARL Language

#### 2.1.1. SARL Syntax

* Add support for try-with-resource statements ([details](http://github.com/sarl/sarl/commit/3fda23ac3fdd614f7026b3e9466b96547d031a41)).
* When a lambda has multiple parameters, and no name is provided by the SARL developer, the compiler generates default names for each of the formal parameters. The implicit name for the first parameter is `$0`, `$1` for the second, `$2` for the third, etc. ([details](http://github.com/sarl/sarl/commit/1056c08d08e1bc7bc209cfb43e6a80a8127ea5d1)).
* `throw` becomes a statement that has side effect ([details](http://github.com/sarl/sarl/commit/f69552d67f29573c56b24d0af45c5f981393d06d)).

#### 2.1.2. SARL Validator

* Use read-write locks in place of the mutual exclusion locks ([1](http://github.com/sarl/sarl/commit/bca119548da6c34b73e27bb101e295adce728d33), [2](http://github.com/sarl/sarl/commit/af3b9adb2c3b3b9f0f701b3cd8e3423f9f58976d)).
* Avoid the generation of "possible side-effect on occurrence" when `occurrence` is used within complex expressions ([details](http://github.com/sarl/sarl/commit/e6f6f7036f5b9a408f8e0064ca42c6a5c04e3a96)).
* Change the texts associated to the warnings on the possible invalid usage of `occurrence` ([details](http://github.com/sarl/sarl/commit/925187245dd336359e336b75ae3f6e702ca4e31c)). The meaning of previous error message was not enough clear to the SARL developers. The message is refactored in order to be more explicit and clear.
* Remove the search of the Xtext library on the classpath when validating ([details](http://github.com/sarl/sarl/commit/c7dfbfefcd720dd17d32aecad02a7e34f5529cc0)).
* Allow to ignore warnings related to raw types ([details](http://github.com/sarl/sarl/commit/b1dfa05adaf6515ff162791a3bfc8bca46c79db9)).

#### 2.1.3. Java Model Inferrer

* Use read-write locks in place of the mutual exclusion locks ([details](http://github.com/sarl/sarl/commit/bca119548da6c34b73e27bb101e295adce728d33)).
* Avoid memory leaks caused due to cyclic references in the action prototype provider ([1](http://github.com/sarl/sarl/commit/e7999e6806d32511b1326b581b90f2a2f1065eb8), [2](http://github.com/sarl/sarl/commit/82edde914855b8f2306f46e9363da8fb5aa1b580)).
* Add `release()` function in the `GenerationContext` type in order to limit memory leaks ([details](http://github.com/sarl/sarl/commit/bcfca13b8dd30a9d67ea16a8b902ae66c4c007f6)).
* Use string representations for the SARL version ([details](http://github.com/sarl/sarl/commit/6a01e6475237edff6843da1eb4f9bc0801d2563f)). The version of SARL was stored into a floating-point number. This approach was fine until the version becomes 0.10. With this version number, it is impossible to make the difference between `0.1` and `0.10`.
* Fixing the automatic annotation related to the purity of the function ([details](http://github.com/sarl/sarl/commit/e454e62d25bb57587b2717fe1652871759b399c9)).

#### 2.1.4. SARL Core Library

* Use read-write locks in place of the mutual exclusion locks ([details](http://github.com/sarl/sarl/commit/bca119548da6c34b73e27bb101e295adce728d33)).
* Events:
  * Add the events `ParticipantJoined` and `ParticipantLeft`, and the associated supported into the SRE ([details](http://github.com/sarl/sarl/commit/1ebc123d16032b0a646b0f21b1aa6aad5538410f)).
* Context:
  * Updating the documentation of `getOrCreateSpaceWithSpec` in order to indicate that the default space is ignored ([details](http://github.com/sarl/sarl/commit/c8638205238e2573895be0f446102af4c143b8e4)).
* Annotations:
  * Enable the [DefaultSkill](http://github.com/DefaultSkill) annotation ([details](http://github.com/sarl/sarl/commit/277a1534b9a9be9f2d9f46656f3926adbdb92693)). This annotation could be attached to a `Capacity` in order to specify the default skill to create into an agent, if one skill is not explicitly provided.
  * Move the `SarlAccessorsProcessor` annotation, which is provessing the `@Accessors` annoations into the SARL core library ([details](http://github.com/sarl/sarl/commit/a36aecbe86567fddd2a1da3b33e0ba2fa4285b1c)). Indeed, for being used by the compiler, the `SarlAccessorsProcessor` annotation must be in the classpath of the project, i.e. the core library.
* Core:
  * Change the access modifier to public for the pure functions of `AgentTrait` ([details](http://github.com/sarl/sarl/commit/a377633b8d17a9030f4d53fb097a12489cf1a15c)) in order to enable access to these read-only information.
* Bootstrap:
  * Add `getService` function into the Bootstrap ([details](http://github.com/sarl/sarl/commit/1dccd1c91a465bdd68f34ca8dc3563f26d5189ca)). This function enables the access to SRE services from any point in the code.
  * Add `getKernelLogger` function into the Bootstrap ([details](http://github.com/sarl/sarl/commit/6bf3c4143f4a967e11ad43474d266fe23cfc0aa5)). This function enables the access to the SRE kernel logger from any point in the code.
  * Add `isRunning` function into the Bootstrap ([details](http://github.com/sarl/sarl/commit/a0f9911e8d96fe43a7db259e4cb5056f2baf9504)) in order to determine any instance of the SRE is running.
  * Add `startAgentWithID` function into the Bootstrap ([details](http://github.com/sarl/sarl/commit/c6fe8a1c6ccf84166f98a38dec2a953419d7e1bc)).

#### 2.1.5. SARL Batch Compiler

* Use read-write locks in place of the mutual exclusion locks ([details](http://github.com/sarl/sarl/commit/bca119548da6c34b73e27bb101e295adce728d33)).
* Fixing classpath definition into the batch compiler that avoid proper compilation on certain siuations ([details](http://github.com/sarl/sarl/commit/65923327be097709103d948100818f2be14a7bfb)).
* Fixing the deletion of the temporary folders that are created by the batch compiler ([details](http://github.com/sarl/sarl/commit/1db12587527b20b7ac44e914082e1f76f15a8580)).

### 2.2. SARL Development Toolkit (SDK)

* Use read-write locks in place of the mutual exclusion locks ([details](http://github.com/sarl/sarl/commit/bca119548da6c34b73e27bb101e295adce728d33)).
* Remove `io.sarl.javafx` from the SDK ([details](http://github.com/sarl/sarl/commit/51cfaba39d41ef9eb15fbf6d199231ae83149036)). The features that are provided by this module are not supposed to be used by all the SARL applications. Moreover, the dependency to JavaFX libraries (in JDK or not) should be managed by the SARL developer, not by the SARL SDK itself. The module is transformed into a maven library (see below).
* Move concurrent utilities into a dedicated package ([details](http://github.com/sarl/sarl/commit/2ac315b60b630ceea2d92993042586ce014324c5)).
* Fixing the API documentation for `Collections3` ([details](http://github.com/sarl/sarl/commit/8bd69f6977d57b930f8f19249401bdbf04d48297)).

### 2.3. Eclipse Development Environment

#### 2.3.1. General Changes

* Use the Concurrent Mark Sweep GC that may provide better performances ([details](http://github.com/sarl/sarl/commit/9eb099792d730dd6edbf6e2e6249be35e67c324b)).
* Do not generate launching scripts for 32-bit platforms ([details](http://github.com/sarl/sarl/commit/43076d4a04ddb4587349388459650c33f2f4845b)).
* Change splash screen and about dialog's pictures ([1](http://github.com/sarl/sarl/commit/440b3d9fcda65a4a6f86404c06c191e11142d4d6), [2](https://github.com/sarl/sarl/commit/244372711037222ef7f88b2981196db19f430442)).
* Add en entry into the FAQ about the difference between the "SARL agent" and "SARL application" launch configurations ([details](https://github.com/sarl/sarl/commit/ba65993152a04b8f670d20fd54de0582755d571f)).

#### 2.3.2. Outline Component

* Add the getter and setter functions when no argument is provided to the [Accessors](http://github.com/Accessors) annotation ([details](http://github.com/sarl/sarl/commit/85d1a2f0229778e35ee56acafa985a2259b5a0a6)).
* Display the accessor functions when multiple types of accessors are given to the [Accessors](http://github.com/Accessors) annotation ([details](http://github.com/sarl/sarl/commit/9ef4cb6a716a8eb9fefb96058862d8cbe99a2ec8)).
* Unify the rendering of the members into the inner types and the root types ([details](http://github.com/sarl/sarl/commit/ffbb19e34fc4ec5dac5ad05b99a52250efc94fbf)).
* Show inherited constructors when the type has no member ([details](http://github.com/sarl/sarl/commit/d65a8cfafaa21315d59c40205140d51a5485446f)).
* Colorized with a specific color (that could be edited into the general preferences) the inherited constructors ([details](http://github.com/sarl/sarl/commit/189a265c71298fa40efc42ea0e7268373661449b)).

#### 2.3.3. Wizards

* Add the events `SpaceCreated`, `SpaceDestroy` into the template that is used by the new-agent wizard ([details](https://github.com/sarl/sarl/commit/84110684478012552c1357c6486d4913ac1e9973)).
* Fixing the incorrect behavior of the project creation wizard when the manually provided folder of the project already exists and contains a non maven SARL project with java files ([details](https://github.com/sarl/sarl/commit/3a6ba529bb317924b4ac8910c8ecd6caacb21298)).
* Fixing description text of the wizards ([details](http://github.com/sarl/sarl/commit/d1101b90043d0d48dd12ed4f85e78c2a24de8345)).

#### 2.3.4. Other Components

* Enable the programmatic creation of launch configurations with a given name ([details](https://github.com/sarl/sarl/commit/cea4caab8a0a83ecb3e3691f50802b165d51c343)).
* Export the icons into the m2e plugin ([details](http://github.com/sarl/sarl/commit/1b3e29f207b85c9bb78dc509fa42b62b53e8421f)).
* Replace the calls to the deprecated function `AbstractUIPlugin.imageDescriptorFromPlugin()` ([details](http://github.com/sarl/sarl/commit/3d29e46cf728c1a0ce4ef7502a1f9978f2a6b44a)).

### 2.4. External Contributions to SARL

#### 2.4.1. Examples

* Add example : Reynold's Boids ([1](https://github.com/sarl/sarl/commit/b10d34ca7af8a51087c31d58dc6b3cad0355ad55), [2](https://github.com/sarl/sarl/commit/137c93576bff3e4b1fc9ae4e708c92f59a098943)).
* Update the "hello world" example, following the upgrade of the event dispatching mechanism ([details](https://github.com/sarl/sarl/commit/73004bb750ba51607c98ec5a314c0f223c5a4d8a)). The agent does not receive any more the system events that it is not supposed to received. Then, the corresponding `on` statements were removed.
* Add launch configurations for each example project ([details](https://github.com/sarl/sarl/commit/5383cd46f1dff261b87e14eb139e0c9497645843)).
* Add the capability to create a launch configuration for each example into the example-creation wizard ([1](https://github.com/sarl/sarl/commit/21b6799131f4565cd7a88e43b33033e87c2e243f), [2](https://github.com/sarl/sarl/commit/c38196f60d7d508b1ad6d9eeb532d07a3d34753c), [3](https://github.com/sarl/sarl/commit/2abb38ebce2d0f887df31ac78a4d36e37062a72d)).
* The syntax for paths of the files to open that are specified into the `plugin.xml` file is normalized ([details](https://github.com/sarl/sarl/commit/a40596ac5f7890aec02a7529b551d40c2159983b)). The example-creation wizard searches for the file based on the specified location (named `<loc>` below):
  1) file with path `<loc>` exists;
  2) file with path `<project-name>/<loc>` exists;
  3) file with path `<project-name>/src/main/sarl/<loc>` exists.
* Enable the injection instances of the SARL component into the example-creation wizard ([details](https://github.com/sarl/sarl/commit/a8b894033d4f15b615512c96dbcffe1f2041d5bf)).
* Explain how to launch each JavaFX example into their README ([details](http://github.com/sarl/sarl/commit/73d8f0431d807d45ba71492ba35aabc2a99b68d4)).
* Change the background of the examples' icons from black to white in order to be integrated in a nicer way into the Eclipse environment ([details](https://github.com/sarl/sarl/commit/31e2d61b6b0f9445809feb2c4eaf4bbd1a195933)).

#### 2.4.2. LaTeX Styles

* Remove color macros from the not-colorized LaTeX style ([details](http://github.com/sarl/sarl/commit/4095562b644a36efe83e7f64e33f8f3bd488d6e0)).

### 2.5. Janus Run-time Environment

* Add the support of the events `ParticipantJoined` and `ParticipantLeft` ([details](http://github.com/sarl/sarl/commit/1ebc123d16032b0a646b0f21b1aa6aad5538410f)).
* Use read-write locks in place of the mutual exclusion locks ([details](http://github.com/sarl/sarl/commit/bca119548da6c34b73e27bb101e295adce728d33)).
* Add shutdown function in order to force shutdown programmatically ([details](http://github.com/sarl/sarl/commit/fa4f390e97be85ceb1732e74e2242f74cfe976df)).
* Inject the default space instance into the space specifications ([1](http://github.com/sarl/sarl/commit/5f3950372dd2b22f7b08e44d5aa6dde593baf5aa), [2](http://github.com/sarl/sarl/commit/6549c38111c915a83eff9c5d24c0e95470d41a99)).
* Ignore the default space inside the `getOrCreateSpaceWithSpec` function ([details](http://github.com/sarl/sarl/commit/2b6a1e15e3011b42c3b1f129cb2937c1a71ec3f0)).
* Replace the cached thread pool by a fixed thread pool with 32 threads in order to avoid out-of-memory exception due to a too large number of created threads ([details](https://github.com/sarl/sarl/commit/84facf175bfdd16ceeb1ed5e1306743346c0f533)).
* Add a constraint on the maximum version for the JDK into the Janus launching scripts ([details](http://github.com/sarl/sarl/commit/c3475bd955fc614b5e4beafe39449973a72d9f15)).
* Propagate the deprecation flag from `StandardBuiltinCapacitiesProvider` to the invokers of this provider ([details](http://github.com/sarl/sarl/commit/69538e4178728183ed4f81952a00d386fb398ae7)).
* The Janus Boot object uses now two output streams: standard and error ([details](http://github.com/sarl/sarl/commit/47b0d3927a60894c81360238b901948f0654ee67)).
* Add links to the Gitter forum into the FAQ ([details](https://github.com/sarl/sarl/commit/30d9d59a25cd0194b13c6f99140b9c8bd0d3c218)).

### 2.6. Maven Tools

#### 2.6.1. Maven Base Library

* Add the implicit dependency to guice multibindings library, which is implicitly used by guice but not present into the dependencies ([details](http://github.com/sarl/sarl/commit/6fd55a721051e10d684e42cb06b5c66222e4386c)).

#### 2.6.2. Bootique Application Module

* Add Maven library for building a bootique-based application ([details](http://github.com/sarl/sarl/commit/dc5cc4926741679b143bc164963a825f0164a0a1)).
* Catch the bootique and guice exceptions, and format them in a better way for console logging ([details](http://github.com/sarl/sarl/commit/7389257c666384b004ce5e90169e808c683429ef)).

#### 2.6.3. JavaFX Application Module

* Add `io.sarl.javafx` module ([details](http://github.com/sarl/sarl/commit/e429d9d8b4c8299e9d26e56c904a38f3825e8da6)).

#### 2.6.4. Documentation Generator Plugin

* Remove unnecessary Maven dependencies into the documentation generator and the associated testing project ([details](http://github.com/sarl/sarl/commit/62d21173a2146f2b8f33006193f43c5f44df09ba)).

### 2.7. Command-Line Tools

#### 2.7.1. sarlc

* Rename "working directory" options and functions to "temp directory" ([details](http://github.com/sarl/sarl/commit/29a275a81e9184578c5c0e399e83b67429bd88b3)).
* Ensure canonical paths are used by sarlc to properly detect the project's file structure ([details](http://github.com/sarl/sarl/commit/7d02ce2d0ed04cc67e9f08f3ad7fadf6cc15850e)).
* Deep re-implementation of the tool in order to fix the issues in the computation of classpath that was resulting to an invalid path ([details](http://github.com/sarl/sarl/commit/3b1b0ec8469686c99942b0d0c5249a2c7edce718)).

#### 2.7.2. sarldoc

* Add the `sarldoc` command-line tools for creation the API documentation from the CLI ([1](http://github.com/sarl/sarl/commit/9da2496e2dcc0a73b6287c439cfee1fc36f48cbb), [2](http://github.com/sarl/sarl/commit/e5e67fc23ea614660d916e7c79f4152c53f345e6), [3](http://github.com/sarl/sarl/commit/45e33c6302f3f8ac1c67955a152ccddd54230e73), [4](http://github.com/sarl/sarl/commit/92f5fc77ceeb8dd13e31f12b469a09d918aac03d), [5](http://github.com/sarl/sarl/commit/835acc4adcbc6c5516e093cc52b6426a60f5e4e3), [6](http://github.com/sarl/sarl/commit/bcf9b90a37d6a0abf008f5e0cbb64a461264cfe7), [7](http://github.com/sarl/sarl/commit/dfeb08b94a1bc9ab2acf0cce8e6fc8100ca51521), [8](http://github.com/sarl/sarl/commit/c916031e6b738aaf410da4a4791ac6f5049a831e), [9](http://github.com/sarl/sarl/commit/2387857a792cd79190780c3753e465c9d82c09b0))

### 2.8. SARL Documentation

* Add a document on how to inject the default space instance into a space specification ([details](http://github.com/sarl/sarl/commit/6ce2a0cbc7cfa23545b8988936b00aadb30021b8)).
* Add the documentation page for the sarldoc command line tool ([details](http://github.com/sarl/sarl/commit/8cd151d007d6c07d4c593c04489d2b0507e53af7)).
* Remove unnecessary documentation ([details](http://github.com/sarl/sarl/commit/2a4975078961e3e6380b74bd03fb80f3816df786)).

### 2.9. Tools for SARL Contributors

#### 2.9.1. Development Environment

* Validate the use of the Java versions 8 and 11 ([details](https://github.com/sarl/sarl/commit/271d7affe54efbc365e9199824a733fcc5fdfae1)):
  * Version for running the SARL DSL Environment: min 1.8, max 1.8;
  * Version for running the SARL Development Environment: min 1.8, max 1.11;
  * Version for running the SARL applications: min 1.8, max 1.11.
* Force the `build.properties`, `MANIFEST.MF` files and specific Java classes to contains the JDK and JRE version numbers that is provided in the general pom file ([details](https://github.com/sarl/sarl/commit/9ac7a0ef13389e21f3f19ec43b9d5ec95031122b)).
* Update the Eclipse working sets ([details](http://github.com/sarl/sarl/commit/7042b8392cb7b74e8e8aad5ebfd9666b0017d6f6)).
* Update the minimum versions of the tools into the contributor documentation ([details](http://github.com/sarl/sarl/commit/10722f450c6c401160d939b6cc4c8b607fbca6cd)).
* Update the release guidelines ([details](http://github.com/sarl/sarl/commit/ca00ff994598c730339972def4e19a60e0b8cace)).

#### 2.9.2. Dependencies

* Make the `io.sarl.javafx` module able to use the JavaFX's dependency for JDK8 or JDK11 ([details](https://github.com/sarl/sarl/commit/d4280730d3a0432a4f8f074d79204602120ef69d)).
* Upgrade to Eclipse 2019-09 and Xtext 2.19 ([details](http://github.com/sarl/sarl/commit/d3d62a77ae31ba4d5af20d74302063c44deae66e)).
* Upgrade to guava 21.0 ([details](http://github.com/sarl/sarl/commit/e2fc12b3c8025e160e0d0ca1d0f9ce889cdda9ae)).
* Upgrade to afc 16.0 ([details](http://github.com/sarl/sarl/commit/3291b6786dbfa8c6d094c0faf668f7abc1c1c41c)).
* Upgrade to slf4j 2.0.0-alpha1 ([details](http://github.com/sarl/sarl/commit/5a1f0ab8a6b70b9ea2f34709feec0d80eeb673e9)).
* Upgrade to hazelcast 3.12.1 ([details](http://github.com/sarl/sarl/commit/a562cee0a2c58353b37058fedc4b80bc354c9ec7)).
* Upgrade to flexmark 0.50.16 ([details](http://github.com/sarl/sarl/commit/240b1243e65b0389443345b4988312a2d631f93c)).

#### 2.9.3. Back Door to the SRE

* Add `setInternalSkill` ([details](http://github.com/sarl/sarl/commit/aeb75789cdcb8f3647b9aad0c506c5233343b8f4)).
* Deprecate unused functions into `SREutils` ([details](http://github.com/sarl/sarl/commit/32de24f5983ddf870af4bd8ed498d054c69ec53a)).

#### 2.9.4. Unit Tests

* Add tests for casting operator overidding ([details](http://github.com/sarl/sarl/commit/d98a14138d16763fea1a53eefd2f08e1ff9c7eda)).
* Add the unit tests for `Accessors` annotation ([details](http://github.com/sarl/sarl/commit/0b521479ea5bbd0ed621fb09038d2dde0468b886)).
* Add several missed tests ([details](http://github.com/sarl/sarl/commit/dd6fe7e2e2dcd8172225a7437c019e139bd3c39c)).
* Add unit tests for the CLI program sarlc ([details](http://github.com/sarl/sarl/commit/cc33683cbed3b9ba74044c83299e932ca214f6b1)).
* Add unit test for testing the launch of Janus, i.e. dependency checking ([details](http://github.com/sarl/sarl/commit/61fa16eda3a1a6d428db7e9634598ea3c4eda3c4)).


#### 2.9.5. Generator of the SARL Compiler (MWE2 Tools) 

* Add an hidden dependency that is mandatory for running the MWE2 script ([details](http://github.com/sarl/sarl/commit/06e88a591e78cf52d3b4517ab19f2ba3220a6d99)).
* Replace the call to the deprecated function `Files.toString()` ([details](http://github.com/sarl/sarl/commit/787b54158f663456a4b764d4c17b5c78a9e82bcd)).
* Ensure that the `DefaultActionPrototypeProvider` is an eager singleton in order to limit memory leaks ([details](http://github.com/sarl/sarl/commit/32f6fff95ca942a607adb4d1676f299f710692d4)).




## 3. Changes in the Previous Versions

* [Changes in the version 0.9.0](./changes_0.9.0.html)

