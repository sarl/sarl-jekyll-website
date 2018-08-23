---
title: "Script Format"
layout: default
---

# Script Format


<ul class="page_outline" id="page_outline">

<li><a href="#1-package-declaration">1. Package Declaration</a></li>
<li><a href="#2-import-directive">2. Import Directive</a></li>
<li><a href="#3-static-import-directive">3. Static Import Directive</a></li>
<li><a href="#4-top-level-features">4. Top-Level Features</a></li>
<li><a href="#5-acknowledgements">5. Acknowledgements</a></li>
<li><a href="#6-legal-notice">6. Legal Notice</a></li>

</ul>


A script is a text file containing SARL code. Each script must follow the format:

	<package declaration>
	<imports>
	<top-level features>


##1. Package Declaration

To structure your software, it is common to put scripts in different packages (as Java does for the classes).

The keyword `package` permits you to define the name of the package associated with a
SARL file. Consequently, all the features defined in the script are contained in this package,
and their names are qualified with the name of the package.

The package's name also affects the generation of the Java files implementing the SARL script. Indeed,
all the Java files are generated in a folder with the name of the package.

In the following example, the qualified name of an agent defined in the file is `io.sarl.docs.reference.gsr`.

```sarl
package io.sarl.docs.reference.gsr
```


<note> If the `package` keyword is not used, the default package will be used. The default
package has an empty name. It is recommended in the SARL Best Practices to specify a package's
name.</note> 


##2. Import Directive

The _imports_ section of a SARL script is dedicated to declaring imported classes.
Each time you want to use a feature defined in another package, (a different file)
you include it with the `import` directive.

<note>This directive works in a similar way as in the Java language.</note>

The `import` keyword is followed by the qualified name of the feature to import.
In the following code, the first directive imports `java.util.List`.

Optionally, you can import all the features defined by a package.
This can be done by replacing the name of the feature by the
wildcard character `*`. The second import directive is an example of the inclusion of
all the classes defined in `java.net`.

```sarl
import java.util.List
import java.net.*
```



##3. Static Import Directive

Sometimes, it is necessary to import a class to access its statically defined functions,
i.e., a function that can be called without any associated object's instance.

To do this, you may invoke the static function with the fully qualified name of the
class. For example, the function `max` is invoked with this syntax in the example below.

```sarl
import java.util.Collections
//...

		var col : Collection<Integer>
		Collections::max(col)
```



As an alternative, the static-import mechanism permits you to reference the function directly.
A static import is specified with the `static` keyword just after the `import` keyword.
The following identifier must be a fully qualified name of one or more functions (with the
wildcard character).

In the example below, all the functions defined in `java.util.Collections` are imported.
Following this import, it is possible to invoke a static function with its unqualified
name, as the call to `max` below.

```sarl
import static java.util.Collections.*
//...

		var col : Collection<Integer>
		max(col)
```



##4. Top-Level Features

Most of a SARL script consists of the definitions of top-level features. These features are the
core concepts of SARL, such as `agent`, `event`, or `capacity`.
All these top-level features are documented in their own reference documents.

```sarl
package io.sarl.docs.reference.gsr
agent MyAgent {
}

event MyEvent

capacity MyCapacity {
}
```



Additionally, it is possible to write object-oriented statements with
the SARL syntax for `class`, `interface`, `enum`, and `annotation`.
The inclusion of these object-oriented statements will help you to write your
application with a single language: SARL. The object-oriented programmation support
is described in the [reference documentation](../OOP.html).

```sarl
package io.sarl.docs.reference.gsr

class MyClass {
}

interface MyInterface {
}

enum MyEnum {
	CONSTANT
}

annotation MyAnnotation {
}
```




##5. Acknowledgements

This documentation is inspired by the documentations from the
[Xtext](https://www.eclipse.org/Xtext/documentation.html) and
[Xtend](https://www.eclipse.org/xtend/documentation.html) projects.

##6. Legal Notice

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.8
* Status: Draft Release
* Release: 2018-08-19

> Copyright &copy; 2014-2018 [the original authors or authors](http://www.sarl.io/about/index.html).
>
> Licensed under the Apache License, Version 2.0;
> you may not use this file except in compliance with the License.
> You may obtain a copy of the [License](http://www.apache.org/licenses/LICENSE-2.0).
>
> You are free to reproduce the content of this page on copyleft websites such as Wikipedia.

<small>Generated with the translator io.sarl.maven.docs.generator 0.8.0-SNAPSHOT.</small>