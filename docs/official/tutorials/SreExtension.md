---
title: "Creating an extension for the Janus SRE"
layout: default
---

# Creating an extension for the Janus SRE


<ul class="page_outline" id="page_outline">

<li><a href="#1-janus-framework">1. Janus Framework</a></li>
<li><a href="#2-bootique">2. Bootique</a></li>
<li><a href="#3-creating-an-extension-step-by-step">3. Creating an extension step-by-step</a></li>
<ul>
  <li><a href="#31-select-the-modules-from-janus">3.1. Select the modules from Janus</a></li>
  <li><a href="#32-write-the-extension-code">3.2. Write the extension code</a></li>
  <li><a href="#33-determine-the-injection-module">3.3. Determine the injection module</a></li>
  <li><a href="#34-write-a-module-for-the-new-injection">3.4. Write a module for the new injection</a></li>
  <li><a href="#35-write-a-bootique-module-provider">3.5. Write a Bootique module provider</a></li>
  <li><a href="#36-define-the-bootique-module-provider-as-java-service">3.6. Define the Bootique module provider as Java service</a></li>
  <li><a href="#37-add-the-library-in-the-classpath">3.7. Add the library in the classpath</a></li>
</ul>
<li><a href="#4-adding-configuration">4. Adding configuration</a></li>
<ul>
  <li><a href="#41-bootique-configuration-in-short">4.1. Bootique configuration in short</a></li>
  <li><a href="#42-create-a-configuration-object">4.2. Create a configuration object</a></li>
  <li><a href="#43-injecting-a-configuration-on-demand">4.3. Injecting a configuration on demand</a></li>
</ul>
<li><a href="#5-mapping-a-configuration-attribute-to-an-environment-variable">5. Mapping a configuration attribute to an environment variable</a></li>
<li><a href="#6-mapping-a-configuration-attribute-to-a-command-line-option">6. Mapping a configuration attribute to a command-line option</a></li>
<li><a href="#7-legal-notice">7. Legal Notice</a></li>

</ul>


This document describes the basics of the extension of the Janus run-time environment (SRE).
Before reading this document, it is recommended reading
the [General Syntax Reference](../reference/GeneralSyntax.html).

<p markdown="1"><span class="label label-danger">Caution</span> This tutorial will use the syntax of the SARL programming language for illustration. However, you could define your extension with any programming language that is compatible with Java, e.g. [Scala](http://www.scala-lang.org/) or [Kotlin](https://kotlinlang.org/).</p>

## 1. Janus Framework

[Janus](http://www.sarl.io/runtime/janus/index.html) is an open-source multi-agent platform fully implemented in SARL. 
Janus could be used as an agent-oriented platform, an organizational platform, and/or an holonic platform. 
It also natively manages the concept of recursive agents and holons.
Janus platform was initially published during the 2007-2008 period as a pure Java framework. Since 2014, Janus is fully reimplemented to
support the SARL Agent-Oriented Programming Language. And since 2020, it is fully re-implemented using the SARL language.

Janus implementation follows the standards of software engineering as much as possible. Basically, the key
implementation choices of Janus that are under interest in this tutorial are:
1. [*Microkernel architecture*](http://www.fipa.org/repository/standardspecs.html): Janus implementation is based on a microkernel that provides the key features of an agent framework, and that could be easily extended. The key features are implemented as services.
2. [*Service-based architecture*](https://en.wikipedia.org/wiki/Service-oriented_architecture): The main features of the Janus framework are implemented as services, e.g. context management, agent lifecycle, logging, etc.
3. [*Dependency Injection*](https://en.wikipedia.org/wiki/Dependency_injection): Modules (and services) are injected into the using objects with [Google Guice](https://github.com/google/guice). It provides support for dependency injection using annotations to configure Java objects. Dependency injection is a design pattern whose core principle is to separate behavior from dependency resolution.



Before starting to create an extension for Janus, you have to be sure you have understood these key implementation choices.

## 2. Bootique

[Bootique](http://bootique.io) is a platform for building container-less runnable Java applications.
It is designed for microservices (but not limited to), as it allows you to create a fully-functional application with minimal-to-no setup.
Unlike traditional container-based applications, Bootique allows you to control your `main()` method and create Java applications that behave
like simple executable commands. Each Bootique application can be started with a (YAML) configuration, or configured with shell
variables and is ideally suited for Docker and cloud deployments.

Compared to other products, Bootique has a focus on modularity and clean pluggable architecture.
It is built on top of a [dependency injection container](https://en.wikipedia.org/wiki/Dependency_injection)
([Google Guice](https://github.com/google/guice)), and pretty much anything in Bootique can be customized/overridden.

*Why is Bootique used into Janus?*
As described above, the features of bootique enables the define and *override* injected modules with less effort.
Moreover, the Bootique enables to define complex (almost complete) configuration parameters that could be
changed from a YAML file, Java properties, environment variables and command-line options.
Finally, Bootique helps to define specific commands that could be started from the command-line
For all these reasons, Bootique was included into Janus. 

## 3. Creating an extension step-by-step

This section explains how to create step-by-step an extension to Janus.
In order to create an Janus extension, the following steps could be followed.

### 3.1. Select the modules from Janus

For creating a Janus extension, even more complex than the one explained in this tutorial, you should study and understood
the implementation of Janus in order to select the best module to override for your purpose.

For matter of simplicity in this tutorial, the logging service of Janus is chosen for illustrating the extension.
The type that is defined in Janus for representing the logging service is `LoggingService`.


### 3.2. Write the extension code

After selecting the modules to be extended, you should write your code:

```sarl
package mypackage
import io.sarl.sre.services.logging.LoggingService
import com.google.common.util.concurrent.AbstractService

class MyLoggingService extends AbstractService implements LoggingService {
	val platformLogger = new MyLogger
	var kernelLogger : MyLogger
	override getPlatformLogger : Logger {
		this.platformLogger
	}
	override getKernelLogger : Logger {
		if (this.kernelLogger === null) {
			this.kernelLogger = new MyLogger(this.platformLogger)
		}
		return this.kernelLogger
	}
	override getKernelModuleLogger(moduleName : String) : Logger {
		return new MyLogger(moduleName, getKernelLogger)
	}
	override createAgentLogger(name : String, initialLevel : Level) : Logger {
		val log = new MyLogger(name, this.platformLogger)
		if (initialLevel !== null) {
			log.level = initialLevel
		}
		return log
	}
	
	override doStart {
	}
	override doStop {
	}
}
```


In the previous code, the type `MyLogger` is defined as an implementation of the JUL logger.
The contruction takes as optional argument the name of the logger, and as mandatory argument the parent logger.

Three functions must be defined in your own implementation of the logging system, namely `MyLoggingService`:

* `getPlatformLogger`: replies the root logger of all the loggers of the SRE.
* `getKernelLogger`: replies the logger that is dedicated to the SRE kernel.
* `getKernelModuleLogger`: replies the logger that is dedicated to a module of the SRE kernel. The argument of the function is the kernel module's name to be used when displaying the messages.
* `createAgentLogger`: create the logger for the agent with the given name. The second parameter permits to control the verbosity of the logger.


<p markdown="1"><span class="label label-info">Note</span> In the previous code, the interface `LoggingService` is directly implemented. It is also possible to extend a class that is defined into the Janus code and implemeting this interface in order to have benefit of existing code.</p>


### 3.3. Determine the injection module

According to the architecture of Janus, the modules are injected into the Java objects that depend on these modules.

It is then mandatory to determine:

1. where the injection is defined, i.e. in which injection module, and
2. how the injection is defined, i.e. the binded types.

In Janus, the modules are defined into the package `io.sarl.sre.boot.internal`, or one of its sub-packages.
The module that corresponds to the logging system is defined in the class `io.sarl.sre.boot.internal.services.LoggingServiceModule`.
The definition of this module is close to:

```sarl
package mypackage
import com.google.inject.AbstractModule
import io.sarl.sre.services.logging.LoggingService

class LoggingServiceModule extends AbstractModule {
	override configure {
		typeof(LoggingService).bind.to(typeof(JanusLoggingService)).asEagerSingleton
	}
}
```


The key principle of the injection definition is the type binding: each time a type A needs to be injected, the injector creates an instance of the binded type B, e.g. with the code `A.bind(B)`.
In the previous code, the type `LoggingService` that should be injected is binded to an instance of type `JanusLoggingService`, that is a Janus-internal definition of the logging service.
The function `asEagerSingleton` forces the injection engine to create the single instance, and no more.


### 3.4. Write a module for the new injection

Now you have determined the original injection module and definition, you could define your own module and injection for your extension.
The following code is the definition of the injection module that binds the `LoggingService` to the new implementation of the logging service.

```sarl
package mypackage
import com.google.inject.AbstractModule
import io.sarl.sre.services.logging.LoggingService

class MyLoggingServiceModule extends AbstractModule {
	override configure {
		typeof(LoggingService).bind.to(typeof(MyLoggingService)).asEagerSingleton
	}
}
```



### 3.5. Write a Bootique module provider

As explained previously, the Bootique library is used for enabling the overriding of the injection definitions.
The API of this library imposes to define a specific provider for the module in your extension. This provider has the role to:

1. Define name and the documentation of the extension.
2. Create the configuration binding.
3. Define the overriding of the module.
4. Create the associated injection module on demand.

This provider has a central role into the Bootique architecture. Without this provider, it is impossible to
include an extension into your application.

Therefore, the code of the Bootique provider is:

```sarl
package mypackage
import io.sarl.sre.services.logging.LoggingService
import io.bootique.BQModuleProvider
import io.bootique.BQModule
import com.google.inject.Module

class MyLoggingServiceModuleProvider implements BQModuleProvider {
	override moduleBuilder : BQModule.Builder {
		BQModule::builder(module)
			.providerName(name)
			.description("This is my extension")
			.overrides(overrides)
	}
	override module : Module {
		new MyLoggingServiceModule
	}
	override overrides : Collection<Class<? extends Module>> {
		#[JanusLoggingService]
	}
}
```


The function `moduleBuilder` is the first of the mandatory functions to be defined into the provider.
It replies a factory for the Bootique module. This factory is built with the function `builder`
that takes the injection module instance (replied by the second function to be defined).
Then, it is possible to specify more attributes for the Bootique module, such as:

* The name of the provider with the function `providerName` that takes the name of the module as argument. The function `name` replies this name. It already defined into the super type.
* A description for the extension that is shown up into the help page of the application.
* The specification of the overridden modules. The function `overrides` replies the list of the injection module typenames that are overridden by your extension. By default, this function replies an empty list.

The function `module` must be defined for creating the instance of the injection module.

The function `overrides` must reply the list of the module types that are overridden by the extension.

To conclude this section, the builder that is created this class is used by the Bootique framework in order to create and include your extension into the application.


### 3.6. Define the Bootique module provider as Java service

Defining the Bootique injection module provider, as in the previous section is not enough to enable Bootique to use your extension.
Indeed, the Bootique must find your library dynamically on the application classpath.
Java framework defines a standard for discovering new features on the classpath: the Java services.

<p markdown="1"><span class="label label-danger">Caution</span> the Java services are different than the SRE services. The first services are defined in order to extend your application dynamically (similar to plugins). The second services are designed to run the agents.</p>

It is almost easy to provide your Bootique module provider to the Bootique framework.
Indeed a Bootique module provider is assimilated to a Java service, and could be declared according to this Java standard.

There is two methods for declared a Java service: one for Java 8 and one for Java 9 and higher.


**For Java 8:** You must create a file into the folder `META-INF/services` with the name `io.bootique.BQModuleProvider` (that is the fully
qualified name of the Bootique module provider class). Each line of this file contains the fully qualified name of an implementation of
a Bootique module provider to be added to the application classpath. Therefore, you could add your own Bootique module provider in this file.
The content of the file `META-INF/services/io.bootique.BQModuleProvider` becomes:

```
mypackage.MyLoggingServiceModuleProvider
```


**For Java 9 and higher:** Since the introduction of the modules into the Java standards, you must declare the provided Java services
in the file `module-info.java`:

```java
module mypackage.myextension {
  requires bootique;
  provides io.bootique.BQModuleProvider with mypackage.MyLoggingServiceModuleProvider;
}
```


### 3.7. Add the library in the classpath

Once you have written and compiled your extension in order to obtain the library file `myextension.jar`.
For including your extension into the application, you have only to add the jar file in the classpath (or the module path).

For example, running the Janus framework with your extension may be done with the following command line:
```
janus -cp myextension.jar myagent
```


## 4. Adding configuration

One of the interesting features of Bootique is its ability to define and manage configuration attributes.


### 4.1. Bootique configuration in short

Bootique modules obtain their configuration in a form of "factory objects". The Bootique application configuration is multi-layered
and roughly follows the sequence of "code - config files (contributed) - config files (CLI) - overrides".
"Code" is the default values that are provided in constructors of factory objects.
Config files overlay those defaults with their own values. Config files can be either contributed in the code,
or specified on the command line. Files is where the bulk of configuration usually stored. Finally config values may be
further overridden via Java properties and/or environment variables.

Format of configuration file can be either JSON or YAML. For simplicity we'll focus on YAML format, but the two are
interchangeable. Here is an example config file:

```yaml
log:
  level: warn
  appenders:
    - type: file
      logFormat: '%c{20}: %m%n'
      file: target/logback/debug.log

jetty:
  context: /myapp
  connectors:
    - port: 12009
```

While not strictly required, as a rule the top-level keys in the file belong to configuration objects of individual modules.
In the example above `log` subtree configures bootique-logback module, while `jetty` subtree configures bootique-jetty.


### 4.2. Create a configuration object

Bootique allows each module to read its specific configuration subtree as an object of the type defined in the module code.
Very often such an object is written with a bunch of setters for configuration properties, and a factory method to produce
create the root instance of the configuration tree.
Here is an example configuration object:

```sarl
package mypackage

class MyConfiguration {
	/** 
	 * Prefix for the configuration entries of the modules.
	 */
	public static val PREFIX = "myextension"
	/** 
	 * Name of a configuration property (with prefix).
	 */
	public static val PROP1_NAME = PREFIX + ".prop1"
	/** 
	 * Default value for the property.
	 */
	public static val DEFAULT_PROP1_VALUE = "default-value"
	@Accessors(PUBLIC_GETTER)
	var prop1 : String = DEFAULT_PROP1_VALUE
	/** Change the value of prop1.
	 */
	@BQConfigProperty("Explanation on the meaning of prop1.")
	def setProp1(value : String) {
		this.prop1 = value
	}
	/** Replies the configuration tree.
	 */
	static def getConfiguration(configFactory : ConfigurationFactory) : MyConfiguration {
		configFactory.config(typeof(MyConfiguration), PREFIX)
	}
}
```


The previous code provides the best pratices for written a Bootique-based configuration.

Each property of the configuration has a qualified name, which starts with the prefix of the configuration.
That's why a global variable named `PREFIX` is defined for this prefix.

For each property in the configuration, you must:

1. Choose the type of the property, e.g. `String`.
2. Define the qualitied name of the property,as illustrated by the declaration of the global variable `PROP1_NAME`.
3. Define a default value for the property, as illustrated by the declaration of `DEFAULT_PROP1_VALUE`.
4. Define the property attribute, e.g. `prop1`, with the selected property type, and the assignment of the default value. In the example, the active annotation `Accessors` generates the public getter function for the attribute.
5. Define the setter function `setProp1` that is in charge of changing the value of the property.
6. Annotate the function `setProp1` with the annotation `BQConfigProperty` that contains a text to be shown up in the help page of the application.


Finally, you must define a static factory function for creating the configuration object instance from the Bootique tool of type `ConfigurationFactory`.
The code of this factory function invokes the function `config` that takes the type of the configuration to be created and the associated
property prefix. This function replies the instance of the configuration, already filled with the values read from the configuration source (file,
property, environment variable, command-line option).

<p markdown="1"><span class="label label-info">Note</span> Each of the property in a configuration is automatically mapped to a Java property with the name `bq.<fqn>`, where `<fqn>` is the fully qualified name of the property, e.g. `bq.myextension.prop1`. Therefore, it is possible to change the value of the property by specifying the property, e.g. on the command-line with `-Dbq.myextension.prop1="value"`.</p>


### 4.3. Injecting a configuration on demand

Now, it is important to define the injection of the extension's configuration.
A simple approach is to update the injection module by adding the function XXX.

```sarl
package mypackage
import com.google.inject.AbstractModule
import io.sarl.sre.services.logging.LoggingService
import io.bootique.config.ConfigurationFactory
import com.google.inject.Injector

class MyLoggingServiceModule extends AbstractModule {
	override configure {
		typeof(LoggingService).bind.to(typeof(MyLoggingService)).asEagerSingleton
	}
	@Provides
	@Singleton
	def provideConfig(configFactory : ConfigurationFactory, injector : Injector) : MyConfiguration  {
		val config = MyConfiguration::getConfiguration(configFactory)
		injector.injectMembers(config)
		return config
	}
}
```


The function `provideConfig` is added into the configuration module in order to create the configuration instance when
it should be injected.



## 5. Mapping a configuration attribute to an environment variable

As explained previously, each configuration property is automatically mapped to a Java property.
However, it may be interesting to map the configuration property to an environment variable.

Since, it is a little complicated to use the Bootique API, we propose to use the class `VariableDecls`
that provides tools for binding the bootique property to its environment variable.
The name of the environment variable is based on the name of the property, but upper-cased and by replacing
all the not alphanumeric characters by the underscore character.

The use of the class `VariableDecls` must be done into the injection module:

```sarl
package mypackage
import com.google.inject.AbstractModule
import io.sarl.sre.services.logging.LoggingService
import io.bootique.config.ConfigurationFactory
import com.google.inject.Injector
import org.arakhne.afc.bootique.variables.VariableDecls

class MyLoggingServiceModule extends AbstractModule {
	override configure {
		typeof(LoggingService).bind.to(typeof(MyLoggingService)).asEagerSingleton
		VariableDecls::extend(binder).declareVar(MyConfiguration::PROP1_NAME)
	}
	@Provides
	@Singleton
	def provideConfig(configFactory : ConfigurationFactory, injector : Injector) : MyConfiguration  {
		val config = MyConfiguration::getConfiguration(configFactory)
		injector.injectMembers(config)
		return config
	}
}
```



## 6. Mapping a configuration attribute to a command-line option

As for the environment variables, it is possible to map a configuration attribute to a command-line option.
This mapping is declared into the injection module:

```sarl
package mypackage
import com.google.inject.AbstractModule
import io.sarl.sre.services.logging.LoggingService
import io.bootique.config.ConfigurationFactory
import com.google.inject.Injector
import org.arakhne.afc.bootique.variables.VariableDecls
import io.bootique.meta.application.OptionMetadata
import static extension io.bootique.BQCoreModule.extend

class MyLoggingServiceModule extends AbstractModule {
	override configure {
		typeof(LoggingService).bind.to(typeof(MyLoggingService)).asEagerSingleton
		VariableDecls::extend(binder).declareVar(MyConfiguration::PROP1_NAME)
		binder.extend.addOption(OptionMetadata::builder("opt", "This is the option to set prop1")
				.valueRequired("value")
				.build)
				.mapConfigPath("opt", MyConfiguration::PROP1_NAME)
	}
	@Provides
	@Singleton
	def provideConfig(configFactory : ConfigurationFactory, injector : Injector) : MyConfiguration  {
		val config = MyConfiguration::getConfiguration(configFactory)
		injector.injectMembers(config)
		return config
	}
}
```


The Bootique API provides tools for declaring the command-line option, e.g. `--opt`.
In the previous example, this command-line option added with `addOption` takes a mandatory value, that is named `value` in the help pages of the application.
The function `OptionMetadata::builder` enables to create a description of the command-line option, with its name, descripton and its value description.


## 7. Legal Notice

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.12
* Status: Draft Release
* Release: 2021-02-14

> Copyright &copy; 2014-2021 [the original authors or authors](http://www.sarl.io/about/index.html).
>
> Licensed under the Apache License, Version 2.0;
> you may not use this file except in compliance with the License.
> You may obtain a copy of the [License](http://www.apache.org/licenses/LICENSE-2.0).
>
> You are free to reproduce the content of this page on copyleft websites such as Wikipedia.

<small>Generated with the translator io.sarl.maven.docs.generator 0.12.0-SNAPSHOT.</small>
