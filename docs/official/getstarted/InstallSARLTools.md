---
title: "Install SARL Tools"
layout: default
---

# Install SARL Tools


<ul class="page_outline" id="page_outline">

<li><a href="#1-step-1-install-java-development-kit-jdk-version-21">1. Step 1: Install Java Development Kit (JDK) version 21</a></li>
<li><a href="#2-step-2-download-the-sarl-product">2. Step 2: Download the SARL product</a></li>
<li><a href="#3-step-3-uncompress-the-downloaded-sarl-product">3. Step 3: Uncompress the downloaded SARL product</a></li>
<li><a href="#4-step-4-configure-the-sarl-product-for-using-the-correct-jdk">4. Step 4: Configure the SARL product for using the correct JDK</a></li>
<li><a href="#5-step-5-run-the-sarl-product">5. Step 5: Run the SARL product</a></li>
<li><a href="#6-what-s-next">6. What's next?</a></li>
<li><a href="#7-version-specification">7. Version Specification</a></li>
<li><a href="#8-legal-notice">8. Legal Notice</a></li>

</ul>


There are two straightforward methods to get SARL up and running. You can either use a pre-configured Eclipse IDE distribution, which comes with all the necessary plug-ins already installed, or you can install the SARL SDK into your existing Eclipse setup using the Eclipse update mechanism. This guide focuses on the first method for installing SARL.

## 1. Step 1: Install Java Development Kit (JDK) version 21

The SARL product requires Java 21 or higher to run. Download the Java Development Kit (JDK) from a standard provider, such as [Oracle](https://www.oracle.com/java/technologies/downloads/) or [OpenJDK](https://openjdk.org/).

## 2. Step 2: Download the SARL product

Follow the instructions on the [download page](http://www.sarl.io/download/index.html) to download the SARL tools. Select the product that matches your operating system.

> **Note for MacOS Users:** On some versions of MacOS, downloading the SARL product through a web browser may corrupt the file, making it impossible to run. In such cases, we recommend using a command-line tool like [wget](https://www.gnu.org/software/wget/) to download the SARL product.

## 3. Step 3: Uncompress the downloaded SARL product

After downloading, you need to uncompress the SARL product to access the executable files. This step is mandatory.

## 4. Step 4: Configure the SARL product for using the correct JDK

Since SARL requires Java to run and multiple Java environments might be installed on your system, it's best to specify the correct JDK for the SARL tools.

**Assumptions:**
1. Your JDK is installed in a folder with the path `/path/to/jdk`. This folder should contain a `bin` subfolder with the `java` and `javac` tools.
2. The SARL product is uncompressed in the folder `/path/to/sarl`.

**Steps to Configure the JDK:**

1. Open the file `/path/to/sarl/sarlide.ini` in a text editor, such as Notepad.
2. Locate the line containing `-vm`. If you can't find this line, proceed to step 6. Otherwise, continue to step 3.
3. The line following `-vm` should contain a path to the JDK folder.
4. Replace the existing path with `/path/to/jdk/bin`. Ensure the path ends with `bin`.
5. Skip to step 8.
6. At the end of the file, add the line `-vm` without any additional text on this line.
7. Directly after the `-vm` line, add a new line with the path to your JDK: `/path/to/jdk/bin`. Ensure the path ends with `bin`.
8. Save the changes to the `sarlide.ini` file.

## 5. Step 5: Run the SARL product

You can now launch the SARL development environment by executing the binary file located in the `/path/to/sarl` folder. The binary file is named `sarlide`. Specific launching scripts may be provided for your operating system, such as Linux Ubuntu or Arch Linux.

## 6. What's next?

In the next section, we will learn how to create a SARL project.

[Next>](./CreateFirstProject.html)

## 7. Version Specification

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.15
* Status: Stable Release
* Release: 2025-09-10

## 8. Legal Notice

> Copyright &copy; 2014-2025 [SARL.io, the Original Authors and Main Authors](http://www.sarl.io/about/index.html).
>
> Documentation text and medias are licensed under the Creative Common CC-BY-SA-4.0;
> you may not use this file except in compliance with CC-BY-SA-4.0.
> You may obtain a copy of [CC-BY-4.0](https://creativecommons.org/licenses/by-sa/4.0/deed.en).
>
> Examples of SARL code are licensed under the Apache License, Version 2.0;
> you may not use this file except in compliance with the Apache License.
> You may obtain a copy of the [Apache License](http://www.apache.org/licenses/LICENSE-2.0).
>
> You are free to reproduce the content of this page on copyleft websites such as Wikipedia.

<small>Generated with the translator docs.generator 0.15.0.</small>
