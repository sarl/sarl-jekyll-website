---
title: "Introduction to Lambda Expressions with SARL - Answers"
layout: default
---

# Introduction to Lambda Expressions with SARL - Answers


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
<li><a href="#16-exercise-16">16. Exercise 16</a></li>
<li><a href="#17-exercise-17">17. Exercise 17</a></li>
<li><a href="#18-exercise-18">18. Exercise 18</a></li>
<li><a href="#19-exercise-19">19. Exercise 19</a></li>
<li><a href="#20-exercise-20">20. Exercise 20</a></li>
<li><a href="#21-exercise-21">21. Exercise 21</a></li>
<li><a href="#22-exercise-22">22. Exercise 22</a></li>
<li><a href="#23-exercise-23">23. Exercise 23</a></li>
<li><a href="#24-exercise-24">24. Exercise 24</a></li>
<li><a href="#25-exercise-25">25. Exercise 25</a></li>
<li><a href="#26-exercise-26">26. Exercise 26</a></li>
<li><a href="#27-exercise-27">27. Exercise 27</a></li>
<li><a href="#28-exercise-28">28. Exercise 28</a></li>
<li><a href="#29-exercise-29">29. Exercise 29</a></li>
<li><a href="#30-exercise-30">30. Exercise 30</a></li>
<li><a href="#31-legal-notice">31. Legal Notice</a></li>

</ul>


## 1. Exercise 1

```sarl
class Solution {
	def firstLambda_version1 {
		var lambda : (int) => int
		lambda = [x : int | x + 15]
	}
	
	def firstLambda_version2 {
		var lambda : (int) => int
		lambda = [x | x + 15]
	}
	def firstLambda_version3 {
		var lambda : (int) => int
		lambda = [it + 15]
	}
	def secondLambda_verison1 {
		var lambda : (int, int) => void
		lambda = [x : int, y : int | println(x * y)]
	}
	def secondLambda_verison2 {
		var lambda : (int, int) => void
		lambda = [x, y | println(x * y)]
	}
}
```



## 2. Exercise 2

```sarl
class Solution1 {
	static def computeLambda(n : int) : (int) => int {
		[x | x * n]
	}
	static def main(args : String*) {
		var result = computeLambda(2)
		println("Double the number of 15 =" + result.apply(15))
		result = computeLambda(3)
		println("Triple the number of 15 =" + result.apply(15))
		result = computeLambda(4)
		println("Quadruple the number of 15 =" + result.apply(15))
		result = computeLambda(5)
		println("Quintuple the number of 15 =" + result.apply(15))
	}
}
class Solution2 {
	static def computeLambda(n : int) : (int) => int {
		[it * n]
	}
	static def main(args : String*) {
		var result = computeLambda(2)
		println("Double the number of 15 =" + result.apply(15))
		result = computeLambda(3)
		println("Triple the number of 15 =" + result.apply(15))
		result = computeLambda(4)
		println("Quadruple the number of 15 =" + result.apply(15))
		result = computeLambda(5)
		println("Quintuple the number of 15 =" + result.apply(15))
	}
}
```



## 3. Exercise 3

```sarl
class Solution {
	static var marks = newArrayList(#[
		#['English', 88],
		#['Science', 90],
		#['Maths', 97],
		#['Social sciences', 82]
	])
	static def main(args : String*) {
		println("Original list of tuples: " + marks)
		marks.sort [a, b | (a.get(1) as Integer) <=> (b.get(1) as Integer)]
		println("Sorting the List of tuples: " + marks)
	}
}
```



## 4. Exercise 4

```sarl
class Solution {
	static var maps = newArrayList(#[
		#{'make' -> 'Nokia', 'model' -> 216, 'color' -> 'Black'},
		#{'make' -> 'Mi Max', 'model' -> 2, 'color' -> 'Gold'},
		#{'make' -> 'Samsung', 'model' -> 7, 'color' -> 'Blue'}
	])
	static def main(args : String*) {
		println("Original list of maps: " + maps)
		maps.sort [a, b | (b.get("model") as Integer) <=> (a.get("model") as Integer)]
		println("Sorting the list of maps: " + maps)
	}
}
```



## 5. Exercise 5

```sarl
import java.util.stream.Collectors
class Solution1 {
	static var original = #[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
	static def main(args : String*) {
		println("Original list of integers: " + original)
		var evenNumbers = original.stream.filter[(it % 2) == 0].collect(Collectors::toList)
		println("Even numbers from the said list: " + evenNumbers)
		var oddNumbers = original.stream.filter[(it % 2) != 0].collect(Collectors::toList)
		println("Odd numbers from the said list: " + oddNumbers)
	}
}
class Solution2 {
	static var original = #[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
	static def main(args : String*) {
		println("Original list of integers: " + original)
		var evenNumbers = original.filter[(it % 2) == 0].toList
		println("Even numbers from the said list: " + evenNumbers)
		var oddNumbers = original.filter[(it % 2) != 0].toList
		println("Odd numbers from the said list: " + oddNumbers)
	}
}
```



## 6. Exercise 6

```sarl
import java.util.stream.Collectors
class Solution1 {
	static var original = #[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
	static def main(args : String*) {
		println("Original list of integers: " + original)
		var squareNumbers = original.stream.map[it.doubleValue ** 2].collect(Collectors::toList)
		println("Square every number of the said list: " + squareNumbers)
		var cubeNumbers = original.stream.map[it.doubleValue ** 3].collect(Collectors::toList)
		println("Cube every number of the said list: " + cubeNumbers)
	}
}
class Solution2 {
	static var original = #[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
	static def main(args : String*) {
		println("Original list of integers: " + original)
		var squareNumbers = original.map[it.doubleValue ** 2].toList
		println("Square every number of the said list: " + squareNumbers)
		var cubeNumbers = original.map[it.doubleValue ** 3].toList
		println("Cube every number of the said list: " + cubeNumbers)
	}
}
```



## 7. Exercise 7

```sarl
class Solution {
	static def main(args : String*) {
		var starts_with = [x : String | x.startsWith('P')]
		println(starts_with.apply('Python'))
		println(starts_with.apply('Java'))
	}
}
```



## 8. Exercise 8

```sarl
import java.util.Calendar
class Solution {
	static def main(args : String*) {
		var now = Calendar::instance
		println(now)
		var year : (Calendar) => int = [it.get(Calendar::YEAR)]
		var month : (Calendar) => int = [it.get(Calendar::MONTH)]
		var day : (Calendar) => int = [it.get(Calendar::DAY_OF_MONTH)]
		var time : (Calendar) => String = [it.get(Calendar::HOUR) + ":" + it.get(Calendar::MINUTE) + ":" + it.get(Calendar::SECOND) + "." + it.get(Calendar::MILLISECOND)]
		println(year.apply(now))
		print(month.apply(now))
		print(day.apply(now))
		print(time.apply(now))
	}
}
```



## 9. Exercise 9

```sarl
class Solution {
	static def dotest(n : String) {
		var is_num = [
			try {
				Double.parseDouble(it.toString)
				return true
			} catch (ex : Throwable) {
				return false
			}
		]
		println(n + " : " + is_num.apply(n))
	}
	static def main(args : String*) {
		dotest("26587")
		dotest("4.2365")
		dotest("-12547")
		dotest("00")
		dotest("Z001")
		dotest("001")
		dotest("-16.4")
		dotest("-24587.11")
	}
}
```



## 10. Exercise 10

```sarl
import java.util.List
class Solution {
	static def fibonacci(n : int) : List<Integer> {
		(0..n).map[#[it]].reduce[accumulator, current |
			var nl : List<Integer> = newArrayList(accumulator)
			var v = accumulator.get(accumulator.size - 1).intValue + accumulator.get(accumulator.size - 2).intValue
			nl += v
			return nl
		]
	}
	static def main(args : String*) {
		println(fibonacci(2))
		println(fibonacci(5))
		println(fibonacci(6))
		println(fibonacci(9))
	}
}
```




## 11. Exercise 11

```sarl
class Solution {
	static var content1 = #[1, 2, 3, 5, 7, 8, 9, 10]
	static var content2 = #[1, 2, 4, 8, 9]
	static def main(args : String*) {
		var result = content2.filter[content1.contains(it)].toList 
		println(result)
	}
}
```



## 12. Exercise 12

```sarl
import static extension java.lang.Math.signum
class Solution {
	static var content : Integer[] = #[-1, 2, -3, 5, 7, 8, 9, -10]
	static def main(args : String*) {
		var result = newArrayList(content)
		result.sort[a, b |
			if (a.signum == b.signum) {
				return a <=> b
			} else if (a < 0) {
				return 1
			} else {
				return 1
			}
		] 
		println(result)
	}
}
```



## 13. Exercise 13

```sarl
class Solution1 {
	static var content = #[1, 2, 3, 5, 7, 8, 9, 10]
	static def main(args : String*) {
		var ecount = content.filter[(it%2) == 0].size
		var ocount = content.filter[(it%2) != 0].size
		println("Original arrays: " + content)
		println("Number of even numbers in the above array: " + ecount)
		println("Number of odd numbers in the above array: " + ocount)
	}
}
class Solution2 {
	static var content = #[1, 2, 3, 5, 7, 8, 9, 10]
	static def main(args : String*) {
		var ecount = content.stream.filter[(it%2) == 0].count
		var ocount = content.stream.filter[(it%2) != 0].count
		println("Original arrays: " + content)
		println("Number of even numbers in the above array: " + ecount)
		println("Number of odd numbers in the above array: " + ocount)
	}
}
```



## 14. Exercise 14

```sarl
class Solution {
	static var weekdays = #['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
	static def main(args : String*) {
		var result = weekdays.filter[it.length == 6].toList
		println(result)
	}
}
```



## 15. Exercise 15

```sarl
import java.util.List
class Solution {
	static var content1 : List<Integer> = #[1, 2, 3]
	static var content2 : List<Integer> = #[4, 5, 6]
	static def main(args : String*) {
		var result : List<Integer>
		if (content1.size > content2.size) {
			var iter = content1.iterator
			result = content2.map[it.intValue + iter.next.intValue]
		} else {
			var iter = content2.iterator
			result = content1.map[it.intValue + iter.next.intValue]
		}
		println(result)
	}
}
```



## 16. Exercise 16

```sarl
import java.util.List
class Solution {
	static var marks : List<List<Object>> = #[
		#['S ROY', 1.0],
		#['B BOSE', 3.0],
		#['N KAR', 2.0],
		#['C DUTTA', 1.0],
		#['G GHOSH', 1.0]
	]
	static def main(args : String*) {
		var result = marks
			.sortWith [a, b | (b.get(1) as Double) <=> (a.get(1) as Double)]
		var firstMark = result.get(0).get(1) as Double
		var secondMark : Double
		var studentsNames = newArrayList
		for (student : result) {
			var m = student.get(1) as Double
			if (secondMark === null) {
				if (m != firstMark) {
					secondMark = m 
					studentsNames += student.get(0) as String
				}
			} else if (m == secondMark) {
				studentsNames += student.get(0) as String
			} else {
				break;					
			}
		}
		println("Second lowest grade: " + secondMark)
		println("Names: " + studentsNames)
	}
}
```



## 17. Exercise 17

```sarl
class Solution {
	static var original = #[19, 65, 57, 39, 152, 639, 121, 44, 90, 190]
	static def main(args : String*) {
		var result = original.filter [(it % 19) == 0 || (it % 13) == 0].toList
		println("Orginal list: " + original)
		println("Numbers of the above list divisible by nineteen or thirteen: " + result)
	}
}
```



## 18. Exercise 18

```sarl
class Solution {
	static var original = #['php', 'w3r', 'SARL', 'abcd', 'Java', 'aaa']
	static def main(args : String*) {
		var result = original.filter[it.palindrome].toList
		println("List of palindromes: " + result)
	}

	static def palindrome(value : String) : boolean {
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



## 19. Exercise 19

```sarl
import java.util.Map
class Solution {
	static var original = #['bcda', 'abce', 'cbda', 'cbea', 'adcb']
	static def main(args : String*) {
		var search_for = "abcd".counter
		var result = original.filter[
			(search_for == it.counter)
		].toList 
		println("List of palindromes: " + result)
	}
	static def counter(value : String) : Map<Character, Integer> {
		var counter = newHashMap
		for (c : value.bytes) {
			var n = counter.getOrDefault(c as char, 0)
			n++
			counter.put(c as char, n) 
		}
		return counter
	}
}
```



## 20. Exercise 20

```sarl
class Solution {
	static var original = "sdf 23 safs8 5 sdfsd8 sdfs 56 21sfs 20 5"
	static def main(args : String*) {
		var words = original.split("\s+")
		var numbers = words.filter[isInteger].map[it as Integer].sort.toList
		println("Numbers in sorted form: " + numbers)
		var length = words.size
		var result = numbers.filter[it > length].toList
		println(result.join(' '))
  		}
	static def isInteger(value : String) : boolean {
		try {
			Long::parseLong(value)
			return true
		} catch (ex : Throwable) {
			return false
		}
	}
}
```



## 21. Exercise 21

```sarl
class Solution {
	static var original = #[2, 4, 6, 9, 11]
	static def main(args : String*) {
		var search_for = 2
		var result = original.map[it * search_for].toList
		println(result)			
  		}
}
```



## 22. Exercise 22

```sarl
import static extension java.lang.Character.isUpperCase
class Solution {
	static var original = #['sally', 'Dylan', 'rebecca', 'Diana', 'Joanne', 'keith']
	static def main(args : String*) {
		var result = original.filter[it.charAt(0).isUpperCase].map[it.length]
			.reduce[accumulator, current | accumulator + current]
		println(result)
  		}
}
```



## 23. Exercise 23

```sarl
import java.util.List
class Solution {
	static var original = #[2, 4, -6, -9, 11, -12, 14, -5, 17]
	static def main(args : String*) {
		var positive = original.filter[it >= 0].sum
		var negative = original.filter[it < 0].sum
		println("Sum of the positive numbers: " + positive)
		println("Sum of the negative numbers: " + negative)
  		}

		static def sum(value : Iterable<Integer>) : int {
			var sum = 0
			for (c : value) {
				sum += c
			}
			return sum
		}
}
```



## 24. Exercise 24

```sarl
import java.util.List
class Solution {
	static def divisible_by_digits(start_num : int, end_num : int) : List<Integer> {
		(start_num..end_num).filter[n |
			((n as String).bytes).forall[digit | (n%(digit as int)) == 0]
		].toList
	}
	static def main(args : String*) {
		println(divisible_by_digits(1,22))
  		}
}
```



## 25. Exercise 25

```sarl
class Solution {
	static def rearrange_bigger(n : int) : Integer {
	    var nums = (n as String).bytes.map[it as Integer]
	    for (i : (nums.size-2)..0) {
	        if (nums.get(i) < nums.get(i+1)) {
	            var z = nums.subList(i, nums.size)
	            var y = z.filter[it > z.get(0)].min
	            z -= y
	            z = z.sort
	            var new_nums = (nums.subList(0, i) + #[y] + z)
	            return (new_nums.join("")) as Integer
			}
		}
	    return null
	}
	static def dotest(n : int) {
		println("Original number: " + n)
		println("Next bigger number: " + rearrange_bigger(n))
	}
	static def main(args : String*) {
		dotest(12)
		dotest(10)
		dotest(201)
		dotest(102)
		dotest(445)
  		}
}
```



## 26. Exercise 26

```sarl
import java.util.List
class Solution {
	static var original = #[#[0], #[1, 3], #[5, 7], #[9, 11], #[13, 15, 17]]

	static def max_length_list(input_list : List<List<Integer>>) : List<Object> {
	    var max_length = input_list.map[it.size].max 
	    var max_list = input_list.filter[it.size == max_length].toList    
	    return #[max_length, max_list]
	}
   
	static def min_length_list(input_list : List<List<Integer>>) : List<Object> {
	    var min_length = input_list.map[it.size].min
	    var min_list = input_list.filter[it.size == min_length].toList    
	    return #[min_length, min_list]
	}
     
	static def main(args : String*) {
		println("Original list: " + original)
		println("List with maximum length of lists: " + max_length_list(original))
		println("List with minimum length of lists: " + min_length_list(original))
  		}
}
```



## 27. Exercise 27

```sarl
import java.util.List
class Solution {
	static var original = #[
		#['green', 'orange'],
		#['black', 'white'],
		#['white', 'black', 'orange']
	]

	static def main(args : String*) {
		var result = original.map[it.sort]
		println(result)
  		}
}
```



## 28. Exercise 28

```sarl
import java.util.List
class Solution {
	static var original = #[
		#[2], #[0], #[1, 3], #[0, 7], #[9, 11], #[13, 15, 17]
	]

	static def main(args : String*) {
		var result = original.map[it.sort].sortWith[a, b | a <=> b] 
		println(result)
  		}
	static def operator_spaceship(a : List<Integer>, b : List<Integer>) : int {
		var cmp = a.size <=> b.size
		if (cmp != 0) {
			return cmp
		}
		var i0 = a.iterator
		var i1 = b.iterator
		while (i0.hasNext && i1.hasNext) {
			var va = i0.next
			var vb = i1.next
			cmp = va <=> vb
			if (cmp != 0) {
				return cmp
			}
		}
		return 0
	}
}
```



## 29. Exercise 29

```sarl
import java.util.List
class Solution {
	static var original = #['SARL', 3, 2, 4, 5, 'version']

	static def main(args : String*) {
		var result = original.filter[it instanceof Number].map[(it as Number).longValue].max
		println(result)
  		}
}
```



## 30. Exercise 30

```sarl
import java.util.List
class Solution {
	static var original1 = #[
		#[1, 2, 3], #[2, 4, 5], #[1, 1, 1]
	]

	static var original2 = #[
		#[1, 2, 3], #[-2, 4, -5], #[1, -1, 1]
	]
	static def sort_matrix(m : List<List<Integer>>) : List<List<Integer>> {
		m.sortWith[a, b | a.sum <=> b.sum]
	}
	static def sum(m : List<Integer>) : int {
		m.reduce[accumulator, current | accumulator + current]
	}
	static def main(args : String*) {
		println(sort_matrix(original1))
		println(sort_matrix(original2))
  		}
}
```




## 31. Legal Notice

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.13
* Status: Stable Release
* Release: 2023-09-19

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

<small>Generated with the translator docs.generator 0.13.0.</small>
