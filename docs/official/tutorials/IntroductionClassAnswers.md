---
title: "Introduction to Object-Oriented Classes with SARL - Answers"
layout: default
---

# Introduction to Object-Oriented Classes with SARL - Answers


<ul class="page_outline" id="page_outline">

<li><a href="#1-exercise-1">1. Exercise 1</a></li>
<li><a href="#2-exercise-2">2. Exercise 2</a></li>
<li><a href="#3-exercise-3">3. Exercise 3</a></li>
<li><a href="#4-exercise-4">4. Exercise 4</a></li>
<li><a href="#5-exercise-5">5. Exercise 5</a></li>
<li><a href="#6-exercise-6">6. Exercise 6</a></li>
<li><a href="#7-exercise-7">7. Exercise 7</a></li>
<li><a href="#8-exercise-8">8. Exercise 8</a></li>
<li><a href="#9-exercise-9">9. Exercise 9</a></li>
<li><a href="#10-exercise-10">10. Exercise 10</a></li>
<li><a href="#11-exercise-11">11. Exercise 11</a></li>
<li><a href="#12-exercise-12">12. Exercise 12</a></li>
<li><a href="#13-legal-notice">13. Legal Notice</a></li>

</ul>


## 1. Exercise 1

```sarl
class MyClass {
}
class Solution {
	def main(args : String*) {
		println(typeof(MyClass).^package.name)
	}
}
```


## 2. Exercise 2

```sarl
class MyClass {
}
class Solution {
	def main(args : String*) {
		var obj = new MyClass
		println(obj.class.^package.name)
	}
}
```


## 3. Exercise 3

```sarl
import static java.lang.Math.abs
class Solution {
	def main(args : String*) {
		println(abs(-155))
	}
}
```


## 4. Exercise 4

```sarl
class Student {
	var age : int
	var name : String
	def getAge : int {
		this.age
	}
	def setAgent(age : int) {
		this.age = age
	}
	def getName : String {
		this.name
	}
	def setName(name : String) {
		this.name = name
	}
}
```



## 5. Exercise 5

```sarl
import org.eclipse.xtend.lib.annotations.Accessors
class Student {
	@Accessors
	var age : int
	@Accessors
	var name : String
}
```


## 6. Exercise 6

```sarl
class Student {
}
class Mark {
}
class Solution {
	def main(args : String*) {
		var a = new Student
		var b = new Mark
		println("a is Student class = " + (a instanceof Student))
		println("a is Mark class = " + (a instanceof Mark))
		println("a is Object class = " + (a instanceof Object))
		println("b is Student class = " + (b instanceof Student))
		println("b is Mark class = " + (b instanceof Mark))
		println("b is Object class = " + (b instanceof Object))
	}
}
```


## 7. Exercise 7

```sarl
import org.eclipse.xtend.lib.annotations.Accessors
class Student {
	@Accessors
	var age : int
	@Accessors
	var name : String
}
class Solution {
	def main(args : String*) {
		var student1 = new Student
		student1.setAge(15)
		student1.setName("First name")
		var student2 = new Student
		student2.age = 18
		student2.name = "Second name"
		
		println("Student1 age = " + student1.getAge)
		println("Student1 name = " + student1.getName)
		println("Student2 age = " + student2.age)
		println("Student2 name = " + student2.name)
	}
}
```


## 8. Exercise 8

```sarl
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
class Student {
	@Accessors
	var age : int
	@Accessors
	var name : String
	@Accessors
	val marks : List<Float> = newArrayList
}
class Main {
	def main(args : String*) {
		var s = new Student
		println(s.means)
	}
	def means(student : Student) : float {
		var mean = 0f
		if (!student.marks.empty) {
			for (mark : student.marks) {
				mean += mark
			}
			mean /= student.marks.size
		}
		return mean
	}
}
```


## 9. Exercise 9

```sarl
class IntRomanConverter {
	static val coefs = #[1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1 ]
	static val symbols = #[ "M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I" ]
	
	static def convert(num : int) : String {
		var acc = num
		var roman = ""
		var i = 0
		while  (acc > 0) {
			for (x : 0..<(acc / coefs.get(i))) {
				roman += symbols.get(i)
				acc -= coefs.get(i)
			}
			i++
		}
		return roman
	}
}
class Main {
	def main(args : String*) {
		println(IntRomanConverter::convert(1))
		println(IntRomanConverter::convert(1994))
	}
}
```


## 10. Exercise 10

```sarl
class RomanIntConverter {
	static val coefs = #{'I' -> 1, 'V' -> 5, 'X' -> 10, 'L' -> 50, 'C' -> 100, 'D' -> 500, 'M' -> 1000}
	
	static def convert(roman : String) : int {
		var num = 0
		for (i : 0..<roman.length) {
			if (i > 0 && coefs.get(roman.charAt(i)) > coefs.get(roman.charAt(i - 1))) {
				num += coefs.get(roman.charAt(i)) - 2 * coefs.get(roman.charAt(i - 1))
			} else {
				num += coefs.get(roman.charAt(i))
			}
		}
   		return num
  		}
}
class Main {
	def main(args : String*) {
		println(RomanIntConverter::convert("I"))
		println(RomanIntConverter::convert("MCMXCIV"))
	}
}
```


## 11. Exercise 11

```sarl
import org.eclipse.xtend.lib.annotations.Accessors
class Vector {
	@Accessors
	var x : double
	@Accessors
	var y : double
	new (x : double, y : double) {
		this.x = x
		this.y = y
	}
	new {
		x = 0
		y = 0
	}
	
	def add(v : Vector) : Vector {
		new Vector(this.x + v.x, this.y + v.y)
	}
	def toString : String {
		"(x=" + x + ", y=" + y + ")"
	}
}
class Main {
	def main(args : String*) {
		var a = new Vector(124, 45)
		var b = new Vector(-456, 78)
		var c = a.add(b)
		println(c)
		var d = b.add(a)
		println(d)
	}
}
```


## 12. Exercise 12

```sarl
import org.eclipse.xtend.lib.annotations.Accessors
class Vector {
	@Accessors
	var x : double
	@Accessors
	var y : double
	new (x : double, y : double) {
		this.x = x
		this.y = y
	}
	new {
		x = 0
		y = 0
	}
	
	def operator_plus(v : Vector) : Vector {
		new Vector(this.x + v.x, this.y + v.y)
	}
	def toString : String {
		"(x=" + x + ", y=" + y + ")"
	}
}
class Main {
	def main(args : String*) {
		var a = new Vector(124, 45)
		var b = new Vector(-456, 78)
		var c = a + b
		println(c)
		var d = b + a
		println(d)
	}
}
```




## 13. Legal Notice

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.14
* Status: Draft Release
* Release: 2023-09-26

> Copyright &copy; 2014-2023 [SARL.io, the Original Authors and Main Authors](https://www.sarl.io/about/index.html).
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

<small>Generated with the translator docs.generator 0.14.0-SNAPSHOT.</small>
