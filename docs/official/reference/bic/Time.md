---
title: "Time Capacity"
layout: default
---

# Time Capacity


<ul class="page_outline" id="page_outline">

<li><a href="#1-get-the-current-time">1. Get the Current Time</a></li>
<li><a href="#2-convertion-from-operating-system-time-to-the-sarl-run-time-time">2. Convertion from Operating System Time to the SARL Run-time Time</a></li>
<ul>
  <li><a href="#21-get-the-factor-for-mapping-to-operating-system-time">2.1. Get the Factor for Mapping to Operating-System Time</a></li>
  <li><a href="#22-convertion-of-a-time">2.2. Convertion of a Time</a></li>
  <li><a href="#23-convertion-of-a-duration">2.3. Convertion of a Duration</a></li>
</ul>
<li><a href="#3-legal-notice">3. Legal Notice</a></li>

</ul>


The built-in capacity `Time` provides tools for obtaining the current time from the run-time platform.

Time definition is application-dependent and platform-dependent. In other words,
the time values replied by this capacity depends on the run-time environment:
it may be the operating system time, or a simulator time.





## 1. Get the Current Time

For obtaining the current time, the `getTime` function is provides by the `Time` capacity:

```sarl
def getTime(timeUnit : TimeUnit = null) : double
```



The timeUnit parameter will enable you to specify the unit of the replied
value (hours, seconds, milliseconds, etc.). If it is not provided,
the values will be expressed in seconds.

```sarl
agent A {
	uses Time
	def myaction {
		var ct = getTime
		var ct2 = getTime(null)
		var ct3 = getTime(TimeUnit::HOURS)
	}
}
```




## 2. Convertion from Operating System Time to the SARL Run-time Time

At least, there is two different time scales:

* Operating System (OS) Time: it is the time of the operating system, and accessible from objects provided by the Java virtual machine for example.
* SARL Run-time Time: it is the time that is considered by the SARL run-time environment, and accessible from the `Time` capacity.


The function `getOSTimeFactor` provides the multiplication factor between these two time scales.
The functions `toOSTime` and `fromOSTime` do the convertion of a time between these two scales.
The functions `toOSDuration` and `fromOSDuration` do the convertion of a duration between these two scales.


### 2.1. Get the Factor for Mapping to Operating-System Time

For the time replied by the `getTime` function may be not the operating-system time, e.g. a simulation time.
In order to map the time replied by the `getTime` function and the operating-system time, the
`getOSTimeFactor` function replies a factor that could be applied so that:

```sarl
operatingSystemTime = getOSTimeFactor * getTime
```


The provided function is:

```sarl
def getOSTimeFactor : double
```



### 2.2. Convertion of a Time

For converting a time, you have access to two functions:

* `toOSTime`: converts a OS time to its equivalent time into the SARL run-time environment. 
* `fromOSTime` converts a SARL run-time time to its equivalent into the OS.

```sarl
// Convertion from OS to SRE
sreTime = fromOSTime(operatingSystemTime)
// Convertion from SRE to OS
operatingSystemTime = toOSTime(sreTime)
```



### 2.3. Convertion of a Duration

For converting a duration, you have access to two functions:

* `toOSDuration`: converts a OS duration to its equivalent time into the SARL run-time environment. 
* `fromOSDuration` converts a SARL run-time duration to its equivalent into the OS.

```sarl
// Convertion from OS to SRE
sreTime = fromOSDuration(operatingSystemTime)
// Convertion from SRE to OS
operatingSystemTime = toOSDuration(sreTime)
```



## 3. Legal Notice

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.12
* Status: Draft Release
* Release: 2020-06-19

> Copyright &copy; 2014-2020 [the original authors or authors](http://www.sarl.io/about/index.html).
>
> Licensed under the Apache License, Version 2.0;
> you may not use this file except in compliance with the License.
> You may obtain a copy of the [License](http://www.apache.org/licenses/LICENSE-2.0).
>
> You are free to reproduce the content of this page on copyleft websites such as Wikipedia.

<small>Generated with the translator io.sarl.maven.docs.generator 0.12.0-SNAPSHOT.</small>