---
layout: default
title: Changes in 0.3.0
---

# Changes in 0.3.0

Release date: 2015-11-30.

## [lang]
* Change the Agent API for constructor injection. ([details](http://github.com/sarl/sarl/commit/803bd7005c5f5172556f7442f091c2e868ea13cb))
* Improve the SARL grammar with basic OOP statements. ([details](http://github.com/sarl/sarl/commit/6950387a70374405948d5964cd135b7d9d5feebd))
* SARL implementation of the OO Ecore elements. ([details](http://github.com/sarl/sarl/commit/f9a7bcfb1028c9415104953305d8be0dd4f167c1))
* Add support of type parameters. ([details](http://github.com/sarl/sarl/commit/d22c305e02e8a1914356ef896563c7ae8c24bebe))
* Add 'it' in the event's guards. ([details](http://github.com/sarl/sarl/commit/b33baa4ff5d2da0dbbd70fedd6cafb65f0fcf011))
* Assume that getter methods have no side effect. ([details](http://github.com/sarl/sarl/commit/7da2e7a4f226edcd09d50b496f4e45348d25bb44))
* Select the injection method for Agent. ([details](http://github.com/sarl/sarl/commit/180e0a06d186f14bc6f648235b3137d42fed7063))
* Error when too old version of SARL is on the classpath. ([details](http://github.com/sarl/sarl/commit/c0cc43a031c164d7b6c5b6f31bd0904c39feb2a8))
* Disable side-effect checks in event handler guards. ([details](http://github.com/sarl/sarl/commit/558d1bb220b9217f7858e2dc78b49c4474613815))
* Warns when super event handler is called. ([details](http://github.com/sarl/sarl/commit/d6b78273b814abcb77608f5de320db32bed5d8f3))
* Add [Pure](http://github.com/Pure) annotation on no-side-effect actions. ([details](http://github.com/sarl/sarl/commit/269d35a6c193872f44ba278439efe906905047a7))
* Change the output directory for SARL. ([details](http://github.com/sarl/sarl/commit/0d6a33dbb7c9fc0e8252e933ce5a8dbb31abe024))
* Upgrade to JavaSE 1.8 ([details](http://github.com/sarl/sarl/commit/f9095c78f7589da979e63463594b5178ca023696))
* Move to Xtext 2.8.4. ([details](http://github.com/sarl/sarl/commit/fc394c9cf4f9f54ce6f77443a492ccd216fdcd8f))
* Use [Generated](http://github.com/Generated) from javax. ([details](http://github.com/sarl/sarl/commit/168a40fe6745a523378525359b14bc8ce1c03334))
* Add the annotation [SarlSpecification](http://github.com/SarlSpecification). ([details](http://github.com/sarl/sarl/commit/8cfb013f03f7b6766ac5f6a3f9ef00c1f3efd66e))

## [core]
* Change the prototype of clearSkill. ([details](http://github.com/sarl/sarl/commit/daf5e2ae1877052498115744105eedf7f9745c31))

## [util]
* [lang.core] Move TimeExtensions into the lang core module for implicit inclusion in SARL. ([details](http://github.com/sarl/sarl/commit/ccc2eee2f53ff6488b9e31b592bdd0a3f963bb59))

## [ui]
* Update the outline for supporting OOP. ([details](http://github.com/sarl/sarl/commit/c97408ef06b76307e57f83e176894dd24fe48b65))

## [m2e]
* Generate error if SARL plugin and library have invalid version. ([details](http://github.com/sarl/sarl/commit/3d4d646dfc22118d49cda7e7f16c42485422ae44))

## [mwe2]
* Enable specification of new Ecore methods in MWE2. ([details](http://github.com/sarl/sarl/commit/fc7754b301c87f4a4919026ae14825568b3503c4))
* Create a specific EMF generator fragment. ([details](http://github.com/sarl/sarl/commit/7388e3d9bcf70037a71c27d74323e9a9ddddadfa))
* Add fragment for generating LaTeX listing styles. ([details](http://github.com/sarl/sarl/commit/77f1d83cf8c107dc751986ac1aff8b531e165813))
* Add fragment for Google Prettify. ([details](http://github.com/sarl/sarl/commit/949ccafa32de826b4e159c8762fd48c8b2623ae2))

## [eclipse]
* Upgrade to Eclipse Mars ([details](http://github.com/sarl/sarl/commit/6cc8c80e03739dee3365bd8ef8af32e664b26f52))
* Remove AttributeUtil. ([details](http://github.com/sarl/sarl/commit/f3a67066aff0c5ecb0513b3e454815a09c02d997))
* Default CSS is e4 "classic". ([details](http://github.com/sarl/sarl/commit/62fe0c4199acc49c18e3d10de32905bee0359682))
* Log the exception when SRE is invalid. ([details](http://github.com/sarl/sarl/commit/18d6a460ffe54b1718cd9f42a4c7ba949127ae26))
* Avoid NPE in the SARL launching configuration. ([details](http://github.com/sarl/sarl/commit/c1e638cac181c9461d33fd90438e46f7147b8781))
* Avoid IllegalArgumentException in launch configuration. ([details](http://github.com/sarl/sarl/commit/7cfe5d6d8725e40d0c169dccf80115e674b8f7a7))
* Change splash screen for Mars platform. ([details](http://github.com/sarl/sarl/commit/71042a490fd1d8d0eb176a84b960f917a56f44d6))
* Fixing NLS warning. ([details](http://github.com/sarl/sarl/commit/4210d23f6d9cc781eab2c8a3c1a91fdfb6a24fa1))

## [product]
* Upgrade to Eclipse Mars ([details](http://github.com/sarl/sarl/commit/6cc8c80e03739dee3365bd8ef8af32e664b26f52))
* Removing support for SARL product MacOS x86 non 64 ([details](http://github.com/sarl/sarl/commit/1757a9ce8c54015378854ffd0acb31242b87e5a4))
* Fixing product configuration. ([details](http://github.com/sarl/sarl/commit/61a225d43b0a09555281d75d4d1f4c1363dc90b2))
* Tuning product content to avoid error at launching [to be continued] ([details](http://github.com/sarl/sarl/commit/553ec8b4d2f85b8f6eab86e21c72342a9afc93d4))
* Force UTF8 file encoding on Windows platforms. ([details](http://github.com/sarl/sarl/commit/c97b316564d6327968da4fc080109f080c0ec06f))

## [maven]
* Remove the dependencies to Xtend in the Maven SDK. ([details](http://github.com/sarl/sarl/commit/864c8bc54089ca5872d1927b4a04d3223e09a336))
* Enforce the plugin dependency detection. ([details](http://github.com/sarl/sarl/commit/a7be861b9a5cedb3d75c603cfde4101a8bde3866))
* Use the value of the "target" configuration tag. ([details](http://github.com/sarl/sarl/commit/b907adc083d959b780a999e5905b694c4c92dd5f))
* Use the SARL prettify style in the doc generator. ([details](http://github.com/sarl/sarl/commit/86a176e445d4b670c8bee01ecaa32bd91d253f8a))
* Use the new Maven plugin API. ([details](http://github.com/sarl/sarl/commit/5b13bc7442286d3be72448874af3d1efaf37321b))

## [docs]
* Add short documentation on the OOP support. ([details](http://github.com/sarl/sarl/commit/9661573704df93d733c8a8908508ea652529fd24))
* Add FAQ about launching problems with Windows 10. ([details](http://github.com/sarl/sarl/commit/409b4d1d14902487ce9367d5d11d8997ad6ed020))
* Add FAQ on SRE/SARL Spec version imcompatibility. ([details](http://github.com/sarl/sarl/commit/54a36d8073d9448bdcf77e30ae33d13f7da4036a))
* Update the documenation API for supporting JRE 1.7 and higher. ([details](http://github.com/sarl/sarl/commit/f6f52b2a95d1e88313b296f12fec4dea0568b94f))
* Remove "pom" type dependency. ([details](http://github.com/sarl/sarl/commit/24a05d3e8884418255c10b81189b837d7e0836da))
* Change the SARLConfig reference. ([details](http://github.com/sarl/sarl/commit/d6c427e5ad8009cfbc2186f2ae6d739b16b2eee0))

# Previous changes

* [Changes in the version 0.2.0](./changes_0.2.0.html)

