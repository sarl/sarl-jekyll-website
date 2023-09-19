---
title: "Introduction to Lambda Expressions with SARL"
layout: default
---

# Introduction to Lambda Expressions with SARL


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


<p markdown="1"><span class="label label-info">Note</span> If you don't know how to solve an problem, or what is the function to be used, you could search on Internet for the answer using the API of the Java programming language. Indeed, since SARL is fully compatible with the Java API, you could use all the types or functions that are defined in this Java API.</p>


## 1. Exercise 1

Write a SARL program to create a lambda function that adds 15 to a given number passed in as an argument, also create a lambda function that multiplies argument x with argument y and prints the result.

* Sample Output:

```
25
48
```

> [Solution](IntroductionLambdaAnswers.html#exercise-1)


## 2. Exercise 2

Write a SARL program to create a function that takes one argument, and that argument will be multiplied with an unknown given number.

* Sample Output:

```
Double the number of 15 = 30
Triple the number of 15 = 45
Quadruple the number of 15 = 60
Quintuple the number 15 = 75
```

> [Solution](IntroductionLambdaAnswers.html#exercise-2)


## 3. Exercise 3

Write a SARL program to sort a list of tuples using Lambda.

* Original list of tuples: `[('English', 88), ('Science', 90), ('Maths', 97), ('Social sciences', 82)]`
* Sorting the list of tuples: `[('Social sciences', 82), ('English', 88), ('Science', 90), ('Maths', 97)]`

> [Solution](IntroductionLambdaAnswers.html#exercise-3)


## 4. Exercise 4

Write a SARL program to sort a list of dictionaries using Lambda.

* Original list of maps: `[{'make': 'Nokia', 'model': 216, 'color': 'Black'}, {'make': 'Mi Max', 'model': '2', 'color': 'Gold'}, {'make': 'Samsung', 'model': 7, 'color': 'Blue'}]`
* Sorting the list of maps: `[{'make': 'Nokia', 'model': 216, 'color': 'Black'}, {'make': 'Samsung', 'model': 7, 'color': 'Blue'}, {'make': 'Mi Max', 'model': '2', 'color': 'Gold'}]`

> [Solution](IntroductionLambdaAnswers.html#exercise-4)


## 5. Exercise 5

Write a SARL program to filter a list of integers using Lambda.

* Original list of integers: `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`
* Even numbers from the said list: `[2, 4, 6, 8, 10]`
* Odd numbers from the said list: `[1, 3, 5, 7, 9]`

> [Solution](IntroductionLambdaAnswers.html#exercise-5)


## 6. Exercise 6

Write a SARL program to square and cube every number in a given list of integers using Lambda.

* Original list of integers: `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`
* Square every number of the said list: `[1, 4, 9, 16, 25, 36, 49, 64, 81, 100]`
* Cube every number of the said list: `[1, 8, 27, 64, 125, 216, 343, 512, 729, 1000]`

> [Solution](IntroductionLambdaAnswers.html#exercise-6)


## 7. Exercise 7

Write a SARL program to find if a given string starts with a given character using Lambda.

> [Solution](IntroductionLambdaAnswers.html#exercise-7)


## 8. Exercise 8

Write a SARL program to extract year, month, date and time using Lambda.

* Sample Output:

```
2020-01-15 09:03:32.744178
2020
1
15
09:03:32.744178
```

> [Solution](IntroductionLambdaAnswers.html#exercise-8)


## 9. Exercise 9

Write a SARL program to check whether a given string is a number or not using Lambda.

* Sample Output:

```
26587 : true
4.2365 : true
-12547 : false
00 : true
Z001 : false
001 : true
-16.4 : true
-24587.11 : true
```

> [Solution](IntroductionLambdaAnswers.html#exercise-9)


## 10. Exercise 10

Write a SARL program to create Fibonacci series up to n using Lambda.

* Fibonacci series upto 2: `[0, 1]`
* Fibonacci series upto 5: `[0, 1, 1, 2, 3]`
* Fibonacci series upto 6: `[0, 1, 1, 2, 3, 5]`
* Fibonacci series upto 9: `[0, 1, 1, 2, 3, 5, 8, 13, 21]`

> [Solution](IntroductionLambdaAnswers.html#exercise-10)



## 11. Exercise 11

Write a SARL program to find the intersection of two given arrays using Lambda.

* Original arrays:

```
[1, 2, 3, 5, 7, 8, 9, 10]
[1, 2, 4, 8, 9]
```

* Intersection of the said arrays: `[1, 2, 8, 9]`

> [Solution](IntroductionLambdaAnswers.html#exercise-11)


## 12. Exercise 12

Write a SARL program to rearrange positive and negative numbers in a given array using Lambda.

* Original arrays: `[-1, 2, -3, 5, 7, 8, 9, -10]`
* Rearrange positive and negative numbers of the said array: `[2, 5, 7, 8, 9, -10, -3, -1]`

> [Solution](IntroductionLambdaAnswers.html#exercise-12)


## 13. Exercise 13

Write a SARL program to count the even and odd numbers in a given array of integers using Lambda.

* Original arrays: `[1, 2, 3, 5, 7, 8, 9, 10]`
* Number of even numbers in the above array: `3`
* Number of odd numbers in the above array: `5`

> [Solution](IntroductionLambdaAnswers.html#exercise-13)


## 14. Exercise 14

Write a SARL program to filter a given list to determine if the values in the list have a length of 6 using Lambda.

* Sample Output:

```
Monday
Friday
Sunday
```

> [Solution](IntroductionLambdaAnswers.html#exercise-14)


## 15. Exercise 15

Write a SARL program to add two given lists using map and lambda.

* Original list:

```
[1, 2, 3]
[4, 5, 6]
```

* Result: after adding two list `[5, 7, 9]`

> [Solution](IntroductionLambdaAnswers.html#exercise-15)


## 16. Exercise 16

Write a SARL program to find the second lowest total marks of any student(s) from the given names and marks of each student using lists and lambda. Input the number of students, the names and grades of each student.

* Names and Grades of all students: `[['S ROY', 1.0], ['B BOSE', 3.0], ['N KAR', 2.0], ['C DUTTA', 1.0], ['G GHOSH', 1.0]]`

```
Second lowest grade: 2.0
Names: N KAR
```

> [Solution](IntroductionLambdaAnswers.html#exercise-16)


## 17. Exercise 17

Write a SARL program to find numbers divisible by nineteen or thirteen from a list of numbers using Lambda.

* Orginal list: `[19, 65, 57, 39, 152, 639, 121, 44, 90, 190]`
* Numbers of the above list divisible by nineteen or thirteen: `[19, 65, 57, 39, 152, 190]`

> [Solution](IntroductionLambdaAnswers.html#exercise-17)


## 18. Exercise 18

Write a SARL program to find palindromes in a given list of strings using Lambda.

* Orginal list of strings: `['php', 'w3r', 'SARL', 'abcd', 'Java', 'aaa']`
* List of palindromes: `['php', 'aaa']`

> [Solution](IntroductionLambdaAnswers.html#exercise-18)


## 19. Exercise 19

Write a SARL program to find all anagrams of a string in a given list of strings using Lambda.

* Original list of strings: `['bcda', 'abce', 'cbda', 'cbea', 'adcb']`
* Anagrams of 'abcd' in the above string: `['bcda', 'cbda', 'adcb']`

> [Solution](IntroductionLambdaAnswers.html#exercise-19)


## 20. Exercise 20

Write a SARL program to find the numbers in a given string and store them in a list. Afterward, display the numbers that are longer than the length of the list in sorted form. Use the lambda function to solve the problem.

* Original string: `sdf 23 safs8 5 sdfsd8 sdfs 56 21sfs 20 5`
* Numbers in sorted form: `20 23 56`

> [Solution](IntroductionLambdaAnswers.html#exercise-20)


## 21. Exercise 21

Write a SARL program that multiplies each number in a list with a given number using lambda functions. Print the results.

* Original list: `[2, 4, 6, 9, 11]`
* Given number: `2`
* Result: `4 8 12 18 22`

> [Solution](IntroductionLambdaAnswers.html#exercise-21)


## 22. Exercise 22

Write a SARL program that sums the length of a list of names after removing those that start with lowercase letters. Use the lambda function.

* Result: `16`

> [Solution](IntroductionLambdaAnswers.html#exercise-22)


## 23. Exercise 23

Write a SARL program to calculate the sum of the positive and negative numbers of a given list of numbers using the lambda function.

* Original list: `[2, 4, -6, -9, 11, -12, 14, -5, 17]`
* Sum of the positive numbers: `-32`
* Sum of the negative numbers: `48`

> [Solution](IntroductionLambdaAnswers.html#exercise-23)


## 24. Exercise 24

Write a SARL program to find numbers within a given range where every number is divisible by every digit it contains.

* Input Range: `1..22`
* Sample Output: `[1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 12, 15, 22]`

> [Solution](IntroductionLambdaAnswers.html#exercise-24)


## 25. Exercise 25

Write a SARL program to create the next bigger number by rearranging the digits of a given number.

* Original number: `12`
* Next bigger number: `21`
* Original number: `10`
* Next bigger number: `null`
* Original number: `201`
* Next bigger number: `210`
* Original number: `102`
* Next bigger number: `120`
* Original number: `445`
* Next bigger number: `454`

> [Solution](IntroductionLambdaAnswers.html#exercise-25)


## 26. Exercise 26

Write a SARL program to find a list with maximum and minimum length using lambda.

* Original list: `[[0], [1, 3], [5, 7], [9, 11], [13, 15, 17]]`
* List with maximum length of lists: `(3, [13, 15, 17])`
* List with minimum length of lists: `(1, [0])`

> [Solution](IntroductionLambdaAnswers.html#exercise-26)


## 27. Exercise 27

Write a SARL program to sort each sublist of strings in a given list of lists using lambda.

* Original list: `[['green', 'orange'], ['black', 'white'], ['white', 'black', 'orange']]`
* After sorting each sublist of the said list of lists: `[['green', 'orange'], ['black', 'white'], ['black', 'orange', 'white']]`

> [Solution](IntroductionLambdaAnswers.html#exercise-27)


## 28. Exercise 28

Write a SARL program to sort a given list of lists by length and value using lambda.

* Original list: `[[2], [0], [1, 3], [0, 7], [9, 11], [13, 15, 17]]`
* Sort the list of lists by length and value: `[[0], [2], [0, 7], [1, 3], [9, 11], [13, 15, 17]]`

> [Solution](IntroductionLambdaAnswers.html#exercise-28)


## 29. Exercise 29

Write a SARL program to find the maximum value in a given heterogeneous list using lambda.

* Original list: `['SARL', 3, 2, 4, 5, 'version']`
* Maximum values in the said list using lambda: `5`

> [Solution](IntroductionLambdaAnswers.html#exercise-29)


## 30. Exercise 30

Write a SARL program to sort a given matrix in ascending order according to the sum of its rows using lambda.

* Original Matrix: `[[1, 2, 3], [2, 4, 5], [1, 1, 1]]`
* Sort the said matrix in ascending order according to the sum of its rows: `[[1, 1, 1], [1, 2, 3], [2, 4, 5]]`
* Original Matrix: `[[1, 2, 3], [-2, 4, -5], [1, -1, 1]]`
* Sort the said matrix in ascending order according to the sum of its rows: `[[-2, 4, -5], [1, -1, 1], [1, 2, 3]]`

> [Solution](IntroductionLambdaAnswers.html#exercise-30)



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
