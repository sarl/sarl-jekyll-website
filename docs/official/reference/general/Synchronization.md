---
title: "Synchronization Expression"
layout: default
---

# Synchronization Expression

The synchonization expression does the same as it does in Java (see
[Java Language Specification](http://docs.oracle.com/javase/specs/jls/se7/html/jls-14.html#jls-14.19)).
The only difference is that in SARL it is an expression and can therefore be used at more places. 

### 0.1. Why Synchronization?

Let's consider a typical race condition where we calculate the sum, and multiple event handlers (i.e. threads) execute the
`calculate` function:

```sarl
class Example {
    var sum = 0
	def getSum : int {
		this.sum
	}
	def setSum(v : int) {
		this.sum = v
	}
	def calculate : void {
        setSum(getSum + 1)
	}
}
```



Since the `calculate` function may be executed in parallel, a multi-threading issues for accessing to the `sum` may occur.

Let the calling of `1000` times the `calculate` function. If we would execute this serially, the expected output would be `1000`,
but our multi-threaded execution fails almost every time with an inconsistent actual output e.g.: `965`. This result is of course
not unexpected.

A simple way to avoid the race condition is to make the operation thread-safe by using the `synchronized` keyword.


## 1. The Synchronized Keyword

The `synchronized` keyword can be used on different levels:

* Instance methods
* Static methods
* Code blocks

When we use a `synchronized` block, internally SARL uses a monitor also known as monitor lock or intrinsic lock, to provide synchronization.
These monitors are bound to an object, thus all synchronized blocks of the same object can have only one thread executing them
at the same time.


### 1.1. Synchronized Instance Methods

Simply add the `synchronized` keyword in the method declaration to make the method synchronized:

```sarl
synchronized def synchronizedCalculate : void {
    setSum(getSum + 1)
}
```



Instance methods are synchronized over the instance of the type owning the method. Which means only one thread per
instance of the type can execute this method.


### 1.2. Synchronized Static Methods

Static methods are synchronized just like instance methods:

```sarl
static var staticSum : int
synchronized static def synchronizedCalculate : void {
    staticSum = staticSum + 1
}
```



These methods are synchronized on the `Class` object associated with the type and since only one `Class` object exists per
virtual machine per type, only one thread can execute inside a static synchronized method per type, irrespective of the number
of instances it has.


### 1.3. Synchronized Blocks Within Blocks

#### Standard Syntax

Sometimes we do not want to synchronize the entire method but only some instructions within it.
This can be achieved by applying `synchronized` to a block:

```sarl
synchronized def synchronizedCalculate : void {
	synchronized (this) {
	    setSum(getSum + 1)
	}
}
```



Notice that we passed a parameter `this` to the synchronized block. This is the monitor object, the code inside the
block gets synchronized on the monitor object. Simply put, only one thread per monitor object can execute inside that
block of code.

```sarl
var lock = new Object
synchronized def synchronizedCalculate : void {
	synchronized (lock) {
	    setSum(getSum + 1)
	}
}
```



In case the method is static, we would pass the class name in place of the object reference. And the class would be a
monitor for synchronization of the block:

```sarl
class Example {
	static var staticSum : int
	static def synchronizedCalculate : void {
		synchronized (typeof(Example)) {
		    staticSum = staticSum + 1
		}
	}
}
```



#### Expression Syntax

Because the `synchronized` keyword is an expression, it is possible to write synchronized code inside another expression.

```sarl
var lock = new Object
synchronized def synchronizedCalculate {
	var newValue = synchronized (lock) {
	    this.sum++
	}
}
```



### 1.4. Reentrancy of the Locks

The lock behind the synchronized methods and blocks is reentrant. That is, the current thread can acquire the same
synchronized lock over and over again while holding it:

```sarl
val lock = new Object
def synchronizedCalculate : void {
	synchronized (lock) {
	    println("First time acquiring it");
	 
	    synchronized (lock) {
	        println("Entering again");
	 
	         synchronized (lock) {
	             println("And again");
	         }
	    }
	}
}
```



As shown above, while we're in a synchronized block, we can acquire the same monitor lock repeatedly.



## 2. Synchronization of Fields

In a multi-threaded environment, a race condition occurs when two or more threads attempt to update mutable shared data
at the same time. SARL offers a mechanism to avoid race conditions by synchronizing thread access to shared data: a piece
of logic marked with `synchronized` becomes a synchronized block, allowing only one thread to execute at any given time.

Synchronizing on a field (within an agent, a behavior, or a skill) synchronizes not on the field itself, but on the object
assigned to it.
So synchronizing on a non-final field makes it possible for the field's value to change while a thread is in a block
synchronized on the old value. That would allow a second thread, synchronized on the new value, to enter the block at
the same time.

The story is very similar for synchronizing on parameters; two different threads running the method in parallel could
pass two different object instances in to the method as parameters, completely undermining the synchronization.

### 2.1. Noncompliant Code Example

The following example shows a noncompliant usage of a lock.
When running the `synchronized` block, the lock is on object instance `"red"` referred to by the `color` variable.
When this variable is changed to `"green"`, other threads are allowed to enter into the synchronized block.
That may not be the expected behavior.

```sarl
var color = "red"

def doSomething : void {
	synchronized (color) {
		// ...
		color = "green"
		// ...
	}
}
```



Another noncompliant usage of the synchronized blocks is:

```sarl
def doSomething : void {
	synchronized (new Object()) {
		// ...
	}
}
```



In this case, a new lock object is created each time the synchronized block is reached. It means that the lock object is not
shared by the different threads. Consequently, there is no synchronization between the threads.


### 2.2. Compliant Code Example

The following code shows a compliant usage of the lock object in order to avoid the issues that are explained in the previous section.
It it a better practice to create the lock object, named `lockObj`, in order to be shared by the different threads.
The best place is to put it as a field of the enclosing type (as illustrated below). 

```sarl
var color = "red"
val lockObj = new Object

def doSomething : void {
	synchronized (lockObj) {
		//...
		color = "green"
		// ...
	}
}
```




## 3. Acknowledgements

This documentation is inspired by the documentations from the
[Xtext](https://www.eclipse.org/Xtext/documentation.html) and
[Xtend](https://www.eclipse.org/xtend/documentation.html) projects.

## 4. Legal Notice

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.12
* Status: Draft Release
* Release: 2020-12-31

> Copyright &copy; 2014-2020 [the original authors or authors](http://www.sarl.io/about/index.html).
>
> Licensed under the Apache License, Version 2.0;
> you may not use this file except in compliance with the License.
> You may obtain a copy of the [License](http://www.apache.org/licenses/LICENSE-2.0).
>
> You are free to reproduce the content of this page on copyleft websites such as Wikipedia.

<small>Generated with the translator io.sarl.maven.docs.generator 0.12.0-SNAPSHOT.</small>
