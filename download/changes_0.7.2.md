---
layout: default
title: Changes in 0.7.2
---

# Changes in 0.7.2

Release date: 2018-04-03.

## 1. SARL Language

### 1.1. SARL Batch Compiler

* Fixing invalid command line for the Java batch compiler. The batch compiler does not output any more an error when a folder does not exist.

## 2. SARL User Interface

### 2.1. Eclipse Product

#### 2.1.1. Wizards

* Avoid NPE when creating a Skill with the wizard.
* Fixing the documentation of BundleUtil.

## 3. External Contributions to SARL

### 3.1. Examples

* Avoid calls to the deprecated features within the examples' codes.

## 4. Janus Run-time Environment

* Update the test API for specifying the injection module.

## 5. SARL Documentation

### 5.1. Documentation for SRE

* Create a Maven project with Janus within the dependencies. The documentation is updated in order to clearly explain why and how to add the Maven depencency to the SARL run-time environment. Indeed, it is not the standard dependency for SARL, which is the SARL SDK module.

## 6. Tools for SARL Contributors

### 6.1. All Platforms

#### 6.1.1. Dependencies

* Downgrade to Maven API 3.3.9
* Upgrade the JDT and SWT plugins.
* Upgrade to m2e 1.8.3.


## 7. Changes in the Previous Versions

* [Changes in the version 0.7.1](./changes_0.7.1.html)

