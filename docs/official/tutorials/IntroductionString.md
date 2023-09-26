---
title: "Introduction to Strings with SARL"
layout: default
---

# Introduction to Strings with SARL


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


<p markdown="1"><span class="label label-info">Note</span> If you don't know how to solve an problem, or what is the function to be used, you could search on Internet for the answer using the API of the Java programming language. Indeed, since SARL is fully compatible with the Java API, you could use all the types or functions that are defined in this Java API.</p>

## 1. Exercise 1

Write a SARL program to calculate the length of a string, providing on the command line.

> [Solution](IntroductionStringAnswers.html#exercise-1)


## 2. Exercise 2

Write a SARL program to count the number of characters (character frequency) in a string.

* Sample String: `google.com`
* Expected Result: `{'g': 2, 'o': 3, 'l': 1, 'e': 1, '.': 1, 'c': 1, 'm': 1}`

> [Solution](IntroductionStringAnswers.html#exercise-2)


## 3. Exercise 3

Write a SARL program to get a string made of the first 2 and last 2 characters of a given string (from the command line). If the string length is less than 2, return the empty string instead.

* Sample String: `w3resource`
* Expected Result: `w3ce`
* Sample String: `w3`
* Expected Result: `w3w3`
* Sample String: ` w`
* Expected Result: Empty String

> [Solution](IntroductionStringAnswers.html#exercise-3)


## 4. Exercise 4

Write a SARL program to get a string from a given string (from the command line) where all occurrences of its first char have been changed to `*`, except the first char itself.

* Sample String: `restart`
* Expected Result: `resta*t`

> [Solution](IntroductionStringAnswers.html#exercise-4)


## 5. Exercise 5

Write a SARL program to get a single string from two given strings (from the command line), separated by a space and swap the first two characters of each string.

* Sample String: `abc`, `xyz`
* Expected Result: `xyc abz`

> [Solution](IntroductionStringAnswers.html#exercise-5)


## 6. Exercise 6

Write a SARL program to add `ing` at the end of a given string (length should be at least 3). If the given string already ends with `ing`, add `ly` instead. If the string length of the given string is less than 3, leave it unchanged.

* Sample String: `abc`
* Expected Result: `abcing`
* Sample String: `string`
* Expected Result: `stringly`

> [Solution](IntroductionStringAnswers.html#exercise-6)


## 7. Exercise 7

Write a SARL program to find the first occurrence of the substrings `not` and `poor` in a given string. If `not` follows `poor`, replace the whole `not`...`poor` substring with `good`. Return the resulting string.

* Sample String: `The lyrics is not that poor!` and `The lyrics is poor!`
* Expected Result: `The lyrics is good!` and `The lyrics is poor!`

> [Solution](IntroductionStringAnswers.html#exercise-7)


## 8. Exercise 8

Write a SARL function that takes a list of words and return the longest word and the length of the longest one.

> [Solution](IntroductionStringAnswers.html#exercise-8)


## 9. Exercise 9

Write a SARL program to remove the nth index character from a nonempty string.

> [Solution](IntroductionStringAnswers.html#exercise-9)


## 10. Exercise 10

Write a SARL program to change a given string to a newly string where the first and last chars have been exchanged.

> [Solution](IntroductionStringAnswers.html#exercise-10)


## 11. Exercise 11

Write a SARL program to remove characters that have odd index values in a given string.

> [Solution](IntroductionStringAnswers.html#exercise-11)


## 12. Exercise 12

Write a SARL program to count the occurrences of each word in a given sentence.

> [Solution](IntroductionStringAnswers.html#exercise-12)


## 13. Exercise 13

Write a SARL script that takes input from the command line and displays that input back in upper and lower cases.

> [Solution](IntroductionStringAnswers.html#exercise-13)


## 14. Exercise 14

Write a SARL program that accepts a comma-separated sequence of words as command line input and prints the distinct words in sorted form (alphanumerically).

* Sample Words: `red, white, black, red, green, black`
* Expected Result: `black`, `green`, `red`, `white`, `red`

> [Solution](IntroductionStringAnswers.html#exercise-14)


## 15. Exercise 15

Write a SARL function to create an HTML string with tags around the word(s).
Sample function and result:

* `['i', 'SARL']` gives `<i>SARL</i>`
* `['b', 'SARL Tutorial']` gives `<b>SARL Tutorial</b>`

> [Solution](IntroductionStringAnswers.html#exercise-15)


## 16. Exercise 16

Write a SARL function to insert a string in the middle of a string.
Sample function and result :

* arguments `('[[]]', 'SARL')` gives `[[SARL]]`
* arguments `('{{}}', 'PHP')` gives `{{PHP}}`

> [Solution](IntroductionStringAnswers.html#exercise-16)


## 17. Exercise 17

Write a SARL function to get a string made of 4 copies of the last two characters of a specified string (length must be at least 2).
Sample function and result :

* `SARL` gives `RLRLRL`
* `Exercises` -> `eseseses`

> [Solution](IntroductionStringAnswers.html#exercise-17)


## 18. Exercise 18

Write a SARL function to get a string made of the first three characters of a specified string. If the length of the string is less than 3, return the original string.
Sample function and result :

* `ipy` gives `ipy`
* `SARL` gives `SAR`

> [Solution](IntroductionStringAnswers.html#exercise-18)


## 19. Exercise 19

Write a SARL function to reverse a string if its length is a multiple of 4.

> [Solution](IntroductionStringAnswers.html#exercise-19)


## 20. Exercise 20

Write a SARL function to convert a given string to all uppercase if it contains at least 2 uppercase characters in the first 4 characters.

> [Solution](IntroductionStringAnswers.html#exercise-20)


## 21. Exercise 21

Write a SARL program to sort a string lexicographically.

> [Solution](IntroductionStringAnswers.html#exercise-21)


## 22. Exercise 22

Write a SARL program to remove a newline in a string.

> [Solution](IntroductionStringAnswers.html#exercise-22)


## 23. Exercise 23

Write a SARL program to check whether a string starts with specified characters.

> [Solution](IntroductionStringAnswers.html#exercise-23)


## 24. Exercise 24

Write a SARL program to create a Caesar encryption.

<p markdown="1"><span class="label label-info">Note</span> In cryptography, a Caesar cipher, also known as Caesar's cipher, the shift cipher, Caesar's code or Caesar shift, is one of the simplest and most widely known encryption techniques. It is a type of substitution cipher in which each letter in the plaintext is replaced by a letter some fixed number of positions down the alphabet. For example, with a left shift of 3, D would be replaced by A, E would become B, and so on. The method is named after Julius Caesar, who used it in his private correspondence.</p>

> [Solution](IntroductionStringAnswers.html#exercise-24)


## 25. Exercise 25

Write a SARL program to remove existing indentation from all of the lines in a given text.

> [Solution](IntroductionStringAnswers.html#exercise-25)


## 26. Exercise 26

Write a SARL program to add prefix text to all of the lines in a string.

> [Solution](IntroductionStringAnswers.html#exercise-26)


## 27. Exercise 27

Write a SARL program to print the real numbers up to 2 decimal places.

> [Solution](IntroductionStringAnswers.html#exercise-27)


## 28. Exercise 28

Write a SARL program to print the real numbers up to 2 decimal places with a sign.

> [Solution](IntroductionStringAnswers.html#exercise-28)


## 29. Exercise 29

Write a SARL program to print the real positive and negative numbers with no decimal places.

> [Solution](IntroductionStringAnswers.html#exercise-29)


## 30. Exercise 30

Write a SARL program to print the integers with zeros to the left of the specified width.

> [Solution](IntroductionStringAnswers.html#exercise-30)


## 31. Exercise 31

Write a SARL program to print the integers with '*' to the right of the specified width.

> [Solution](IntroductionStringAnswers.html#exercise-31)


## 32. Exercise 32

Write a SARL program to count occurrences of a substring in a string, both provided on the command line.

> [Solution](IntroductionStringAnswers.html#exercise-32)


## 33. Exercise 33

Write a SARL program to reverse a string that is provided on the command line.

> [Solution](IntroductionStringAnswers.html#exercise-33)


## 34. Exercise 34

Write a SARL program to reverse words in a string that is provided on the command line.

> [Solution](IntroductionStringAnswers.html#exercise-34)


## 35. Exercise 35

Write a SARL program to print the square and cube symbols in the area of a rectangle and the volume of a cylinder, using the string formatting tool of the API.

* Input variables:

```text
area = 1256.66
volume = 1254.725
decimals = 2
```

* Sample output:

```text
The area of the rectangle is 1256.66cm2
The volume of the cylinder is 1254.725cm3
```

> [Solution](IntroductionStringAnswers.html#exercise-35)


## 36. Exercise 36

Write a SARL program to print the index of a character in a string.

* Sample string: `w3resource`
* Expected output:

```text
Current character w position at 0
Current character 3 position at 1
Current character r position at 2
....
Current character c position at 8
Current character e position at 9
```

> [Solution](IntroductionStringAnswers.html#exercise-36)


## 37. Exercise 37

Write a SARL program to check whether a string contains all letters of the alphabet.

> [Solution](IntroductionStringAnswers.html#exercise-37)


## 38. Exercise 38

Write a SARL program to convert a given string into a list of words.

* Input: `The quick brown fox jumps over the lazy dog.`
* Sample Output:

```text
['The', 'quick', 'brown', 'fox', 'jumps', 'over', 'the', 'lazy', 'dog.']
```

> [Solution](IntroductionStringAnswers.html#exercise-38)


## 39. Exercise 39

Write a SARL program to lowercase the first n characters in a string.

> [Solution](IntroductionStringAnswers.html#exercise-39)


## 40. Exercise 40

Write a SARL program to swap commas and dots in a string.

* Sample string: `32.054,23`
* Expected Output: `32,054.23`

> [Solution](IntroductionStringAnswers.html#exercise-40)


## 41. Exercise 41

Write a SARL program to count and display vowels in text.

> [Solution](IntroductionStringAnswers.html#exercise-41)


## 42. Exercise 42

Write a SARL program to split a string on the last occurrence of the delimiter.

> [Solution](IntroductionStringAnswers.html#exercise-42)


## 43. Exercise 43

Write a SARL program to find the first non-repeating character in a given string.

> [Solution](IntroductionStringAnswers.html#exercise-43)


## 44. Exercise 44

Write a SARL program to print all permutations with a given repetition number of characters of a given string.

> [Solution](IntroductionStringAnswers.html#exercise-44)


## 45. Exercise 45

Write a SARL program to find the first repeated character in a given string.

> [Solution](IntroductionStringAnswers.html#exercise-45)


## 46. Exercise 46

Write a SARL program to find the first repeated character in a given string where the index of the first occurrence is smallest.

> [Solution](IntroductionStringAnswers.html#exercise-46)


## 47. Exercise 47

Write a SARL program to find the first repeated word in a given string.

> [Solution](IntroductionStringAnswers.html#exercise-47)


## 48. Exercise 48

Write a SARL program to find the second most repeated word in a given string.

> [Solution](IntroductionStringAnswers.html#exercise-48)


## 49. Exercise 49

Write a SARL program to remove spaces from a given string.

> [Solution](IntroductionStringAnswers.html#exercise-49)


## 50. Exercise 50

Write a SARL program to find all the common characters in lexicographical order from two given lower case strings. If there are no similar letters print `No common characters`.

> [Solution](IntroductionStringAnswers.html#exercise-50)


## 51. Exercise 51

Write a SARL program to make two given strings (lower case, may or may not be of the same length) anagrams without removing any characters from any of the strings.

> [Solution](IntroductionStringAnswers.html#exercise-51)


## 52. Exercise 52

Write a SARL program to remove all consecutive duplicates of a given string.

> [Solution](IntroductionStringAnswers.html#exercise-52)


## 53. Exercise 53

Write a SARL program to find the longest common sub-string from two given strings.

> [Solution](IntroductionStringAnswers.html#exercise-53)


## 54. Exercise 54

Write a SARL program to count Uppercase, Lowercase, special characters and numeric values in a given string.

> [Solution](IntroductionStringAnswers.html#exercise-54)


## 55. Exercise 55

Write a SARL program to wrap a given string into a paragraph with a given width.

* Input a string: `The quick brown fox.`
* Input the width of the paragraph: `10`
* Result:

```text
The quick
brown fox.
```

> [Solution](IntroductionStringAnswers.html#exercise-55)


## 56. Exercise 56

Write a SARL program to swap cases in a given string.

* Input: `SARL eXERiCISES`
* Output: `sarl ExerIcises`

> [Solution](IntroductionStringAnswers.html#exercise-56)


## 57. Exercise 57

Write a SARL program to check whether a given string contains a capital letter, a lower case letter, a number and a minimum length.

> [Solution](IntroductionStringAnswers.html#exercise-57)


## 58. Exercise 58

Write a SARL program to convert a given heterogeneous list of scalars into a string.
Sample Output:

* Original list: `['Red', 100, -50, 'green', 'w,3,r', 12.12, false]`
* Convert the heterogeneous list of scalars into a string: `Red,100,-50,green,w,3,r,12.12,false`

> [Solution](IntroductionStringAnswers.html#exercise-58)


## 59. Exercise 59

Write a SARL program to extract numbers from a given string.

* Original string: `red 12 black 45 green`
* Extract numbers from the said string: `[12, 45]`

> [Solution](IntroductionStringAnswers.html#exercise-59)


## 60. Exercise 60

Write a SARL program to replace each character of a word of length five and more with a hash character (`#`).

* Original string: `Count the lowercase letters in the said list of words:`
* Replace words (length five or more) with hash characters in the said string: `##### the ######### ####### in the said list of ######`

> [Solution](IntroductionStringAnswers.html#exercise-60)



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
