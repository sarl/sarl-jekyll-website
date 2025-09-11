---
title: "Logging Capacity"
layout: default
---

# Logging Capacity


<ul class="page_outline" id="page_outline">

<li><a href="#1-print-an-error-or-a-warning-message">1. Print an error or a warning message</a></li>
<li><a href="#2-print-an-information-message">2. Print an information message</a></li>
<li><a href="#3-print-a-debugging-message">3. Print a debugging message</a></li>
<li><a href="#4-retrieve-and-change-the-logging-level">4. Retrieve and change the logging level</a></li>
<li><a href="#5-testing-the-logging-level">5. Testing the logging level</a></li>
<li><a href="#6-change-the-name-of-the-logger">6. Change the name of the logger</a></li>
<li><a href="#7-accessing-to-the-backend-logger">7. Accessing to the backend logger</a></li>
<li><a href="#8-version-specification">8. Version Specification</a></li>
<li><a href="#9-legal-notice">9. Legal Notice</a></li>

</ul>


The built-in capacity `Logging` provides tools for printing messages in the log associated to the agent.





## 1. Print an error or a warning message

For printing an error or a warning message, the two following functions
are provided:

```sarl
def error(message : Object, exception : Throwable = null, arguments : Object*)
def warning(message : Object, exception : Throwable = null, arguments : Object*)
```



The `message` parameter is converted to a string for obtaining the message to output.
The message is built from the parsing of the message in which parameter constants aree replaced by the `arguments`.
The `exception` parameter may be given for printing an exception that is the cause of the logging action.

Examples:
```sarl
agent A {
	uses Logging
	def myaction {
		error("mymessage")
		error("mymessage", new Exception)
		warning("mymessage")
		warning("mymessage", new Exception)
	}
}
```



You could also give a text supplier, in the form of a lambda expression, to these logging functions in order to build the loggeable message dynamically.

```sarl
agent A {
	uses Logging
	def myaction {
		error [ "mymessage" ]
		warning [ "mymessage" ]
	}
}
```



## 2. Print an information message

For printing an information message, the following function is provided:

```sarl
def info(message : Object, arguments : Object*)
```



The `message` parameter is converted to a string for obtaining the message to output.
The message is built from the parsing of the message in which parameter constants aree replaced by the `arguments`.

Example:
```sarl
agent A {
	uses Logging
	def myaction {
		info("mymessage")
	}
}
```



You could also give a text supplier, in the form of a lambda expression, to the logging function in order to build the loggeable message dynamically.

```sarl
agent A {
	uses Logging
	def myaction {
		info [ "mymessage" ]
	}
}
```



## 3. Print a debugging message

For printing a debugging message, the following function is provided:

```sarl
def debug(message : Object, arguments : Object*)
```



The `message` parameter is converted to a string for obtaining the message to output.
The message is built from the parsing of the message in which parameter constants aree replaced by the `arguments`.

Example:
```sarl
agent A {
	uses Logging
	def myaction {
		debug("mymessage")
	}
}
```



You could also give a text supplier, in the form of a lambda expression, to the logging function in order to build the loggeable message dynamically.

```sarl
agent A {
	uses Logging
	def myaction {
		debug [ "mymessage" ]
	}
}
```



## 4. Retrieve and change the logging level

The printable messages are associated to a level of logging (error, warning, info, debug).
If a message is given to the logging system, and the current output level is lower
than the message's level, then the message is not output.

For retrieving the current logging level, the following function is provided:

```sarl
def getLogLevel : int
```



The replied value is 0 when no message is printed, 1 if only error messages are printed, 2 for error and warning messages, etc.

For changing the current logging level, the following function is provided:

```sarl
def setLogLevel(level : int)
```


Example:
```sarl
agent A {
	uses Logging
	def myaction {
		var l = getLogLevel
		setLogLevel( l + 1 )
	}
}
```



## 5. Testing the logging level

The following functions permits testing if a specific logging level is enabled:

```sarl
def isErrorLogEnabled : boolean
def isWarningLogEnabled : boolean
def isInfoLogEnabled : boolean
def isDebugLogEnabled : boolean
```



Example:
```sarl
agent A {
	uses Logging
	def myaction : boolean {
		   isErrorLogEnabled
		|| isWarningLogEnabled
		|| isInfoLogEnabled
		|| isDebugLogEnabled
	}
}
```



## 6. Change the name of the logger

By default, the logging message contains the identifier of the agent associated to the `Logging` capacity.

Sometimes, it is helpful to change the printed name of the agent.
The following function gives the opportunity to change this name.

```sarl
def setLoggingName(name : String)
```


Example:
```sarl
agent A {
	uses Logging
	def myaction {
		setLoggingName("the name of the agent")
	}
}
```



## 7. Accessing to the backend logger

The `Logging` capacity is based on the logging system of run-time virtual machine.
The `getLogger` function provides you the access to the backend logger that is associated to the agent. 

```sarl
def getLogger : Logger
```



## 8. Version Specification

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.15
* Status: Stable Release
* Release: 2025-09-11

## 9. Legal Notice

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
