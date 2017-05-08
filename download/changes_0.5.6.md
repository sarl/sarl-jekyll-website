---
layout: default
title: Changes in 0.5.6
---

# Changes in 0.5.6

Release date: 2017-05-07.

## [lang]
* Do not include object fields in the generated equals and hashCode functions. ([details](http://github.com/sarl/sarl/commit/5923629621314412b10d640068b7c4fb511b6a28))
* Use InheritedHelper in SARLLabelProvider. ([details](http://github.com/sarl/sarl/commit/98f656783ee9b6241b25acca7151ed4595aa32e3))
* Automatic creation of temp directory in batch compiler. ([details](http://github.com/sarl/sarl/commit/b55a7992492f6078f013b1d24acedb068d50a6a9))
* Mark generated elements with @SarlElementType. ([details](http://github.com/sarl/sarl/commit/75efec9660f7fbaa6d9d44e2e605e0c601ed0b8b))
* Enable capacity calls in annonymous classes. ([details](http://github.com/sarl/sarl/commit/e6103743b06799e3cca6b0cf0d1564907b549ea2))
* Internal errors in JVM inferrer must be output at DEBUG level. ([details](http://github.com/sarl/sarl/commit/d486178d51da64a39c360d9a5d9ad54efbec021f))
* Add static default visibility computation from EClass. ([details](http://github.com/sarl/sarl/commit/4bc7c3efd4002cafa1fb549d7d520f2eedfda658))
* Update the default visibilities of the SARL elements. ([details](http://github.com/sarl/sarl/commit/c96662db341cafeaa3fdb5c6bf90abc9cb5f2a2c))

## [ui]
* Protect keywords in generated functions. ([details](http://github.com/sarl/sarl/commit/84ef43d3eb94f9b0243935eaf07c3754f39cabba))
* Add renaming strategy for package names. ([details](http://github.com/sarl/sarl/commit/dc796a77832f37b0da270b5ded450ccdc3f23683))
* Override Xtend code builder for SARL types. ([details](http://github.com/sarl/sarl/commit/cb4aa774f2ed3062e5af1532117725f2faa15786))
* Unimplemented method quick fix uses the SARL syntax. ([details](http://github.com/sarl/sarl/commit/e3573f2bfbc6a8e9b9dc37bbf0bba889156f13d5))
* Rewrite the quick fix for mised functions. ([details](http://github.com/sarl/sarl/commit/d881035c4096f9fe7ec417eb80e8bd51b4e14971))

## [eclipse]
* Add "Run as Java application" shortcut. ([details](http://github.com/sarl/sarl/commit/cb943937aeb30dd97cb4bf3457054f6eff65319a))

## [docs]
* Documentation updates:
  * Rewrite the documentation in Markdown. ([details](http://github.com/sarl/sarl/commit/8353937ca46c37ddc69da734511a0b75a5270837))
  * Remove the Jnario documentation. ([details](http://github.com/sarl/sarl/commit/2e3e2d9960bb1274597c7c69788383a7c94d2ce9))
  * Add FAQ entry related to the Ctrl+Space on MacOS. ([details](http://github.com/sarl/sarl/commit/d2f93068c04cab40b0654ff16135ea0783acea62))
  * Add doc on the syntax highlighning styles. ([details](http://github.com/sarl/sarl/commit/0ad063f25987588f216bee9d09ee61bfdd9a843c))
  * Add documentation on sarlc and janus. ([details](http://github.com/sarl/sarl/commit/ea7fe86972b4478d824d385fe28ffa6de81fb6f6))
  * Add Pygments reference in README. ([details](http://github.com/sarl/sarl/commit/eeb032db3ec4abf77c572df0fc7b41c7526a844a))
* Documentation generator:
  * Add [:Dynamic:] macro in documentation. ([details](http://github.com/sarl/sarl/commit/a6c3a0e1975c480be8b4571c6c91f0f07a33265b))
  * Minor bug fixes in the documentation generator. ([details](http://github.com/sarl/sarl/commit/293598886ef943e5dc7279ff20dff734cbb0d9ff))
  * Do not test remote links. ([details](http://github.com/sarl/sarl/commit/a1e8360f6d7340ae9c4e9b7564866a66361884aa))
  * Disable extensional use of the markdown generator. ([details](http://github.com/sarl/sarl/commit/40fb633f93b8f6db730d383615bd89681d056695))
  * Disabled outside website generation. ([details](http://github.com/sarl/sarl/commit/d170779d4731fed5f28f3b9661b1c1e8beadc591))
  * SARL compiler singleton in documentation generator. ([details](http://github.com/sarl/sarl/commit/79f5dd7f6b838512f020eab5207d872538b423e8))

## [maven]
* Add documentation generator based on Markdown. ([details](http://github.com/sarl/sarl/commit/cae823d94d616922b6a842268ad0bdca3c3d162b))
* Fixing URL generation for Windows OS in the documentation generator. ([details](http://github.com/sarl/sarl/commit/a72b58c89bda6904af0fcc375966335f90ed912a))

## [sre]
* Default name of the SRE is janus. ([details](http://github.com/sarl/sarl/commit/2e014d9d37c1d3b9f0be34c437daadf1988d9a1c))
* Transform 'janus' module tests from Tycho to Maven testing modules. ([details](http://github.com/sarl/sarl/commit/4a54eed6f09784483ee36725f6ee64b18bcc6f4e))
* Exclude Xbase lib dependency from Arakhne libs. ([details](http://github.com/sarl/sarl/commit/2bfe1c3c3d11a491825a5404197808c4cbc19004))
* Fixing warnings in source code. ([details](http://github.com/sarl/sarl/commit/6831dc1f3419d766ba68d6e234706b4d47768038))

## [contribs]
* Transform 'example' module tests from Tycho to Maven testing modules. ([details](http://github.com/sarl/sarl/commit/8e9b07dd6c66787507a22a049f9100a43a2932b1))

## [mwe2]
* Add function for protected keywords in SARLGrammarKeywordAccess. ([details](http://github.com/sarl/sarl/commit/280a82f63e52d439790a7847117bb70bffc1c412))

## [tests]
* Fixing failing tests on generated functions. ([details](http://github.com/sarl/sarl/commit/6fa5225b25d7c54363ae736aab0f6f33ab075490))
* Transform 'lang' module tests from Tycho to Maven testing modules. ([details](http://github.com/sarl/sarl/commit/a5408a8b6dba561b4dfa98adb794f8a59c1746cd))
* Split the testing API into two modules for not ui and ui. ([details](http://github.com/sarl/sarl/commit/bfc40d7bb9ba2ba9ebe7bb9c32445c942f54bc5a))
* Transform 'core' module tests from Tycho to Maven testing modules. ([details](http://github.com/sarl/sarl/commit/d24782326250f8dc053f0ef7f1ea641c49d04b9d))

## [ci]
* Use travis CI for deployment. ([details](http://github.com/sarl/sarl/commit/0a36ac213da3187f7ef26deb3aa5788463b01cc1))
* Update the appveyor configuration. ([details](http://github.com/sarl/sarl/commit/fd46cdd9f587beb94e210fa8946e026ffa7aabe1))


# Previous changes

* [Changes in the version 0.5.5](./changes_0.5.5.html)

