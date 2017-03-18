---
layout: default
title: Changes in 0.5.0
---

# Changes in 0.5.0

Release date: 2017-03-18.

## [lang]
* Upgrade to Xtext 2.11. ([details](http://github.com/sar/sarl/commit/ccb463cbcd6c22de7bd4aea93c4c7d4b0ae2ca97))
* New Agent API. ([details](http://github.com/sar/sarl/commit/8a2153382583b9dc384b25957274f6839728b217))
* Add inheritance of constructors. ([details](http://github.com/sar/sarl/commit/bf151c394acc8ea6bde93fac18d6ca24c05da523))
* Add "break" keyword. ([details](http://github.com/sar/sarl/commit/e44121327d55a749da19e826cdb88b9752c26c71))
* Warn when occurrence is modified. ([details](http://github.com/sar/sarl/commit/78421386abd0d9246400d8d076b5d2f644edd785))
* Error when redeclaring occurrence. ([details](http://github.com/sar/sarl/commit/fb6210709a5e0315483d44d28638cdb6ef0182c4))
* Generate serialVersionUID. ([details](http://github.com/sar/sarl/commit/9800ee73f2ffd6e027a9902028a0da9e536ef87e))
* Enabling generation of anonymous classes. ([details](http://github.com/sar/sarl/commit/3ad6bedda74a6680085e3ebc12831975cca0ee3f))
* Add warning when using Inline annotation. ([details](http://github.com/sar/sarl/commit/91781d604a77c53849ccfd592b51282819942fb3))
* Reserve the keyword "artifact" for further use. ([details](http://github.com/sar/sarl/commit/cc7837045e59b9d41a21fe52c37e35531ae10828))

## [core]
* Behaviors:
** Upgrade Behaviors capacity with hasRegisteredBehavior and getRegisteredBehaviors. ([details](http://github.com/sar/sarl/commit/52c0e5a31b3fb780eaca9ef0d70eaf8e1f6e8ac8))
** Add filter for registerBehavior. ([details](http://github.com/sar/sarl/commit/9f1fb9110c05e1bb1e6a9eb8b72adb9d2dda1e60))
** Add scope parameter to the wake function. ([details](http://github.com/sar/sarl/commit/3e69bfb743ea504d784b3aba549705144a6b0957))
* DefaultContextInteractions:
** Add [Inline](http://github.com/Inline) to the receive() function. ([details](http://github.com/sar/sarl/commit/8f649b78c3c79cb65e3c2f9943ef5bc464a09d59))
** Deprecate spawn() in DefaultContextInteractions ([details](http://github.com/sar/sarl/commit/51461135b0c1a4758330bbc83ee01c2a69618aa1))
** Allow null scope. ([details](http://github.com/sar/sarl/commit/3f65b3283f8ee3508e98d70e9628f84997050da5))
* Lifecycle:
** Enforce the agent killing process. ([details](http://github.com/sar/sarl/commit/852d8c6622a84160731fb720c1f52a7966f4927f))
** Add spawn() in Lifecycle. ([details](http://github.com/sar/sarl/commit/50d3cf61ed43bb1aac2d191ea96e0fcc4163bba7))
** Spawn more than one agent. ([details](http://github.com/sar/sarl/commit/d110883fe11ea9555b6b822fd589ddcd83b50f6c))
* Schedules:
** Change AgentTask guard type for fitting the Xtext generated closures. ([details](http://github.com/sar/sarl/commit/447b6856f50e934222939183eb14fb8b0102c73b))
** Add the atFixedDelay() function in the Schedules capacity. ([details](http://github.com/sar/sarl/commit/b4cf839483886c1c1177ebe3fa99d0506fd00844))
** Add the execute() function in the Schedules capacity. ([details](http://github.com/sar/sarl/commit/1e6cf1ce2dec2e92f92b43aa6be90e4ad425b7b4))
** Add isCancelled for agent tasks. ([details](http://github.com/sar/sarl/commit/06471f0c2b3a43bca6323b443d81fde22555941b))
* Events:
** Add spawner in the Initialize event. ([details](http://github.com/sar/sarl/commit/79bd93c279fcbe6d5b022a124e62e8a7290887d1))
** Standard events are final. ([details](http://github.com/sar/sarl/commit/73ab01c851f5348ddf6d5e7e7296db89544cc46d))

## [lang.core]
* Generate inner class for context aware capacity calls. ([details](http://github.com/sar/sarl/commit/5113a2d7bb0af450fec13e2faf7be5f78a99cbf4))
* Avoid NPE in AgentTrait. ([details](http://github.com/sar/sarl/commit/06ec1112d7a73bde8ff764e3e89b76e389f35490))

## [utils]
* Add functions in Scopes. ([details](http://github.com/sar/sarl/commit/7735eb517dbf753f5f2cdfe164791b7b9a6a7ac6))
* Add SarlSpecificationChecker. ([details](http://github.com/sar/sarl/commit/c8860d589edec7928fb1dbdc103948599ab1b7ff))
* Internal Event Bus:
** Move the guard evaluator detector from Janus to io.sarl.util. ([details](http://github.com/sar/sarl/commit/7ed4b96dd514abca8b96b4db33e1b18b76aa24b4))
** Remove the list of listeners in the internal event bus skill. ([details](http://github.com/sar/sarl/commit/ccb5a508ebb9f95c90bd219fab96601c91272ad9))
** Fire Initialize and Destroy in behaviors. ([details](http://github.com/sar/sarl/commit/c10be5d84fff204a2686673db2bd9dee8048a510))

## [eclipse] and [product]
* Upgrade to Eclipse Neon.2. ([details](http://github.com/sar/sarl/commit/8592c51779080d35607078e0451452e60eef4aaa))
* Add OO element creation shortcuts. ([details](http://github.com/sar/sarl/commit/7cacbc75bea99a1202f7046b3c2900a15fba5f1b))
* Add menu item for submitting issues. ([details](http://github.com/sar/sarl/commit/013d7ab3ab365c761b74e46e83598d81c5cc6cae))
* Embed icons for new OO element wizards. ([details](http://github.com/sar/sarl/commit/9e81dae83b1df07d427d4b349b9d291573917d31))
* Add source bundles. ([details](http://github.com/sar/sarl/commit/b6942a63d35236a7e336ad32229f794af2435bf1))
* Include JavaFX in the product. ([details](http://github.com/sar/sarl/commit/f359bade1ea525b3d594e4b62c7d53d478436a0e))
* Add the elevator simulator project into the success stories. ([details](http://github.com/sar/sarl/commit/e8f9b89dd6db6ae7c14c82f5e7952e1a4940c0f3))
* Fixing configuration for MacOS product. ([details](http://github.com/sar/sarl/commit/844e90454e0125770e20be79055d4977881f8c2c))
* Give proposals on field's type. ([details](http://github.com/sar/sarl/commit/a2f355ccfb47a57f8287f89ffc819a8d4cce82b8))
* Capacity calls in hovers are correctly formated. ([details](http://github.com/sar/sarl/commit/dda575c233f5444a72990f89763b8a5362432a68))
* SARL signatures in hovers. ([details](http://github.com/sar/sarl/commit/0ef28a7f54392532efbe8f8b744af7996a5f5743))

## [sre]
* Upgrade to Gson 2.8.0. ([details](http://github.com/sar/sarl/commit/f71bbc647f315561a4c65ec5d82624f91ef5342d))
* Upgrade to ZeroMQ 0.3.6. ([details](http://github.com/sar/sarl/commit/435a0b423019088ae6b3411df8bd19dfed559b06))
* Upgrade to Hazelcast 3.8. ([details](http://github.com/sar/sarl/commit/041f6b143fa5bd9566f3f44d05accb276ab5d1c9))
* Enforce the agent killing process. ([details](http://github.com/sar/sarl/commit/852d8c6622a84160731fb720c1f52a7966f4927f))
* Cancel tasks when behavior is unregistered. ([details](http://github.com/sar/sarl/commit/b1d3fbe323fa43a73ca30fe42897276bb54765ec))
* Ensure clearing of buffered skills. ([details](http://github.com/sar/sarl/commit/297e9f6b08164bf8bacc8ef7d9decc670638c160))
* Efficient access to builtin skills. ([details](http://github.com/sar/sarl/commit/0044177873be7eeae1705f70da597bf71dbef07c))
* Optimization of the internal agent event bus. ([details](http://github.com/sar/sarl/commit/d0f08524eead60fa6991ec65263b35b7779d9686))
* Remove unnecessary code in the internal agent event bus. ([details](http://github.com/sar/sarl/commit/288607058be38e10f477254918ba3ea397507972))
* Remove reference to DeadEvent. ([details](http://github.com/sar/sarl/commit/243a8382d9a467fc0e6f9fe649152ebefb874388))
* Add -version command line option. ([details](http://github.com/sar/sarl/commit/37b5cbcfe6cb3afe25ee57f41eac5fd2495c61b4))
* Synchronize context and space service. ([details](http://github.com/sar/sarl/commit/4162cb6de302d45dc9b1a05613734836ef701f03))
* Synchronize network-based services. ([details](http://github.com/sar/sarl/commit/2b9ee34f67cb6776b1e170dda40735e67098b422))
* Synchronize NoNetworkService. ([details](http://github.com/sar/sarl/commit/1b4e2c907d7a9a8b6f7b88ba6d3be98d1b47d6a5))
* Synchronize StandardDistributedDataStructureService. ([details](http://github.com/sar/sarl/commit/419af3f4d1aa882c11732cfca894c75181080cf8))
* Synchronize StandardKernelDiscoveryService. ([details](http://github.com/sar/sarl/commit/3dc7146ad2f8351ac5be7708ddf92a20636f094c))
* Synchronize JdkExecutorService. ([details](http://github.com/sar/sarl/commit/76e9b585f0dac1a0dc7560b7a1b74bf209e110b7))
* Change synchronization of event spaces. ([details](http://github.com/sar/sarl/commit/3c7648cf1372999cb28b49c6d4f02e6c5c61562d))
* Stop not periodic tasks on exception. ([details](http://github.com/sar/sarl/commit/255cada06ef2ba86e71e6e6cad3f49f7b2c3f558))
* Simplify the executor service implementation. ([details](http://github.com/sar/sarl/commit/363bb7a468023e2567f97abff4a558d2fd176f30))
* Mark as thread-safe the simple services. ([details](http://github.com/sar/sarl/commit/fc591f1d0ec96d10fdfec0ab4a38185802254aa8))
* Add configuration property for specifying the max number of threads. ([details](http://github.com/sar/sarl/commit/8df40a0f474ab3c1804b2c326cecb7271fe6f1fb))
* Remove DistributedSpace interface. ([details](http://github.com/sar/sarl/commit/4b7d5fd6e327d6a2d406036337618a1da43cad0a))

## [maven]
* Fixing the documentation generator. ([details](http://github.com/sar/sarl/commit/d047ef865ff8d9ecdf78feb0fd9e2c658da193e9))
* Add archive filename attribute in the SRE plugin. ([details](http://github.com/sar/sarl/commit/557336d78b222b2ba644823505ec7a1ffc9f03f0))

## [latex]
* Add single comments into the LaTeX styles. ([details](http://github.com/sar/sarl/commit/486fe198d30b68b64ea1fd4f21d631a2c9bdac6c))

## [docs]
* New spawning API. ([details](http://github.com/sar/sarl/commit/76ff282fb8100dfd1596663ebaf6283316e0cb66))
* Add CONTRIBUTING.adoc. ([details](http://github.com/sar/sarl/commit/59ee88f164cee39687d47324a3d5116ecc62cd34))
* Add documentation contributor. ([details](http://github.com/sar/sarl/commit/96b6b3b6fe352dabb182b1c9db33770ecebd8f58))
* Add functions in Scopes. ([details](http://github.com/sar/sarl/commit/78bd449d0d0994687905446f633f526797f8ac62))
* Add documentation about anonymous classes. ([details](http://github.com/sar/sarl/commit/fa6418cd0a40f19802f2d9c2047fa3ca2d90e6fa))
* Add guideline for contributors. ([details](http://github.com/sar/sarl/commit/70f3ac10ad6bc5a0ec429a4c977081354ba96b9e))
* Add best practise for event creation with a builder. ([details](http://github.com/sar/sarl/commit/e70fb82a998ea97bfeeb7380248b38a859e6a8ff))
* Doc for ambiguous call to capacity function. ([details](http://github.com/sar/sarl/commit/8af585088209afa86f4a9b15547eb585c697134b))
* Rename startJanus. ([details](http://github.com/sar/sarl/commit/357b1fea690136c93e5d53b73bc867c9e89f4309))
* Reorganize the FAQ. ([details](http://github.com/sar/sarl/commit/330def91d4b976dcaa55ed659a95d8e4b506f171))
* Update the SRE launching documentation. ([details](http://github.com/sar/sarl/commit/d1dc228c6e8280c840477d68eced762747c0c680))

## For Developers
* Reactivate the Linux compilation. ([details](http://github.com/sar/sarl/commit/85399c1eee25aeb020cb2befa20bde3399173f8c))
* Enable tests on OSX Travis CI. ([details](http://github.com/sar/sarl/commit/405e2391a6c227dedb90d3c5a312a48c23042925))
* Enable tests on Windows Appveyor. ([details](http://github.com/sar/sarl/commit/379ae009a438147cda3d7ec56589129fe23ba3a6))
* Add Neon preferences for developers. ([details](http://github.com/sar/sarl/commit/f79355e804843efdcb653380c99342cec1819f8e))
* Generate function for creating "uses" programmatically. ([details](http://github.com/sar/sarl/commit/7d29861d52f4f234a621a89e88f4a05a651b961b))

# Previous changes

* [Changes in the version 0.4.3](./changes_0.4.3.html)

