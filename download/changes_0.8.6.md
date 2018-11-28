---
layout: default
title: Changes in 0.8.6
---

# Changes in 0.8.6

Release date: 2018-11-28.

## 1. SARL Language

### 1.1. Java Model Inferrer

* Make the lambdas able to be serializable ([1](http://github.com/sarl/sarl/commit/13dfb0d5d17c28b65840d1606cc0c4ee445d02d5), [2](http://github.com/sarl/sarl/commit/9f409b392d05d9feebbaf082371f6ad9d4e528ac), [3](http://github.com/sarl/sarl/commit/5e35f2c94426bd645c0dac9e0ce8d095533fefba)). A lambda is usually used for specifying the scope of the event sending actions. Since a lambda contains a code that reference local objects, and the scope is evaluated when the event is deliver to each agent, the scope function cannot be properly evaluated when the event and its scope have been transferred through a computer network. This change into the SARL compiler enables to generate a Java version of the lambdas in order to be serializable.

### 1.2. SARL Core Library

* Move number extensions into the module `io.sarl.lang.core` ([details](http://github.com/sarl/sarl/commit/9ebe793ced14314e0f966d37bc2201bfe5d32719)). The extensions are usually used for generated an inline version of the operations on the numbers. When the `@Inline` is disabled into the compiler configuration, the Java functions provided by the number extensions must be accessible from the public SARL API. Consequently, the extensions are moved from the module `io.sarl.lang` (private API) to `io.sarl.lang.core` (public API).

### 1.3. Command Line Compiler

* Remove hard dependencies to experimental contributions ([details](http://github.com/sarl/sarl/commit/e023358599c74e79e5f95eb439e29f72f73ba691)). This decision enables to avoid run-time errors when the experimental libraries are not available in the tool's classpath.


## 2. SARL Development Toolkit (SDK)

* Ensure API events are fully serializable ([details](http://github.com/sarl/sarl/commit/d3eaaecd6527645544e2bf33efde8dcfc3d0ba0e)). All the events that are defined into the SDK are fixed in order to enable their serialization. 


## 3. Janus Run-time Environment

* Gson serializer is disabled because it cannot handle the lambda serialization ([details](http://github.com/sarl/sarl/commit/cbd6814c55474e722128fb4a10d93d2209aeabc1)). It is replaced by the native Java serializer.
* Send events into the local instance of the SRE if an error occured when sending over the network ([details](http://github.com/sarl/sarl/commit/9d3adb6ab8ba80de4cb42cc32333cfd835aa528c)).
* Fixing the formatting of the error messages into the network service ([details](http://github.com/sarl/sarl/commit/d35e17b827b0a69c13bbf1dea7b38c3e55f901bb)).
* Fixing error messages of the GsonEventSerializer ([details](http://github.com/sarl/sarl/commit/4f7271a41bf90ec895e4f2f3adae6dad055a5621)).


## 4. Eclipse Product

### 4.1. Internal UI Implementation

* Avoid the double paste of a text into the SARL editor ([details](http://github.com/sarl/sarl/commit/688b693792bad84088551ac2912314337aa65854)). When the "auto-formatting when pasting" feature was enabled, the text is pasted two times. This change fixes this issue.
* Print a warning when the errors in the editor and the SARL model are not the same ([details](http://github.com/sarl/sarl/commit/56c77adabaac13eacada9e21e1084419487c8293)). This change shold enable the SARL developpers to detect when and why the state of the SARL editor becomes invalid regarding the SARL model behind the editor.

### 4.2. Eclipse Product

#### 4.2.1. Launching Configurations

* Re-enabling the source tab into the SARL launch configurations ([details](http://github.com/sarl/sarl/commit/fb7e37e77e58b1a9f8d039b221fd8195d13e9cda)). This tab is used to configuration the search path for the SARL sources.

#### 4.2.3. UI Components

* Avoid to open a dialog box for adding the SARL nature to a project ([details](http://github.com/sarl/sarl/commit/b8608b437c5404fcc76ecf6f092aa25ce609c8ab)). The addition of the SARL nature is added without querying the user to confirm.


## 5. Maven Tools

* Remove hard dependencies to experimental contributions ([details](http://github.com/sarl/sarl/commit/e023358599c74e79e5f95eb439e29f72f73ba691)). This decision enables to avoid run-time errors when the experimental libraries are not available in the tool's classpath.


## 6. SARL Documentation

* A language comparison is written into a specific page ([1](http://github.com/sarl/sarl/commit/e2181cca47f48ad8d720011e197e24bc55f572b8), [2](http://github.com/sarl/sarl/commit/29894d4ae80b650cec10b4ce7af533f9111e8ba0)).


## 7. Tools for SARL Contributors

* Add unit test for testing the operation conformance on numbers. ([details](http://github.com/sarl/sarl/commit/0c774e2dc74795ab179748ca2be084f90c46b1c2)) Xbase library is officially conformant to the Java specification regarding the typecasting (implicit or explicit) of the numbers. In order to highlight the different cases, and to prepare SARL for the introduction of the cast operator overriding, a set of unit tests have been added.
* Make the test tools faster ([1](http://github.com/sarl/sarl/commit/0a9e8eb36abbfb0fb765fa276da11e45b19aa8c1), [2](http://github.com/sarl/sarl/commit/e3966d577f94a4d7a376c084048ac491b8dfea85)).







## 6. Changes in the Previous Versions

* [Changes in the version 0.8.5](./changes_0.8.5.html)
* [Changes in the version 0.8.4](./changes_0.8.4.html)
* [Changes in the version 0.8.3](./changes_0.8.3.html)
* [Changes in the version 0.8.2](./changes_0.8.2.html)
* [Changes in the version 0.8.1](./changes_0.8.1.html)
* [Changes in the version 0.8.0](./changes_0.8.0.html)
* [Changes in the version 0.7.2](./changes_0.7.2.html)
* [Changes in the version 0.7.1](./changes_0.7.1.html)
* [Changes in the version 0.7.0](./changes_0.7.0.html)

