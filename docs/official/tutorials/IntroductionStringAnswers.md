---
title: "Introduction to Strings with SARL - Answers"
layout: default
---

# Introduction to Strings with SARL - Answers


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
<li><a href="#60-exercise-60">60. Exercise 60</a></li>
<li><a href="#61-legal-notice">61. Legal Notice</a></li>

</ul>


## 1. Exercise 1

```sarl
class Solution {
	static def main(args : String*) {
		println(args.get(0).length)
	}
}
```



## 2. Exercise 2

```sarl
class Solution {
	static def main(args : String*) {
		var map = newHashMap
		for (b : "google.com".bytes) {
			var c = b as char
			var n = map.getOrDefault(c, 0)
			map.put(c, n + 1)
		}
		println(map)
	}
}
```



## 3. Exercise 3

```sarl
class Solution {
	static def main(args : String*) {
		var input = args.get(0)
		var output = ""
		if (input.length >= 2) {
			output = input.substring(0, 2) + input.substring(input.length - 2, input.length)
		}
		println(output)
	}
}
```



## 4. Exercise 4

```sarl
class Solution {
	static def main(args : String*) {
		var input = args.get(0)
		var output = ""
		if (input.length >= 1) {
			var firstChar = input.charAt(0)
			output = firstChar + input.substring(1, input.length).replace(firstChar, '*')
		}
		println(output)
	}
}
```



## 5. Exercise 5

```sarl
class Solution {
	static def start(value : String) : String {
		if (value.length >= 2) value.substring(0, 2) else value
	}
	
	static def end(value : String) : String {
		if (value.length >= 2) value.substring(2, value.length) else ""
	}
	static def main(args : String*) {
		if (args.length >= 2) {
			var in0 = args.get(0)
			var in1 = args.get(1)
			var output = start(in1) + end(in0) + start(in0) + end(in1)
			println(output)
		}
	}
}
```



## 6. Exercise 6

```sarl
class Solution {
	static def add_ing(value : String) : String {
		if (value.length >= 3) {
			if (value.endsWith("ing")) value + "ly" else value + "ing"
		} else {
			value
		}
	}
	static def main(args : String*) {
		for (value : args) {
			println(value.add_ing)
		}
	}
}
```



## 7. Exercise 7

```sarl
import java.util.regex.Pattern
class Solution {
	static def main(args : String*) {
		var pattern = Pattern::compile("not.+?poor") 
		for (value : args) {
			var matcher = pattern.matcher(value)
			var nvalue = matcher.replaceAll("good")
			println(nvalue)
		}
	}
}
```



## 8. Exercise 8

```sarl
class Solution1 {
	static def longuest_word(words : String[]) : Object[] {
		if (words.length > 0) {
			var wd = words.get(0)
			var max = wd.length
			for (var i = 1; i < words.length; i++) {
				var w = words.get(i)
				if (w.length > max) {
					max = w.length
					wd = w
				}
			}
			return #[wd, max]
		}
		return null
	}
	static def main(args : String*) {
		println(args.longuest_word)
	}
}
class Solution2 {
	static def longuest_word(words : String[]) : Object[] {
		words.sortWith[a, b | b.length <=> a.length].map[#[it, it.length]].get(0)
	}
	static def main(args : String*) {
		println(args.longuest_word)
	}
}
```



## 9. Exercise 9

```sarl
class Solution {
	static def remove_char(word : String, index : int) : String {
		word.substring(0, index) + word.substring(index + 1, word.length)
	}
	static def main(args : String*) {
		for (arg : args) {
			println(arg.remove_char(arg.length / 2))
		}
	}
}
```



## 10. Exercise 10

```sarl
class Solution {
	static def swap_bounds(word : String) : String {
		if (word.length >= 2) {
			var firstChar = word.charAt(0)
			var lastChar = word.charAt(word.length - 1)
			if (word.length > 2) {
				lastChar + word.substring(1, word.length - 2) + firstChar
			} else {
				(lastChar + firstChar) as String
			}
		} else {
			word
		}
	}
	static def main(args : String*) {
		for (arg : args) {
			println(arg.swap_bounds)
		}
	}
}
```



## 11. Exercise 11

```sarl
class Solution1 {
	static def remove_odd_chars(word : String) : String {
		var str = ""
		for (var i = 0; i < word.length; i += 2) {
			str += word.charAt(i)
		}
		return str
	}
	static def main(args : String*) {
		for (arg : args) {
			println(arg.remove_odd_chars)
		}
	}
}
class Solution2 {
	static def remove_odd_chars(word : String) : String {
		var str = new StringBuilder
		for (var i = 0; i < word.length; i += 2) {
			str.append(word.charAt(i))
		}
		return str.toString
	}
	static def main(args : String*) {
		for (arg : args) {
			println(arg.remove_odd_chars)
		}
	}
}
```



## 12. Exercise 12

```sarl
import java.util.Map
class Solution {
	static def count_words(sentence : String) : Map<String, Integer> {
		var map = newHashMap
		for (word : sentence.split("\s+")) {
			var n = map.getOrDefault(word, 0)
			map.put(word, n + 1)
		}
		return map
	}
	static def main(args : String*) {
		for (arg : args) {
			println(arg.count_words)
		}
	}
}
```



## 13. Exercise 13

```sarl
class Solution {
	static def main(args : String*) {
		for (arg : args) {
			println(arg.toUpperCase)
			println(arg.toLowerCase)
		}
	}
}
```



## 14. Exercise 14

```sarl
import java.util.List
class Solution {
	static def main(args : String*) {
		var words = args.map[newArrayList(it.split("\s*,\s*"))]
			.reduce[accumulator : List<String>, current : List<String> |
				(accumulator + current) as List<String>
			]
		println(words)
	}
}
```



## 15. Exercise 15

```sarl
import java.util.List
class Solution1 {
	static def to_html(words : List<String>) : String {
		var str = ""
		var action : String = null
		for (w : words) {
			if (action !== null) {
				str += "<" + action + ">" + w + "</" + action + ">" 
			} else if (w == "b" || w == "i") {
				action = w
			} else {
				str += w
			}
		}
		return str
	}
	static def main(args : String*) {
		println(args.to_html)
	}
}
class Solution2 {
	static def to_html(words : List<String>) : String {
		var str = new StringBuilder
		var action : String = null
		for (w : words) {
			if (action !== null) {
				str.append("<").append(action).append(">")
				str.append(w).append("</").append(action).append(">") 
			} else if (w == "b" || w == "i") {
				action = w
			} else {
				str.append(w)
			}
		}
		return str.toString
	}
	static def main(args : String*) {
		println(args.to_html)
	}
}
```



## 16. Exercise 16

```sarl
class Solution {
	static def insert_middle(str : String, inside : String) : String {
		var m = str.length / 2
		str.substring(0, m) + inside + str.substring(m, str.length)
	}
	static def main(args : String*) {
		println("{{}}".insert_middle("SARL"))
		println("[[]]".insert_middle("SARL"))
	}
}
```



## 17. Exercise 17

```sarl
class Solution1 {
	static def duplicate_last(str : String) : String {
		if (str.length >= 2) {
			var substr = str.substring(str.length - 2, str.length)
			return substr + substr + substr + substr
		}
		return str
	}
	static def main(args : String*) {
		println("SARL".duplicate_last)
		println("Exercices".duplicate_last)
	}
}
class Solution2 {
	static def operator_power(value : String, n : int) : String {
		var buffer = new StringBuilder
		for (i : 1..n) {
			buffer.append(value)
		}
		return buffer.toString
	}
	static def duplicate_last(str : String) : String {
		if (str.length >= 2) {
			return str.substring(str.length - 2, str.length) ** 4
		}
		return str
	}
	static def main(args : String*) {
		println("SARL".duplicate_last)
		println("Exercices".duplicate_last)
	}
}
```



## 18. Exercise 18

```sarl
class Solution {
	static def begin(str : String) : String {
		if (str.length <= 3) str else str.substring(0, 3)
	}
	static def main(args : String*) {
		println("SARL".begin)
		println("Exercices".begin)
	}
}
```



## 19. Exercise 19

```sarl
class Solution {
	static def reverse(str : String) : String {
		if ((str.length%4) != 0) str else new String(str.bytes.reverse)
	}
	static def main(args : String*) {
		println("SARL".reverse)
		println("Exercices".reverse)
	}
}
```



## 20. Exercise 20

```sarl
class Solution {
	static def selective_uppercase(str : String) : String {
		var num_upper = 0 str.bytes.take(4).filter[Character::isUpperCase(it)].size
		if (num_upper >= 2) str.toUpperCase else str
	}
	static def main(args : String*) {
		println("SARL".selective_uppercase)
		println("Exercices".selective_uppercase)
	}
}
```



## 21. Exercise 21

```sarl
class Solution {
	static def sort(str : String) : String {
		new String(str.toCharArray.sort)
	}
	static def main(args : String*) {
		println("SARL".sort)
		println("Exercices".sort)
	}
}
```



## 22. Exercise 22

```sarl
class Solution {
	static def remove_nl(str : String) : String {
		str.replaceAll("[nr]+", "")
	}
	static def main(args : String*) {
		println("SARL".remove_nl)
		println("Exercices".remove_nl)
	}
}
```



## 23. Exercise 23

```sarl
class Solution {
	static def starts_with(str : String, prefix : String) : boolean {
		if (prefix.length > str.length) {
			return false
		}
		for (var i = 0; i < prefix.length; i++) {
			if (str.charAt(i) != prefix.charAt(i)) {
				return false
			}
		}
		return true
	}
	static def main(args : String*) {
		println("SARL".starts_with("SA"))
		println("SARL".starts_with("Sa"))
	}
}
```



## 24. Exercise 24

```sarl
class Solution1 {
	static def caesarCipher(str : String, delta : int) : String {
		var tab = newCharArrayOfSize(str.length)
		for (var i = 0; i < str.length; i++) {
			tab.set(i, (tab.get(i)+ delta) as char)
		}
		new String(tab)
	}
	static def main(args : String*) {
		println("SARL".caesarCipher(-3))
		println("SARL".caesarCipher(4))
	}
}
class Solution2 {
	static def caesarCipher(str : String, delta : int) : String {
		new String(str.toCharArray.map[(it + delta) as char])
	}
	static def main(args : String*) {
		println("SARL".caesarCipher(-3))
		println("SARL".caesarCipher(4))
	}
}
```



## 25. Exercise 25

```sarl
class Solution1 {
	static def remove_indent(str : String) : String {
		var out = new StringBuilder
		var line_start = true
		for (c : str.toCharArray) {
			if (line_start) {
				if (!Character::isWhitespace(c)) {
					line_start = false
					out.append(c)
				}
			} else if (c == "n" || c == "r") {
				line_start = true
			} else {
				out.append(c)
			}
		}
		return out.toString
	}
	static def main(args : String*) {
		println("SARLntline2n    line3".remove_indent)
	}
}
class Solution2 {
	static def remove_indent(str : String) : String {
		str.replaceFirst("^\s+", "").replaceAll("[nr]\s*", "n")
	}
	static def main(args : String*) {
		println("SARLntline2n    line3".remove_indent)
	}
}
```



## 26. Exercise 26

```sarl
class Solution1 {
	static def add_prefix(str : String, prefix : String) : String {
		var out = new StringBuilder
		var line_start = true
		out.append(prefix)
		for (c : str.toCharArray) {
			if (line_start) {
				if (!Character::isWhitespace(c)) {
					line_start = false
					out.append(c)
				}
			} else if (c == "n" || c == "r") {
				line_start = true
				out.append(prefix)
			} else {
				out.append(c)
			}
		}
		return out.toString
	}
	static def main(args : String*) {
		println("SARLntline2n    line3".add_prefix("---"))
	}
}
class Solution2 {
	static def add_prefix(str : String, prefix : String) : String {
		str.replaceFirst("^\s+", prefix).replaceAll("[nr]\s*", "n" + prefix)
	}
	static def main(args : String*) {
		println("SARLntline2n    line3".add_prefix("---"))
	}
}
```



## 27. Exercise 27

```sarl
import java.text.MessageFormat
import static extension java.lang.Math.abs
class Solution1 {
	static def format_number(value : double) : String {
		var str = new StringBuilder
		var lvalue = (value as long).abs
		str.append(lvalue)
		var dec = value.abs - lvalue
		if (dec != 0.0) {
			for (i : 1..2) {
				dec *= 10
				str.append(dec as int)
			}
		}
		return str.toString
	}
	static def main(args : String*) {
		println(123.456789.format_number)
	}
}
class Solution2 {
	static def format_number(value : double) : String {
		MessageFormat::format("#0.00", value)
	}
	static def main(args : String*) {
		println(123.456789.format_number)
	}
}
```



## 28. Exercise 28

```sarl
import java.text.MessageFormat
class Solution1 {
	static def format_number(value : double) : String {
		var str = new StringBuilder
		var lvalue = value as long
		str.append(lvalue)
		var dec = value - lvalue
		if (dec != 0.0) {
			for (i : 1..2) {
				dec *= 10
				str.append(dec as int)
			}
		}
		return str.toString
	}
	static def main(args : String*) {
		println(123.456789.format_number)
	}
}
class Solution2 {
	static def format_number(value : double) : String {
		MessageFormat::format("+#0.00", value)
	}
	static def main(args : String*) {
		println(123.456789.format_number)
	}
}
```



## 29. Exercise 29

```sarl
import java.text.MessageFormat
class Solution1 {
	static def format_number(value : double) : String {
		var str = new StringBuilder
		str.append(value as long)
		return str.toString
	}
	static def main(args : String*) {
		println(123.456789.format_number)
	}
}
class Solution2 {
	static def format_number(value : double) : String {
		MessageFormat::format("+#0", value)
	}
	static def main(args : String*) {
		println(123.456789.format_number)
	}
}
```



## 30. Exercise 30

```sarl
class Solution1 {
	static def format_number(value : int, width : int) : String {
		var buffer = new StringBuilder
		buffer.append(value)
		while (buffer.length < width) {
			buffer.insert(0, '0')
		}
		return buffer.toString
	}
	static def main(args : String*) {
		println(123.format_number(10))
	}
}
class Solution2 {
	static def format_number(value : int, width : int) : String {
		String::format("%0" + width + "d", value)
	}
	static def main(args : String*) {
		println(123.format_number(10))
	}
}
```



## 31. Exercise 31

```sarl
class Solution {
	static def format_number(value : int, width : int, leadingchar : char = '*') : String {
		var buffer = new StringBuilder
		buffer.append(value)
		while (buffer.length < width) {
			buffer.insert(0, leadingchar)
		}
		return buffer.toString
	}
	static def main(args : String*) {
		println(123.format_number(10))
	}
}
```



## 32. Exercise 32

```sarl
class Solution {
	static def count_sub(str : String, sub : String) : int {
		if (sub.length == 0 || sub.length > str.length) {
			return 0
		}
		var sub0 = sub.charAt(0)
		var count = 0
		for (var i = 0; i < str.length - sub.length; i++) {
			var base = str.charAt(i)
			if (base == sub0) {
				var found = true
				for (var j = i + 1, var k = 1; k < sub.length; j++, k++) {
					var c0 = str.charAt(j)
					var c1 = sub.charAt(k)
					if (c0 != c1) {
						found = false
						break
					}
				}
				if (found) {
					count++
				}
			}
		}
		return count
	}
	static def main(args : String*) {
		println(count_sub(args.get(0), args.get(1)))
	}
}
```



## 33. Exercise 33

```sarl
class Solution1 {
	static def reverse(str : String) : String {
		var chars = newCharArrayOfSize(str.length)
		for (var i = 0, var j = str.length - 1; i < str.length; i++, j--) {
			chars.set(i, str.charAt(j))
		}
		return new String(chars)
	}
	static def main(args : String*) {
		for (arg : args) {
			println(arg.reverse)
		}
	}
}
class Solution2 {
	static def reverse(str : String) : String {
		new String(str.toCharArray.reverseView)
	}
	static def main(args : String*) {
		for (arg : args) {
			println(arg.reverse)
		}
	}
}
```



## 34. Exercise 34

```sarl
class Solution1 {
	static def reverse_words(str : String) : String {
		var words = str.split("\s+")
		var nwords = new StringBuilder
		for (word : words) {
			if (nwords.length > 0) {
				nwords.insert(0, " ")
			}
			nwords.insert(0, word)
		}
		return nwords.toString
	}
	static def main(args : String*) {
		for (arg : args) {
			println(arg.reverse_words)
		}
	}
}
class Solution2 {
	static def reverse_words(str : String) : String {
		str.split("\s+").reverseView.join(" ")
	}
	static def main(args : String*) {
		for (arg : args) {
			println(arg.reverse_words)
		}
	}
}
```



## 35. Exercise 35

```sarl
import static extension com.google.common.base.Strings.repeat
class Solution {
	static def main(args : String*) {
		var area = 1256.66
		var volume = 1254.725
		var decimals = 2
		println(String::format(
			"The area of the rectangle is {0,number,#0." + "0".repeat(decimals) + "}cmu00b2", area))
		decimals = 3
		println(String::format(
			"The volume of the cylinder is {0,number,#0." + "0".repeat(decimals) + "}cmu00b3", volume))
	}
}
```



## 36. Exercise 36

```sarl
class Solution1 {
	static def index_of(str : String, c : char) : int {
		for (var i = 0; i < str.length; i++) {
			if (str.charAt(i) == c) {
				return i
			}
		}
		return -1
	}
	static def main(args : String*) {
		println("w3resource".index_of('w'))
		println("w3resource".index_of('3'))
		println("w3resource".index_of('r'))
		println("w3resource".index_of('e'))
		println("w3resource".index_of('s'))
		println("w3resource".index_of('o'))
		println("w3resource".index_of('u'))
		println("w3resource".index_of('c'))
	}
}
class Solution2 {
	static def main(args : String*) {
		println("w3resource".indexOf('w'))
		println("w3resource".indexOf('3'))
		println("w3resource".indexOf('r'))
		println("w3resource".indexOf('e'))
		println("w3resource".indexOf('s'))
		println("w3resource".indexOf('o'))
		println("w3resource".indexOf('u'))
		println("w3resource".indexOf('c'))
	}
}
```



## 37. Exercise 37

```sarl
class Solution {
	static def is_alphabet(str : String) : boolean {
		if (str.length < 26) {
			var alpha = newTreeSet(null)
			str.chars.forEach[
				var c = Character::toLowerCase(it as char)
				if (Character::isLetter(c)) {
					alpha += c
				}
			]
			return alpha.size == 26
		} else {
			for (var c = ('a' as char); c <= ('z' as char); c++) {
				if (str.chars.noneMatch[Character::toLowerCase(it as char) == c]) {
					return false
				}
			}
		}
		return true
	}
	static def main(args : String*) {
		println("w3resource".is_alphabet)
	}
}
```



## 38. Exercise 38

```sarl
import java.util.List
class Solution1 {
	static def split_words(str : String) : List<String> {
		var list = newArrayList
		var word = new StringBuilder
		str.chars.forEach[
			var c = it as char
			if (!Character::isWhitespace(c)) {
				word.append(c)
			} else if (word.length > 0) {
				list.add(word.toString)
				word = new StringBuilder
			}
		]
		return list
	}
	static def main(args : String*) {
		for (sentence : args) {
			println(sentence.split_words)
		}
	}
}
class Solution2 {
	static def main(args : String*) {
		for (sentence : args) {
			println(sentence.split("\s+"))
		}
	}
}
```



## 39. Exercise 39

```sarl
class Solution1 {
	static def lowercase(str : String, n : int) : String {
		if (str.length <= n) {
			return str.toLowerCase
		}
		var word = new StringBuilder
		for (var i = 0; i < n; i++) {
			word.append(Character::toLowerCase(str.charAt(i)))
		}
		for (var i = n; i < str.length; i++) {
			word.append(str.charAt(i))
		}
		return word.toString
	}
	static def main(args : String*) {
		println("W3RESOURCE".lowercase(3))
	}
}
class Solution2 {
	static def lowercase(str : String, n : int) : String {
		if (str.length <= n) {
			return str.toLowerCase
		}
		return str.substring(0, n).toLowerCase + str.substring(n, str.length)
	}
	static def main(args : String*) {
		println("W3RESOURCE".lowercase(3))
	}
}
```



## 40. Exercise 40

```sarl
class Solution1 {
	static def swap(str : String) : String {
		var out = new StringBuilder
		for (var i = 0; i < str.length; i++) {
			var c = str.charAt(i)
			switch (c) {
				case '.': {
					out.append(",")
				}
				case ',': {
					out.append(".")
				}
				default: {
					out.append(c)
				}
			}
		}
		return out.toString
	}
	static def main(args : String*) {
		println("W3RESOURCE".swap)
	}
}
class Solution2 {
	static def swap(str : String) : String {
		str.chars.map[
			var c = it as char
			switch (c) {
				case '.': {
					return ',' as int
				}
				case ',': {
					return '.' as int
				}
				default: {
					return c as int
				}
			}
		].toArray.join
	}
	static def main(args : String*) {
		println("10,153.2568".swap)
	}
}
```



## 41. Exercise 41

```sarl
class Solution1 {
	static var VOWELS = <Character>newTreeSet(null, "a", "e", "i", "o", "u", "y")
	static def vowels(str : String) : int {
		var count = 0
		for (var i = 0; i < str.length; i++) {
			if (VOWELS.contains(str.charAt(i))) {
				count++
			}
		}
		return count
	}
	static def main(args : String*) {
		println("W3RESOURCE".vowels)
	}
}
class Solution2 {
	static var VOWELS = <Character>newTreeSet(null, "a", "e", "i", "o", "u", "y")
	static def vowels(str : String) : int {
		str.toCharArray.filter[VOWELS.contains(it)].size
	}
	static def main(args : String*) {
		println("W3RESOURCE".vowels)
	}
}
```



## 42. Exercise 42

```sarl
class Solution1 {
	static def split_last(str : String, delimiter : char) : String[] {
		var part1 = new StringBuilder
		var i = str.length - 1
		for (; i >= 0; i--) {
			var c = str.charAt(i)
			if (delimiter == c) {
				break
			}
			part1.insert(0, c)
		}
		var part0 = new StringBuilder
		for (i--; i >= 0; i--) {
			var c = str.charAt(i)
			part0.insert(0, c)
		}
		return #[part0.toString, part1.toString]
	}
	static def main(args : String*) {
		println("W3,RESOURCE,id".split_last(","))
	}
}
class Solution2 {
	static def split_last(str : String, delimiter : char) : String[] {
		var idx = str.lastIndexOf(delimiter)
		if (idx >= 0) {
			return #[
				str.substring(0, idx),
				str.substring(idx + 1, str.length)
			]
		}
		return #[str]
	}
	static def main(args : String*) {
		println("W3,RESOURCE,id".split_last(","))
	}
}
```



## 43. Exercise 43

```sarl
class Solution {
	static def first_non_repeating_character(str : String) : Character {
		var char_order = newArrayList
		var ctr = newHashMap
		str.chars.forEach[
			if (ctr.containsKey(it)) {
				var n = ctr.getOrDefault(it, 0)
				ctr.put(it, n + 1)
			} else {
				ctr.put(it, 1)
				char_order += it
			}
		]
		return char_order.findFirst[ctr.get(it) == 1] as Character
	}
	static def main(args : String*) {
		println(first_non_repeating_character('abcdef'))
		println(first_non_repeating_character('abcabcdef'))
		println(first_non_repeating_character('aabbcc'))
	}
}
```



## 44. Exercise 44

```sarl
import java.util.List
class Solution {
	static def all_repeat(str : String, n : int) : List<String> {
		var chars = str.toCharArray
		var result = newArrayList
		if (n > 0) {
			var nn = Math::min(n, chars.length)
			while (nn > 0) {
				var nresult = newArrayList
				for (base : result) {
					for (c : chars) {
						nresult += base + (c as String)
					}
				}
				result = nresult
				nn--
			}
		}
		return result
	}
	static def main(args : String*) {
		println(all_repeat('xyz', 3))
		println(all_repeat('xyz', 2))
		println(all_repeat('abcd', 4))
	}
}
```



## 45. Exercise 45

```sarl
class Solution {
	static def first_repeating_character(str : String) : Character {
		var char_order = newArrayList
		var ctr = newHashMap
		str.chars.forEach[
			if (ctr.containsKey(it)) {
				var n = ctr.getOrDefault(it, 0)
				ctr.put(it, n + 1)
			} else {
				ctr.put(it, 1)
				char_order += it
			}
		]
		return char_order.findFirst[ctr.get(it) >= 1] as Character
	}
	static def main(args : String*) {
		println(first_repeating_character('abcdef'))
		println(first_repeating_character('abcabcdef'))
		println(first_repeating_character('aabbcc'))
	}
}
```



## 46. Exercise 46

```sarl
class Solution1 {
	static def first_second(str : String, c : char) : int {
		var i = 0
		var index = -1
		while (i < str.length && index == -1) {
			var cc = str.charAt(i)
			if (cc == c) {
				index = i
			}
			i++
		}
		if (index >= 0) {
			while (i < str.length) {
				var cc = str.charAt(i)
				if (cc == c) {
					return i
				}
				i++
			}
		}
		return -1
	}
	static def main(args : String*) {
		println(first_second('abcabcdef', 'a'))
		println(first_second('abcabcdef', 'b'))
		println(first_second('abcabcdef', 'c'))
	}
}
class Solution2 {
	static def first_second(str : String, c : char) : int {
		var index = str.indexOf(c)
		if (index >= 0) {
			return str.indexOf(c, index + 1)
		}
		return -1
	}
	static def main(args : String*) {
		println(first_second('abcabcdef', 'a'))
		println(first_second('abcabcdef', 'b'))
		println(first_second('abcabcdef', 'c'))
	}
}
```



## 47. Exercise 47

```sarl
class Solution {
	static def first_repeated_word(str : String) : String {
		var found = newHashSet
		var words = str.split("\s+")
		for (word : words) {
			if (!found.add(word)) {
				return word
			}
		}
		return null
	}
	static def main(args : String*) {
		println(first_repeated_word("ab ca bc ab"))
		println(first_repeated_word("ab ca bc ab ca ab bc"))
		println(first_repeated_word("ab ca bc ca ab bc"))
		println(first_repeated_word("ab ca bc"))
	}
}
```



## 48. Exercise 48

```sarl
class Solution {
	static def word_count(str : String) : String {
		var counts = newHashMap
		var words = str.split("\s+")
		for (word : words) {
			var n = counts.getOrDefault(word, 0)
			counts.put(word, n + 1)
		}
		var e = counts.entrySet.sortWith[a, b | b.value <=> a.value].get(1)
		return e.key
	}
   
	static def main(args : String*) {
		println(word_count("Both of these issues are fixed by postponing the evaluation of annotations. Instead of compiling code which executes expressions in annotations at their definition time, the compiler stores the annotation in a string form equivalent to the AST of the expression in question. If needed, annotations can be resolved at runtime using typing.get_type_hints(). In the common case where this is not required, the annotations are cheaper to store (since short strings are interned by the interpreter) and make startup time faster."))
	}
}
```



## 49. Exercise 49

```sarl
class Solution1 {
	static def remove_spaces(str : String) : String {
		var out = new StringBuilder
		for (var i = 0; i < str.length; i++) {
			var c = str.charAt(i)
			if (!Character::isWhitespace(c)) {
				out.append(c)
			}
		}
		return out.toString
	}
   
	static def main(args : String*) {
		println(remove_spaces("Both of these issues are fixed by postponing the evaluation of annotations."))
	}
}
class Solution2 {
	static def remove_spaces(str : String) : String {
		str.replaceAll("\s+", "")
	}
   
	static def main(args : String*) {
		println(remove_spaces("Both of these issues are fixed by postponing the evaluation of annotations."))
	}
}
```



## 50. Exercise 50

```sarl
import java.util.Map
class Solution {
	static def nb_chars(str : String) : Map<Character, Integer> {
		var map = newHashMap
		str.chars.forEach[
			var c = it as char
			var n = map.getOrDefault(c, 0)
			map.put(c, n + 1)
		]
		return map
	}
	static def common_chars(str1 : String, str2 : String) : String {
		var d1 = str1.nb_chars
		var d2 = str2.nb_chars
		var common_dict = newArrayList
		for (k : d1.keySet) {
			if (d2.containsKey(k)) {
				common_dict += k
			}
		}
		return common_dict.sort.join
	}
	static def main(args : String*) {
		var str1 = 'Python'
		var str2 = 'PHP'
		println("Two strings: " + str1 + ' : ' + str2)
		println(common_chars(str1, str2))
		str1 = 'Java'
		str2 = 'PHP'
		println("Two strings: " + str1 + ' : ' + str2)
		println(common_chars(str1, str2))
	}
}
```



## 51. Exercise 51

```sarl
import java.util.Map
class Solution {
	static def nb_chars(str : String) : Map<Character, Integer> {
		var map = newHashMap
		str.chars.forEach[
			var c = it as char
			var n = map.getOrDefault(c, 0)
			map.put(c, n + 1)
		]
		return map
	}
	static def make_anagram(str1 : String, str2 : String) : int {
		var str1_map = str1.nb_chars
		var str2_map = str2.nb_chars
		var ctr = 0
		for (e : str2_map.entrySet) {
			if (str1_map.containsKey(e.key)) {
				ctr += Math::max(0, e.value - str1_map.get(e.key))
			} else {
				ctr += e.value
			}
		}
		for (e : str1_map.entrySet) {
			if (str2_map.containsKey(e.key)) {
				ctr += Math::max(0, e.value - str2_map.get(e.key))
			} else {
				ctr += e.value
			}
		}
		return ctr
	}
	static def main(args : String*) {
		var str1 = args.get(0)
		var str2 = args.get(1)
		println(make_anagram(str1, str2))
	}
}
```



## 52. Exercise 52

```sarl
import java.util.Map
class Solution {
	static def remove_duplicates(str : String) : String {
   		var i = 0
		var j = 0
		var newElements = new StringBuilder
		while (j < str.length) {
			if (str.charAt(i) == str.charAt(j)) {
				j++
			} else if (str.charAt(j) != str.charAt(i) || j == str.length() - 1) {
				newElements.append(str.charAt(i))
				i = j
				j++
			}
		}
		newElements.append(str.charAt(j - 1))
		return newElements.toString
	}
	static def main(args : String*) {
		println("aaaaabbbbbb".remove_duplicates)
		println("geeksforgeeks".remove_duplicates)
		println("aabccba".remove_duplicates)
	}
}
```


## 53. Exercise 53

```sarl
import java.util.Set
class Solution {
	static def longest_substring(s : String, t : String) : Set<String> {
		var m = s.length
		var n = t.length
		var counter = newArrayList
		for (x : 0..m) {
			var lst = newArrayList
			for (i : 1..n) {
				lst += 0
			}
			counter.add(lst)
		}
		var longest = 0
		var lcs_set = newHashSet
		for (i : 0..<m) {
			for (j : 0..<n) {
				if (s.charAt(i) == t.charAt(j)) {
					var c = counter.get(i).get(j) + 1
					counter.get(i + 1).set(j, c)
					if (c >= longest) {
						if (c > longest) {
						lcs_set = newHashSet
						longest = c
						}
						lcs_set += s.substring(i - c + 1, i+2)
					}
				}
			}
		}
		return lcs_set
	}
	static def main(args : String*) {
		println(longest_substring('abcdefgh', 'xswerabcdwd'))
	}
}
```



## 54. Exercise 54

```sarl
import java.util.Set
class Solution {
	static def count_chars(str : String) : int[] {
		var upper_ctr = 0
		var lower_ctr = 0
		var number_ctr = 0
		var special_ctr = 0
		for (i : 0..<str.length) {
			if (str.charAt(i) >= 'A' && str.charAt(i) <= 'Z') {
				upper_ctr++
			} else if (str.charAt(i) >= 'a' && str.charAt(i) <= 'z') {
				lower_ctr++
			} else if (str.charAt(i) >= '0' && str.charAt(i) <= '9') {
				number_ctr++
			}  else {
				special_ctr++
			}
		}
		return #[upper_ctr, lower_ctr, number_ctr, special_ctr]
	}
	static def main(args : String*) {
		var str = "@W3Resource.Com"
		println("Original Substrings:" + str)
		var t = count_chars(str)
		println('Upper case characters: ' + t.get(0))
		println('Lower case characters: ' + t.get(1))
		println('Number case: ' + t.get(2))
		println('Special case characters: ' + t.get(3))
	}
}
```



## 55. Exercise 55

```sarl
class Solution {
	static def wrap(str : String, width : int) : String {
		var words = str.split("\s+")
		var buffer = new StringBuilder
		var line = new StringBuilder
		for (word : words) {
			line.append(word)
			if (line.length >= width) {
				if (buffer.length > 0) {
					buffer.append("n")
				}
				buffer.append(line)
				line.length = 0
			}
		}
		if (line.length >= 0) {
			if (buffer.length > 0) {
				buffer.append("n")
			}
			buffer.append(line)
		}
		return buffer.toString
	}
	static def main(args : String*) {
		println("The quick brown fox.".wrap(10))
	}
}
```



## 56. Exercise 56

```sarl
import static extension java.lang.Character.*
class Solution {
	static def swap(str : String) : String {
		var out = new StringBuilder
		for (c : str.toCharArray) {
			if (c.isLowerCase) {
				out.append(c.toUpperCase)
			} else if (c.isUpperCase) {
				out.append(c.toLowerCase)
			} else {
				out.append(c)
			}
		}
		return out.toString
	}
	static def main(args : String*) {
		println("SARL eXERiCISES".swap)
	}
}
```



## 57. Exercise 57

```sarl
import static extension java.lang.Character.*
import java.util.List
class Solution {
	static var messages : List<(String) => String> = #[
		[if (it.chars.anyMatch[c|c.isUpperCase]) null else 'String must have 1 upper case character.'],
		[if (it.chars.anyMatch[c|c.isLowerCase]) null else 'String must have 1 lower case character.'],
		[if (it.chars.anyMatch[c|c.isDigit]) null else 'String must have 1 number.'],
		[if (it.length >= 8) null else 'String length should be at least 8.']
	]
	static def check_string(str : String) : String {
		var r = messages.findFirst[it.apply(str) !== null].apply(str)
		if (r === null) {
			r = "Valid string."
		}
		return r
	}
	static def main(args : String*) {
		println(args.get(0).check_string)
	}
}
```



## 58. Exercise 58

```sarl
import java.util.List
class Solution1 {
	static var original= #['Red', 100, -50, 'green', 'w,3,r', 12.12, false]
	static def convert(list : List<?>) : String {
		var out = new StringBuilder
		for (element : list) {
			if (out.length > 0) {
				out.append(",")
			}
			out.append(element)
		}
		return out.toString
	}
	static def main(args : String*) {
		println(original.convert)
	}
}
class Solution2 {
	static var original= #['Red', 100, -50, 'green', 'w,3,r', 12.12, false]
	static def convert(list : List<?>) : String {
		list.join(',')
	}
	static def main(args : String*) {
		println(original.convert)
	}
}
```



## 59. Exercise 59

```sarl
import java.util.List
class Solution1 {
	static def toNumber(str : String) : Number {
		try {
			return Long::valueOf(str)
		} catch (ex : Throwable) {
		}
		try {
			return Double::valueOf(str)
		} catch (ex : Throwable) {
		}
		return null
	}
	static def extract(str : String) : List<? extends Number> {
		var words = str.split("\s+")
		var out = newArrayList
		for (word : words) {
			var n = word as Number
			if (n !== null) {
				out += n
			}
		}
		return out
	}
	static def main(args : String*) {
		println("red 12 black 45 green".extract)
	}
}
class Solution2 {
	static def toNumber(str : String) : Number {
		try {
			return Long::valueOf(str)
		} catch (ex : Throwable) {
		}
		try {
			return Double::valueOf(str)
		} catch (ex : Throwable) {
		}
		return null
	}
	static def extract(str : String) : List<? extends Number> {
		str.split("\s+").map[it as Number].filter[it !== null].toList
	}
	static def main(args : String*) {
		println("red 12 black 45 green".extract)
	}
}
```



## 60. Exercise 60

```sarl
import com.google.common.base.Strings
class Solution1 {
	static def hide(str : String) : String {
		var words = str.split("\s+")
		var out = new StringBuilder
		for (word : words) {
			if (out.length > 0) {
				out.append(" ")
			}
			if (word.length >= 5) {
				for (i : 1..word.length) {
					out.append("#")
				}
			} else {
				out.append(word)
			}
		}
		return out.toString
	}
	static def main(args : String*) {
		println("Count the lowercase letters in the said list of words:".hide)
	}
}
class Solution2 {
	static def hide(str : String) : String {
		str.split("\s+").map[
			if (it.length >= 5) {
				Strings.repeat("#", it.length)
			} else {
				it
			}
		].join(" ")
	}
	static def main(args : String*) {
		println("Count the lowercase letters in the said list of words:".hide)
	}
}
```




## 61. Legal Notice

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
