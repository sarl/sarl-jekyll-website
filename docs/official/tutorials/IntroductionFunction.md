---
title: "Introduction to Functions with SARL"
layout: default
---

# Introduction to Functions with SARL


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


<p markdown="1"><span class="label label-info">Note</span> If you don't know how to solve an problem, or what is the function to be used, you could search on Internet for the answer using the API of the Java programming language. Indeed, since SARL is fully compatible with the Java API, you could use all the types or functions that are defined in this Java API.</p>


## 1. Exercise 1

Write a SARL function to find the maximum of three numbers.

> [Solution](IntroductionFunctionAnswers.html#exercise-1)


## 2. Exercise 2

Write a SARL function to sum all the numbers in a list.

* Sample List: `(8, 2, 3, 0, 7)`
* Expected Output: `20`

> [Solution](IntroductionFunctionAnswers.html#exercise-2)


## 3. Exercise 3

Write a SARL function to multiply all the numbers in a list.

* Sample List: `(8, 2, 3, -1, 7)`
* Expected Output: `-336`

> [Solution](IntroductionFunctionAnswers.html#exercise-3)


## 4. Exercise 4

Write a SARL program to reverse a string.

* Sample String: `1234abcd`
* Expected Output: `dcba4321`

> [Solution](IntroductionFunctionAnswers.html#exercise-4)


## 5. Exercise 5

Write a SARL function to calculate the factorial of a number (a non-negative integer). The function accepts the number as an argument.

> [Solution](IntroductionFunctionAnswers.html#exercise-5)


## 6. Exercise 6

Write a SARL function to check whether a number falls within a given range.

> [Solution](IntroductionFunctionAnswers.html#exercise-6)


## 7. Exercise 7

Write a SARL function that accepts a string and counts the number of upper and lower case letters.

* Sample String: `The quick Brow Fox`
* Expected Output:

```text
No. of Upper case characters : 3
No. of Lower case Characters : 12
```

> [Solution](IntroductionFunctionAnswers.html#exercise-7)


## 8. Exercise 8

Write a SARL function that takes a list and returns a new list with distinct elements from the first list.

* Sample List: `[1,2,3,3,3,3,4,5]`
* Unique List: `[1, 2, 3, 4, 5]`

> [Solution](IntroductionFunctionAnswers.html#exercise-8)


## 9. Exercise 9

Write a SARL function that takes a number as a parameter and checks whether the number is prime or not.
A prime number (or a prime) is a natural number greater than 1 and that has no positive divisors other than 1 and itself.

> [Solution](IntroductionFunctionAnswers.html#exercise-9)


## 10. Exercise 10

Write a SARL program to print the even numbers from a given list.

* Sample List: `[1, 2, 3, 4, 5, 6, 7, 8, 9]`
* Expected Result: `[2, 4, 6, 8]`

> [Solution](IntroductionFunctionAnswers.html#exercise-10)


## 11. Exercise 11

Write a SARL function to check whether a number is "Perfect" or not.
According to Wikipedia: In number theory, a perfect number is a positive integer that is equal to the sum of its proper positive divisors, that is, the sum of its positive divisors excluding the number itself (also known as its aliquot sum). Equivalently, a perfect number is a number that is half the sum of all of its positive divisors (including itself).

Example: The first perfect number is 6, because 1, 2, and 3 are its proper positive divisors, and 1 + 2 + 3 = 6. Equivalently, the number 6 is equal to half the sum of all its positive divisors: ( 1 + 2 + 3 + 6 ) / 2 = 6. The next perfect number is 28 = 1 + 2 + 4 + 7 + 14. This is followed by the perfect numbers 496 and 8128.

> [Solution](IntroductionFunctionAnswers.html#exercise-11)


## 12. Exercise 12

Write a SARL function that checks whether a passed string is a palindrome or not.
A palindrome is a word, phrase, or sequence that reads the same backward as forward, e.g., `madam` run.

> [Solution](IntroductionFunctionAnswers.html#exercise-12)


## 13. Exercise 13

Write a SARL function to check whether a string is a pangram or not.
Pangrams are words or sentences containing every letter of the alphabet at least once.
For example: `The quick brown fox jumps over the lazy dog` is a pangram.

> [Solution](IntroductionFunctionAnswers.html#exercise-13)


## 14. Exercise 14

Write a SARL program that accepts a hyphen-separated sequence of words as input and prints the words in a hyphen-separated sequence after sorting them alphabetically.

* Sample Items: `green-red-yellow-black-white`
* Expected Result: `black-green-red-white-yellow`

> [Solution](IntroductionFunctionAnswers.html#exercise-14)


## 15. Exercise 15

Write a SARL function to create and print a list where the values are the squares of numbers between 1 and 30 (both included).

> [Solution](IntroductionFunctionAnswers.html#exercise-15)




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
