---
layout: default
title: Changes in 0.6.0
---

# Changes in 0.6.0

Release date: 2017-09-14.

## 1. Language and Compiler


### 1.1. General

* Upgrade to Xtext 2.12. ([details](http://github.com/sarl/sarl/commit/768a0a0a0f21724353f86110d2911d39048a8695))
* Add "assert" and "assume" keywords. ([details](http://github.com/sarl/sarl/commit/97eed6ad5fef68a75f792b5ccb67a9eb228c756f))
* Add static constructor compilation. ([details](http://github.com/sarl/sarl/commit/e6463fda63507cf05e46d17897a0b7a3ae40e59c))
* Add missed functions for supporting fully the "break" keyword generation. ([details](http://github.com/sarl/sarl/commit/f8fed318320a714d9d4b4f8c604df6f597188144))
* Ignore calls to functions that are declared into a deprecated type when other functions (not deprecated) are available. ([details](http://github.com/sarl/sarl/commit/11b30885d720a177e2e939512c17b7317d34d118))
* Attach the "fires not yet supported" warning to the fires clause, not the entire action. ([details](http://github.com/sarl/sarl/commit/6f049da6f292e4ac6597ae48ce7c5c084920abbe))
* Add warning for unnecessary use of a capacity that is implemented by the current skill. ([details](http://github.com/sarl/sarl/commit/e7b551b1eb76f8c7d0baa9c08052a0d4e6f89fe4))
* Add pure operation detector. ([details](http://github.com/sarl/sarl/commit/ab86a08a701723861871cd9915055ec2b834e2b0))

### 1.2. Language Core Library

* Add DynamicSkillProvider factory. ([details](http://github.com/sarl/sarl/commit/ede5d48703d2a38c8097703ae7dc846dd15fb60d))
* Event source should be specified when firing in EventSpace. ([details](http://github.com/sarl/sarl/commit/e5aa681fbd2db0faf2edd4c8479505392255a0e8))
* Make the SARL concepts able to receive SRE specific data. ([details](http://github.com/sarl/sarl/commit/0967d4dca4ca940c757d0b648a40f8d10d5d888d), [details](http://github.com/sarl/sarl/commit/45ef0ee3f30d56903b50d2657001b1f38e98b764) and [details](http://github.com/sarl/sarl/commit/39a56bbbc9b13414e031292a9b47417a4f06449b))
* Deprecate EarlyExitEvent. ([details](http://github.com/sarl/sarl/commit/804609ddf9bac2372a2004ee8dde901f396b8466))
* Move OutParameter into the public API. ([details](http://github.com/sarl/sarl/commit/33d794a3e1ee5150ad6f5624a93ee0a4877c9b4d))
* Replace collection interfaces by interfaces that enable faster implementation. ([details](http://github.com/sarl/sarl/commit/6cd3cdd337163b046847d526193c6fefb8535838))
* Use SynchronizedIterable in place of SynchronizedCollection. ([details](http://github.com/sarl/sarl/commit/529efd31540b11fff07f014b1a67fb6e162dfeef))
* Mark the SREutils as part of the private API. ([details](http://github.com/sarl/sarl/commit/9aa885384fb1a303332099bc82551dfa46049348))

### 1.3. Java Generator

* Generate the Java files as much as possible if the SARL contains an error. ([details](http://github.com/sarl/sarl/commit/56db030d12a14314379d166f62843f8c6c7e17ee))
* Do not generate inline annotation for overridable functions. ([details](http://github.com/sarl/sarl/commit/b3270e5f009dc258cde1f4efe1a13a37f65b1184))
* Valid generation of standard, default and static functions in interfaces. ([details](http://github.com/sarl/sarl/commit/437a1aebe93e920a30bb18a538642cd8e336e6ed))
* Apply a minimal public visibility to the inherited constructors. ([details](http://github.com/sarl/sarl/commit/fc48ef6dfaf2fd1d0d1070ec6126ffb0791736c6))
* Generating type parameters in default valued parameter functions. ([details](http://github.com/sarl/sarl/commit/3172093fa91012ab98eccf3443b5117937829079))
* Copy generic types in the capacity's context-aware wrapper. ([details](http://github.com/sarl/sarl/commit/b7caa40a549877593e1622a6bce31f5eb4889d05))
* Do not break the internal state of JVM operations when detecting purability dynamically. ([details](http://github.com/sarl/sarl/commit/52ff6267e3eb55bea155a214459d44f4194a088a))
* Proper detection of the method overriding with parameters of function type. ([details](http://github.com/sarl/sarl/commit/eac8397d91eaeac808c0482a33bed4d9fb180a1c))
* Fixing the copy of functions with generic parameters. ([details](http://github.com/sarl/sarl/commit/09647eb9133022df921196134a9439c018841ddc))
* Make the cloneWithTypeParametersAndProxies function a general utility function. ([details](http://github.com/sarl/sarl/commit/eb4eb5cb8fe1b41a892fd3e143842b536e0b4291))
* Rewritten the SARL code serialization from the JVM model inferrer. ([details](http://github.com/sarl/sarl/commit/897159780f1b544d01e77308f65aca008c71f5bd))
* Avoid generation of inline annotation for null expressions. ([details](http://github.com/sarl/sarl/commit/688da593a9ad112a91b9909a4b72add8bf112caa))

### 1.4. Extra-Language Generator

* Create the extra language infrastructure. ([details](http://github.com/sarl/sarl/commit/a689aa6e18762493c207c0263f4fe3677594fc93))
* Injection definition for extra language generation into MWE2 script. ([details](http://github.com/sarl/sarl/commit/b9dcd6664f42471449ec562eadb9426973ac093c))


## 2. Core Libraries (SDK)

* Replace Boolean by boolean into AgentTask. ([details](http://github.com/sarl/sarl/commit/cfe0db3b9b48b4c8a9c7afc94cd764e2abcb6dcf))
* Add Comparators utilities. ([details](http://github.com/sarl/sarl/commit/e754e4287266ab4c74378ee0d979b87fabe85202))
* Add the SRE utility class and the SREBootstrap. ([details](http://github.com/sarl/sarl/commit/0275037a0337df10c63d273e019fd5847c09edb8))
* Functions for joining and leaving a context replies the action status with a boolean value. ([details](http://github.com/sarl/sarl/commit/726fbe65e3c9c6c9b3a5f9c11310c8cdde0ac954))
* Add getLogger to the Logging capacity. ([details](http://github.com/sarl/sarl/commit/fc4e633b107968637b97b160f659a5ea7de41c14))
* Add SynchronizedIterable interface. ([details](http://github.com/sarl/sarl/commit/90e51f090996471743223cbe919c33d01ce24053))
* Add scope of identifiers. ([details](http://github.com/sarl/sarl/commit/dd1652a3d699c6a9a5565c7daa87b15a572a72a6))
* Use array of addresses into AddressScope for better performance. ([details](http://github.com/sarl/sarl/commit/18c681ac3788d90836ea3ca5e5dbef91d0d6a5ed))
* Clean the SARL core library code. ([details](http://github.com/sarl/sarl/commit/f98c7d5d3b1ec64b0de72a1857b4bb8d08dbfec6))
* Uncomment the assertion statements into the code. ([details](http://github.com/sarl/sarl/commit/643f0e5c4d9aa875a806f76b81aee040914fe178))

## 3. Eclipse Product

### 3.1. General

* Upgrade to Eclipse Oxygen. ([details](http://github.com/sarl/sarl/commit/2c0f8bce1dd84a73b1122a1e637f469e57d81d3d) and [details](http://github.com/sarl/sarl/commit/35b8d8d00146ebccd2f698f2e90801e28caabbe8))
* Hide Xtend UI contributions. ([details](http://github.com/sarl/sarl/commit/bcb5aec1a21898741935db9d922f4bf3b7ce1298))
* Use default project configuration if it is not provided when creating a project. ([details](http://github.com/sarl/sarl/commit/0a9ff5942d7bb1b9ef1e7540388c23e469fa00fc))
* Change the memory configuration for the product. ([details](http://github.com/sarl/sarl/commit/7dccf96893d7578e61401a37908460e3e31485e1))
* Add the Bootstrap into the definition of the ISREInstall. ([details](http://github.com/sarl/sarl/commit/ed487af4b8a7657a3d301d330616c1af948cf56a))
* Change the colors of the splash beta stamp. ([details](http://github.com/sarl/sarl/commit/d4a9d0e2951f13b1553d1374e48e1a485c2b3365))
* Change beta icon colors. ([details](http://github.com/sarl/sarl/commit/33cfc3e23adfe2ff2b4358d563868a594b30fafd))
* Extra-Language validator becomes a sub-validator of the SARL UI validator. ([details](http://github.com/sarl/sarl/commit/0acf058e39edd1fdf0bd432250768825af203551))
* Avoid NPE in the SARL method builder when no return type was provided. ([details](http://github.com/sarl/sarl/commit/87041867f65d924705d8388daad19f408041e15b))

### 3.2. Outline

* Display Java error marker into the SARL outline. ([details](http://github.com/sarl/sarl/commit/1945436929fa4264cf9cc3567ad52ed246d57650))
* Output the inherited constructors into the outline. ([details](http://github.com/sarl/sarl/commit/c4010001e5facf7d53984c222f2d914c98771f41),  [details](http://github.com/sarl/sarl/commit/b586f6fe312336f6c7922aa23c51707be38ac4df) and [details](http://github.com/sarl/sarl/commit/9a293361b2f7c7268ad77ba6c90983cf0c7f7d2d))
* Open the type declarations in outline view. ([details](http://github.com/sarl/sarl/commit/0b6816b17c98c8cdf46b289e21e42c3114c55690))
* Specific formatting of the formal parameters with default values by the label providers. ([details](http://github.com/sarl/sarl/commit/07115ac827df33c98fccd49d947dcc410cb193ee))
* Fixing text region computation for linking the editor to the outline. ([details](http://github.com/sarl/sarl/commit/f6d08c7d27361e37d9a536ee74d5ff6e54c1a563))
* Fixing invalid error markers in outline for archive's components. ([details](http://github.com/sarl/sarl/commit/66f8bf0da2e493f57b15a071b0677b07804b0420))

### 3.3. Quickfixes

* Fixing generic type mapping for the auto-generated methods. ([details](http://github.com/sarl/sarl/commit/54f1c970a00e112a676c4cb76833bf32e1063143))
* Generates the type parameters into the auto-generated methods. ([details](http://github.com/sarl/sarl/commit/e58379c57ea056d4d0641f9c8efd440694ff5ecb))
* Copy the type parameter constrains into the auto-generated functions. ([details](http://github.com/sarl/sarl/commit/b0295419fa9cff18035ea02519c07d0af9ad6003))
* Generates the fires clause into the auto-generated methods. ([details](http://github.com/sarl/sarl/commit/0cd0b1d75b0e393833cb6ad1c1b90a0ee1ab5245))
* Function types into the auto-generated methods follows the SARL syntax. ([details](http://github.com/sarl/sarl/commit/f321a60fb4c757617e69fe4004a4c7927a257603))


## 4. SARL Run-time Environment (SRE)

* Add the new emit(source,event,scope) function into the ExternalContextAccess skill. ([details](http://github.com/sarl/sarl/commit/cc93392f68e740d207ceff666cc872d81ff2cee2))
* Buffering the capacity for faster access. ([details](http://github.com/sarl/sarl/commit/fb0c813f98d87e092a6de54ab4174b20955fa72d))
* Janus provides a SRE bootstrap service. ([details](http://github.com/sarl/sarl/commit/05351783b40227cf1cac2779abc1931e067de18d))
* Upgrade to ZeroMQ 0.4.2 ([details](http://github.com/sarl/sarl/commit/074cf2eb205dcbddee38869702a4e805ebc21eca))
* Upgrade to Hazelcast 3.9 ([details](http://github.com/sarl/sarl/commit/548892f5002b9d76b190ca291041b7a9561d00a1))
* Fixing the configuration for Maven Assembly 3.1.0. ([details](http://github.com/sarl/sarl/commit/f84496bfbe55b97c1a9be5b287752fd00f2b2186))

## 5. Maven Tools

* The SRE configuration Maven plugin supports SRE Bootstrap. ([details](http://github.com/sarl/sarl/commit/a109e3bf9c12165ead1eac97bc0be29905ef1dba))
* The maven documentation generator verifies the URLs' anchors. ([details](http://github.com/sarl/sarl/commit/52c7c9763ed123e3857d1fbb736c35781254da97))
* Add line continuation option in the documentation generator. ([details](http://github.com/sarl/sarl/commit/83d5d39062135b277b31e1b179c22414e8555698))
* The Markdown document generator parses the pure HTML "a" hrefs. ([details](http://github.com/sarl/sarl/commit/b809dee298af78864c2e91aa0a18c8ca25ebaf2c))
* References to deprecated features are considered as error when validating the documentation. Consequently, no deprecated feature is documented. ([details](http://github.com/sarl/sarl/commit/06bd264e65d6dd59abb9a2d35edab0788d5f36f9))

## 6. Contributions



### 6.1. Embedded Examples

* Add the Sierpinski fractal example. ([details](http://github.com/sarl/sarl/commit/7f5fb3e3ea02aee13a64a4a48fb207cabf9bec1f))
* Add the fireworks example. ([details](http://github.com/sarl/sarl/commit/1bdc0e4b7351c609ff503ae61e6726d791bb1616) and [details](http://github.com/sarl/sarl/commit/a60f29ec977d65455a3312df259a8b6ba1f0d951))
* Add examples related to the tutorials. ([details](http://github.com/sarl/sarl/commit/3d620d7dd873663b6770199f3128279b077fb4b0) and [details](http://github.com/sarl/sarl/commit/70bdd4024d8405a2e3ef3200feffbb2e3f42d2c2))
* Include the example creation wizard's class into the plugin. ([details](http://github.com/sarl/sarl/commit/c48102dfc1cf791c954e6e20753dfc4127ff223d))
* Close the welcome page when creation wizard is finished. ([details](http://github.com/sarl/sarl/commit/4ddc8ff4fc8bfa446da9c2f376ea0f122b8b3a3d))
* Add the project configuration for the examples. ([details](http://github.com/sarl/sarl/commit/fc87e79f47ca1539a30381bfe1240b06381f9c07))
* Fixing the README for adding an example. ([details](http://github.com/sarl/sarl/commit/89b158b2c8e43b60e0b8dcff213a7ff705465f3f))

### 6.2. External Syntax Highlightning

* Add syntax highlightning for TextMate, Sublime Text and Atom text editors. ([details](http://github.com/sarl/sarl/commit/d6957107e526c44faa6125becfa2c033cf0d82e0), [details](http://github.com/sarl/sarl/commit/cf0cc8730e0ad4c4a2ad1e1d158c3d05e25c0f8f), and [details](http://github.com/sarl/sarl/commit/79a3d1a51c294646b54fbb14332418cc73d87773))
* Add syntax hilightning for Vim text editors. ([details](http://github.com/sarl/sarl/commit/78a096144112e78971ee97f69d636bad3a84cc3e))
* Make case-insensitive numbers into the Pygments syntax hilightning. ([details](http://github.com/sarl/sarl/commit/8e143a833db3ea4718d461a3079d07f9d90b368e))
* Fixing invalid syntax hilightning for Gtk source viewer. ([details](http://github.com/sarl/sarl/commit/1b865e5d7bef054518cfc7fba868bfbda41970bd))
* Add line number format in LaTeX styles. ([details](http://github.com/sarl/sarl/commit/a5f4775b350b7ec2896b858d00bd8af99f1a3e6b))
* Add '[no]sarlcolors' option to the LaTeX styles. ([details](http://github.com/sarl/sarl/commit/829eb7d6c191881b7af75aaa43de5f7935a4c80c))
* Enable README file generation into external syntax hilightning tools. ([details](http://github.com/sarl/sarl/commit/e48a72f3610fe3856ec4ee8c6e73263736e6285a))

### 6.3. Other Contributions

* Better UI for SEI results. ([details](http://github.com/sarl/sarl/commit/725aaae766302ac830e10b4ab14c96da8cdf8a28))

## 7. Documentation

### 7.1. Language Documentation

* Complete the comparison table between SARL, Java, Xtend and Scala. ([details](http://github.com/sarl/sarl/commit/374ca21cbb4eac91ded23d3b957e90a396793cbe))
* Add missed explanations on field and methods definitions in classes. ([details](http://github.com/sarl/sarl/commit/c6e0e84cbc315b259ae06f23b3474d8f6495b471))
* Add missed bitwise operators. ([details](http://github.com/sarl/sarl/commit/170b9b8439d079fb647780aaeede6fcdcc56bde8))
* Add assert keyword documentation. ([details](http://github.com/sarl/sarl/commit/908def537d01e3ed954511e9df0e6bbdb8ed620e))
* Add scope of identifiers. ([details](http://github.com/sarl/sarl/commit/dd1652a3d699c6a9a5565c7daa87b15a572a72a6))
* Add documentation about dispatch methods. ([details](http://github.com/sarl/sarl/commit/f7c41e010aa08d9f4540bd9c4f5a350f12c5aaad))
* Add documentation on static constructors. ([details](http://github.com/sarl/sarl/commit/727169ca2e0330057a1074c8452b87a08f646ce6))
* Add short documentation of the SRE bootstrap. ([details](http://github.com/sarl/sarl/commit/ca2437eed872db6f869563854f80bbcb0d888e5b))
* Add documentation on synthetic methods. ([details](http://github.com/sarl/sarl/commit/5531e9350fdc77072d9393be5c45c4e00b4c8595))
* Fixing invalid documentation for boolean operators. ([details](http://github.com/sarl/sarl/commit/283b1bdab1c0c959296ee5f889f2941bb502d856))
* Update the Logging capacity documentation. ([details](http://github.com/sarl/sarl/commit/98cafd7e389df412e0d0ab33de7a1dee87152eae))

### 7.2. Other Documentation

* Add short explanation on the SARL tool-chain. ([details](http://github.com/sarl/sarl/commit/9b8329c4bd5b81c5f5d538f803b6d13f35ed96e6))
* Add links to the cli tool documentation. ([details](http://github.com/sarl/sarl/commit/5881e4ae096d4c21a43682969fa911ce950afa62))
* Clean the documentation. ([details](http://github.com/sarl/sarl/commit/bb822f3d5587ebbfdcc9988471ea862e4c237399))


## 8. Developers' Corner

* Add the code of conduct for the project. ([details](http://github.com/sarl/sarl/commit/2e2058661f23499d58c6c19ef6388db2e2cd6be1))
* Create LICENSE ([details](http://github.com/sarl/sarl/commit/00bd20ba797b60a8c2ba245bf15f328247cc7d37))
* Avoid unecessary logs during the unit tests. ([details](http://github.com/sarl/sarl/commit/d2fd601d245df533e5f56c788eeaf97af0ee84d4) and  [details](http://github.com/sarl/sarl/commit/d2276b01d79823cda546b91f8a7ea716c61494bc))
* Updating CONTRIBUTING with the guideline for solving the launch4j issue. ([details](http://github.com/sarl/sarl/commit/8b4cffb99391fa8d476b1214188ab72487596f75))
* Fixing the module names in the Javadoc generation script. ([details](http://github.com/sarl/sarl/commit/f05e39b94482c0194e069f8d9f085f6080043325))
* Add specific script for deployment on travis. ([details](http://github.com/sarl/sarl/commit/12dca8d14eb474a81f3f3baf7f070650fa5bce5b))
* Change the memory configuration for AppVeyor. ([details](http://github.com/sarl/sarl/commit/c20446b92e011e4cf1f753a51c40fd2c3627b7a1))
* Add https cert for deployment. ([details](http://github.com/sarl/sarl/commit/4c5449cec56e05fce801ac836972b4aa45962240))
* Use Maven 3.5.0 on CI servers. ([details](http://github.com/sarl/sarl/commit/9c7b261ef5115ea0f9c4cdb8fbfaa09c40fef8f5))
* Use Checkstyle 7.6 ([details](http://github.com/sarl/sarl/commit/7d40e4fe2f6fbbe57631e801b494ff2b9cf5ae43))
* Change the AppVeyor configuration. ([details](http://github.com/sarl/sarl/commit/d709c6f135a09138adc9b73fa6f726fe16f2aa3e))


## 9. Changes in the Previous Versions

* [Changes in the version 0.5.8](./changes_0.5.8.html)

