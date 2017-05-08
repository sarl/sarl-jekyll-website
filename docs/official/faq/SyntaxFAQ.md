---
title: "FAQ on the SARL language Syntax"
layout: default
---

# FAQ on the SARL language Syntax


<ul class="page_outline" id="page_outline">

<li><a href="#1-general-syntax">1. General Syntax</a></li>
<ul>
  <li><a href="#1-1-can-i-use-the-same-syntax-as-in-java-for-number-literals">1.1. Can I use the same syntax as in Java for number literals?</a></li>
  <li><a href="#1-2-why-can-i-not-put-a-string-in-the-package-name">1.2. Why can I not put a string in the package name?</a></li>
  <li><a href="#1-3-is-the-val-keyword-defining-a-constant">1.3. Is the 'val' keyword defining a constant?</a></li>
  <li><a href="#1-4-why-cannot-use-the-syntax-a-0-for-arrays">1.4. Why cannot use the syntax 'a[0]' for arrays?</a></li>
  <li><a href="#1-5-why-can-i-not-use-the-notation-for-generic-parameters">1.5. Why can I not use the '<>' notation for generic parameters?</a></li>
  <li><a href="#1-6-how-can-i-create-instances-of-anonymous-classes">1.6. How can I create instances of anonymous classes?</a></li>
  <li><a href="#1-7-java-syntax-for-anonymous-classes-is-allowed">1.7. Java syntax for anonymous classes is allowed</a></li>
  <li><a href="#1-8-ambiguous-call-to-capacity-function">1.8. Ambiguous call to capacity function</a></li>
</ul>
<li><a href="#2-legal-notice">2. Legal Notice</a></li>

</ul>


##1. General Syntax

###1.1. Can I use the same syntax as in Java for number literals?

__No__.

When a decimal point is written in the literal,
the fractional part and the mantissa part must
be specify also, even if these parts are equal
to zero.  Consequently:

* `123.0` is correct;
* `0.123` is incorrect;
* `123.` is correct;
* `.123` is incorrect.

```sarl
	
```

```sarl
	
```

```sarl
	
```

```sarl
	
```



###1.2. Why can I not put a string in the package name?

It is not allowed to put a SARL keyword, such as
`agent`, in the name of a package.

But, if you prefix with the `^` character the string
that corresponds to a keyword, then it is possible
to obtain a package name with one of its components
equals to a SARL keyword:

```sarl
	
```



###1.3. Is the 'val' keyword defining a constant?

__Yes and No__.

Indeed, the `val` keyword defines a name that it could be initialized only once time.
It is similar to the `final` modifier of the Java language.

Consider the example below: two values are defined, `a` and `b`.
The `a` variable is a real constant because it has a raw type and it is initialized.
The `b` variable is not a real constant because it is a reference to an object.
The reference is constant, *but* the referred object is not. Consequently, it is still
possible to call the setters of `b`. 

```sarl
	val a : int = 4
	val b : Object = new Object
```



###1.4. Why cannot use the syntax 'a[0]' for arrays?

In SARL, the array type may be written with the classic array syntax, such as
`int[]`, or the object-oriented syntax, such as `List<Integer>`.

SARL considers that the each array is a list of something.
Consequently, retrieving the values of the array must be done with `get(int)`.

```sarl
	var a : Integer[] = #[1, 2, 3]
	var b : List<Integer> = newArrayList(1, 2, 3)
	
	a.get(0) == b.get(0)
```



###1.5. Why can I not use the '<>' notation for generic parameters?

In SARL, the empty generic parameter list, written `<>` is
not supported: a generic type expression must be written between them.

```sarl
	
```


For solving this problem, two choices: i) add a type expression between
< and >; ii) remove the generic parameter list.

```sarl
	var firstSolution : List<Integer> = new ArrayList<Integer>
	var secondSolution : List<Integer> = new ArrayList
```



###1.6. How can I create instances of anonymous classes?

In SARL, the creation of anonymous classes (interface implementation...)
must be done with a closure.

Consider the definition of the following interface:

```sarl
	interface MyInterface {
	     def myfunction(parameter : Object) : void
	}
```


The on-the-fly definition and instantiation of an instance of this interface,
a.k.a. anonymous class definition in the Java community, could be written is SARL
with the following closure:

```sarl
	var instance : MyInterface
	instance = [ parameter | /* The code of myfunction() */ ]
```



###1.7. Java syntax for anonymous classes is allowed

In SARL, it is recommended tp create anonymous classes (interface implementation...)
must be done with a closure (see previous question).

The Java-based syntax for defining an anonymous class's instance is allowed, but not recommended
in the SARL language. It means that the following code is valid:

```sarl
	var instance = new MyInterface() {
		def myfunction(parameter : Object) {
			/* The code of myfunction() */
		}
	}
```



###1.8. Ambiguous call to capacity function

When the calling a capacity function, the SARL compiler complains with an "ambiguous call" error.
In the code below, the function `myfunction` is defined in the capacities `C1` and `C2`.
The call to `myfunction` in the agent definition is the place where the error occurs.

```sarl
	capacity C1 {
		def myfunction
		def myfunction2
	}
	capacity C2 {
		def myfunction
		def myfunction3
	}
	agent MyAgent {
		uses C1, C2
		on Initialize {
		    myfunction
		    myfunction2
		    myfunction3
		}
	}
```


This error is standard because the functions of the capacities `C1` and `C2` are implicitly accessible
in the scope of the agent definition, see `uses` keyword definition. The SARL compiler is then unable
to determine that is the function to call.


For solving this issue, the developer must explicitly call the correct version of `myfunction` by
getting the capacity. The following code is the correct call to the function if the function in the
capacity `C1` should be called:

```sarl
	getSkill(C1).myfunction
```



##2. Legal Notice

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.6
* Status: Draft Release
* Release: 2017-04-21

> Copyright &copy; 2014-2017 [the original authors or authors](http://www.sarl.io/about/index.html).
>
> Licensed under the Apache License, Version 2.0;
> you may not use this file except in compliance with the License.
> You may obtain a copy of the [License](http://www.apache.org/licenses/LICENSE-2.0).
>
> You are free to reproduce the content of this page on copyleft websites such as Wikipedia.

<small>Generated with the translator io.sarl.maven.docs.generator 0.6.0-SNAPSHOT.</small>