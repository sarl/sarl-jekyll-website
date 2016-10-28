---
layout: default
title: Changes in 0.4.2
---

# Changes in 0.4.2

Release date: 2016-10-28.

## [lang]

### API
* Add missed functions in the AgentTrait. ([details](http://github.com/sarl/sarl/commit/bffd0aac225a701769e6ff9ce39569262c44edf7))
* Merge functions that have similar prototypes. ([details](http://github.com/sarl/sarl/commit/e4881fceb93869910cc6b32157bc67f85bb50946))

### Validation: errors and warnings
* Error when OOP modifiers are used with AOP elements. ([details](http://github.com/sarl/sarl/commit/761a1d61dccd852ac45aaca58a3332c71037ef97))
* Validation of the deprecation warnings in closures. ([details](http://github.com/sarl/sarl/commit/d80f85a04b1ec8fe8c82960acccbb0cc856c6208))
* Set to ignore the default state of the missed override warning. ([details](http://github.com/sarl/sarl/commit/6c8f6c173bc10cf409314959b98c09a813c7148b))
* Fixing invalid warning message for override keywords. ([details](http://github.com/sarl/sarl/commit/ccad8ea936f6838a0964b52c200972c24c85212f))

### Compiler
* Create a batch compiler for SARL. ([details](http://github.com/sarl/sarl/commit/b97ec3810e82721af62878b4fbc1844911b00793))

### Bug fixes
* Do not force abstract modifier to actions when containing type is abstract. ([details](http://github.com/sarl/sarl/commit/b8526216fc5b36856d8fb29582fd0da4783a96c7))
* Avoid NPE when the AgentTrait has no owner. ([details](http://github.com/sarl/sarl/commit/e33af6a56ae170c7e94d2ea29b181d6739aeaf1d))
* Fixing invalid Windows path computation. ([details](http://github.com/sarl/sarl/commit/41fa6d34c06cdce8f9e391212598d094fd138348))
* Do not check inheritance in the jvm model inferrer. ([details](http://github.com/sarl/sarl/commit/3e664fbee97fb6bef0b0b87c55acd8fa9dbf68a4))

## [maven]
* Maven module for the SARL batch compiler. ([details](http://github.com/sarl/sarl/commit/e8d419ac0ef08a70dbc20af6743deacd76448a92))
* Refactor sarl-maven-plugin for using the batch compiler. ([details](http://github.com/sarl/sarl/commit/859dd1b12a7b5b27ecfda99d5fa0f4532a3889d1))
* Fixing invalid source folder definitions. ([details](http://github.com/sarl/sarl/commit/600ef4f6361c073e2bd784b5eb83f6efa41ed036))
* Adding more log messages in the maven compiler plugin. ([details](http://github.com/sarl/sarl/commit/d6b6cea52e5e7e7ed86c034faab0cfc06e6114d7))

## [eclipse]

### Content assistant
* Provide proposals in behavior unit guards. ([details](http://github.com/sarl/sarl/commit/edced61c8c1d00225695e1936b44aa8de50da110))

### Configuration
* Upgrade to Neon.1 ([details](http://github.com/sarl/sarl/commit/4327534709ec340508c15715e98c138d34fc2428))
* Launch the previous launched application by default. ([details](http://github.com/sarl/sarl/commit/ea39d4754adfa0ccf72140bcec66d862333bf453))

### Bug fixes
* Inject the XbaseResourceForEditorInputFactory for building a resource from the Java editor. ([details](http://github.com/sarl/sarl/commit/e6b7dc5e79e12f2168cae692ebb88d9af91de7c4))

## [sre]
* Fixing the Janus library definition. ([details](http://github.com/sarl/sarl/commit/55ab3087f39b362d000d401fc147a52e3c49242d))
* Create a CLI launcher for Janus. ([details](http://github.com/sarl/sarl/commit/a18cd8c99792901698b75569841bd49509ad645e))
* Do not generate exception when guard evaluator is not found when unregistered. ([details](http://github.com/sarl/sarl/commit/0157ed67acf4fc4732a2d9fb28aa95b539aa7cfb))

## [product]
* Create the CLI SARL compilers. ([details](http://github.com/sarl/sarl/commit/e1069d54d28ab42a82b513b1930c025ea0ca4cec))
* Add sarlc and janus command line tools in the Windows and Linux products. ([details](http://github.com/sarl/sarl/commit/b73a06402fe18f4d5591bd46ed2634f0d1db531b))
* Add launching script for arch linux. ([details](http://github.com/sarl/sarl/commit/c16b58d0d115fbe7b3826e6c3b9c1781f880a8c3))
* Include sources in the product. ([details](http://github.com/sarl/sarl/commit/7b09a1898dd60f000bc7692b83ef31ce1103e82f))

## [docs]
* Add FAQ entry for explaining '<>' syntax. ([details](http://github.com/sarl/sarl/commit/079f719af5bbc36c84466eec4c4141a8fa8deb67))
* Add section for sarl-maven-plugin in the README. ([details](http://github.com/sarl/sarl/commit/3971b50f5e68e6f3a97397d6d41ada83224e5104))

# Previous changes

* [Changes in the version 0.4.1](./changes_0.4.1.html)

