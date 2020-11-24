---
title: "Operators"
layout: default
---

# Operators


<ul class="page_outline" id="page_outline">

<li><a href="#1-assignments">1. Assignments</a></li>
<li><a href="#2-arithmetic-operators">2. Arithmetic operators</a></li>
<li><a href="#3-comparison-operators">3. Comparison operators</a></li>
<ul>
  <li><a href="#31-comparison-operators-on-primitive-types">3.1. Comparison operators on primitive types</a></li>
  <li><a href="#32-comparison-operators-on-objects">3.2. Comparison operators on objects</a></li>
</ul>
<li><a href="#4-boolean-operators">4. Boolean Operators</a></li>
<li><a href="#5-bitwise-operators">5. Bitwise Operators</a></li>
<li><a href="#6-string-operators">6. String Operators</a></li>
<li><a href="#7-number-range-operators">7. Number Range operators</a></li>
<li><a href="#8-collection-operators">8. Collection Operators</a></li>
<li><a href="#9-other-operators">9. Other operators</a></li>
<li><a href="#10-operator-precedence">10. Operator Precedence</a></li>
<li><a href="#11-operator-overloading">11. Operator Overloading</a></li>
<li><a href="#12-acknowledgements">12. Acknowledgements</a></li>
<li><a href="#13-legal-notice">13. Legal Notice</a></li>

</ul>


SARL supports a collection of operators. Most of them are infix operators, and several are postfix operators.


## 1. Assignments

The assignment operators are listed below. Local variables and fields can be assigned using the `=` operator.
Compound assignment operators (`+=`, `-=`, `*=`, `/=`, and `%=`) can be used as a shorthand for the assignment
of a binary expression. They work automatically when the corresponding infix operator is declared.


| Operator | Operator Semantic                       |
| -------- | --------------------------------------- |
| a = b    | Set the variable a with the value of b. |
| a += b   | Alias to: `a = a + b`                   |
| a -= b   | Alias to: `a = a - b`                   |
| a *= b   | Alias to: `a = a * b`                   |
| a /= b   | Alias to: `a = a / b`                   |
| a %= b   | Alias to: `a = a % b`                   |


<p markdown="1"><span class="label label-info">Note</span> The assignment operator is the only one operator that cannot be overridden yet. See the [operator overloading section](#11-operator-overloading) for details.</p>


## 2. Arithmetic operators

The arithmetic operators are listed below and take numbers as operands. 
There are either unary (one operand) or binary (two operands).


| Operator | Function Name        | Operator Semantic                                            |
| -------- | -------------------- | ------------------------------------------------------------ |
| a + b    | operator\_plus       | Add a and b.                                                 |
| a - b    | operator\_minus      | Subtract b to a. Binary operator.                            |
| a * b    | operator\_multiply   | Multiply a by b.                                             |
| a / b    | operator\_divide     | Divide a by b.                                               |
| a % b    | operator\_modulo     | Modulo of the division of a by b.                            |
| a \*\* b | operator\_power      | Compute the power b of a.                                    |
| - a      | operator\_minus      | Negate the value of a. Unary operator.                       |
| a ++     | operator\_plusPlus   | Increment a by 1, reply the value before the incrementation. |
| a --     | operator\_moinsMoins | Decrement a by 1, reply the value before the decrementation. |


Each operator has an associated function name. This function contains
the concrete implementation of the operational semantic of the
operator. This function can be redefined as explained in the 
[operator overloading section](#11-operator-overloading).


## 3. Comparison operators

### 3.1. Comparison operators on primitive types

The comparison operators on primitive types are listed below.


| Operator      | Function Name               | Operator Semantic                                                                |
| ------------- | --------------------------- | -------------------------------------------------------------------------------- |
| a == b        | operator\_equals            | Test if a and b are equal.                                                       |
| a != b        | operator\_notEquals         | Test if a and b are not equal.                                                   |
| a === b       | operator\_tripleEquals      | Test if a and b are equal.                                                       |
| a !== b       | operator\_tripleNotEquals   | Test if a and b are not equal.                                                   |
| a &lt; b      | operator\_lessThan          | Test if a is lower than b (a, b cannot be boolean).                              |
| a &gt; b      | operator\_greaterThan       | Test if a is greater than b (a, b cannot be boolean).                            |
| a &lt;= b     | operator\_lessEqualsThan    | Test if a is lower than or equal to b (a, b cannot be boolean).                  |
| a &gt;= b     | operator\_greaterEqualsThan | Test if a is greater than or equal to b (a, b cannot be boolean).                |
| a &lt;=&gt; b | operator\_spaceship         | Replies a negative value if a &lt; b, a positive value if a &gt; b, otherwise 0. |


Each operator has an associated function name. This function contains
the concrete implementation of the operational semantic of the
operator. This function can be redefined as explained in the 
operator overloading section](#operator-overloading).


### 3.2. Comparison operators on objects

The comparison operators on objects are listed below.

| Operator      | Function Name               | Operator Semantic                                                                |
| ------------- | --------------------------- | -------------------------------------------------------------------------------- |
| a == b        | operator\_equals            | Test if a and b are equal.                                                       |
| a != b        | operator\_notEquals         | Test if a and b are not equal.                                                   |
| a === b       | operator\_tripleEquals      | Test if a and b are equal.                                                       |
| a !== b       | operator\_tripleNotEquals   | Test if a and b are not equal.                                                   |
| a &lt; b      | operator\_lessThan          | Test if a is lower than b (a must be Comparable).                                |
| a &gt; b      | operator\_greaterThan       | Test if a is greater than b (a must be Comparable).                              |
| a &lt;= b     | operator\_lessEqualsThan    | Test if a is lower than or equal to b (a must be Comparable).                    |
| a &gt;= b     | operator\_greaterEqualsThan | Test if a is greater than or equal to b (a must be Comparable).                  |
| a &lt;=&gt; b | operator\_spaceship         | Replies a negative value if a &lt; b, a positive value if a &gt; b, otherwise 0. |

Each operator has an associated function name. This function contains
the concrete implementation of the operational semantic of the
operator. This function can be redefined as explained in the
operator overloading section](#operator-overloading).


## 4. Boolean Operators

The boolean operators are listed below. Each operator takes one or two boolean values as operands, and
replies the boolean value resulting from the operational semantic of the operator. 


| Operator         | Function Name  | Operator Semantic          |
| ---------------- | -------------- | -------------------------- |
| a &#124;&#124; b | operator\_or   | If a then true else b.     |
| a &amp;&amp; b   | operator\_and  | If a then b else false.    |
| ! a              | operator\_not  | If a then false else true. |


Each operator has an associated function name. This function contains
the concrete implementation of the operational semantic of the
operator. This function can be redefined as explained in the 
[operator overloading section](#11-operator-overloading).


## 5. Bitwise Operators

The bit operators are listed below. The bit operators apply operations on the bits that represent
a numeric value.


| Operator         | Function Name               | Operator Semantic                                                 |
| ---------------- | --------------------------- | ----------------------------------------------------------------- |
| a &lt;&lt; b     | operator\_doubleLessThan    | Shift the signed bit representation of a to the left by b units.  |
| a &gt;&gt; b     | operator\_doubleGreaterThan | Shift the signed bit representation of a to the left by b units.  |
| a &lt;&lt;&lt; b | operator\_tripleLessThan    | Not supported.                                                    |
| a &gt;&gt;&gt; b | operator\_tripleGreaterThan | Shift the unsigned bit representation of a to the left by b units |





Each operator has an associated function name. This function contains
the concrete implementation of the operational semantic of the
operator. This function can be redefined as explained in the 
[operator overloading section](#11-operator-overloading).

Additional bitwise operators are available into the SARL library, but not associated to any operator:


| Operator         | Operator Semantic                     |
| ---------------- | ------------------------------------- |
| a.bitwiseAnd(b)  | Do a bit-per-bit AND operation.       |
| a.bitwiseOr(b)   | Do a bit-per-bit OR operation.        |
| a.bitwiseXor(b)  | Do a bit-per-bit XOR operation.       |
| a.bitwiseNot     | Do a bit-per-bit NEGATION operation.  |



## 6. String Operators

The string operators are listed below. These operators are dedicated to strings of characters.


| Operator | Function Name  | Operator Semantic                                  |
| ---------| -------------- | -------------------------------------------------- |
| a + b    | operator\_plus | Concatenate the string representations of a and b. |



Each operator has an associated function name. This function contains
the concrete implementation of the operational semantic of the
operator. This function can be redefined as explained in the 
[operator overloading section](#11-operator-overloading).


## 7. Number Range operators

This section presents a collection of operators that define ranges of values.


| Operator   | Function Name                  | Operator Semantic                                                               |
| ---------- | ------------------------------ | ------------------------------------------------------------------------------- |
| a .. b     | operator\_upTo                 | Create a list of integer values from a (inclusive) to b (inclusive). `1..5` is the range from 1 to 5 with 1 &lt;= x &lt;= 5.  `5..1` is the range from 5 to 1 with 5 &gt;= x &gt;= 1.  The type of this expression is `IntegerRange`. |
| a &gt;.. b | operator\_greaterThanDoubleDot | Create a list of integer values from a (exclusive) to b (inclusive). `5&gt;..1` is the range from 4 to 1 with 5 &gt; x &gt;= 1.  `1&gt;..5` is the empty range since the constraint is wrong 1 &gt; x &gt;= 5.  See [Xtext](https://bugs.eclipse.org/bugs/show_bug.cgi?id=443258) for discussion on the operational semantics of this operator. The type of this expression is `ExclusiveRange`. |
| a ..&lt; b | operator\_doubleDotLessThan    | Create a list of integer values from a (inclusive) to b (exclusive). `1..&lt;5` is the range from 1 to 5 with 1 &lt;= x &lt; 5. `5..&lt;1` is the empty range since the constraint is wrong 5 &lt;= x &lt; 1. See [Xtext](https://bugs.eclipse.org/bugs/show_bug.cgi?id=443258) for discussion on the operational semantics of this operator. The type of this expression is `ExclusiveRange`.                              |


Each operator has an associated function name. This function contains
the concrete implementation of the operational semantic of the
operator. This function can be redefined as explained in the 
[operator overloading section](#11-operator-overloading).


## 8. Collection Operators

The collection operators are listed below. These operators are dedicated to the collections (lists, sets, maps...)
Most of the time, the first operand is the collection on which the operator must be applied.


| Operator              | Function Name      | Operator Semantic                                                                          |
| --------------------- | ------------------ | ------------------------------------------------------------------------------------------ |
| c += e    | operator\_add      | Equivalent to: `c.add(e)`                                                                  |
| c -= e                | operator\_remove   | Equivalent to: `c.remove(e)`                                                               |
| c1 + c2 | operator\_plus     | Create a collection that is containing the elements of the collections `c1` and `c2`.  |
| m + p     | operator\_plus     | Create a map of type `Map<A,B>` that is containing the elements of the map `m` and the new pair `p` of type `Pair<A,B>`.                                                |
| m - p                 | operator\_moins    | Create a map of type `Map<A,B>` that is containing the elements of the map `m`, except the pair `p` of type `Pair<A,B>`.                                                        |
| a -&gt; b             | operator\_mappedTo | Create an instance of `Pair<A,B>` where `A` and `B` are the types of a and b respectively. |












Each operator has an associated function name. This function contains
the concrete implementation of the operational semantic of the
operator. This function can be redefined as explained in the 
[operator overloading section](#11-operator-overloading).


## 9. Other operators

This section presents a collection of operators that are not related to the categories in the previous sections.


| Operator               | Function Name         | Operator Semantic                                                                 |
| ---------------------- | --------------------- | --------------------------------------------------------------------------------- |
| a ?: b                 | operator\_elvis       | If a is not null then a else b.                                                   |
| a =&gt; b    | operator\_doubleArrow | Used as a  'with'- or 'let'-operation. It allows you to bind an object to a local scope in order to do something on it. b must be a lambda expression.              |
| a &lt;&gt; b           | operator\_diamond     | Not yet supported.                                                                |






Each operator has an associated function name. This function contains
the concrete implementation of the operational semantic of the
operator. This function can be redefined as explained in the 
[operator overloading section](#11-operator-overloading).

For an example of the `=&gt;` operator, consider the class `Person` with two attributes inside: `firstName` and `lastName`.
The creation of an instance of `Person` could be done with:

```sarl
new Person => [
	firstName = 'Han';
	lastName = 'Solo'
]
```



<p markdown="1"><span class="label label-info">Note</span> Note how the `;` allows two expressions on one line.</p>

In this example, the instance of Person is created and passed to the
lambda expression. Inside this expression, the new Person instance is accessible with the `it`
reserved pseudo-variable, which does not need to be typed out since it is the default object in
lambda expression. The lambda expression replies the value of `it`.


## 10. Operator Precedence

The following table lists the precedence and associativity of SARL operators. Operators are listed top to bottom,
in ascending precedence, i.e. from the lower priority to the higher priority.


| Operators                                           | Associativity   |
| --------------------------------------------------- | --------------- |
| =                                                   | right to left   |
| ||                                                  | left to right   |
| &&                                                  | left to right   |
| ==, !=, ===, !==                                    | left to right   |
| >=, <=, <, >                                        | left to right   |
| instanceof                                          | not associative |
| <=>, <>, .., >.., ..<, ->, =>, ?:, >>, <<, >>>, <<< | left to right   |
| +, -                                                | left to right   |
| *, /, %                                             | left to right   |
| as                                                  | left to right   |
| **                                                  | left to right   |
| !, - (unary), + (unrary)                            | right to left   |
| ++, --                                              | not associative |





When parsing an expression, an operator which is listed on some row of the table above with a precedence will
be bound tighter (as if by parentheses) to its arguments than any operator that is listed on a row further 
above it with a lower precedence.

For example, the expressions `c << a == b` and `-p++` are parsed as `(c << a) == b` and `-(p++)`, and not as
`c << (a == b)` or `(-p)++`.

Operators that have the same precedence are bound to their arguments in the direction of their associativity.
For example, the expression `a = b = c` is parsed as `a = (b = c)`, and not as `(a = b) = c` because of
right-to-left associativity of assignment, but `a + b - c` is parsed `(a + b) - c` and not `a + (b - c)`
because of left-to-right associativity of addition and subtraction.
Associativity specification is redundant for unary operators and is only shown for completeness:
unary postfix operators always associate left-to-right.
Note that the associativity is meaningful for member access operators, even though they are grouped with
unary postfix operators: `a.b++` is parsed `(a.b)++` and not `a.(b++)`.
Operator precedence is unaffected by operator overloading.


## 11. Operator Overloading

In SARL, it is easy to overload or re-define an existing operator.

You should define the operator mapping function (see the previous sections for a comprehensive list of them).

The following example, the addition operator [:plusop] for two `Pair` objects is defined.
The function that is defining the operator must be named with the `operator_` prefix, and have one parameter
for each operand associated with the operator. In the example, the addition of two pairs `1 -> 3` and `4 -> 5`.
gives the pair (a,d).
 
```sarl
def operator_plus(
			a : Pair<Integer,Integer>,
			b : Pair<Integer,Integer>) : Pair<Integer,Integer> {
	return new Pair(a.key, b.value)
}
def example {
	var x = 1 -> 3
	var y = 4 -> 5
	
	// Old-fashion-style call to the overloaded operator
	var z1 = operator_plus(x, y)
	
	// Operator-style call to the overloaded operator
	var z2 = x + y 
	
	// z1 == (1 -> 5)
	println(z1.toString)
	
	// z2 == (1 -> 5)
	println(z2.toString)
}
```


In addition to the overloading of the operators that are described on this page, it 
is possible to overload the casting operator. See [details](./Cast.html).


## 12. Acknowledgements

This documentation is inspired by the documentations from the
[Xtext](https://www.eclipse.org/Xtext/documentation.html) and
[Xtend](https://www.eclipse.org/xtend/documentation.html) projects.

## 13. Legal Notice

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.12
* Status: Draft Release
* Release: 2020-11-25

> Copyright &copy; 2014-2020 [the original authors or authors](http://www.sarl.io/about/index.html).
>
> Licensed under the Apache License, Version 2.0;
> you may not use this file except in compliance with the License.
> You may obtain a copy of the [License](http://www.apache.org/licenses/LICENSE-2.0).
>
> You are free to reproduce the content of this page on copyleft websites such as Wikipedia.

<small>Generated with the translator io.sarl.maven.docs.generator 0.12.0-SNAPSHOT.</small>
