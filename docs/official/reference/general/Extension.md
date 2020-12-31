---
title: "Extension Methods and Available Extensions"
layout: default
---

# Extension Methods and Available Extensions

Extension methods allow you to add new methods to existing types without modifying them. This is really
helpful as they can greatly improve the readability. Extension methods use a simple syntactic trick:
the first parameter of a method can either be passed in after opening the parentheses or before the
method call. For example, given a method:

```sarl
def removeVowels (s : String) {
	s.replaceAll("[aeiouyAEIOUY]", "")
}
```



We can call this method either like in Java or C++ languages:

```sarl
removeVowels("Hello")
```



or as an extension method of String:

```sarl
"Hello".removeVowels
```



## 1. Import static extension methods

You can import static methods as extensions, and directly call the imported static methods.

In the following example, the `sort(List)` function is provided by the `Collections` utility class.
This function is invoked with the extension method syntax.

```sarl
import static extension java.util.Collections.*
agent MyAgent {
	def example {
		val colors : String[] = #["red", "blue", "green"]
		colors.sort 
	}
}
```



## 2. Local extension methods

All visible non-static methods of the current class and its super types are automatically available as extensions.

In the following example, the `hasOneElement` function is invoked with the extension method syntax.

```sarl
// Define an extension method for List
def hasOneElement(list : List<?>) : boolean {
	list.size == 1
}

// Invoke the extension method
def example : boolean {
	newArrayList("red").hasOneElement
}
```



## 3. Extension Provider

By adding the `extension` keyword to a field, a local variable, or a parameter declaration, its
instance methods become extension methods.

<p markdown="1"><span class="label label-danger">Caution</span> The `extension` keyword must be always written just before the `val` or `var` keywords for fields and local variables, or before the parameter's name.  In the case of an extension field, you must give the type of the field because the type resolved of SARL cannot infer the type of the field.</p>

In the following example, the extension provider is a field. The function `contains(Object)`
is called with the extension method syntax. The extension provider is the field `list`.
Because of the extension method, the call to `contains` is equivalent to `list.contains(value)`.

```sarl
class ExtensionProviderExamples {
	extension var list : ArrayList<String> = newArrayList
	
	def extensionFieldExample(value : String) : boolean {
		value.contains
	}
}
```


In the following example, the extension provider is the formal parameter `o`.
Because of the extension method, the call to `contains` is equivalent to `o.contains(value)`.

```sarl
class ExtensionProviderExamples {

def extensionParameterExample(value : String, extension o : ArrayList<String>) : boolean {
	value.contains
}
```



In the following example, the extension provider is the local variable `o`.
Because of the extension method, the call to `contains` is equivalent to `o.contains(value)`.

```sarl
def extensionLocalVariableExample(value : String) : boolean {
	extension val o : ArrayList<String> = newArrayList
	value.contains
}
```



## 4. Imported Extensions

The following sections describe the extensions (in alphabetical order) that are automatically imported in a SARL script.
The extensions are described into categories.


### 4.1. Collection Category

The following functions are provided for extended the standard collection API:

```sarl
def clone(T[]) : T[] with T
def clone(boolean[]) : boolean[]
def clone(byte[]) : byte[]
def clone(char[]) : char[]
def clone(double[]) : double[]
def clone(float[]) : float[]
def clone(int[]) : int[]
def clone(long[]) : long[]
def clone(short[]) : short[]
def contains(Object[], Object) : boolean
def contains(boolean[], boolean) : boolean
def contains(byte[], byte) : boolean
def contains(char[], char) : boolean
def contains(double[], double) : boolean
def contains(float[], float) : boolean
def contains(int[], int) : boolean
def contains(long[], long) : boolean
def contains(short[], short) : boolean
def equals(Object[], Object) : boolean
def equals(boolean[], Object) : boolean
def equals(byte[], Object) : boolean
def equals(char[], Object) : boolean
def equals(double[], Object) : boolean
def equals(float[], Object) : boolean
def equals(int[], Object) : boolean
def equals(long[], Object) : boolean
def equals(short[], Object) : boolean
def get(T[], int) : T with T
def get(T[][], int, int) : T with T
def get(boolean[], int) : boolean
def get(boolean[][], int, int) : boolean
def get(byte[], int) : byte
def get(byte[][], int, int) : byte
def get(char[], int) : char
def get(char[][], int, int) : char
def get(double[], int) : double
def get(double[][], int, int) : double
def get(float[], int) : float
def get(float[][], int, int) : float
def get(int[], int) : int
def get(int[][], int, int) : int
def get(long[], int) : long
def get(long[][], int, int) : long
def get(short[], int) : short
def get(short[][], int, int) : short
def hashCode(Object[]) : int
def hashCode(boolean[]) : int
def hashCode(byte[]) : int
def hashCode(char[]) : int
def hashCode(double[]) : int
def hashCode(float[]) : int
def hashCode(int[]) : int
def hashCode(long[]) : int
def hashCode(short[]) : int
def length(Object[]) : int
def length(boolean[]) : int
def length(byte[]) : int
def length(char[]) : int
def length(double[]) : int
def length(float[]) : int
def length(int[]) : int
def length(long[]) : int
def length(short[]) : int
def set(T[], int, E) : T with T, E
def set(T[][], int, int, E) : T with T, E
def set(boolean[], int, boolean) : boolean
def set(boolean[][], int, int, boolean) : boolean
def set(byte[], int, byte) : byte
def set(byte[][], int, int, byte) : byte
def set(char[], int, char) : char
def set(char[][], int, int, char) : char
def set(double[], int, double) : double
def set(double[][], int, int, double) : double
def set(float[], int, float) : float
def set(float[][], int, int, float) : float
def set(int[], int, int) : int
def set(int[][], int, int, int) : int
def set(long[], int, long) : long
def set(long[][], int, int, long) : long
def set(short[], int, short) : short
def set(short[][], int, int, short) : short
```



### 4.2. Number Category

The following functions are provided for extended the standard number API:

```sarl
def operator_divide(BigDecimal, BigDecimal) : BigDecimal
def operator_minus(BigDecimal) : BigDecimal
def operator_minus(BigDecimal, BigDecimal) : BigDecimal
def operator_multiply(BigDecimal, BigDecimal) : BigDecimal
def operator_plus(BigDecimal, BigDecimal) : BigDecimal
def operator_power(BigDecimal, int) : BigDecimal
```



### 4.3. Primitive Type Category

The following functions are provided for extended the standard primitive type  API:

```sarl
def operator_and(boolean, boolean) : boolean
def operator_equals(boolean, boolean) : boolean
def operator_greaterEqualsThan(boolean, boolean) : boolean
def operator_greaterThan(boolean, boolean) : boolean
def operator_lessEqualsThan(boolean, boolean) : boolean
def operator_lessThan(boolean, boolean) : boolean
def operator_not(boolean) : boolean
def operator_notEquals(boolean, boolean) : boolean
def operator_or(boolean, boolean) : boolean
def xor(boolean, boolean) : boolean
```



### 4.4. Object Type Category

The following functions are provided for extended the Object types:

```sarl
def operator_greaterEqualsThan(Comparable<Object>, C) : boolean with C
def operator_greaterThan(Comparable<Object>, C) : boolean with C
def operator_lessEqualsThan(Comparable<Object>, C) : boolean with C
def operator_lessThan(Comparable<Object>, C) : boolean with C
def operator_spaceship(Comparable<Object>, C) : int with C
```



### 4.5. Functions and Procedure Category

The following functions are provided for extended the standard Lambda expression API:

```sarl
def andThen((Object) => T, (Object) => R) : (V) => R with V, T, R
def andThen((Object) => void, (Object) => void) : (T) => void with T
def andThen((Object, Object) => T, (Object) => R) : (V1, V2) => R with V1, V2, T, R
def andThen(Procedure0, Procedure0) : Procedure0
def compose((Object) => R, (Object) => T) : (V) => R with V, T, R
def curry((Object) => RESULT, P1) : () => RESULT with P1, RESULT
def curry((Object, Object) => RESULT, P1) : (P2) => RESULT with P1, P2, RESULT
def curry((Object, Object, Object) => RESULT, P1) : (P2, P3) => RESULT with P1, P2, P3, RESULT
def curry((Object, Object, Object, Object) => RESULT, P1) : (P2, P3, P4) => RESULT with P1, P2, P3, P4, RESULT
def curry((Object, Object, Object, Object, Object) => RESULT, P1) : (P2, P3, P4, P5) => RESULT with P1, P2, P3, P4, P5, RESULT
def curry((Object, Object, Object, Object, Object, Object) => RESULT, P1) : (P2, P3, P4, P5, P6) => RESULT with P1, P2, P3, P4, P5, P6, RESULT
```



### 4.6. Time Category

The following functions are provided for extended the standard time API:

```sarl
def convertFromTo(double, TimeUnit, TimeUnit) : double
def days(Number) : long
def days(byte) : long
def days(double) : long
def days(float) : long
def days(int) : long
def days(long) : long
def days(short) : long
def hours(Number) : long
def hours(byte) : long
def hours(double) : long
def hours(float) : long
def hours(int) : long
def hours(long) : long
def hours(short) : long
def milliseconds(Number) : long
def milliseconds(byte) : long
def milliseconds(double) : long
def milliseconds(float) : long
def milliseconds(int) : long
def milliseconds(long) : long
def milliseconds(short) : long
def minutes(Number) : long
def minutes(byte) : long
def minutes(double) : long
def minutes(float) : long
def minutes(int) : long
def minutes(long) : long
def minutes(short) : long
def seconds(Number) : long
def seconds(byte) : long
def seconds(double) : long
def seconds(float) : long
def seconds(int) : long
def seconds(long) : long
def seconds(short) : long
def weeks(Number) : long
def weeks(byte) : long
def weeks(double) : long
def weeks(float) : long
def weeks(int) : long
def weeks(long) : long
def weeks(short) : long
```





## 5. Acknowledgements

This documentation is inspired by the documentations from the
[Xtext](https://www.eclipse.org/Xtext/documentation.html) and
[Xtend](https://www.eclipse.org/xtend/documentation.html) projects.

## 6. Legal Notice

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.12
* Status: Draft Release
* Release: 2020-12-31

> Copyright &copy; 2014-2020 [the original authors or authors](http://www.sarl.io/about/index.html).
>
> Licensed under the Apache License, Version 2.0;
> you may not use this file except in compliance with the License.
> You may obtain a copy of the [License](http://www.apache.org/licenses/LICENSE-2.0).
>
> You are free to reproduce the content of this page on copyleft websites such as Wikipedia.

<small>Generated with the translator io.sarl.maven.docs.generator 0.12.0-SNAPSHOT.</small>
