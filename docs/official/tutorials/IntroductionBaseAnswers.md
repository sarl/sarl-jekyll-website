---
title: "SARL Basic - Answers"
layout: default
---

# SARL Basic - Answers


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
<li><a href="#31-exercise-31">31. Exercise 31</a></li>
<li><a href="#32-exercise-32">32. Exercise 32</a></li>
<li><a href="#33-exercise-33">33. Exercise 33</a></li>
<li><a href="#34-exercise-34">34. Exercise 34</a></li>
<li><a href="#35-exercise-35">35. Exercise 35</a></li>
<li><a href="#36-exercise-36">36. Exercise 36</a></li>
<li><a href="#37-exercise-37">37. Exercise 37</a></li>
<li><a href="#38-exercise-38">38. Exercise 38</a></li>
<li><a href="#39-exercise-39">39. Exercise 39</a></li>
<li><a href="#40-exercise-40">40. Exercise 40</a></li>
<li><a href="#41-exercise-41">41. Exercise 41</a></li>
<li><a href="#42-exercise-42">42. Exercise 42</a></li>
<li><a href="#43-exercise-43">43. Exercise 43</a></li>
<li><a href="#44-exercise-44">44. Exercise 44</a></li>
<li><a href="#45-exercise-45">45. Exercise 45</a></li>
<li><a href="#46-exercise-46">46. Exercise 46</a></li>
<li><a href="#47-exercise-47">47. Exercise 47</a></li>
<li><a href="#48-exercise-48">48. Exercise 48</a></li>
<li><a href="#49-exercise-49">49. Exercise 49</a></li>
<li><a href="#50-exercise-50">50. Exercise 50</a></li>
<li><a href="#51-exercise-51">51. Exercise 51</a></li>
<li><a href="#52-exercise-52">52. Exercise 52</a></li>
<li><a href="#53-exercise-53">53. Exercise 53</a></li>
<li><a href="#54-exercise-54">54. Exercise 54</a></li>
<li><a href="#55-exercise-55">55. Exercise 55</a></li>
<li><a href="#56-exercise-56">56. Exercise 56</a></li>
<li><a href="#57-exercise-57">57. Exercise 57</a></li>
<li><a href="#58-exercise-58">58. Exercise 58</a></li>
<li><a href="#59-exercise-59">59. Exercise 59</a></li>
<li><a href="#60-legal-notice">60. Legal Notice</a></li>

</ul>


## 1. Exercise 1

```sarl
import io.sarl.api.core.Initialize
agent Solution {
	on Initialize {
		println("Twinkle, twinkle, little star,ntHow I wonder what you are!nttUp above the world so high,nttLike a diamond in the sky.ntTwinkle, twinkle, little star,ntHow I wonder what you are")
	}
}
```


## 2. Exercise 2

```sarl
import io.sarl.api.core.Initialize
import java.util.Date
agent Solution {
	on Initialize {
		var dt = new Date
		println(dt)
	}
}
```


## 3. Exercise 3

```sarl
import io.sarl.api.core.Initialize
agent A {
	on Initialize {
		var r = occurrence.parameters.get(0) as Double
		var area = Math::PI * r**2
		println("r = " + r)
		println("Area = " + area)
	}
}
```


## 4. Exercise 4

```sarl
import io.sarl.api.core.Initialize
agent A {
	on Initialize {
		var firstname = occurrence.parameters.get(0) as String
		var lastname = occurrence.parameters.get(1) as String
		println(lastname + " " + firstname)
	}
}
```


## 5. Exercise 5

```sarl
import io.sarl.api.core.Initialize
agent A {
	on Initialize {
		var numberListString = occurrence.parameters.get(0) as String
		var numberArray = numberListString.split("\s*,\s*")
		var numberList = newArrayList(numberArray)
		println("List : " + numberList)
	}
}
```


## 6. Exercise 6

```sarl
import io.sarl.api.core.Initialize
agent A {
	on Initialize {
		var filename = occurrence.parameters.get(0) as String
		var idx = filename.indexOf('.')
		if (idx >= 0) {
			println(filename.substring(idx + 1))
		}
	}
}
```


## 7. Exercise 7

```sarl
import io.sarl.api.core.Initialize
agent A {
	on Initialize {
		var color_list = #["Red", "Green", "White", "Black"]
		println(color_list.get(0))
		println(color_list.get(color_list.length - 1))
	}
}
```


## 8. Exercise 8

```sarl
import io.sarl.api.core.Initialize
agent A {
	on Initialize {
		var n = occurrence.parameters.get(0) as Integer
		var value = n + n**2 + n**3
		println("Result : " + value)
	}
}
```


## 9. Exercise 9

```sarl
import io.sarl.api.core.Initialize
import java.util.GregorianCalendar
agent A {
	on Initialize {
		var month = occurrence.parameters.get(0) as Integer
		var year = occurrence.parameters.get(1) as Integer
		var cal = new GregorianCalendar(year, month, 1)
		println(cal)
	}
}
```


## 10. Exercise 10

```sarl
import io.sarl.api.core.Initialize
import java.time.LocalDate
import java.time.temporal.ChronoUnit
agent A {
	on Initialize {
		var day0 = occurrence.parameters.get(0) as Integer
		var month0 = occurrence.parameters.get(1) as Integer
		var year0 = occurrence.parameters.get(2) as Integer
		
		var day1 = occurrence.parameters.get(3) as Integer
		var month1 = occurrence.parameters.get(4) as Integer
		var year1 = occurrence.parameters.get(5) as Integer
		
		var cal0 = LocalDate::of(year0, month0, day0)
		var cal1 = LocalDate::of(year1, month1, day1)
		
		var days = ChronoUnit::DAYS.between(cal1, cal0)
		println(days + " days")
	}
}
```


## 11. Exercise 11

```sarl
import io.sarl.api.core.Initialize
agent A {
	on Initialize {
		var volume = 4/3 * Math::PI * 6**3;
		println(volume)
	}
}
```


## 12. Exercise 12

```sarl
import io.sarl.api.core.Initialize
agent A {
	on Initialize {
		var number = occurrence.parameters.get(0) as Integer
		var diff = number - 17
		if (diff < 0) {
			diff = 2 * -diff
		}
		println(diff)
	}
}
```


## 13. Exercise 13

```sarl
import io.sarl.api.core.Initialize
import static java.lang.Math.*
agent A {
	on Initialize {
		var n = occurrence.parameters.get(0) as Integer
		var result = ((abs(1000 - n) <= 100) || (abs(2000 - n) <= 100))
		println(result)
	}
}
```


## 14. Exercise 14

```sarl
import io.sarl.api.core.Initialize
agent A {
	on Initialize {
		var number0 = occurrence.parameters.get(0) as Integer
		var number1 = occurrence.parameters.get(1) as Integer
		var number2 = occurrence.parameters.get(2) as Integer
		
		var sum = number0 + number1 + number2
		if (number0 == number1 && number1 == number2) {
			sum *= 3
		}
		println(sum)
	}
}
```


## 15. Exercise 15

```sarl
import io.sarl.api.core.Initialize
agent A {
	on Initialize {
		var str = occurrence.parameters.get(0) as String
		if (!str.startsWith("Is ")) {
			str = "Is " + str
		}
		println(str)
	}
}
```


## 16. Exercise 16

```sarl
import io.sarl.api.core.Initialize
agent A {
	on Initialize {
		var str = occurrence.parameters.get(0) as String
		var n = occurrence.parameters.get(1) as Integer
		var result = ""
		for (i : 1..n) {
			result += str
		}
		println(result)
	}
}
```


## 17. Exercise 17

```sarl
import io.sarl.api.core.Initialize
agent A {
	on Initialize {
		var n = occurrence.parameters.get(0) as Integer
		if ((n%2) == 0) {
			println("Even number: " + n)
		} else {
			println("Odd number: " + n)
		}
	}
}
```


## 18. Exercise 18

```sarl
import io.sarl.api.core.Initialize
agent A {
	on Initialize {
		var n = 0
		for (arg : occurrence.parameters) {
			try {
				var nb = arg as Integer
				if (nb == 4) {
					n++
				}
			} catch (ex : Throwable) {
			}
		}
		println(n)
	}
}
```


## 19. Exercise 19

```sarl
import io.sarl.api.core.Initialize
agent A {
	on Initialize {
		var n = 0
		for (arg : occurrence.parameters) {
			try {
				var nb = arg as Integer
				if (nb == 4) {
					n++
				}
			} catch (ex : Throwable) {
			}
		}
		println(n)
	}
}
```


## 20. Exercise 20

```sarl
import io.sarl.api.core.Initialize
agent A {
	val vowels = newArrayList('a', 'e', 'i', 'o', 'u', 'y')
	
	on Initialize {
		var str = occurrence.parameters.get(0) as String
		var letter = (str.charAt(0) as Character).toLowerCase
		if (vowels.contains(letter)) {
			println("The letter is a vowel")
		} else {
			println("The letter is not a vowel")
		}
	}
}
```


## 21. Exercise 21

```sarl
import io.sarl.api.core.Initialize
agent A {
	val group = newArrayList(1, 5, 8, 3)
	
	on Initialize {
		var value = occurrence.parameters.get(0) as Integer
		println(value + " -> " + group + " : " + group.contains(value))
	}
}
```


## 22. Exercise 22

```sarl
import io.sarl.api.core.Initialize
agent A {
	on Initialize {
		var list = <String>newArrayList
		for (arg : occurrence.parameters) {
			var str = arg as String
			list += str
		}
		println(list)
	}
}
```


## 23. Exercise 23

```sarl
import io.sarl.api.core.Initialize
agent A {
	var numbers : int[] = #[    
	    386, 462, 47, 418, 907, 344, 236, 375, 823, 566, 597, 978, 328, 615, 953, 345, 
	    399, 162, 758, 219, 918, 237, 412, 566, 826, 248, 866, 950, 626, 949, 687, 217, 
	    815, 67, 104, 58, 512, 24, 892, 894, 767, 553, 81, 379, 843, 831, 445, 742, 717, 
	    958,743, 527
	]
	on Initialize {
		var i = 0
		while (i < numbers.length && i < 237) {
			println(numbers.get(i))
			i++
		}
	}
}
```


## 24. Exercise 24

```sarl
import io.sarl.api.core.Initialize
agent A {
	var color_list_1 = newHashSet(#["White", "Black", "Red"])
	var color_list_2 = newHashSet(#["Red", "Green"])
	on Initialize {
		for (col : color_list_1) {
			if (!color_list_2.contains(col)) {
				println(col)
			}
		}
	}
}
```


## 25. Exercise 25

```sarl
import io.sarl.api.core.Initialize
agent A {
	on Initialize {
		var base = occurrence.parameters.get(0) as Double
		var height = occurrence.parameters.get(1) as Double
		var area = (base * height) / 2
		println("Area = " + area)
	}
}
```


## 26. Exercise 26

```sarl
import io.sarl.api.core.Initialize
agent A {
	on Initialize {
		var number1 = occurrence.parameters.get(0) as Double
		var number2 = occurrence.parameters.get(1) as Double
		var gcd = gcd(number1, number2)
		println("GCD(" + number1 + ", "+ number2 + ") = " + gcd)
	}
	def gcd(a : double, b : double) : double {
		var da = a
		var db = b
		while (da != db) {
			if (da > db) {
				da = da - db
			} else {
				db = db - da
			}
		}
		return da
	}
}
```


## 27. Exercise 27

```sarl
import io.sarl.api.core.Initialize
import static java.lang.Math.*
agent A {
	on Initialize {
		var number1 = occurrence.parameters.get(0) as Double
		var number2 = occurrence.parameters.get(1) as Double
		var lcm = lcm(number1, number2)
		println("LCM(" + number1 + ", "+ number2 + ") = " + lcm)
	}
	def lcm(a : double, b : double) : double {
		abs(a * b) / gcd(a, b)
	}
	def gcd(a : double, b : double) : double {
		var da = a
		var db = b
		while (da != db) {
			if (da > db) {
				da = da - db
			} else {
				db = db - da
			}
		}
		return da
	}
}
```


## 28. Exercise 28

```sarl
import io.sarl.api.core.Initialize
agent A {
	on Initialize {
		var number1 = occurrence.parameters.get(0) as Integer
		var number2 = occurrence.parameters.get(1) as Integer
		var number3 = occurrence.parameters.get(2) as Integer
		var sum = 0
		if (number1 != number2 && number2 != number3 && number1 != number3) {
			sum = number1 + number2 + number3
		}
		println(sum);
	}
}
```


## 29. Exercise 29

```sarl
import io.sarl.api.core.Initialize
agent A {
	on Initialize {
		var number1 = occurrence.parameters.get(0) as Integer
		var number2 = occurrence.parameters.get(1) as Integer
		var sum = number1 + number2
		if ((15..20).contains(sum)) {
			sum = 20
		}
		println(sum);
	}
}
```


## 30. Exercise 30

```sarl
import io.sarl.api.core.Initialize
agent A {
	on Initialize {
		var number1 = occurrence.parameters.get(0) as Integer
		var number2 = occurrence.parameters.get(1) as Integer
		var result = program(number1, number2)
		println(result);
	}
	def program(number1 : int, number2 : int) : boolean {
		number1 == number2 || number1 + number2 == 5
	}
}
```


## 31. Exercise 31

```sarl
import io.sarl.api.core.Initialize
agent A {
	on Initialize {
		var number1 = occurrence.parameters.get(0)
		var number2 = occurrence.parameters.get(1)
		var result = sum(number1, number2)
		println(result);
	}
	def sum(number1 : Object, number2 : Object) : int {
		if (number1 instanceof Number) {
			if (number2 instanceof Number) {
				return number1.intValue + number2.intValue
			}
		}
		return 0
	}
}
```


## 32. Exercise 32

```sarl
import io.sarl.api.core.Initialize
agent A {
	on Initialize {
		var x = occurrence.parameters.get(0) as Double
		var y = occurrence.parameters.get(1) as Double
		var result = solve(x, y)
		println(result);
	}
	def solve(x : double, y : double) : double {
		(x + y) ** 2
	}
}
```


## 33. Exercise 33

```sarl
import io.sarl.api.core.Initialize
agent A {
	on Initialize {
		var x1 = occurrence.parameters.get(0) as Double
		var y1 = occurrence.parameters.get(1) as Double
		var x2 = occurrence.parameters.get(2) as Double
		var y2 = occurrence.parameters.get(3) as Double
		var result = distance(x1, y1, x2, y2)
		println(result);
	}
	def distance(x1 : double, y1 : double, x2 : double, y2 : double) : double {
		Math::sqrt((x2 - x1)**2 + (y2 - y1)**2)
	}
}
```


## 34. Exercise 34

```sarl
import io.sarl.api.core.Initialize
import java.io.File
agent A {
	on Initialize {
		var filename = occurrence.parameters.get(0) as String
		var file = new File(filename)
		var isExist = file.exists
		println(isExist);
	}
}
```


## 35. Exercise 35

```sarl
import io.sarl.api.core.Initialize
agent A {
	on Initialize {
		var value = occurrence.parameters.get(0) as String
		try {
			var floatNumber = value as Double
			println("Double value = " + floatNumber)
		} catch (ex : Throwable) {
			var intNumber = value as Long
			println("Long value = " + intNumber)
		}
	}
}
```


## 36. Exercise 36

```sarl
import io.sarl.api.core.Initialize
import java.io.File
agent A {
	on Initialize {
		var folderName = occurrence.parameters.get(0) as String
		var folder = new File(folderName)
		var list = folder.listFiles
		println(list)
	}
}
```



## 37. Exercise 37

```sarl
import io.sarl.api.core.Initialize
agent A {
	on Initialize {
		var value = occurrence.parameters.get(0) as String
		value = value.replaceAll("[n ]+", "")
		println(value)
	}
}
```


## 38. Exercise 38

```sarl
import io.sarl.api.core.Initialize
import io.sarl.api.core.Logging
agent A {
	uses Logging
	on Initialize {
		var value = occurrence.parameters.get(0) as String
		error(value)
	}
}
```


## 39. Exercise 39

```sarl
import io.sarl.api.core.Initialize
agent A {
	on Initialize {
		var variableName = occurrence.parameters.get(0) as String
		println(System::getProperty(variableName))
	}
}
```


## 40. Exercise 40

```sarl
import io.sarl.api.core.Initialize
agent A {
	on Initialize {
		println(System::getProperty("user.name"))
	}
}
```


## 41. Exercise 41

```sarl
import io.sarl.api.core.Initialize
agent A {
	on Initialize {
		var n = occurrence.parameters.get(0) as Integer
		var sum = 0
		for (i : 1..n) {
			sum += i
		}
		println(sum)
	}
}
```


## 42. Exercise 42

```sarl
import io.sarl.api.core.Initialize
agent A {
	on Initialize {
		var height = occurrence.parameters.get(0) as Double
		height = 2.54 * height
		println(height)
	}
}
```


## 43. Exercise 43

```sarl
import io.sarl.api.core.Initialize
agent A {
	on Initialize {
		var side1 = occurrence.parameters.get(0) as Double
		var side2 = occurrence.parameters.get(1) as Double
		var hypotenuse = Math::sqrt(side1**2 + side2**2)
		println(hypotenuse)
	}
}
```


## 44. Exercise 44

```sarl
import io.sarl.api.core.Initialize
import static java.util.concurrent.TimeUnit.*
agent A {
	on Initialize {
		var days = occurrence.parameters.get(0) as Long
		var hours = occurrence.parameters.get(1) as Long
		var minutes = occurrence.parameters.get(1) as Long
		var seconds = occurrence.parameters.get(1) as Long
		var total = DAYS.toSeconds(days) + HOURS.toSeconds(hours) + MINUTES.toSeconds(hours) + seconds
		println(total)
	}
}
```


## 45. Exercise 45

```sarl
import io.sarl.api.core.Initialize
import java.io.File
agent A {
	on Initialize {
		var name = occurrence.parameters.get(0) as String
		var file = new File(name)
		var absoluteFilename = file.absolutePath
		println(absoluteFilename)
	}
}
```


## 46. Exercise 46

```sarl
import io.sarl.api.core.Initialize
agent A {
	on Initialize {
		var seconds = occurrence.parameters.get(0) as Integer
		var days = (seconds / (3600 * 24)) as int
		seconds = seconds - days * 3600 * 24
		var hours = (seconds / 3600) as int
		seconds = seconds - hours * 3600
		var minutes = (seconds / 60) as int
		seconds = seconds - minutes * 60
		println("Days = " + days)
		println("Hours = " + hours)
		println("Minutes = " + minutes)
		println("Seconds = " + seconds)
	}
}
```


## 47. Exercise 47

```sarl
import io.sarl.api.core.Initialize
agent A {
	on Initialize {
		var weight = occurrence.parameters.get(0) as Double
		var height = occurrence.parameters.get(1) as Double
		var bmi = weight / height**2
		println(bmi)
	}
}
```


## 48. Exercise 48

```sarl
import io.sarl.api.core.Initialize
agent A {
	on Initialize {
		var kilopascals = occurrence.parameters.get(0) as Double
		var psl = kilopascals * 0.145038
		println("Pounds per square inch = " + psl + " Psl")
		var mmhg = kilopascals * 7.50062
		println("Millimeters of mercury = " + mmhg + " mmHg")
		var atmosphere = kilopascals / 101.325
		println("Atmosphere pressure = " + atmosphere + " atmosphere")
	}
}
```


## 49. Exercise 49

```sarl
import io.sarl.api.core.Initialize
agent A {
	on Initialize {
		var value = occurrence.parameters.get(0) as String
		var sum = 0
		for (c : value.toCharArray) {
			if (c >= '0' && c <= '9') {
				sum += (c - '0') as int
			}
		}
		println(sum)
	}
}
```


## 50. Exercise 50

```sarl
import io.sarl.api.core.Initialize
import static java.lang.Math.*
agent A {
	on Initialize {
		var x = occurrence.parameters.get(0) as Integer
		var y = occurrence.parameters.get(1) as Integer
		var z = occurrence.parameters.get(2) as Integer
		var a1 = min(x, min(y, z))
		var a3 = max(x, max(y, z))
		var a2 = (x + y + z) - a1 - a3
		println("Numbers in sorted order: (" + a1 + ", " + a2 + ", "  + a3 + ")")
	}
}
```


## 51. Exercise 51

```sarl
import io.sarl.api.core.Initialize
agent A {
	on Initialize {
		var all = ""
		for (p : occurrence.parameters) {
			all += p as String
		}
		println(all)
	}
}
```


## 52. Exercise 52

```sarl
import io.sarl.api.core.Initialize
import java.util.stream.Collectors
import static extension java.util.Arrays.*
agent A {
	on Initialize {
		var s = sum(occurrence.parameters.asList.stream
			.filter[it instanceof Number]
			.map[it as Number].collect(Collectors.toList))
		println(s)
	}
	def sum(container : Iterable<? extends Number>) : double {
		var s = 0.0
		var iter = container.iterator
		while (iter.hasNext) {
			var elt = iter.next
			s += elt as double
		}
		return s
	}
}
```


## 53. Exercise 53

```sarl
import io.sarl.api.core.Initialize
import static extension java.util.Arrays.*
agent A {
	on Initialize {
		var input = occurrence.parameters.asList.stream
			.filter[it instanceof Number]
			.map[it as Number]
		var iter = input.iterator
		var reference = iter.next as double
		var output = newArrayList
		while (iter.hasNext) {
			var n = iter.next as double
			if (n > reference) {
				output += n
			}
		}
		println(output)
	}
}
```


## 54. Exercise 54

```sarl
import io.sarl.api.core.Initialize
agent A {
	on Initialize {
		var c = occurrence.parameters.get(0) as Character
		var value = occurrence.parameters.get(1) as String
		var count = value.chars.filter[it == c].count
		println(count)
	}
}
```


## 55. Exercise 55

```sarl
import io.sarl.api.core.Initialize
import java.io.File
agent A {
	on Initialize {
		var filename = occurrence.parameters.get(0) as String
		var file = new File(filename)
		println(file.isFile || file.isDirectory)
	}
}
```


## 56. Exercise 56

```sarl
import io.sarl.api.core.Initialize
agent A {
	on Initialize {
		var var1 = occurrence.parameters.get(0)
		var var2 = occurrence.parameters.get(1)
		var tmp = var1
		var1 = var2
		var2 = tmp
		println("var1 = " + var1)
		println("var2 = " + var2)
	}
}
```


## 57. Exercise 57

```sarl
import io.sarl.api.core.Initialize
agent A {
	on Initialize {
		var value = occurrence.parameters.get(0) as String
		println(isNumeric(value))
	}
	def isNumeric(value : String) : boolean {
		try {
			Double::parseDouble(value)
			return true
		} catch (ex : Throwable) {
			return false
		}
	}
}
```


## 58. Exercise 58

```sarl
import io.sarl.api.core.Initialize
agent A {
	on Initialize {
		var value1 = occurrence.parameters.get(0) as String
		var value2 = occurrence.parameters.get(2) as String
		println(isSameAddressInMemory(value1, value2))
	}
	def isSameAddressInMemory(value1 : String, value2 : String) : boolean {
		value1 === value2
	}
}
```


## 59. Exercise 59

```sarl
import io.sarl.api.core.Initialize
agent A {
	on Initialize {
		println("Min integer = " + Integer::MIN_VALUE)
		println("Max integer = " + Integer::MAX_VALUE)
		println("Min long = " + Long::MIN_VALUE)
		println("Max long = " + Long::MAX_VALUE)
		println("Min float = " + Float::MIN_VALUE)
		println("Max float = " + Float::MAX_VALUE)
	}
}
```



## 60. Legal Notice

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
