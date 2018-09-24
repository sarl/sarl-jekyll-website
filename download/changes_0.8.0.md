---
layout: default
title: Changes in 0.8.0
---

# Changes in 0.8.0

Release date: 2018-09-24.

## 1. SARL Language

### 1.1. SARL Language Grammar

* Upgrade to Xtext 2.15. ([details](http://github.com/sarl/sarl/commit/9a37ea93aac9cb359c5327718b06e7ebae814fc9))
* Upgrade to AFC 15.0. ([details](http://github.com/sarl/sarl/commit/c32ddba23d15df950a2673e94f35897cf5c01b5f))
* Use SLF4J as the standard logging system. ([details](http://github.com/sarl/sarl/commit/c0da2fcd7f9051aa025025260e9b0d38faee0357))
* Fixing the invalid precedence of the power operator. ([details](http://github.com/sarl/sarl/commit/18501d85a8d564fb6d1fc2211d26c66b83d572e1))
* Refactor the number operators for avoiding ambiguous calls. ([details](http://github.com/sarl/sarl/commit/045ad5fbcdced84df224d20c1075d53c90dceb7f))
* Allow "public" modifier on the behavior's fields. ([details](http://github.com/sarl/sarl/commit/ad0568f3d393232701babae815c9dcc32c1344e5))
* Add global functions for creating 2-dimension arrays. ([1](http://github.com/sarl/sarl/commit/46ed82f7dc616f6b52f4c9725feafccf241e558c), [2](http://github.com/sarl/sarl/commit/725ea78aa2aadafaadecc9faad51ae6182441b20))
* Make inlined the functions isMe(), isFromMe(). ([details](http://github.com/sarl/sarl/commit/28b4448fe7930a8545e4dec2d1cc14fea8894a52))
* Enablement of the automatic generation of the equality test functions. ([details](http://github.com/sarl/sarl/commit/c1437c9aa74d249ded02e96e52cefe60a29bd2ad))
* Avoid error when "occurrence" is used in an argument's expression. ([details](http://github.com/sarl/sarl/commit/2ec60e8caf8eea1ea1727bb1dac8f978023dd749))
* Avoid Java compilation error when a early exit function is called within a function with return type. ([details](http://github.com/sarl/sarl/commit/3c893e53c62cdb62955fedd264fdf048ffbf9f5c))
* Avoid infinite loop when loop in the type inheritance is declared. ([details](http://github.com/sarl/sarl/commit/03b0d7a6527a1a3f5458628780392f23feac6737))
* Avoid internal exception when [Pure](http://github.com/Pure) is attached to a function in the code. ([details](http://github.com/sarl/sarl/commit/59420370a5b60b79465e348b06613a75c66ab59f))
* Implicitly imported functions in MapExtensions are moved from SARL to Xtext. ([details](http://github.com/sarl/sarl/commit/9847295a6e8a876dcb53a7a3e1af0b0772332899))
* Refactoring of the extra-language generation API. ([details](http://github.com/sarl/sarl/commit/a283dfeed7126a7d90aa92f6162aa9bd38638b27))
* Add output configuration for test code. ([details](http://github.com/sarl/sarl/commit/34464ccdcba5884afd1b34cf466b048f120650e1))
* Apply Xtext patch for solving security issue from JDT jar files. ([details](http://github.com/sarl/sarl/commit/dd45d758547b25ba9c1f7b4ce0e4b30efd7fbd5f))


### 1.2. SARL Validator

* The detection of the invalid and discouraged uses of occurrences is refactored in order to provide consistant errors. ([details](http://github.com/sarl/sarl/commit/960b07c47ac803d7e697c69efc13f9072a64884e))
* Potential synchronization issue is ignorable with [SuppressWarnings](http://github.com/SuppressWarnings). ([details](http://github.com/sarl/sarl/commit/f0ed7c9245a0f21eab5a88753b18dbebcf3a230a))
* Fixing the Xbase regression regarding the detection of duplicate types within a script. ([details](http://github.com/sarl/sarl/commit/52a264ec5a5afe6fb5b64ee369f083caf5bc03cc))

### 1.3. Java Model Inferrer

* Test code is generated into a specific source folder. ([details](http://github.com/sarl/sarl/commit/c532efef2b9844da8ac5e78819d5a8b71e02c590))
* Do not attach [SyntheticMember](http://github.com/SyntheticMember) to the behavior unit functions. ([details](http://github.com/sarl/sarl/commit/18e270dfa1e831f63988ad1ca0175aabb640c881))

### 1.4. SARL Core Library

* Add initialization parameters for the behaviors. ([details](http://github.com/sarl/sarl/commit/6b3a3fc5da2ae86dc5250d1444a706c71237063d))
* Fixing the inlining of the Agent's functions. ([details](http://github.com/sarl/sarl/commit/c4c7291bedf3b4bbcdea8ca553056e5cd9c38d9a))

### 1.5. SARL Batch Compiler

* Introduce the selection of different Java compilers within the batch compiler. ([details](http://github.com/sarl/sarl/commit/df661f679ba1cd73a3abbbb9bf5581ff88e144df))
* Add optimization level parameter to the SARL batch compiler. ([details](http://github.com/sarl/sarl/commit/ecc5fd3f0bd1be9a74278912d5a15985410e32e9))
* Add the compile(IProgressMonitor) function into the SARL batch compiler. ([details](http://github.com/sarl/sarl/commit/15830d6960138f46b0346f4b8f4cefe1387df895))
* Change the format of the issue messages that is used by the SARL batch commpiler ([1](http://github.com/sarl/sarl/commit/5d280c026869329c7b50b239a0f21c4c34b0f28d), [2](http://github.com/sarl/sarl/commit/8cea363ae8422f03ada20a5f4f8a2fe57e0fdaa9))
* Remove the 'Finished" message within the sarl batch compiler. ([details](http://github.com/sarl/sarl/commit/1d87dae6061ca5d071e16749faff81d22f41c5f7))

### 1.6. Generator for extra-languages

* Refactoring of the extra-language generation API. ([details](http://github.com/sarl/sarl/commit/a283dfeed7126a7d90aa92f6162aa9bd38638b27))

### 1.7 Python3 Generator for SARL

* Enable the generation of the inner types. ([details](http://github.com/sarl/sarl/commit/802e793a51c4100f1ffdd359b86aad6f6558a1cc))
* Remove Bootique configuration. ([details](http://github.com/sarl/sarl/commit/a6b5c7dfba07507d03448ded573d324bdb0cbd16))

## 2. SARL User Interface

### 2.1. UI Components

* Add special highlighting for capacity methods. ([details](http://github.com/sarl/sarl/commit/a0f5e009c691043b168ce54d2454a1e09d8c1c34))
* Add codemining feature, and codemining displays the implemented type for anonymous class. ([1](http://github.com/sarl/sarl/commit/4332563bce823dff8c8287daa2f4172afe5790ba), [2](http://github.com/sarl/sarl/commit/de16e2862a3e13c08c8bacf9c8d8ddb4b94e8253))

### 2.2. Internal UI Implementation

* Add specific output folder for test code. ([details](http://github.com/sarl/sarl/commit/d5446877122334688be399d5f7c3a5f58e31e4a5))
* Refactoring of the extra-language generation API. ([details](http://github.com/sarl/sarl/commit/a283dfeed7126a7d90aa92f6162aa9bd38638b27))

### 2.3. Eclipse Product

#### 2.3.1 General Product

* Upgrade the IDE for using Eclipse Photon. ([details](http://github.com/sarl/sarl/commit/cc96a21b527d314a19599bc79da4d9a1dc683df5))
* Configure the classpath with standard and test flags. ([details](http://github.com/sarl/sarl/commit/16d52f4810c38a77688f48f7d27d78da759a82bb))
* Change the name of the product from "SARL Development Environment" to "SARL IDE". ([details](http://github.com/sarl/sarl/commit/4154f0119a372865bb3e1eeb73e691166a9fb8f0))
* Linux launching scripts support both GTK2 and GTK3. ([details](http://github.com/sarl/sarl/commit/a4c89a42429e280496051ce16d747f8cefbe3754))

#### 2.3.1. Preferences

* Add options for enabling or disabling the generation of the special Java statements, e.g. `equals`, `clone`, the serial numbers. ([details](http://github.com/sarl/sarl/commit/74289b56f32da650483eadc7907a920bfc4cf4c2))
* Enhance the SARL project configurator by providing new functions. ([details](http://github.com/sarl/sarl/commit/689e7e7a57bd310fe38b50065d14605024f713c4))
* Refactor the validation code of the editor preference page. ([details](http://github.com/sarl/sarl/commit/7b1139093aeb9951e4c0b30d99d1ab809ae07988))

#### 2.3.2. Wizards

* Avoid NPE when creating a type with a super type. ([details](http://github.com/sarl/sarl/commit/183c03a28269911db9492ccdab93726381623d0b))
* Make public the template of the pom file. ([1](http://github.com/sarl/sarl/commit/c8b8175122fa247caa607384340e911e0ee717f4), [2](http://github.com/sarl/sarl/commit/a4a6e5176fe11d251b1f1e13b30cc9f41e7da716))

#### 2.3.3. SARL Command-Line Compiler

* Add SARL boot class path. ([details](http://github.com/sarl/sarl/commit/adf5be071b35f0818407f209b9c8999fb51b026c))
* Add parameters for selecting the Java compiler and setting the optimization level. ([details](http://github.com/sarl/sarl/commit/fa40cf74327fbbf1bbf9d94dc797d14e39c4ca4e))
* Add the command line options for running the extra-language generators. ([details](http://github.com/sarl/sarl/commit/456ba7e668d516268125422d85eeedf18456979f))
* Re-implement sarlc tool with Bootique. ([1](http://github.com/sarl/sarl/commit/68468067dfe078ad0bd306230c4fc8e2b4ee308b), [2](http://github.com/sarl/sarl/commit/2c53567249dbef321252ac8035336c723a53f6a2), [3](http://github.com/sarl/sarl/commit/6e4b335bd2fce514bf71c8d4c6ab8092393fee2e))
* Compilation command outcomes the first error message. ([details](http://github.com/sarl/sarl/commit/59baf8f98b7a3f8b9fad0eaae29eaef02fa649a3))
* Path detector is now injectable. ([details](http://github.com/sarl/sarl/commit/b31be87de369aa5ac51cfbe4b9291ccca14afb3a))
* Add a progress bar that could be enabled with --progress. ([details](http://github.com/sarl/sarl/commit/86af7ed081f50a0cb6260ba126ad0dfcc5649e36))
* Enable injection of the issue message formatter. ([details](http://github.com/sarl/sarl/commit/4e5ab85520333a9eb7a67a13240f440b93eff4a9))
* Write more details into the options' descriptions. ([details](http://github.com/sarl/sarl/commit/e19733932a941fb0e26fa29ee10e974fbf191ea3))


## 3. External Contributions to SARL

### 3.1. Examples

* Add the Game-of-Life example.
* Add the version of the maven-compiler-plugin in the pom template. ([details](http://github.com/sarl/sarl/commit/b0724d8e9ef5ffcf0f5a1ac1e3b85060b6600558))
* Add file headers and [author](http://github.com/author) comments into all examples' files. ([details](http://github.com/sarl/sarl/commit/d3d4e33da940c85f0c54762c5598d2a0303b71d5))
* Enable the Maven compilation of the tests during the unit tests' execution. ([details](http://github.com/sarl/sarl/commit/d7d4a94ffdda2f683d185e0d2b34de2d476e0083))
* Create a Maven project when the example folder contains a pom file. ([details](http://github.com/sarl/sarl/commit/28f946c5b778bd50c133b0c50b1a819351c5bc12))
* Creation of a default pom file within each example's projects. ([details](http://github.com/sarl/sarl/commit/fd214881029294f5ad58f9e94f698c04cfb91ce9))
* Add pom files to the JavaFX-based examples. ([details](http://github.com/sarl/sarl/commit/c7bd778f2660bc0df4dfeb231205388596716ebf))
* Add icon for each JavaFX-based example. ([details](http://github.com/sarl/sarl/commit/5e66a3098a0e83a66d1726258c4d97ad7452451c))

## 4. SARL Run-time Environment

* Avoid the killed agents receiving the `AgentKilled` events. ([details](http://github.com/sarl/sarl/commit/60cbf2436f6a31dec3de519de0b6571cf8b6f8b3))
* Avoid the spawned agents receiving `AgentSpawned` events. ([details](http://github.com/sarl/sarl/commit/4cd02f643966d1f060da1bb65ac9e31fac2a475d))
* Use the Java SDK's cached thread executor service by default. ([details](http://github.com/sarl/sarl/commit/4c01c6aa50b8d848bf1701b73ae8cc0d4629b161))
* The default maximum number of threads is decrease to 32. ([details](http://github.com/sarl/sarl/commit/86451bc1a2c49495df6c240a0d60774768802e1d))

## 5. Maven Tools

* Apply separate compilation processes for SARL standard code and SARL unit test code. ([1](http://github.com/sarl/sarl/commit/3bcf1aec8639a3b68255209484c7cf69f8c5cb25), [2](http://github.com/sarl/sarl/commit/669d66346a83d8953a19f372aa6b7f10a97814b8))
* When the SARL compiler fails, the first compilation error is output as the main error. ([details](http://github.com/sarl/sarl/commit/f8b5e07d24930d986b5f533cb6bbfb4e6068b499))
* Add the configuration options for running the extra-language generators. ([details](http://github.com/sarl/sarl/commit/e46f2568c11d2a3a67934528f404843b53287430))
* Add parameters for selecting the Java compiler and setting the optimization level. ([1](http://github.com/sarl/sarl/commit/9baec57fa8a9b4abc9337602f8dc4f10db25f1bf), [2](http://github.com/sarl/sarl/commit/3fc34bf1f9900c00fb82448df8140ad9998d519d))
* Avoid help mojo discovery in classpath libraries. ([details](http://github.com/sarl/sarl/commit/9f510ceb901773fbd8c8703e4af8ce21716e766e))

## 6. SARL Documentation

### 6.1. Documentation of the SARL Language

* Add documentation on [DefaultSkill](http://github.com/DefaultSkill). ([details](http://github.com/sarl/sarl/commit/c407c86d86636dd03c455a22a6bf4103e876785f))
* Add documentation on the short notation of the lambda expressions. ([details](http://github.com/sarl/sarl/commit/fe75c089b65c686c7daaf0bfc72dee86fe81d925))
* Add documentation on Skill's install and uninstall functions. ([details](http://github.com/sarl/sarl/commit/181eeaf3d626f3c13d142170b96ad409121b5403))

### 6.2. Documentation of the SARL Core Library

* Fixing the API documentation. ([details](http://github.com/sarl/sarl/commit/49d30e7fc554512b361a0beacdf76b3585a79119))

### 6.3. Tutorials

* Add tutorials on parallel execution and MAS initialization. ([details](http://github.com/sarl/sarl/commit/a5cc3da62408ca6ab598dcba696a6655d234a85f))

### 6.4. Documentation for SRE

* Update documentation on assert for its enabling and disabling. ([1](http://github.com/sarl/sarl/commit/3d8cd145da96b34ca091efcdb50c5edaed726eb9), [2](http://github.com/sarl/sarl/commit/cd02ed3f1e374776f9d783644fc9859fff5cd329))

### 6.5. Documentation for the Maven Tools

* Update the documentation related to the Maven Exec plugin. ([details](http://github.com/sarl/sarl/commit/02df7807569b1c100fe569db5867dca98a7ffeca))
* Add documentation for sarl-maven-plugin plugin. ([details](http://github.com/sarl/sarl/commit/9bd7110b387b5cc080583677ea6230e771d13184))

## 7. Tools for SARL Contributors

### 7.1. General Changes

* Upgrade to Maven 3.5.3. ([details](http://github.com/sarl/sarl/commit/c82ef2a00d33f79c88d488f63f6b0b2dbae26935))

### 7.2. Generator of the SARL Compiler (MWE2 Tools) 

* Codebuilder fragment does not generate unused variables. ([details](http://github.com/sarl/sarl/commit/7ece47ba637f0613a0599fcc9e211865bad2cd2f))
* Extension types within code builder are no more ignored. ([details](http://github.com/sarl/sarl/commit/a08fd4532ff3e33f64f320e9e1929d6b3d8ba6d3))
* Add import wizard for Maven-based SARL projects. ([details](http://github.com/sarl/sarl/commit/997ca0403889337054765e7d13f9c2b5a2c49d9b))
* Test code is generated into a specific source folder. ([details](http://github.com/sarl/sarl/commit/349ecb293cf1788e0c87b05fb2fdfdb05b8ed6dd))
* Provide an utility function for importing a SARL Maven project properly. ([details](http://github.com/sarl/sarl/commit/b3508e3ad0d4b6a41e8d9ba1d83c7f06445c21b0))
* Create the wizard for creating a new SARL Maven project. ([details](http://github.com/sarl/sarl/commit/434a56b3f4a7b487a4fc474464ebceed2f876d97))



## 8. Changes in the Previous Versions

* [Changes in the version 0.7.2](./changes_0.7.2.html)
* [Changes in the version 0.7.1](./changes_0.7.1.html)
* [Changes in the version 0.7.0](./changes_0.7.0.html)

