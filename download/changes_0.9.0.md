---
layout: default
title: Changes in 0.9.0
---

# Changes in 0.9.0

Release date: 2019-04-15.

## 1. SARL Language

### 1.1. SARL Language Grammar

* Major upgrades:
  * Upgrade to Xtext 2.17.1 ([1](http://github.com/sarl/sarl/commit/fa1771a8185ba35f4417a26b85e107d00a371c1b), [2](http://github.com/sarl/sarl/commit/f7343006b4694de8343543ff4d0df47a8c78f360), [3](http://github.com/sarl/sarl/commit/dee2fc05aba1512ba87628bcc11f6c31a3068d6c)). This version of Xtext provides better performances. It is also fixing issues related to the Xtext editor.
 * Upgrade to Eclipse 2019-03 ([details](http://github.com/sarl/sarl/commit/5c095d62a99ad3ae51a682b8af9dc6ad68f63372)). See [major implications of this upgrade](#3_1_Multi_platform_Configurations).
* Operators:
  * Add overriding of the cast operator ([1](http://github.com/sarl/sarl/commit/b1f3c8520eee87f54f7f46b53b6bfd54c403af2c), [2](http://github.com/sarl/sarl/commit/0a62cdf1cf57f00a5956cd7816bc457af2e90f7b), [3](http://github.com/sarl/sarl/commit/0b602a1010dfa3584d7f599e59816af2f3abd4f3)): it is now possible to create overriding functions that may be invoked when the `as` operator is used and the standard casting behavior cannot be applied. Several casting operations are predefined for convertings numbers and strings.
* Active Annotations:
  * Enable [active annotations](http://www.sarl.io/docs/official/reference/general/ActiveAnnotations.html) on SARL type declarations. ([details](http://github.com/sarl/sarl/commit/efc3585fd99efdaef708d25da3be4064714ce370))
* References to `it` into the closures/lambdas:
  * Bug fix: implicit references to `it` into the closures are not causing serialisation issues, e.g. when the lambda is embedded into an event as the scope of this event. ([details](http://github.com/sarl/sarl/commit/3095f04ed8a08747a29be0ccb04d53fb3b372949))
  * Bug fix: avoid infinite loop when searching for `it` references into the lambda expressions ([details](http://github.com/sarl/sarl/commit/9d4ea66ce5646b06bea4bb5e20fc7e028f42c399)).

### 1.2. SARL Validator

* The validator warns only when a event firing declaration does not concern an early-exit event. ([details](http://github.com/sarl/sarl/commit/cbf663090a7b4ef3828cfeb1d2c9aff549847177))
* The warning "unused function" is not any more generated when a function is invoked with one of its arguments with a default values ([details](http://github.com/sarl/sarl/commit/342b3f69efbaabc8edb8b927d6db693643de2287)).

### 1.3. Java Model Inferrer

* Avoid Java error when using `it` variable into the serializable lambdas. ([details](http://github.com/sarl/sarl/commit/885910369457d17f636ad74749001199dbd81863))
* Make the generation of the type members faster. ([details](http://github.com/sarl/sarl/commit/ebe9bb805a5e27e9ea805cdf798baf4327807dc3))
* Ignoring files without Xtext content during the generation of the Java code ([details](http://github.com/sarl/sarl/commit/4150202c493e00134e9de80ac13f0e0a4da52de7)).

## 2. SARL Development Toolkit (SDK)

### 2.1. New Features

* Add casting operators for:
  * strings and numbers ([details](http://github.com/sarl/sarl/commit/c27aeb9ec853501cd890f744cc5c51163785fd82)).
  * strings and booleans ([details](http://github.com/sarl/sarl/commit/fce1b1afa9f1b76b706a48386ecc769786bcf977)).
  * Big numbers ([details](http://github.com/sarl/sarl/commit/2dc79846eff8a22ad7a99ed2eea3f01bcfd34100)).
* Bootstrap API:
  * add functions into the Bootstrap API ([details](http://github.com/sarl/sarl/commit/64908d58e6d94426dff87ee4b9c53243069a6d13)): `setSpecificContextUUID`, `setUniverseContextUUID`, `getUniverseContextUUID`, `setUniverseSpaceUUID` and `getUniverseSpaceUUID`.
  * deprecate `setDefaultContextUUID` ([details](http://github.com/sarl/sarl/commit/85e1f21ec63fa3a383a5f50e27839191c547fc29)).

### 2.2. Time Extension

* Replace the numeric constants into the inline expressions of the time extension by the corresponding static constants ([details](http://github.com/sarl/sarl/commit/c13b9a022fb18a7c21628596d84ddf126b5fd5e5)).

## 3. Eclipse Product

#### 3.1. Multi-platform Configurations

* Removing all the support for x86 architectures ([details](http://github.com/sarl/sarl/commit/0b99ed715b6c1ed0e9da371e5601da1edf2b6564)). These architectures are not any more supported by the Eclipse framework. Consequently, these is not any more a SARL product for the 32-bit platforms.

#### 3.2. UI Components

* Add the action "Convert to SARL Maven Project" into the pop-up menu on a project ([details](http://github.com/sarl/sarl/commit/8e7448a81c884101bf87c2bdaaca1221a04c33d4)). This option enables to convert a standard SARL project into its equivalent Maven SARL project.
* Do not display the editor's inconsistent state when the editor is dirty ([details](http://github.com/sarl/sarl/commit/53f9864c122a3666add2368ebebb6dc1e892fe23)). This small update is a first answer to the old issue related to the inconsistent state of the editor comparing to the rest of the widgets (errors are appearing into the editor and not into the other widgets).

## 4. External Contributions to SARL: Examples

* Fixing the Sierpinski fractal demo in order to follow the recent evolution of the SARL syntax ([details](http://github.com/sarl/sarl/commit/6aa7827592b3b701ba749bca2137021d0f98ff5b)).

## 5. Janus Run-time Environment

* Allow cancellation of [scheduled tasks](http://www.sarl.io/docs/api/io/sarl/core/AgentTask.html) before any future object is not provided by the Java thread manager ([details](http://github.com/sarl/sarl/commit/bb9ad7a7bfa366aed1ff2dad802636f608529ebe)). The cancellation is buffered until the future object is provided by the Java thread manager. At this time the task is automatically cancelled.
* Upgrade to ZeroMQ 0.5.0 ([details](http://github.com/sarl/sarl/commit/a3f39b3a7e707f7c8a5131137b89827cec2aec89)).
* Upgrade to Hazelcast 3.11.2 ([details](http://github.com/sarl/sarl/commit/a3c191ee7a45ea0887c53cdadbde11c2103b0bb8)).

## 6. Maven Tools

* The batch compiler must not fail when only warnings were found into the compiled SARL code ([details](http://github.com/sarl/sarl/commit/a8877906d72e9db66f72f0732e2ec3ee4261fa34)).


## 7. SARL Documentation

### 7.1. Documentation of the SARL Language

* Complete the documentation on the casting features ([details](http://github.com/sarl/sarl/commit/11beddf779174efac40c635dcb0c20191ce67ec3)).

### 7.2. FAQ

* Add FAQ questions from the [Sebastian Sardina's FAQ](https://bitbucket.org/snippets/ssardina/9er67X). ([details](http://github.com/sarl/sarl/commit/f883f0db7ed18ebee7f32e26c21b8b68e2621abd))
* Add [FAQ](http://www.sarl.io/docs/official/faq/GeneralFAQ.html#3-1-is-it-possible-to-obtain-examples-of-sarl-code-for-applications) for creating a project from a typical example of application ([details](http://github.com/sarl/sarl/commit/71839d40192dfa52ba24c8736e44fd7b9f53a50b)).

### 7.3. Documentation of SARL Code

* Add a [documentation](http://www.sarl.io/docs/official/tools/APIDocumentation.html) that explain how to create an API documentation for the SARL code, as Javadoc is doing for any Java code ([details](http://github.com/sarl/sarl/commit/486e2aaf32489b0e35c0e83f5bdc70ad4109ec1e)).

## 8. Tools for SARL Contributors

* Removing support for x86 architectures because Eclipse 2019-03 is not any more supporting them ([details](http://github.com/sarl/sarl/commit/0b99ed715b6c1ed0e9da371e5601da1edf2b6564)).
* Upgrade to Maven API 3.6.0 ([details](http://github.com/sarl/sarl/commit/96b9fe6fb02b0f9428ea304c648e40329f0a7354)).
* Upgrade to Tycho 1.3.0 ([1](http://github.com/sarl/sarl/commit/0ef376c0186caf22e71b2ff805d73da22740f292), [2](http://github.com/sarl/sarl/commit/f5feea06e8805df5af6fb3b54d5784a6a2c72dd0)). Add Tycho compiler options into the Maven pom file ([details](http://github.com/sarl/sarl/commit/654e974d39f6ed27900adbbf7ad4852473069cb8)).
* Upgrade [Arakhne libraries](http://www.arakhne.org/afc/) to version 15.2 ([details](http://github.com/sarl/sarl/commit/514f0b52d1e73cbd900004d92f89a43db2d1d683)).
* In the massive testing API, replacing the hard-coded `\n` by `System.lineSeparator()` to avoid errors on Windows ([details](http://github.com/sarl/sarl/commit/ba4e280359a862521bf64fefbcbb2410f79f48c5)).
* Removing reference to `org.eclipse.equinox.ds`, and replacing it by `org.apache.felix.scr ([details](http://github.com/sarl/sarl/commit/b2378435efc3841f8c88519cfa12deebb5eba19c)).





## 9. Changes in the Previous Versions

* [Changes in the version 0.8.6](./changes_0.8.6.html)

