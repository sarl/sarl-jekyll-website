---
title: "Anonymous Class"
layout: default
---

# Anonymous Class


<ul class="page_outline" id="page_outline">

<li><a href="#1-declaring-anonymous-classes">1. Declaring Anonymous Classes</a></li>
<li><a href="#2-syntax-of-anonymous-classes">2. Syntax of Anonymous Classes</a></li>
<li><a href="#3-accessing-local-variables-of-the-enclosing-scope-and-declaring-and-accessing-members-of-the-anonymous-class">3. Accessing Local Variables of the Enclosing Scope, and Declaring and Accessing Members of the Anonymous Class</a></li>
<li><a href="#4-references">4. References</a></li>
<li><a href="#5-version-specification">5. Version Specification</a></li>
<li><a href="#6-legal-notice">6. Legal Notice</a></li>

</ul>


Anonymous classes enable you to make your code more concise. They enable you to declare and instantiate a
class at the same time. They are like local classes except that they do not have a name. Use them if you
need to use a local class only once.


## 1. Declaring Anonymous Classes

While local classes are class declarations, anonymous classes are expressions, which means that you define
the class in another expression.

The following example, `HelloWorldAnonymousClasses`, uses anonymous classes in the
initialization statements of the local variables `frenchGreeting` and `spanishGreeting`:

```sarl
interface HelloWorld {
    def greetSomeone(someone : String)
}
class HelloWorldAnonymousClasses {
    def sayHello {
        var frenchGreeting = new HelloWorld {
            var name = "tout le monde"
            def greetSomeone(someone : String) {
                name = someone
                println("Salut " + name)
            }
        }

        var spanishGreeting = new HelloWorld {
            var name = "mundo"
            def greetSomeone(someone : String) {
                name = someone
                println("Hola, " + name)
            }
        }
        frenchGreeting.greetSomeone("Marc")
        spanishGreeting.greetSomeone("Marco")
    }
}
```



## 2. Syntax of Anonymous Classes

As mentioned previously, an anonymous class is an expression.
The syntax of an anonymous class expression is like the invocation of a constructor,
except that there is a class definition contained in a block of code.

Consider the instantiation of the frenchGreeting object ion the code below.

The anonymous class expression consists of the following:

* The `new` operator
* The name of an interface to implement or a class to extend. In this example, the anonymous class is implementing the interface `HelloWorld`.
* Parentheses that contain the arguments to a constructor, just like a normal class instance creation expression. When you implement an interface, there is no constructor, so you do not need to put parameters, as in this example.
* A body, which is a class declaration body. More specifically, in the body, method declarations are allowed but statements are not.

Because an anonymous class definition is an expression, it must be part of a statement.
In this example, the anonymous class expression is part of the statement that instantiates
the `frenchGreeting` object.

```sarl
var frenchGreeting = new HelloWorld {
    var name = "tout le monde"
    def greetSomeone(someone : String) {
        name = someone
        println("Salut " + name)
    }
}
```



## 3. Accessing Local Variables of the Enclosing Scope, and Declaring and Accessing Members of the Anonymous Class

Anonymous classes can capture variables; they have the same access to
local variables of the enclosing scope:

* An anonymous class has access to the members of its enclosing class.
* An anonymous class cannot access local variables in its enclosing scope that are not declared as final or effectively final.
* A declaration of a type (such as a variable) in an anonymous class shadows any other declarations in the enclosing scope that have the same name.

Anonymous classes have restrictions with respect to their members:

* You cannot declare static initializers or member interfaces in an anonymous class.
* An anonymous class can have static members provided that they are constant variables.

<p markdown="1"><span class="label label-info">Note</span> You can declare the following in anonymous classes: fields, extra methods (even if they do not implement any methods of the supertype), instance initializers, local classes. However, you cannot declare constructors in an anonymous class.</p>

```sarl
class HelloWorldAnonymousClasses {
	var name : String
	def sayHello {
		var frenchGreeting = new HelloWorld {
			def greetSomeone(someone : String) {
				name = someone
				println("Salut " + name)
			}
		}
	}
}
```


## 4. References

This documentation is based on documentations from the Xtext and Xtend projects, and from the Java tutorials.
Thank you to the contributors to these documents.

* [Xtend](https://www.eclipse.org/xtend/documentation.html)
* [Xtext](https://www.eclipse.org/Xtext/documentation.html)
* [Java Tutorials](https://docs.oracle.com/javase/tutorial/)

## 5. Version Specification

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.15
* Status: Stable Release
* Release: 2025-09-11

## 6. Legal Notice

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

<small>Generated with the translator docs.generator 0.15.1.</small>
