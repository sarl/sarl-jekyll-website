---
title: "Maven Plugin for the SARL Compiler"
layout: default
---

# Maven Plugin for the SARL Compiler


<ul class="page_outline" id="page_outline">

<li><a href="#1-usage">1. Usage</a></li>
<li><a href="#2-configuration">2. Configuration</a></li>
<li><a href="#3-legal-notice">3. Legal Notice</a></li>

</ul>






[Apache Maven](http://maven.apache.org) is a build automation tool used primarily for Java projects.

Maven addresses two aspects of building software: first, it describes how software is built, 
and second, it describes its dependencies.
Unlike earlier tools like [Apache Ant](https://en.wikipedia.org/wiki/Apache_Ant), it uses conventions
for the build procedure, and only exceptions need to be written down.
An XML file describes the software project being built, its dependencies on other external modules
and components, the build order, directories, and required plug-ins. It comes with pre-defined
targets for performing certain well-defined tasks such as compilation of code and its packaging.

In order to compile SARL code within a Maven-based project, a compilation plug-in is provided, named
`sarl-maven-plugin`.
 
##1. Usage

Open the file `pom.xml` of your project, and edit it for obtaining a content similar to the
configuration below.

Replace the version number `0.10.0` of SARL with the one you want to use. You could search on the
[Maven Central Repository](http://search.maven.org/) for the last available version.


```xml
 <project>
    ...
    <properties>
       ...
       <sarl.version>0.10.0</sarl.version>
       <jdk.version>1.8</jdk.version>
       <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
    </properties>
    ...
    <build>
       <plugins>
          ...
          <plugin>
             <groupId>io.sarl.maven</groupId>
             <artifactId>sarl-maven-plugin</artifactId>
             <version>${sarl.version}</version>
             <extensions>true</extensions>
             <configuration>
                <source>${jdk.version}</source>
                <target>${jdk.version}</target>
                <encoding>${project.build.sourceEncoding}</encoding>
             </configuration>
          </plugin>
		  <plugin>
			<groupId>org.apache.maven.plugins</groupId>
			<artifactId>maven-compiler-plugin</artifactId>
			<version>3.8.1</version>
			<configuration>
				<source>${jdk.version}</source>
				<target>${jdk.version}</target>
				<encoding>${project.build.sourceEncoding}</encoding>
			</configuration>
		  </plugin>
       </plugins>
    </build>
    ...
    <dependencies>
      ...
       <dependency>
          <groupId>io.sarl.maven</groupId>
          <artifactId>io.sarl.maven.sdk</artifactId>
          <version>${sarl.version}</version>
       </dependency>
       ...
    </dependencies>
    ...
 </project>
```


##2. Configuration

The configuration section may contains the following elements.

| Property | Maven Goal | Property Type | Description | Default Value |
| -------- | ---------- | ------------- | ----------- | ------------- |




##3. Legal Notice

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.10
* Status: Stable Release
* Release: 2019-10-26

> Copyright &copy; 2014-2019 [the original authors or authors](http://www.sarl.io/about/index.html).
>
> Licensed under the Apache License, Version 2.0;
> you may not use this file except in compliance with the License.
> You may obtain a copy of the [License](http://www.apache.org/licenses/LICENSE-2.0).
>
> You are free to reproduce the content of this page on copyleft websites such as Wikipedia.

<small>Generated with the translator io.sarl.maven.docs.generator 0.10.0.</small>