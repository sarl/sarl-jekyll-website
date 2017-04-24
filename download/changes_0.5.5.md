---
layout: default
title: Changes in 0.5.5
---

# Changes in 0.5.5

Release date: 2017-04-24.

## [lang]
* Parameters' default values:
	* No type parameter in the generated default value fields. ([details](http://github.com/sarl/sarl/commit/82aa2dd28edeebc206673b3bf5ffcc4420891fd3))
* Generated equality-test function:
	* Add type parameters in generated equals function. ([details](http://github.com/sarl/sarl/commit/b105525eb8868253fd84858ada7533ecd603f9bc))
* Implicitly imported features:
	* Add operator "-=' and '-' on Map and Pair. ([details](http://github.com/sarl/sarl/commit/1a436c28ee1699023c2061ffd5f8f29ae74f79cd))
* Batch Compiler:
	* Add issue listener in the batch compiler. ([details](http://github.com/sarl/sarl/commit/d76b3941ea384f1d2f5284f6c56d72708ac5e07b))
	* Add listener on compiled resources in the batch compiler. ([details](http://github.com/sarl/sarl/commit/8814d584f66e45e7b135616c6d736f65e8d7c44a))
* Others:
	* Add "dump" function in utilities. ([details](http://github.com/sarl/sarl/commit/51003ec2e67b59713e0aa82633e6a52028c5bf8c))

## [util]
* Remove the dependency to com.google.inject. ([details](http://github.com/sarl/sarl/commit/a6cb6505599a6b8cde350756f8d8734989e70ce5))
* Minor fixes in SarlSpecificationCheck tests. ([details](http://github.com/sarl/sarl/commit/bf6b1109123dc1f09f653b11246989466f9774ed))

## [ui]
* Content Assist:
	* Remove the SARL-specific icons of the content proposals for avoiding freezing of the IDE. ([details](http://github.com/sarl/sarl/commit/811cc9edddec671529f7892cf99f33f805acca0f))
	* Add proposal priority infrastructure. ([details](http://github.com/sarl/sarl/commit/e9e0a03e9990132ea6138def5218ccf8e6cdabd3))
	* Add test on auto-completion after new keyword. ([details](http://github.com/sarl/sarl/commit/e36c5ac22ce48c386bf76690be38c9d6a939e5da))
* Fixing a mispelled classname. ([details](http://github.com/sarl/sarl/commit/fc6abdedea157fadcdc3546ba3f5dc8e9a2e81c2))

## [eclipse]
* Create place holders in the SARL menu. ([details](http://github.com/sarl/sarl/commit/799f5ccf2a6132b525aab9a447aece335a3fe77a))
* Replace SARLEclipseConstants.MINIMAL_JRE_VERSION with SARLVersion.MINIMAL_JDK_VERSION. ([details](http://github.com/sarl/sarl/commit/56f87c767bc71158461c42014e6a38901812eb48))

## [m2e]
* Replace SARLEclipseConstants.MINIMAL_JRE_VERSION with SARLVersion.MINIMAL_JDK_VERSION. ([details](http://github.com/sarl/sarl/commit/56f87c767bc71158461c42014e6a38901812eb48))

## [product]
* Disable the simpleconfigurator service in order to avoid low performances of the product. ([details](http://github.com/sarl/sarl/commit/56788133c97c9d012c745735f179f641d0d0d40c))

## [janus]
* Add missed injection of SarlSpecificationChecker. ([details](http://github.com/sarl/sarl/commit/78cf4d231acf291d58ae6d06946a18c151ae29e4))

## [tests]
* Fast failure when UTBM servers are not reachable. ([details](http://github.com/sarl/sarl/commit/6d8727e6dfc118a600ed5a0282f6c2496a4e8e34))
* Split the bugs package. ([details](http://github.com/sarl/sarl/commit/0a32341baad209b2198b246e66526e9b7fa1c3f3))

## [mwe2]
* Add generator for Pygments style files. (details: [1](http://github.com/sarl/sarl/commit/a72c967a76c4f783fb268b9d086c57c130a44854), [2](http://github.com/sarl/sarl/commit/75ba2dc6496be731fa54e9725a5e3fb58b19bd01))
* Use IAppender for creating external style files. ([details](http://github.com/sarl/sarl/commit/27fc8118bc0a1432a55914fb41306f1ca5b03b25))

## [dev-tools]
* Create a message that provides the command-line for copying the generated bundles for Maven Central. ([details](http://github.com/sarl/sarl/commit/47e93189d8ea535ca8d208dff217e60e0c162729))


# Previous changes

* [Changes in the version 0.5.4](./changes_0.5.4.html)

