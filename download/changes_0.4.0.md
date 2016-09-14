---
layout: default
title: Changes in 0.4.0
---

# Changes in 0.4.0

Release date: 2016-09-14.

## [all]
* Move to Eclipse Neon. ([details](http://github.com/sarl/sarl/commit/ac98a2c25eaed2ee40a7a4ce3143cefda789c034))
* Xtext 2.10.0 ([details](http://github.com/sarl/sarl/commit/1197a3052bc993b507699c0d574ce2d91527cf1a))
* Adding demo plugin content ([details](http://github.com/sarl/sarl/commit/1845b320c3c6ed7295784540d0d68bf9d61dba32))
* Adding Janus SRE ([details](http://github.com/sarl/sarl/commit/d08b1cd1ab5de0f85e848e43b043e39f1241dc4b))
* Refactor the project structure. ([details](http://github.com/sarl/sarl/commit/385eeb3748392d9c87f5b4c0d20d0e45829edbf5))

## [lang]
* Remove backtracks from the grammar. ([details](http://github.com/sarl/sarl/commit/5b042d2dc8803110b3830b9a805dcba9820a9ca2))
* Add [Inline](http://github.com/Inline) to the imported capacity functions. ([details](http://github.com/sarl/sarl/commit/03a7cea02d054bde6bf59be79c68aa1012dc8310))
* Generate [Inline](http://github.com/Inline) annotations. ([details](http://github.com/sarl/sarl/commit/b31758c4eb7553deeb67157b1e93117737980c2f))
* Add generator of Inline annotations. ([details](http://github.com/sarl/sarl/commit/eda693746a565eef11ca8c9f8802b6b358cc5c36))
* Add setSkill(Skill,Capacities[]). ([details](http://github.com/sarl/sarl/commit/c02316828eeb820c263f1f1d2dbe0072ad60c1fa))
* Add support of [SuppressWarnings](http://github.com/SuppressWarnings). ([details](http://github.com/sarl/sarl/commit/6666d48aacc0794e56b6a3ef4e450a3ec7bf560d))
* Add "space" keyword. ([details](http://github.com/sarl/sarl/commit/b3db7cbc9dd5ae3108027bb49a7b706072b97c45))
* Error message for SARL keywords used as identifier. ([details](http://github.com/sarl/sarl/commit/3dbfb7c4f78ccbca0282825b7fda22f16b74e8e1))
* Avoid logging of formatting exceptions. ([details](http://github.com/sarl/sarl/commit/fb3c8958ed0467bee3088de09875a434be2c39f1))
* Create compiler for inline calls with variadic paremeters. ([details](http://github.com/sarl/sarl/commit/9095e8d8bc32dfda566fa4030594fda2ac3649ab))
* Discourage uses of SARL compiler annotation is SARL code. ([details](http://github.com/sarl/sarl/commit/d47e97cc7498fd33be34b88839f7b7356b86487b))
* Add [FunctionalInterface](http://github.com/FunctionalInterface). ([details](http://github.com/sarl/sarl/commit/d99af396cb7ec142ac628e1490e5cbb8bc355204))
* Fixing invalid inheritance detection for dirty elements. ([details](http://github.com/sarl/sarl/commit/085e285de834bc5e36f72dd1bec08ac347017757))
* Fixing the documentation formatter. ([details](http://github.com/sarl/sarl/commit/ee5a46130f5793fd38da8c2eacc35173ace3109b))
* Use the API 2 for coding the formatter. ([details](http://github.com/sarl/sarl/commit/165b159252a2c6c55a8d1ff9f75c0a762649b756))
* Create a formatter based on API 2, and its tests. ([details](http://github.com/sarl/sarl/commit/bb96831fa47e23db845b1d0be1321083d3e1f649))
* Restrict Pure function detection. ([details](http://github.com/sarl/sarl/commit/e9c3326229d500e59f4dbaf394d9b266508bd663))
* Fixing the Ecore code builder. ([details](http://github.com/sarl/sarl/commit/a593a96d02bf6cfa6b8135ba7113f389a2c9dba9))
* Avoid multiple calls to Skill.install and Skill.uninstall. ([details](http://github.com/sarl/sarl/commit/6145c4fbb7709c53140ea7b27b2ad446c3208cb3))

## [ui]
* Add basic templates. ([details](http://github.com/sarl/sarl/commit/dc3150dfb3fe70ccffbe6f3d68739cdf515ac71b))
* Auto format code on paste. ([details](http://github.com/sarl/sarl/commit/3a7b1217375975e0c40c21d8194c89357178c2f9))
* Add quick fix for adding [SuppressWarnings](http://github.com/SuppressWarnings). ([details](http://github.com/sarl/sarl/commit/887ae7c9854ed3c5becc2cb1c6216b3e0e40950f))
* Provide package renaming participant fragment. ([details](http://github.com/sarl/sarl/commit/52edca1073ebc1ccd89b4bfa8018a6fadde3e824))
* Enable content assist on all the type references. ([details](http://github.com/sarl/sarl/commit/da833bbb709eb27bf757e2457b974d8a3c7d49a9))
* Add icons to the quick fixes. ([details](http://github.com/sarl/sarl/commit/94c1d73532c089f6809c1beedd7a9e1f5a60d1c0))
* Add diagnostic decorations in the outline. ([details](http://github.com/sarl/sarl/commit/8f26f18446837e81dc14cad44a66a17d6d9582c1))
* Add widgets for configuring the [inline](http://github.com/inline) generation. ([details](http://github.com/sarl/sarl/commit/5b108a6f555336559efce02f1ad25dc296d47e92))
* Add icon provider for content assist. ([details](http://github.com/sarl/sarl/commit/73d6fc4aca8e34989b284418614d466be45ff264))

## [core]
* Add Time capacity. ([details](http://github.com/sarl/sarl/commit/42bd1948dfc535bcc6ba0e108091f1c334dc9b26))
* Rename "receive()" to "willReceive()". ([details](http://github.com/sarl/sarl/commit/1484d56d9381166eeef229e9330f4954b5d2525a))
* Add setSkill(Skill,Capacities[]). ([details](http://github.com/sarl/sarl/commit/c02316828eeb820c263f1f1d2dbe0072ad60c1fa))
* Mark the functions as pure. ([details](http://github.com/sarl/sarl/commit/480c186c8a611949d2a611315e6a3717f6d04e76))

## [contribs]
* Add template for SARL examples. ([details](http://github.com/sarl/sarl/commit/d9fe41a1de6637e34abf9de5b1955d3f282642dc))

## [m2e]
* Add monitor when configuring the project. ([details](http://github.com/sarl/sarl/commit/9c49aa20cb6fa0fd1228cbb91e130e60cd348d80))
* Use project configuration for the natures. ([details](http://github.com/sarl/sarl/commit/2bcb5fad9d3295934904d96494775d8b79ea56cb))

## [maven]
* Add "io.sarl.maven.sre" plugin. ([details](http://github.com/sarl/sarl/commit/253c307619b4d6bcca308020969778d61cc36f24))

## [tools]
* Do not display line numbers in the Beamer style. ([details](http://github.com/sarl/sarl/commit/ca4e689db1d36d225d9ef1b41bb71bb17ab54364))
* Make more configurable the fragment that generates the TeX styles. ([details](http://github.com/sarl/sarl/commit/99b1c1c40c6cccfc79233f8a2bb8aa6382280604))

## [mwe2]
* Use version 2 of the MWE2 generation API. ([details](http://github.com/sarl/sarl/commit/e8dd2a35aa5c146ba6c1d5721411cea00ed37524))
* Use the MWE2 API version 2. ([details](http://github.com/sarl/sarl/commit/682808f45a88fcd7ed3e36f0eca328bd7b670a82))
* Add GNU SOURCE-highlite specification generator. ([details](http://github.com/sarl/sarl/commit/38d4d014a8b59ffdcfcd832775a7482410680462))
* Add GNU src-highlite specification generator. ([details](http://github.com/sarl/sarl/commit/38d4d014a8b59ffdcfcd832775a7482410680462))


## [product]
* Add the "embedded" CLI option for the SREs. ([details](http://github.com/sarl/sarl/commit/10453cc42d275441683600c2dd51ba3dbac89f11))
* Provide default SARL project configuration. ([details](http://github.com/sarl/sarl/commit/dc1020ed000272359f3187a8a6a89014c9e24f26))
* Adding the error log view to the SARL product ([details](http://github.com/sarl/sarl/commit/4e9f372e0bcbf92842715e740e897a4d7e2214d7))
* Customizing Welcome page ([details](http://github.com/sarl/sarl/commit/6f7b6cbd501fae51f2dbd4d336cf47f99c6379eb))
* Add project configurator. ([details](http://github.com/sarl/sarl/commit/f3c335330fed646b310a8240f8bf5de186ddd783))
* Add SARL debug perspective. ([details](http://github.com/sarl/sarl/commit/a808bc9865c1a0cd3f7dc35bb0f524c81f3dfa95))
* Add contributions to the configure menus. ([details](http://github.com/sarl/sarl/commit/2c6f6fc053699a2f378cf492a759a22a7cf72574))
* Add type selection dialog for SARL features. ([details](http://github.com/sarl/sarl/commit/05e0aa67b4ba16b2625b1872b9665217fcb2688f))
* Active progress bar in splash screen. ([details](http://github.com/sarl/sarl/commit/cc389180d3f68e286404d451a248bbe5df6e7904))
* Add wizards for creating SARL elements ([details](http://github.com/sarl/sarl/commit/ada1d098ae8d0823c28a954fa99b28a782bfc8e2))
* Change the order of the source folders in the project. ([details](http://github.com/sarl/sarl/commit/93a54d4abd90e9cf0a785dc5d8f0dde5daa3f384))
* Add shortcuts for "Run as" and "Debug as". ([details](http://github.com/sarl/sarl/commit/4f68510df5078132ec629449f64d197878c39416))
* Add application runner for running inside the SARL project VM. ([details](http://github.com/sarl/sarl/commit/3b9cfdb79dc141d414960115584ab6402f03530b))
* Beta decoration is dynamically added. ([details](http://github.com/sarl/sarl/commit/57424268cce8929588b783dd7a8277cbaf8d8ac4))

# Previous changes

* [Changes in the version 0.3.1](./changes_0.3.1.html)

