---
title: "Literals"
layout: default
---

# Literals


<ul class="page_outline" id="page_outline">

<li><a href="#1-string-literals">1. String Literals</a></li>
<li><a href="#2-character-literals">2. Character Literals</a></li>
<li><a href="#3-number-literals">3. Number Literals</a></li>
<ul>
  <li><a href="#31-general-notation">3.1. General Notation</a></li>
  <li><a href="#32-integer-suffixes">3.2. Integer suffixes</a></li>
</ul>
<li><a href="#4-floating-point-value-suffixes">4. Floating-point-value suffixes</a></li>
<ul>
  <li><a href="#41-large-numbers">4.1. Large Numbers</a></li>
</ul>
<li><a href="#5-boolean-literals">5. Boolean Literals</a></li>
<li><a href="#6-null-literal">6. Null Literal</a></li>
<li><a href="#7-type-literals">7. Type Literals</a></li>
<li><a href="#8-collection-literals">8. Collection Literals</a></li>
<ul>
  <li><a href="#81-mutable-collections">8.1. Mutable Collections</a></li>
  <li><a href="#82-array-literals">8.2. Array Literals</a></li>
  <li><a href="#83-immutable-collections">8.3. Immutable Collections</a></li>
</ul>
<li><a href="#9-acknowledgements">9. Acknowledgements</a></li>
<li><a href="#10-legal-notice">10. Legal Notice</a></li>

</ul>


A literal denotes a fixed, unchangeable value. Literals for strings, numbers, booleans, null, and Java types are
supported, as well as literals for unmodifiable collection types like lists, sets, maps, and arrays.


## 1. String Literals

A string literal is of type `String`. String literals are enclosed in a pair of single quotes
or double quotes. Special characters can be quoted with a backslash or defined using unicode
notation.

```sarl
var a = 'Hello World!'
var b = "Hello World!"
var c = 'Hello "World!"'
var d = "Hello "World!""
var e = "Hello 
			World!"
```




<p markdown="1"><span class="label label-info">Note</span> Unlike Java, SARL strings can span multiple lines, as ilustrated by the variable `e` above.</p>


## 2. Character Literals

Character literals use the same notation as String literals. If a single-character String literal is
used in a context where a primitive char or the wrapper type `Character` or `char` is expected,
the compiler will treat the literal as a `Character` or `char` value.

```sarl
var a : char = 'a'
var b : char = "b"
```



## 3. Number Literals

### 3.1. General Notation

SARL supports the same number literals as Java with two exceptions: there is no notation
for specifying octal numbers, and if you put the dot character in a number, you must
specify both the integer and fractional parts.

```sarl
var a = 42		// Decimal
var b = 0xbeef	// Hexadecimal
var c = 077		// Decimal 77, NOT octal
var d = 0.1		// The leading zero must be specified
var e = 1.0		// The trailing zero must be specified
```



| Type of Integer | Description                   | Example        |
| --------------- | ----------------------------- | -------------- |
| Hexadecimal     | Prefix is `0x`                | `0xbeef` |
| Octal           | Not supported                 |                |
| Decimal         | No prefix, no fractional part | `077` |
| Rational        | No prefix, fractional part    | `0.1` |



### 3.2. Integer suffixes

Post-fixing an integer literal may change its type:

* no suffix is for `int` number,
* suffix `l` or `L` is for `long` number (uppercase is less likely to be confused with `1`), and
* suffix `bi` or `BI` is for `BigInteger` number.

Examples:
```sarl
var anInteger = 1234

var aLong = 1234L

var aBigInteger = 1234bi
```



## 4. Floating-point-value suffixes

Post-fixing a floating-point literal may change its type:

* no suffix is for `double` number,
* suffix `d` or `D` is for `double` number,
* suffix `f` or `F` is for `float` number, and
* suffix `bd` or `BD` is for `BigDecimal` number. 

Examples:
```sarl
var aDouble = 1234.0

var anotherDouble = 5678d

var aFloat = 1234.0f

var anotherFloat = 5678f

var aBigDecimal = 1234bd
```



### 4.1. Large Numbers

As in Java 7, you can separate digits using `_` for better readability of large numbers.

```sarl
// underscore is ignored, L for long
var a = 12_345_678L
```



## 5. Boolean Literals

There are two boolean literals, `true` and `false`, which correspond to their Java counterpart of type `boolean`.


## 6. Null Literal

The null pointer literal `null` has exactly the same semantics as in Java: a reference to nothing.


## 7. Type Literals

A type literal is the fully qualified name of a type in the SARL language.
The syntax for type literals is generally the plain name of the type. Nested types use the delimiter `.`.
The following example is the type literal for the `Agent` type.

```sarl
io.sarl.lang.core.Agent
```


To disambiguate the type expression with the `.` operator for invoking a function, the type literal may
also be specified using the `typeof` operator.

```sarl
typeof(io.sarl.lang.core.Agent)
```


Consequently, it is possible to access the members of a type reflectively by using its plain name.
In the following example, the fields declared in the `String` class are provided:

```sarl
String.getDeclaredFields
```



## 8. Collection Literals

The collection literals permit to specify collections of values.


### 8.1. Mutable Collections

It is easy to create instances of collections since the methods in `CollectionLiterals` are automatically imported.
They permit you to create instances of collections from the JDK.

```sarl
class CollectionLiterals {
	def emptyList : List<T> with T
	def emptyMap : Map<K, V> with K, V
	def emptySet : Set<T> with T
	def newArrayList : ArrayList<T> with T
	def newArrayList(T[]*) : ArrayList<T> with T
	def newHashMap : HashMap<K, V> with K, V
	def newHashMap(Pair<K, V>[]*) : HashMap<K, V> with K, V
	def newHashSet : HashSet<T> with T
	def newHashSet(T[]*) : HashSet<T> with T
	def newImmutableList(T[]*) : List<T> with T
	def newImmutableMap(Pair<K, V>[]*) : Map<K, V> with K, V
	def newImmutableSet(T[]*) : Set<T> with T
	def newLinkedHashMap : LinkedHashMap<K, V> with K, V
	def newLinkedHashMap(Pair<K, V>[]*) : LinkedHashMap<K, V> with K, V
	def newLinkedHashSet : LinkedHashSet<T> with T
	def newLinkedHashSet(T[]*) : LinkedHashSet<T> with T
	def newLinkedList : LinkedList<T> with T
	def newLinkedList(T[]*) : LinkedList<T> with T
	def newTreeMap(Comparator<Object>) : TreeMap<K, V> with K, V
	def newTreeMap(Comparator<Object>, Pair<K, V>[]) : TreeMap<K, V> with K, V
	def newTreeSet(Comparator<Object>) : TreeSet<T> with T
	def newTreeSet(Comparator<Object>, T[]) : TreeSet<T> with T
}
```



In the following example, an array-based list with two strings of characters and a linked hash map with two pairs are created. 

```sarl
var myList = newArrayList('Hello', 'world')
var myMap = newLinkedHashMap('a' -> 1, 'b' -> 2)
```



### 8.2. Array Literals

Java arrays can be created either using a literal as described in the next section, or a new array with a fixed size.


#### Array Creation

The methods from `ArrayLiterals` are automatically included.

```sarl
class ArrayLiterals {
	def newArrayOfSize(int) : T[] with T
	def newArrayOfSize(int, int) : T[][] with T
	def newBooleanArrayOfSize(int) : boolean[]
	def newBooleanArrayOfSize(int, int) : boolean[][]
	def newByteArrayOfSize(int) : byte[]
	def newByteArrayOfSize(int, int) : byte[][]
	def newCharArrayOfSize(int) : char[]
	def newCharArrayOfSize(int, int) : char[][]
	def newDoubleArrayOfSize(int) : double[]
	def newDoubleArrayOfSize(int, int) : double[][]
	def newFloatArrayOfSize(int) : float[]
	def newFloatArrayOfSize(int, int) : float[][]
	def newIntArrayOfSize(int) : int[]
	def newIntArrayOfSize(int, int) : int[][]
	def newLongArrayOfSize(int) : long[]
	def newLongArrayOfSize(int, int) : long[][]
	def newShortArrayOfSize(int) : short[]
	def newShortArrayOfSize(int, int) : short[][]
}
```



This utility class provides a collection of methods, such as ``ArrayLiterals`.newArrayOfSize(int)`
for creating array literals.

```sarl
// variable a contains a array of size 400 which contains Objects.
var a : String[] = newArrayOfSize(400)
// variable b contains a array of size 200 which contains int values.
var b : int[] = newIntArrayOfSize(200)
```



#### Array Element Accessors

Retrieving and setting values of arrays is done through the extension methods `get(int)` and
`set(int, T)`.
The first parameter of these two functions are the position of the element to get or set.
As with Java, the index of the elements in the array starts with `0`.
The second parameter of set is the value to put at the specified position in the array.

The method `length` is available for retrieving the size of the array.

```sarl
var a = #['Hello', 'world', '!']
// variable b contains the second element of the array a: 'world'.
var b = a.get(1)
// change the first element in the array a.
a.set(0, 'New Element')
// variable c contains the size of the array a: 3.
var c = a.length
```




#### Array to List

Arrays are automatically converted to lists when needed. This is similar to the boxing and unboxing features
provided by Java to convert between the primitives and their respective object types.
This convertion is not done by copying the elements of array.
The [Facade design pattern] is used for creating a specific `List` implementation that uses the
original array as its internal backed data structure.
This method is similar to the `Arrays.asList` function provided by the Java API.


In the following example, an array is defined and converted to a list.

```sarl
val myArray : int[] = #[1,2,3]
val myList : List<Integer> = myArray
```



### 8.3. Immutable Collections

In addition to the functions described in the previous section, SARL supports collection literals to create
immutable collections and arrays, depending on the target type. There are three types of immutable
collections: array, set, and hash table.

An immutable array of values is specified with the `#[` and `]` delimiters.  

```sarl
var a = #[ 'Hello', 'World' ]
```



An immutable set of values is specified with the `#{` and `}` delimiters.  

```sarl
var b = #{ 'Hello', 'World' }
```



An immutable map of pairs is specified with the `#{` and `}` delimiters, as for immutable sets, but
the values are pairs, using the `->`.  

```sarl
var c = #{ 'a' -> 1 ,'b' -> 2 }
```




## 9. Acknowledgements

This documentation is inspired by the documentations from the
[Xtext](https://www.eclipse.org/Xtext/documentation.html) and
[Xtend](https://www.eclipse.org/xtend/documentation.html) projects.

## 10. Legal Notice

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
