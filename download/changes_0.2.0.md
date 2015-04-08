---
layout: default
title: Changes in 0.2.0
---

# Changes in 0.2.0

Release date: 2015-04-08.

## [core]
* Move to Xtext 2.8.1. ([details](http://github.com/sarl/sarl/commit/7014b89735374e513157e12cd15378fe8d9a076f))
* Add Logging built-in capacity. ([details](http://github.com/sarl/sarl/commit/d0326fb0ce56ccd1b0ce4f793d4aac236691cabc))
* Add utility functions for the Event element. ([details](http://github.com/sarl/sarl/commit/5869f77b4166e3a5aa9b1a59e13abaa7081e786f))
* Add utility functions in the BIC. ([details](http://github.com/sarl/sarl/commit/5a094b5983457d785e957ce33b89ccbc3737c61d))

## [lang]
* Output an error when System.exit is called. ([details](http://github.com/sarl/sarl/commit/28d0e3c8a5cbddfbf430a568eeaf91b99eef6945))
* Add utility functions for the Event element. ([details](http://github.com/sarl/sarl/commit/5869f77b4166e3a5aa9b1a59e13abaa7081e786f))
* Add the [FiredEvents](http://github.com/FiredEvents) and [EarlyExit](http://github.com/EarlyExit) annotations ([details](http://github.com/sarl/sarl/commit/27d364de1081fffbd16b87c02db5de5b208041e4))
* Fixing the Map extension according to the comment on the Xtext contribution. ([details](http://github.com/sarl/sarl/commit/dad3637a5215f7cbb800b1970b4104cfe3077179))
* Remove conflicting operations in MapExtensions. ([details](http://github.com/sarl/sarl/commit/5bf72180e7d3fe1bcf98a00debe1c9c5b53ca341))
* Add warning on multiple capacity uses. ([details](http://github.com/sarl/sarl/commit/732128cb0165994cca681108bc4253e7fa85a6a5))
* Add a function for retreiving the default value for a type which is specified by a string. ([details](http://github.com/sarl/sarl/commit/65a031ffde53efa6a7b4f9509830972a07656b21))
* Output a warning when a capacity is not used. ([details](http://github.com/sarl/sarl/commit/fa346d24b1a392ea30d9236cb52881b80f15d3ff))
* The quick fix for missed actions are using the SARL prototypes in place of the JVM prototypes. ([details](http://github.com/sarl/sarl/commit/b260b9215d152d124b43cbd343df4bcb5ce24960))
* Add the function to create SARL Ecore elements from JVM elements. ([details](http://github.com/sarl/sarl/commit/fe29fb9e6045afcc41687b6658cfe7e9bee0b403))
* Replace Xtend scripts by Java code. ([details](http://github.com/sarl/sarl/commit/a0152e8d8345866d4c2d8cae95eccf5c200d1b22))
* Change code style. ([details](http://github.com/sarl/sarl/commit/7ccad520be7eb45fcd6b34bf08bc74eed064a575))
* Add unit tests for the SARLCodeGenerator. ([details](http://github.com/sarl/sarl/commit/2d079db815013aa84d13509a4e8eee41281cabc2))
* Apply code style. ([details](http://github.com/sarl/sarl/commit/10e1ac770801914548bbf62e456aa4902c9bca59))
* Make localized the messages related to forbidden and discouraged references ([details](http://github.com/sarl/sarl/commit/aeffa3925f5ce4d2ec96baec5ce42f7266ffc045))
* Fixing code style. ([details](http://github.com/sarl/sarl/commit/6e64bcd53ea0cbb0dfa3ba8dbd0a90e3c324c745))
* Make the JDK and Xtext validation messages more clear. ([details](http://github.com/sarl/sarl/commit/d7da8392120dee912f52ca26ce6e6bde34c5b70b))
* Add a string value to the Generated annotation. ([details](http://github.com/sarl/sarl/commit/61d723daae72779bd1781987442517721d875f08))
* Add ContextPDFProvider for fixing invalid "implements" keyword serialization. ([details](http://github.com/sarl/sarl/commit/26cbf55c5475ae74dea26fe0d1c4064aa6e81f44))
* Create a signature building function from a formal parameter provider. ([details](http://github.com/sarl/sarl/commit/81cd7bc77ab5debb5979ec2b1a2941364b8b701f))
* Add imports for the added missed functions. ([details](http://github.com/sarl/sarl/commit/8a5389e8d32c8de38ef9048dcef6310f95a5fd63))
* Share the internal name prefixes for the hidden attributes and event handlers. ([details](http://github.com/sarl/sarl/commit/b1b85a02790e6459a955036a8460428895b3b8e2))
* Add the missed "return" keyword when generating default-value-parameter function. ([details](http://github.com/sarl/sarl/commit/94c29a4f43c0bec8a03d23c521881801338e81fe))
* Refine getOrCreateSpace function. ([details](http://github.com/sarl/sarl/commit/b93867a94c49194ea2e061102bb385590bcf00af))
* Add warning on the use of the println function and the System stream. ([details](http://github.com/sarl/sarl/commit/c90e7e50364df1ad89e4049a5e50e81fa56acec7))
* Put the annotation ImportedCapacityFeature into the generated code. ([details](http://github.com/sarl/sarl/commit/32e4e68c339f260c43b5f6f37a8ec0c613d4adb4))
* Add operation extensions for Maps. ([details](http://github.com/sarl/sarl/commit/5d7e00c4ccbd151057d2446a2b243c355bca2964))

## [ui]
* Add quick fix for the unused capacities. ([details](http://github.com/sarl/sarl/commit/a01b1a8def23720cfbd3326acb58a93f637cdc09))
* Add the commands for toggling breakpoints. ([details](http://github.com/sarl/sarl/commit/e7e2b6178c71f8fefb05f9a2c423b1b7cb9f2ca6))
* Share the "Auto-generated action" message. ([details](http://github.com/sarl/sarl/commit/8a1c1cd61b82350650a15eabac780eeb98c5b3f5))
* Add imports for the added missed functions. ([details](http://github.com/sarl/sarl/commit/8a5389e8d32c8de38ef9048dcef6310f95a5fd63))
* Auto-detect the attribute type when generating the outline. ([details](http://github.com/sarl/sarl/commit/996b3f298be1ce414598ab6a82ba85528b08c1f8))
* The quick fix for missed actions are using the SARL prototypes in place of the JVM prototypes. ([details](http://github.com/sarl/sarl/commit/b260b9215d152d124b43cbd343df4bcb5ce24960))
* Add quick fix for multiple capacity uses. ([details](http://github.com/sarl/sarl/commit/b134d698bfa069c508fb1c447546ffb7cced5a03))
* Avoid exception in the UI thread when refreshing the SRE list. ([details](http://github.com/sarl/sarl/commit/0953114f356f76796ea51421bcd4ed0fa5f7fa22))

## [eclipse]
* Add wizards for creating the source code for the SARL elements. ([details](http://github.com/sarl/sarl/commit/dc7163547f1eafdf7dbf8ea8b8c856432026f1eb))
* Create a brandable product for SARL. ([details](http://github.com/sarl/sarl/commit/70c1dd1a15c2f25ed0f96a957426043c1b0d6735))
* Change the splash screen. ([details](http://github.com/sarl/sarl/commit/90b3251685a065917423503bc797b0a03acb373f))
* Add the preference page for the "errors/warnings" of SARL. ([details](http://github.com/sarl/sarl/commit/b99d6734f7083e06999cd63a52eac082a98d3fa3))
* SARL launch configuration provides the implementations of Agent. ([details](http://github.com/sarl/sarl/commit/ca1e4f59e39f4a27edf6a6dd72a2c13ed159fad9))
* Avoid NPE when launching SARL application. ([details](http://github.com/sarl/sarl/commit/f88f9eaed7a8efdd3ad32625e4f28965807e61da))
* Display an error message when the Xtext output configuration is not matching the Java source folders. ([details](http://github.com/sarl/sarl/commit/4bdc182f7fdf4563fa8d7698606073ed1a7564de))
* Fixing the invalid test of the SARL version supported by a selected SRE. ([details](http://github.com/sarl/sarl/commit/c761ac62bef2a012122084fbc992bd2c2b8902ce))
* Avoid exception when invalid SRE path is provided by the file chooser. ([details](http://github.com/sarl/sarl/commit/b94e9c012bed14b94ad974b45b46bfe4e1b36c20))
* Use Ecore description in the wizards for creating the SARL elements. ([details](http://github.com/sarl/sarl/commit/f4fe3695e94a5d0d2fa7d5621aab3e52ab5935a9))
* Avoid infinite loop when loading SREs ([details](http://github.com/sarl/sarl/commit/c670b25c8af644f37d9853fc660b54175d35d82d))
* Set the preferences of a new project after updating it with the JDT tools. ([details](http://github.com/sarl/sarl/commit/842bc382a07736e6dc80d715ba01446e25c148d5))
* Add a text field for entering the SRE specific arguments. ([details](http://github.com/sarl/sarl/commit/611d93623a0852d52c29bf2dbbf0b6ecbf226235))
* Add "multiple capacity use" and "unused capacity" warnings in the preference page. ([details](http://github.com/sarl/sarl/commit/8aa7d3cd57ce8ba50652f96e6badbfbad0f48156))
* Add launch options for the SREs. ([details](http://github.com/sarl/sarl/commit/7a8e5ceaa488ff03a3b8bfdf2afa60165da2b53a))
* Add the SRE in the classpath when not specified. ([details](http://github.com/sarl/sarl/commit/42a87aa9c534267821e3414b1ae70e45aa98a52f))
* Do not make the SRE path relative to the workspace. ([details](http://github.com/sarl/sarl/commit/5762b59cd7abb8df85ed1430bc3d2278ed414181))

## [m2e]
* Add unit tests. ([details](http://github.com/sarl/sarl/commit/989736dd6eaac0f57e1b290a106f66207a647764))
* Add provider of SRE that is specified in the Maven dependencies. ([details](http://github.com/sarl/sarl/commit/cd2074cd511f6c092546c29e50c48fba1b936bbd))
* Add the validation the version of the SARL bundle and the Maven dependency. ([details](http://github.com/sarl/sarl/commit/23f9fa3bad6af1b9493cb8ce241d59552354c361))
* Appply the code style. ([details](http://github.com/sarl/sarl/commit/ddba0658af2bda21f38d168e1e7b6770b90f35f1))

## [maven]
* SARL Maven compiler supports submodules. ([details](http://github.com/sarl/sarl/commit/30223e2e05ea8717ab221251c9b6973923b3aa0b))

## [product]
* The Java perspective is the default perspective. ([details](http://github.com/sarl/sarl/commit/947d6625272c6479cf6d59c3279e3d30feb5c77f))
* Add default SARL update URLs in the product. ([details](http://github.com/sarl/sarl/commit/e031b689b05cfd636f1c33cccdbecc41450cde01))
* Add m2e connector for JDT compiler in the product. ([details](http://github.com/sarl/sarl/commit/a5c6b22e104324a65833bce56cb0fa2bad0ca077))

## [docs]
* Update the tutorials. ([details](http://github.com/sarl/sarl/commit/ef430039658fab871f2118f19162a5550a9cb100))
* Update the table format for the "every" function. ([details](http://github.com/sarl/sarl/commit/55eee6c0216ca900d9ffaf4ea645ac446f8947a1))
* Add the documentation on the implicit method extensions. ([details](http://github.com/sarl/sarl/commit/b9df22c7e004ae5fc59070e3d728e6ed0aeb0bf7))
* Explain how to launch agents programmatically. ([details](http://github.com/sarl/sarl/commit/d321d04ccc925fe5c61bff672c9c55e18e6921fd))
* Clean the M2 repository before compiling the release version. ([details](http://github.com/sarl/sarl/commit/6a1843865ff996f2690bdda1fe78238d2159065d))
* Update the README file for release process. ([details](http://github.com/sarl/sarl/commit/8c6cb0765640e933a207ec14ade90da03dacb610))
* Add a FAQ entry for the error "agent class not found." ([details](http://github.com/sarl/sarl/commit/6fd5cc29b6cee91bb89558e6f2d363314c73e336))
* Fixing invalid Jnario tests. ([details](http://github.com/sarl/sarl/commit/c6fe789c1074f7d68ec2aab7b1fd60008c531f9d))
* Avoid compilation error in the Jnario project. ([details](http://github.com/sarl/sarl/commit/3a84a0551f5b48412d5c690361f55df9dfc14d55))
* Apply changes from the SARL grammar. ([details](http://github.com/sarl/sarl/commit/c99b834938ecf08255a76796474e9117fe10762b))
* Add awesome-sarl in the FAQ. ([details](http://github.com/sarl/sarl/commit/86781f5da07ef0460dd9db274f870bfce91119f8))
* Add phase about release candidate version. ([details](http://github.com/sarl/sarl/commit/23e4122bfa86b30d933defd8c82c8d1f212ed88d))
* Add FAQ entry for the invalid SRE error. ([details](http://github.com/sarl/sarl/commit/ecf88685ae2e66ca93c61bbc88f46c81ae891e29))

# Previous changes

* [Changes in the version 0.1.0](./changes_0.1.0.html)

