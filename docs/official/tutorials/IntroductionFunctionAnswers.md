---
title: "Introduction to Functions with SARL - Answers"
layout: default
---

# Introduction to Functions with SARL - Answers


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
<li><a href="#13-exercise-13">13. Exercise 13</a></li>
<li><a href="#14-exercise-14">14. Exercise 14</a></li>
<li><a href="#15-exercise-15">15. Exercise 15</a></li>
<li><a href="#16-legal-notice">16. Legal Notice</a></li>

</ul>


## 1. Exercise 1

```sarl
class Solution {
	static def max(a : double, b : double, c : double) {
		if (a > b && a > c) {
			return a
		}
		if (b > c) {
			return b
		}
		return c
	}
}
```


## 2. Exercise 2

```sarl
import java.util.List
class Solution {
	static def sum(list : List<Double>) : double {
		var sum = 0.0
		for (num : list) {
			sum += num
		}
		return sum
	}
}
```


## 3. Exercise 3

```sarl
import java.util.List
class Solution {
	static def mul(list : List<Double>) : double {
		var mul = 0.0
		for (num : list) {
			mul *= num
		}
		return mul
	}
}
```


## 4. Exercise 4

```sarl
class Solution {
	static def reverse(value : String) : String {
		var rev = new StringBuilder
		for (c : value.toCharArray) {
			rev.insert(0, c)
		}
		return rev.toString
	}
}
```


## 5. Exercise 5

```sarl
class Solution {
	static def fact(n : int) : int {
		if (n > 0) {
			return fact(n - 1) * n
		}
		return 1
	}
}
```


## 6. Exercise 6

```sarl
class Solution1 {
	static def inRange(n : int, start : int, end : int) : boolean {
		start <= n && n <= end
	}
}
class Solution2 {
	static def inRange(n : int, start : int, end : int) : boolean {
		(start .. end).contains(n)
	}
}
```


## 7. Exercise 7

```sarl
import static extension java.lang.Character.*
class Solution {
	static def caseCount(value : String) : void {
		var lcount = 0
		var ucount = 0
		for (c : value.toCharArray) {
			if (c.isUpperCase) {
				ucount++
			} else if (c.isLowerCase) {
				lcount++
			}
		}
		println("No. of Upper case characters : " + ucount)
		println("No. of Lower case Characters : " + lcount)
	}
}
```


## 8. Exercise 8

```sarl
import java.util.List
class Solution1 {
	static def disctinct(list : List<Integer>) : List<Integer> {
		var uniq = newArrayList
		for (c : list) {
			if (!uniq.contains(c)) {
				uniq += c
			}
		}
		return uniq
	}
}
class Solution2 {
	static def disctinct(list : List<Integer>) : List<Integer> {
		var uniq = newTreeSet(null)
		uniq.addAll(list)
		return newArrayList(uniq)
	}
}
```


## 9. Exercise 9

```sarl
class Solution {
	static def isPrime(n : int) : boolean {
		if (n == 1) {
			return false
		} else if (n == 2) {
			return true
		}
		for (x : 2..<n) {
			if (n % x == 0) {
				return false
			}
		}
		return true
	}
}
```


## 10. Exercise 10

```sarl
import java.util.List
class Solution {
	static def showEvenNumberList(list : List<Integer>) : void {
		var evenNums = newArrayList
		for (num : list) {
			if (num % 2 == 0) {
				evenNums += num
			}
		}
		println(evenNums)
	}
}
```


## 11. Exercise 11

```sarl
class Solution {
	static def isPerfect(n : int) : boolean {
		var sum = 0
		for (x : 1..<n) {
			if (n % x == 0) {
				sum += x
			}
		}
		sum == n
	}
}
```


## 12. Exercise 12

```sarl
class Solution {
	static def isPalindrome(value : String) : boolean {
		var i = 0
		var j = value.length - 1
		while (i < j) {
			if (value.charAt(i) != value.charAt(j)) {
				return false
			}
		}
		return true
	}
}
```


## 13. Exercise 13

```sarl
import static extension java.lang.Character.*
class Solution {
	static def isPangram(value : String) : boolean {
		if (value.length < 26) {
			return false
		}
		var found = newTreeSet(null)
		for (c : value.toCharArray) {
			if (found.size == 26) {
				return true
			}
			if (c.isLetter) {
				found += c.toLowerCase
			}
		}
		return found.size == 26
   	}
}
```


## 14. Exercise 14

```sarl
import static extension java.util.Collections.sort;
class Solution {
	static def sortWords(value : String) {
		var components = newArrayList(value.split("\-"))
		components.sort
		var result = String.join('-', components)
		println(result)
   	}
}
```


## 15. Exercise 15

```sarl
class Solution {
	static def showSquareNumbers {
		var numbers = newArrayList
		for (num : 1..30) {
			numbers += num**2
		}
		println(numbers)
   	}
}
```




## 16. Legal Notice

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
