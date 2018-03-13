---
layout: default
title: Changes in 0.7.1
---

# Changes in 0.7.1

Release date: 2018-03-12.

## 1. SARL Language

### 1.1. SARL Language Grammar

* Use the variable's reference names within assert's Java expressions. ([details](http://github.com/sarl/sarl/commit/03554f4f0537df033e26b82bdc3cbb01db139409))
* Internal errors within the type computer should not stop the compilation. ([details](http://github.com/sarl/sarl/commit/426a3951f28a216f28b4d808c02f3d8defa73e4a))
* Add static fields for the default compiler's configuration. ([details](http://github.com/sarl/sarl/commit/f9e666d55bf57ec8e30ec373f78917af5d2ab6bc))

## 2. SARL User Interface

### 2.3. Eclipse Product

#### 2.3.1. Preferences

* Disable "use expression interpreter" when "generate inline annotation is disabled. ([details](http://github.com/sarl/sarl/commit/114362f16e8f6ecc68f2310dcb6db06549f42bc1))
* Add "experimental" to the "Generation [Inline](http://github.com/Inline) annotations" within the compiler preference page. ([details](http://github.com/sarl/sarl/commit/b965abafb15e1415e271cbd9b21718b6e0e21d2e))

#### 2.3.2. Wizards

* Add wizard for exporting a SARL application. ([details](http://github.com/sarl/sarl/commit/9b5f397713aed4e9a3a715c3824eb0c155d17564))

## 3. Janus Run-time Environment

* Janus Eclipse plugin must not be in dependencies of the Janus SRE. ([details](http://github.com/sarl/sarl/commit/2bb9c9d20b84fb93800744557b4a45dfbcf4383b))

## 4. Tools for SARL Contributors

* Split the Eclipse working set "Plugins" to "Core Plugins" and "API Plugins". ([details](http://github.com/sarl/sarl/commit/a85468f7e542fc8ea931ee4e543e379fd5af6b2d))
* No code style check within JavaFX code because it is SARL code. ([details](http://github.com/sarl/sarl/commit/dfbe6540a90f8b6806099541643ad984daea4570))


## 5. Changes in the Previous Versions

* [Changes in the version 0.7.0](./changes_0.7.0.html)

