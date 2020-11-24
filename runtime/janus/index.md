---
layout: default
title: Janus Agent and Holonic Platform
relative: ../..
---

# Janus Agent and Holonic Platform

![Janus Logo]({{ page.relative }}images/janusv3.png)

Janus is an open-source multi-agent platform fully implemented in SARL (implemented with Java for its versions 1 and 2). 
Janus enables developers to quickly create web, enterprise and desktop multiagent-based applications. 
It provides a comprehensive set of features to develop, run, display and monitor multiagent-based applications. 
Janus-based applications can be distributed across a network. 
Janus could be used as an agent-oriented platform, an organizational platform, and/or an holonic platform. 
It also natively manages the concept of recursive agents and holons.

Janus platform was initially published during the 2007-2008 period as a pure Java framework. Since 2014, Janus is fully reimplemented to
support the SARL Agent-Oriented Programming Language. And since 2020, it is fully re-implemented using the SARL language.

## About the Version Number of Janus

The version number of Janus follows a specific convention for its definition. This convention will permits you
to select the appropriate version of the Janus runtime environment for the targeted SARL specification.

**The version number is composed of 4 numbers, optionally followed by the `-SNASPHOT` flag.**
The semantic of these components is:

1. the major version number of the Janus platform;
2. the major version number of the SARL specification;
3. the minor version number of the SARL specification; and
4. the revision number of the Janus platform.

The `-SNAPSHOT` postfix indicates a "under-development" version, i.e. it is not yet released.

## Downloading Janus

The Janus platform may be directly download, even if it is recommend to use it through Maven (see below).
For downloading the platform, please go to the [download page]({{ page.relative }}download/index.html#download_janus).

## Using Janus with Maven

Janus is available as a Maven artifact. The artifact is available on the [Maven Central Repository](http://search.maven.org). For using Janus in your Maven project, add the following dependency into your POM dependencies:


    <dependency>
      <groupId>io.janusproject</groupId>
      <artifactId>io.janusproject.kernel</artifactId>
      <version>{{site.janus_stable_version}}</version>
    </dependency>


You should change the version number {{site.janus_stable_version}} according to the version of your choice. All of the available version numbers could be found on the [Maven Central Repository](http://search.maven.org).

![Janus on Maven Central](https://img.shields.io/maven-central/v/io.janusproject/io.janusproject.kernel.svg?label=Available%20on%20Maven%20Central)

## Command-Line Tool

A command-line tool is provided for running Janus. It could be downloaded on the [SARL download page]({{ page.relative }}download/index.html#download_janus). And, you could read the [official documentation]({{ page.relative }}docs/official/tools/Janus.html) of this tool.

## Documentation

### Java API Documentation

The API documentation related to the Janus platform is included into the [documentation of SARL]({{ page.relative }}docs/api).


### Frequently Asked Questions

The frequently asked questions related to the Janus platform are hosted by the SARL programming language website.
See the [Frequently Asked Questions]({{ page.relative }}docs/official/faq/RuntimeEnvironmentFAQ.html).



