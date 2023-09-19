---
title: "Introduction to Lists with SARL - Answers"
layout: default
---

# Introduction to Lists with SARL - Answers


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
import java.util.List	
class Solution1 {
	static def sum(list : List<? extends Number>) : Number {
		var s = 0.0
		for (e : list) {
			s += e
		}
		return s
	}
}
class Solution2 {
	static def sum(list : List<? extends Number>) : Number {
		list.reduce[accumulator, current | accumulator.doubleValue + current.doubleValue]
	}
}
```


## 2. Exercise 2

```sarl
import java.util.List	
class Solution1 {
	static def mul(list : List<? extends Number>) : Number {
		var s = 0.0
		for (e : list) {
			s *= e
		}
		return s
	}
}
class Solution2 {
	static def mul(list : List<? extends Number>) : Number {
		list.reduce[accumulator, current | accumulator.doubleValue * current.doubleValue]
	}
}
```


## 3. Exercise 3

```sarl
import java.util.List	
class Solution1 {
	static def maxValue(list : List<? extends Number>) : Number {
		var m : Number = null
		for (e : list) {
			if (m === null || m < e) {
				m = e
			}
		}
		return m
	}
}
class Solution2 {
	static def maxValue(list : List<? extends Number>) : Number {
		list.max[a, b | a <=> b]
	}
}
```


## 4. Exercise 4

```sarl
import java.util.List	
class Solution1 {
	static var original = #['abc', 'xyz', 'aba', '1221']
	static def countStrings(list : List<String>) : int {
		var n = 0
		for (s : list) {
			if (s.length >= 2 && s.charAt(0) == s.charAt(s.length - 1)) {
				n++
			}
		}
		return n
	}
	static def main(args : String*) {
		println(countStrings(original))
	}
}
class Solution2 {
	static var original = #['abc', 'xyz', 'aba', '1221']
	static def countStrings(list : List<String>) : int {
		list.filter[it.length >= 2 && it.charAt(0) == it.charAt(it.length - 1)].size
	}
	static def main(args : String*) {
		println(countStrings(original))
	}
}
```


## 5. Exercise 5

```sarl
import java.util.List	
class Solution {
	static var original = #[#[2, 5], #[1, 2], #[4, 4], #[2, 3], #[2, 1]]
	static def main(args : String*) {
		var result = original.sortWith[a, b | 
			a.get(1) <=> b.get(1)
		]
		println(result)
	}
}
```


## 6. Exercise 6

```sarl
import java.util.List	
class Solution {
	static def remove_duplicates(list : List<?>) {
		var result = newArrayList
		for (e : list) {
			if (!result.contains(e)) {
				result += e
			}
		}
		return result
	}
}
```


## 7. Exercise 7

```sarl
import java.util.List	
class Solution {
	static def enquiry(list : List<?>) {
		list.size === 0
	}
}
```


## 8. Exercise 8

```sarl
import java.util.List	
class Solution {
	static def copy(list : List<?>) {
		var cp = newArrayList
		cp.addAll(list)
		return cp
	}
}
```


## 9. Exercise 9

```sarl
import java.util.List	
class Solution1 {
	static def words(list : List<String>, n : int) {
		var cp = newArrayList
		for (e : list) {
			if (e.length > n) {
				cp += e
			}
		}
		return cp
	}
}
class Solution2 {
	static def words(list : List<String>, n : int) {
		list.filter[it.length > n].toList
	}
}
```


## 10. Exercise 10

```sarl
import java.util.List	
class Solution1 {
	static def common(list1 : List<?>, list2 : List<?>) {
		for (e : list1) {
			if (list2.contains(e)) {
				return true
			}
		}
		return false
	}
}
class Solution2 {
	static def words(list1 : List<String>, list2 : List<?>) {
		list1.exists[list2.contains(it)]
	}
}
```


## 11. Exercise 11

```sarl
class Solution {
	static var original = #['Red', 'Green', 'White', 'Black', 'Pink', 'Yellow']
	static def main(args : String*) {
		original.remove(5)
		original.remove(4)
		original.remove(0)
		println(original)
	}
}
```


## 12. Exercise 12

```sarl
class Solution1 {
	static def main(args : String*) {
		var result = newArrayList
		for (a : 1..3) {
			var dim2 = newArrayList
			for (b : 1..4) {
				var dim3 = newArrayList
				for (c : 1..6) {
					dim3 += '*'
				}
				dim2 += dim3
			}
			result += dim2
		}
		println(result)
	}
}
class Solution2 {
	static def main(args : String*) {
		var result = (1..3).map[
			(1..4).map[
				(1..6).map['*'].toList
			].toList
		].toList
		println(result)
	}
}
```


## 13. Exercise 13

```sarl
import java.util.List
class Solution1 {
	static def remove_even(list : List<Integer>) : List<Integer> {
		var nlist = newArrayList
		for (e : list) {
			if ((e % 2) != 0) {
				nlist += e
			}
		}
		return nlist
	}
}
class Solution2 {
	static def remove_even(list : List<Integer>) : List<Integer> {
		list.filter[(it % 2) != 0].toList
	}
}
```


## 14. Exercise 14

```sarl
import static extension java.util.Collections.shuffle
class Solution {
	static var original = #['Red', 'Green', 'White', 'Black', 'Pink', 'Yellow']
	static def main(args : String*) {
		original.shuffle
		println(original)
	}
}
```


## 15. Exercise 15

```sarl
import java.util.List
class Solution {
	static def swap(elements : Object[], index0 : int, index1 : int) : void {
		var tmp = elements.get(index0)
		elements.set(index0, elements.get(index1))
		elements.set(index1, tmp);
	}
	static def permuts(list : List<Object>) : List<List<Object>> {
		var permuts = newArrayList
		permuts.add(list.immutableCopy)
		if (list.size > 1) {
			var elements = list.toArray
			var indexes = newIntArrayOfSize(list.size)
			var i = 0
			while (i < list.size) {
			    if (indexes.get(i) < i) {
			       swap(elements, if (i % 2 == 0) 0 else indexes.get(i), i)
					permuts.add(newArrayList(elements))
			       indexes.set(i, indexes.get(i) + 1);
			       i = 0
			    } else {
			       indexes.set(i, 0)
			       i++
			    }
			}
		}
		return permuts
	}
}
```


## 16. Exercise 16

```sarl
import java.util.List
class Solution {
	static def difference(a : List<Object>, b : List<Object>) : List<Object> {
		var diff = newArrayList
		for (element : a) {
			if (!b.contains(element)) {
				diff += element
			}
		}
		return diff
	}
}
```


## 17. Exercise 17

```sarl
class Solution1 {
	static var original = #[5, 15, 35, 8, 98]
	static def main(args : String*) {
		var i = 0
		for (element : original) {
			println(i + " " + element)
			i++
		}
	}
}
class Solution2 {
	static var original = #[5, 15, 35, 8, 98]
	static def main(args : String*) {
		for (var i = 0; i < original.size; i++) {
			println(i + " " + original.get(i))
		}
	}
}
class Solution3 {
	static var original = #[5, 15, 35, 8, 98]
	static def main(args : String*) {
		original.forEach [element, index |
			println(index + " " + element)
		]
	}
}
```


## 18. Exercise 18

```sarl
import java.util.List
class Solution1 {
	static var original : List<Character> = #['h', 'e', 'l', 'l', 'o']
	static def main(args : String*) {
		var str = ""
		for (c : original) {
			str += c
		}
		println(str)
	}
}
class Solution2 {
	static var original : List<Character> = #['h', 'e', 'l', 'l', 'o']
	static def main(args : String*) {
		var str_buffer = new StringBuilder
		for (c : original) {
			str_buffer.append(c)
		}
		var str = str_buffer.toString
		println(str)
	}
}
class Solution3 {
	static var original : List<Character> = #['h', 'e', 'l', 'l', 'o']
	static def main(args : String*) {
		var str = original.join("")
		println(str)
	}
}
```


## 19. Exercise 19

```sarl
import java.util.List
class Solution1 {
	static var original : List<Character> = #['h', 'e', 'l', 'l', 'o']
	static def findIndexOf(list : List<?>, element : Object) : int {
		var i = 0
		for (elt : list) {
			if (elt == element) {
				return i
			}
			i++
		}
		return -1
	}
	static def main(args : String*) {
		println(original.findIndexOf('h'))
		println(original.findIndexOf('e'))
		println(original.findIndexOf('l'))
		println(original.findIndexOf('o'))
	}
}
class Solution2 {
	static var original : List<Character> = #['h', 'e', 'l', 'l', 'o']
	static def main(args : String*) {
		println(original.indexOf('h'))
		println(original.indexOf('e'))
		println(original.indexOf('l'))
		println(original.indexOf('o'))
	}
}
```


## 20. Exercise 20

```sarl
import java.util.List
class Solution1 {
	static var original = #[#[4], #[0, 658, 4, 6], #[1, 2, 3]]
	static def flattenList(list : List<List<Integer>>) : List<Integer> {
		var output = newArrayList
		for (sublist : list) {
			for (element : sublist) {
				output += element
			}
		}
		return output
	}
	static def main(args : String*) {
		println(original.flattenList)
	}
}
class Solution2 {
	static var original = #[#[4], #[0, 658, 4, 6], #[1, 2, 3]]
	static def flattenList(list : List<List<Integer>>) : List<Integer> {
		var output = newArrayList
		for (sublist : list) {
			output += sublist
		}
		return output
	}
	static def main(args : String*) {
		println(original.flattenList)
	}
}
class Solution3 {
	static var original = #[#[4], #[0, 658, 4, 6], #[1, 2, 3]]
	static def main(args : String*) {
		println(original.flatten.toList)
	}
}
```


## 21. Exercise 21

```sarl
class Solution1 {
	static var original1 = #[1, 45, 8, 6, 1]
	static var original2 = #[457, -1, 5]
	static def main(args : String*) {
		for (c : original2) {
			original1 += c
		}
		println(original1)
	}
}
class Solution2 {
	static var original1 = #[1, 45, 8, 6, 1]
	static var original2 = #[457, -1, 5]
	static def main(args : String*) {
		original1 += original2
		println(original1)
	}
}
```


## 22. Exercise 22

```sarl
import java.util.Random
class Solution {
	static var original = #[1, 45, 8, 6, 1]
	static def main(args : String*) {
		var random = new Random
		var element = original.get(random.nextInt(original.size))
		println(element)
	}
}
```


## 23. Exercise 23

```sarl
import java.util.List
class Solution {
	static var list1 = #[10, 10, 0, 0, 10]
	static var list2 = #[10, 10, 10, 0, 0]
	static def circularly_identical(list1 : List<Integer>, list2 : List<Integer>) : boolean {
		// doubling list
		var list3 = newArrayList(list1)
	    list3.addAll(list1)
		// traversal in twice of list1
		for (x : 0..<list1.size) {
			var z = 0
			// check if list2 == list1 circularly
	        for (y : x..<(x + list1.size)) {
	            if (list2.get(z) == list3.get(y)) {
	            	z += 1
	            } else {
	            	break
	            }
	        }
	             
			// if all n elements are same circularly
			if (z == list1.size) {
				return true
			}
		}
	    return false
	}
  
	static def main(args : String*) {
		println(circularly_identical(list1, list2))
	}
}
```


## 24. Exercise 24

```sarl
class Solution1 {
	static var original = #[1, 45, -45, 2, 987]
	static def main(args : String*) {
		var smaller : Integer = null
		for (c : original) {
			if (smaller === null || c < smaller) {
				smaller = c
			}
		}
		var secondSmaller : Integer = null
		for (c : original) {
			if (c > smaller && (smaller === null || c < secondSmaller)) {
				secondSmaller = c
			}
		}
		println(secondSmaller)
	}
}
class Solution2 {
	static var original = #[1, 45, -45, 2, 987]
	static def main(args : String*) {
		var smaller = original.min
		var secondSmaller = original.filter[it > smaller].min
		println(secondSmaller)
	}
}
```


## 25. Exercise 25

```sarl
import java.util.List
class Solution1 {
	static var original = #[1, 45, -45, 1, 2, 987, 45]
	static def get_uniq(list : List<Integer>) : List<Integer> {
		var uniq = newArrayList
		for (c : list) {
			if (!uniq.contains(c)) {
				uniq += c
			}
		}
		return uniq
	}
	static def main(args : String*) {
		println(get_uniq(original))
	}
}
class Solution2 {
	static var original = #[1, 45, -45, 1, 2, 987, 45]
	static def get_uniq(list : List<Integer>) : List<Integer> {
		var uniq = newTreeSet(null)
		uniq.addAll(list)
		return uniq.toList
	}
	static def main(args : String*) {
		println(get_uniq(original))
	}
}
```


## 26. Exercise 26

```sarl
import java.util.List
import java.util.Map
class Solution {
	static var original = #[1, 45, -45, 1, 2, 987, 45]
	static def frequency(list : List<T>) : Map<T, Integer> with T {
		var map = newHashMap
		for (c : list) {
			var n = map.getOrDefault(c, 0)
			map.put(c, n + 1)
		}
		return map
	}
	static def main(args : String*) {
		println(frequency(original))
	}
}
```


## 27. Exercise 27

```sarl
import java.util.List
class Solution {
	static var original = #[1, 45, -45, 1, 2, 987, 45]
	static def is_sublist(list : List<Integer>, search_for : List<Integer>) : boolean {
		if (search_for.isEmpty) {
			return true
		}
		if (search_for.size > list.size) {
			return false
		}
		for (i : 0..<list.size) {
			if (list.get(i) == search_for.get(0)) {
				var n = 1
				while ((n < search_for.size) && (list.get(i + n) == search_for.get(n))) {
					n++
				}
				if (n == search_for.size) {
					return true
				}
			}
		}
		return false
	}
	static def main(args : String*) {
		println(is_sublist(original, #[1, 2, 987]))
		println(is_sublist(original, #[1, 987, 2]))
	}
}
```


## 28. Exercise 28

```sarl
import java.util.BitSet
import java.util.List
class Solution1 {
	static def sieve_of_eratosthenes(num : int) {
		var prime = newArrayList
		for (i : 0..num) {
			prime += true
		}
		var p = 2
		while (p * p <= num) {
			// If prime[p] is not changed, then it is a prime
			if (prime.get(p)) {
				// Updating all multiples of p
				for (var i = p * p; i <= num; i += p) {
					prime.set(i, false)
				}
			}
			p += 1
		}
		// Print all prime numbers
		for (p2 : 2..num) {
			if (prime.get(p2)) {
    			println(p2)
    		}
    	}
	}
	static def main(args : String*) {
		sieve_of_eratosthenes(10)
		sieve_of_eratosthenes(20)
	}
}
class Solution2 {
	static def sieve_of_eratosthenes(num : int) {
		var prime = new BitSet(num)
		var p = 2
		while (p * p <= num) {
			// If prime[p] is not changed, then it is a prime
			if (!prime.get(p)) {
				// Updating all multiples of p
				for (var i = p * p; i <= num; i += p) {
					prime.set(i)
				}
			}
			p += 1
		}
		// Print all prime numbers
		for (i : 2..num) {
			if (!prime.get(i)) {
				println(i)
			}
		}
	}
	static def main(args : String*) {
		sieve_of_eratosthenes(10)
		sieve_of_eratosthenes(20)
	}
}
```


## 29. Exercise 29

```sarl
import java.util.List
class Solution {
	static def concat(list : List<String>, num : int) : List<String> {
		var new_list = newArrayList
		for (element : list) {
			for (i : 1..num) {
				new_list += element + i
			}
		}
		return new_list
	}
	static def main(args : String*) {
		println(concat(#['p', 'q'], 5))
	}
}
```


## 30. Exercise 30

```sarl
import java.util.List
class Solution {
	static def common(list1 : List<Integer>, list2 : List<Integer>) : List<Integer> {
		var common_list = newArrayList
		for (element : list1) {
			if (list2.contains(element)) {
				common_list += element
			}
		}
		return common_list
	}
	static def main(args : String*) {
		println(common(#[1, 2, 4, 6], #[2, 34, 6, 122]))
	}
}
```


## 31. Exercise 31

```sarl
import java.util.List
class Solution {
	static def change(list : List<Integer>) : List<Integer> {
		var new_list = newArrayList
		for (var i = 0; i < list.size; i += 2) {
			var tmp = list.get(i)
			list.set(i, list.get(i + 1))
			list.set(i + 1, tmp)
		}
		return new_list
	}
	static def main(args : String*) {
		println(change(#[0,1,2,3,4,5]))
	}
}
```


## 32. Exercise 32

```sarl
import java.util.List
class Solution {
	static def diz(n : int) : int {
		var d = 1
		while (n > d) {
			d *= 10
		}
		return d
	}
	static def merge(list : List<Integer>) : Integer {
		var result = 0
		for (element : list) {
			result *= diz(element)
			result += element
		}
		return result
	}
	static def main(args : String*) {
		println(merge(#[11, 33, 50]))
	}
}
```


## 33. Exercise 33

```sarl
import java.util.List
import java.util.Map
class Solution1 {
	static var original = #[
		'be', 'have', 'do', 'say', 'get', 'make',
		'go', 'know', 'take', 'see', 'come', 'think',
		'look', 'want', 'give', 'use', 'find',
		'tell', 'ask', 'work', 'seem', 'feel',
		'leave', 'call']
	static def split_by_letter(words : List<String>) : Map<Character, List<String>> {
		var map : Map<Character, List<String>> = newHashMap
		for (word : words) {
			var letter = word.charAt(0)
			var list = map.computeIfAbsent(letter, [newArrayList])
			list += word
		}
		return map
	} 
	static def main(args : String*) {
		println(split_by_letter(original))
	}
}
class Solution2 {
	static var original = #[
		'be', 'have', 'do', 'say', 'get', 'make',
		'go', 'know', 'take', 'see', 'come', 'think',
		'look', 'want', 'give', 'use', 'find',
		'tell', 'ask', 'work', 'seem', 'feel',
		'leave', 'call']
	static def split_by_letter(words : List<String>) : Map<Character, List<String>> {
		return words.groupBy[it.charAt(0)]
	} 
	static def main(args : String*) {
		println(split_by_letter(original))
	}
}
```


## 34. Exercise 34

```sarl
class Solution1 {
	static def main(args : String*) {
		var result = newHashMap
		for (i : 1..10) {
			result.computeIfAbsent(i) [newArrayList]
		}
		println(result)
	}
}
class Solution2 {
	static def main(args : String*) {
		var result = (1..10).toInvertedMap[newArrayList]
		println(result)
	}
}
```


## 35. Exercise 35

```sarl
class Solution1 {
	static var original = #[
		#[1, 2], #[3, 4], #[1, 2], #[5, 6], #[7, 8],
		#[1, 2], #[3, 4], #[3, 4], #[7, 8], #[9, 10]
	]
	static def main(args : String*) {
		var result = newArrayList
		for (tuple : original) {
			for (element : tuple) {
				if (!result.contains(element)) {
					result += element
				}
			}
		}
		println(result)
	}
}
class Solution2 {
	static var original = #[
		#[1, 2], #[3, 4], #[1, 2], #[5, 6], #[7, 8],
		#[1, 2], #[3, 4], #[3, 4], #[7, 8], #[9, 10]
	]
	static def main(args : String*) {
		var result = newTreeSet(null)
		for (tuple : original) {
			for (element : tuple) {
				result += element
			}
		}
		println(result)
	}
}
class Solution3 {
	static var original = #[
		#[1, 2], #[3, 4], #[1, 2], #[5, 6], #[7, 8],
		#[1, 2], #[3, 4], #[3, 4], #[7, 8], #[9, 10]
	]
	static def main(args : String*) {
		var result = newTreeSet(null)
		for (tuple : original) {
			result += tuple
		}
		println(result)
	}
}
```


## 36. Exercise 36

```sarl
class Solution1 {
	static var original = #[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
	static def main(args : String*) {
		var result = newArrayList
		for (value : original) {
			if ((value % 2) != 0) {
				result += value
			}
		}
		println(result)
	}
}
class Solution2 {
	static var original = #[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
	static def main(args : String*) {
		var result = original.filter[(it % 2) != 0].toList
		println(result)
	}
}
```


## 37. Exercise 37

```sarl
import java.util.List
class Solution {
	static var original = #[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
	static def appendBefore(list : List<Integer>, prefix : Integer) : List<Integer> {
		var result = newArrayList
		for (element : list) {
			result += prefix
			result += element
		}
		return result
	}
	static def main(args : String*) {
		println(appendBefore(original, 34))
	}
}
```


## 38. Exercise 38

```sarl
import java.util.List
class Solution {
	static var original = #[#['assign1', 'assign2'], #['final','assign4'], #['exam','study']]
	static def main(args : String*) {
		for (list : original) {
			if (!list.isEmpty) {
				var iter = list.iterator
				print(iter.next)
				while (iter.hasNext) {
					print(" " + iter.next)
				}
			}
			println
		}
	}
}
```


## 39. Exercise 39

```sarl
class Solution {
	static var originalNames = #["Black", "Red", "Maroon", "Yellow"]
	static var originalColors = #["#000000", "#FF0000", "#800000", "#FFFF00"]
	static def main(args : String*) {
		var result = newArrayList
		var iter1 = originalNames.iterator
		var iter2 = originalColors.iterator
		while (iter1.hasNext && iter2.hasNext) {
			var map = newHashMap
			map.put('color_name', iter1.next)
			map.put('color_code', iter2.next)
			result += map
		}
		println(result)
	}
}
```


## 40. Exercise 40

```sarl
import java.util.List
class Solution {
	static var original = #['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n']
	static def split_at_n(list : List<String>, n : int) : List<List<String>> {
		var result = newArrayList
		var clist = newArrayList
		for (element : list) {
			if (clist.size == n) {
				result.add(clist)
				clist = newArrayList
			}
			clist += element
		}
		if (!clist.isEmpty) {
			result.add(clist)
		}
		return result
	}
	static def main(args : String*) {
		println(split_at_n(original, 5))
	}
}
```


## 41. Exercise 41

```sarl
import java.util.List
class Solution {
	static var a = #["red", "orange", "green", "blue", "white"]
	static var b = #["black", "yellow", "green", "blue"]
	static def difference(list1 : List<String>, list2 : List<String>) : List<String> {
		var result = newArrayList
		for (element : list1) {
			if (!list2.contains(element)) {
				result += element
			}
		}
		return result
	}
	static def main(args : String*) {
		println(difference(a, b))
		println(difference(b, a))
	}
}
```


## 42. Exercise 42

```sarl
import java.util.List
class Solution {
	static def replace_last(list1 : List<Integer>, list2 : List<Integer>) : List<Integer> {
		var result = newArrayList
		result += list1.subList(0, list1.size - 1)
		result += list2
		return result
	}
	static def main(args : String*) {
		println(replace_last(#[1, 3, 5, 7, 9, 10], #[2, 4, 6, 8]))
	}
}
```


## 43. Exercise 43

```sarl
import java.util.List
class Solution {
	static def exist_in(list : List<Integer>, position : int) : boolean {
		0 <= position && position < list.size
	}
	static def main(args : String*) {
		println(exist_in(#[1, 3, 5, 7, 9, 10], 3))
		println(exist_in(#[1, 3, 5, 7, 9, 10], 8))
	}
}
```


## 44. Exercise 44

```sarl
import java.util.List
class Solution1 {
	static var original = #[1, 2, 3, 4]
	static def append_prefix(list : List<Integer>, prefix : String) : List<String> {
		var result = newArrayList
		for (element : list) {
			result += prefix + element
		}
		return result
	}
	static def main(args : String*) {
		println(append_prefix(original, "emp"))
	}
}
class Solution2 {
	static var original = #[1, 2, 3, 4]
	static def append_prefix(list : List<Integer>, prefix : String) : List<String> {
		list.map[prefix + it].toList
	}
	static def main(args : String*) {
		println(append_prefix(original, "emp"))
	}
}
```


## 45. Exercise 45

```sarl
import java.util.List
import java.util.Iterator
class Solution1 {
	static var original1 = #[1, 2, 3]
	static var original2 = #['red', 'white', 'black']
	static def zip(list1 : List<?>, list2 : List<?>) : List<Object[]> {
		var result : List<Object[]> = newArrayList
		val iter1 = list1.iterator
		val iter2 = list2.iterator
		while (iter1.hasNext && iter2.hasNext) {
			result.add(#[iter1.next, iter2.next])
		}
		return result
	}
	static def main(args : String*) {
		for (tuple : zip(original1, original2)) {
			println(tuple)
		}
	}
}
class Solution2 {
	static var original1 = #[1, 2, 3]
	static var original2 = #['red', 'white', 'black']
	static def zip(list1 : List<?>, list2 : List<?>) : Iterable<Object[]> {
		[
			val iter1 = list1.iterator
			val iter2 = list2.iterator
			new Iterator<Object[]> {
				def hasNext : boolean {
					iter1.hasNext && iter2.hasNext
				}
				def next : Object[] {
					var v1 = iter1.next
					var v2 = iter2.next
					return #[v1, v2]
				}
			}
		]
	}
	static def main(args : String*) {
		for (tuple : zip(original1, original2)) {
			println(tuple)
		}
	}
}
```


## 46. Exercise 46

```sarl
import java.util.List
class Solution {
	static var original = #[0, 10, #[20, 30], 40, 50, #[60, 70, 80], #[90, 100, 110, 120]]
	static def flatten_list(list : List<?>) : List<?> {
		var result = newArrayList
		for (element : list) {
			if (element instanceof Iterable) {
				result.addAll(element)
			} else {
				result += element
			}
		}
		return result
	}
	static def main(args : String*) {
		println(flatten_list(original))
	}
}
```



## 47. Exercise 47

```sarl
class Solution {
	static var original = #[0, 0, 1, 2, 3, 4, 4, 5, 6, 6, 6, 7, 8, 9, 4, 4]
	static def main(args : String*) {
		var result = newArrayList
		for (element : original) {
			if (result.isEmpty || element != result.get(result.size - 1)) {
				result += element
			}
		}
		println(result)
	}
}
```


## 48. Exercise 48

```sarl
import java.util.List
class Solution {
	static var original = #[0, 0, 1, 2, 3, 4, 4, 5, 6, 6, 6, 7, 8, 9, 4, 4]
	static def main(args : String*) {
		var result = newArrayList
		var pack : List<Integer> = null
		var prev : Integer = null
		for (element : original) {
			if (element != prev) {
				if (!pack.isNullOrEmpty) {
					result.add(pack)
				}
				pack = newArrayList
			}
			pack += element
			prev = element
		}
		if (!pack.isNullOrEmpty) {
			result.add(pack)
		}
		println(result)
	}
}
```


## 49. Exercise 49

```sarl
import java.util.List
class Solution {
	static var original = #[1, 1, 2, 3, 4, 4, 5, 1]
	static def insert_at(list : List<Integer>, position : int, element : Integer) : List<Integer> {
		var new_list = newArrayList
		new_list.addAll(list)
		if (position >= new_list.size) {
			new_list += element
		} else {
			new_list.add(position, element)
		}
		return new_list
	}
	static def main(args : String*) {
		println(insert_at(original, 3, 12))
	}
}
```


## 50. Exercise 50

```sarl
import java.util.List
import java.util.Random
class Solution {
	static var original = #[1, 1, 2, 3, 4, 4, 5, 1]
	static def extract_random(list : List<Integer>, n : int) : List<Integer> {
		var new_list = newArrayList
		if (n <= list.size) {
			new_list.addAll(list)
		} else {
			var random = new Random
			var selected = newHashSet
			for (i : 1..n) {
				var rnd = random.nextInt(list.size)
				while (!selected.add(rnd)) {
					rnd = random.nextInt(list.size)
				}
				new_list.add(list.get(rnd))
			}
		}
		return new_list
	}
	static def main(args : String*) {
		println(extract_random(original, 3))
	}
}
```


## 51. Exercise 51

```sarl
class Solution {
	static var original = #[1, 2, 3, 4, 5, 6, 7, 8, 9]
	static def main(args : String*) {
		var result = newArrayList
		for (var i = 0; i < original.size - 1; i++) {
			var elt0 = original.get(i)
			for (var j = i + 1; j < original.size; j++) {
				var elt1 = original.get(j)
				result.add(#[elt0, elt1])
			}
		}
		println(result)
	}
}
```


## 52. Exercise 52

```sarl
class Solution1 {
	static var original = #[22.4, 4.0, -16.22, -9.1, 11.0, -12.22, 14.2, -5.2, 17.5]
	static def main(args : String*) {
		var sum = 0l
		for (element : original) {
			sum += Math::round(element)
		}
		println(sum * original.size)
	}
}
class Solution2 {
	static var original = #[22.4, 4.0, -16.22, -9.1, 11.0, -12.22, 14.2, -5.2, 17.5]
	static def main(args : String*) {
		var result = original.size * original.map[Math::floor(it)].reduce[accumulator, current| accumulator + current]
		println(result)
	}
}
```


## 53. Exercise 53

```sarl
import java.util.List
class Solution {
	static def create_multidimensional_list(a : int, b : int) : List<List<Integer>> {
		var list = newArrayList
		for (i : 1..a) {
			var sublist = newArrayList
			for (j : 1..b) {
				sublist += 0
			}
			list.add(sublist)
		}
		return list
	}
	static def main(args : String*) {
		println(create_multidimensional_list(3, 2))
	}
}
```


## 54. Exercise 54

```sarl
import java.util.List
class Solution {
	static def input_matrix(args : String[]) : List<List<Integer>> {
		var n = args.get(0) as int
		var m = newArrayList
		var k = 1
		for (i : 1..n) {
			var row = newArrayList
			for (j : 1..n) {
				row.add(args.get(k) as int)
				k++
			}
			m.add(row)
		}
		return m
	}
	static def sum_diag(matrix : List<List<Integer>>) : int {
		var sum = 0
		for (i : 0..<matrix.size) {
			sum += matrix.get(i).get(i)
		}
		return sum
	}
	static def main(args : String*) {
		var matrix = input_matrix(args)
		var result = sum_diag(matrix)
		println(result)
	}
}
```


## 55. Exercise 55

```sarl
import java.util.List
import java.util.Iterator
class Solution {
	static var original1 = #[#[1, 3], #[5, 7], #[9, 11]]
	static var original2 = #[#[2, 4], #[6, 8], #[10, 12, 14]]
	static def zip(list1 : List<List<Integer>>, list2 : List<List<Integer>>) : List<List<Integer>> {
		var iter1 = list1.iterator
		var iter2 = list2.iterator
		var result = newArrayList
		while (iter1.hasNext && iter2.hasNext) {
			var sublist = newArrayList
			sublist.addAll(iter1.next)
			sublist.addAll(iter2.next)
			result.add(sublist)
		}
		if (iter1.hasNext) {
			do {
				result.add(iter1.next)
			} while (iter1.hasNext)
		} else if (iter2.hasNext) {
			do {
				result.add(iter2.next)
			} while (iter2.hasNext)
		}
		return result
	}
	static def main(args : String*) {
		var result = zip(original1, original2)
		println(result)
	}
}
```


## 56. Exercise 56

```sarl
import java.util.List
class Solution {
	static var original = #[1, 1, 3, 4, 4, 5, 6, 7]
	static def isseq(list : List<Integer>, i : int, n : int) : boolean {
		var elt = list.get(i)
		for (var j = i + 1; j < n; j++) {
			if (list.get(j) != elt) {
				return false
			}
		}
		return true
	}
	static def extract(list : List<Integer>, n : int) : List<Integer> {
		var result = newArrayList
		for (var i = 0; i <= list.size - n; i++) {
			if (isseq(list, i, n)) {
				result += list.get(i)
			}
		}
		return result
	}
	static def main(args : String*) {
		var result = extract(original, 2)
		println(result)
	}
}
```


## 57. Exercise 57

```sarl
import java.util.List
class Solution {
	static var original1 = #[1, 1, 3, 4, 4, 5, 6, 7]
	static var original2 = #[0, 1, 2, 3, 4, 4, 5, 7, 8]
	static def average(lists : List<Integer>*) : double {
		var sum = 0.0
		var count = 0
		for (list : lists) {
			count += list.size
			for (elt : list) {
				sum += elt
			}
		}
		return sum / count
	}
	static def main(args : String*) {
		var result = average(original1, original2)
		println(result)
	}
}
```


## 58. Exercise 58

```sarl
import java.util.List
import java.math.BigInteger
class Solution1 {
	static var original = #[1, 'abcd', 3, 1.2, 4, 'xyz', 5, 'pqr', 7, -5, -12.22]
	static def isInteger(value : Object) : boolean {
		value instanceof Integer || value instanceof Long || value instanceof BigInteger
	}
	static def count_integers(list : List<?>) : int {
		var count = 0
		for (element : list) {
			if (element.isInteger) {
				count++
			}
		}
		return count
	}
	static def main(args : String*) {
		println(count_integers(original))
	}
}
class Solution2 {
	static var original = #[1, 'abcd', 3, 1.2, 4, 'xyz', 5, 'pqr', 7, -5, -12.22]
	static def count_integers(list : List<?>) : int {
		list.filter[it instanceof Integer || it instanceof Long || it instanceof BigInteger].size
	}
	static def main(args : String*) {
		println(count_integers(original))
	}
}
```


## 59. Exercise 59

```sarl
import java.util.List
class Solution {
	static var original = #[#[1, 2, 3], #[2, 4, 5], #[1, 1, 1]]
	static def remove_column(list : List<List<Integer>>, col : int) : List<List<Integer>> {
		var rows = newArrayList
		for (row : list) {
			var ncols = newArrayList
			ncols.addAll(row)
			ncols.remove(col)
			rows.add(ncols)
		}
		return rows
	}
	static def main(args : String*) {
		println(remove_column(original, 1))
	}
}
```


## 60. Exercise 60

```sarl
import java.util.List
class Solution {
	static var original = #[#[1, 2, 3], #[2, 4, 5], #[1, 1, 1]]
	static def get_column(list : List<List<Integer>>, col : int) : List<Integer> {
		var column = newArrayList
		for (row : list) {
			column += row.get(col)
		}
		return column
	}
	static def main(args : String*) {
		println(get_column(original, 1))
	}
}
```



## 61. Legal Notice

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
