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



##1. Import static extension methods

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



##2. Local extension methods

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



##3. Extension Provider

By adding the `extension` keyword to a field, a local variable, or a parameter declaration, its
instance methods become extension methods.

<caution>The `extension` keyword must be always written just before the `val` or
`var` keywords for fields and local variables, or before the parameter's name.</caution>

<caution>In the case of an extension field, you must give the type of the field because the type resolved
of SARL cannot infer the type of the field.</caution>

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



##4. Imported Extensions

The following sections describe the extensions (in alphabetical order) that are automatically imported in a SARL script.
The extensions are described into categories.


###4.1. Collection Category

The `ArrayExtensions` class extends the class `Array` with the following functions:

```sarl
interface ArrayExtensions {
	def get(int[], int) : int
	def get(short[], int) : short
	def get(double[], int) : double
	def get(boolean[], int) : boolean
	def get(float[], int) : float
	def get(char[], int) : char
	def get(long[], int) : long
	def get(Object[], int) : Object
	def get(byte[], int) : byte
	def equals(double[], Object) : boolean
	def equals(byte[], Object) : boolean
	def equals(short[], Object) : boolean
	def equals(long[], Object) : boolean
	def equals(float[], Object) : boolean
	def equals(char[], Object) : boolean
	def equals(boolean[], Object) : boolean
	def equals(Object[], Object) : boolean
	def equals(int[], Object) : boolean
	def hashCode(long[]) : int
	def hashCode(float[]) : int
	def hashCode(int[]) : int
	def hashCode(double[]) : int
	def hashCode(Object[]) : int
	def hashCode(short[]) : int
	def hashCode(boolean[]) : int
	def hashCode(byte[]) : int
	def hashCode(char[]) : int
	def clone(char[]) : char[]
	def clone(int[]) : int[]
	def clone(short[]) : short[]
	def clone(byte[]) : byte[]
	def clone(double[]) : double[]
	def clone(float[]) : float[]
	def clone(boolean[]) : boolean[]
	def clone(Object[]) : Object[]
	def clone(long[]) : long[]
	def length(short[]) : int
	def length(long[]) : int
	def length(double[]) : int
	def length(boolean[]) : int
	def length(Object[]) : int
	def length(byte[]) : int
	def length(float[]) : int
	def length(int[]) : int
	def length(char[]) : int
	def set(byte[], int, byte) : byte
	def set(int[], int, int) : int
	def set(Object[], int, Object) : Object
	def set(double[], int, double) : double
	def set(float[], int, float) : float
	def set(short[], int, short) : short
	def set(char[], int, char) : char
	def set(boolean[], int, boolean) : boolean
	def set(long[], int, long) : long
}
```


The `CollectionExtensions` class extends the class `Collection` with the following functions:

```sarl
interface CollectionExtensions {
	def immutableCopy(SortedMap<Object, Object>) : SortedMap<Object, Object>
	def immutableCopy(SortedSet<Object>) : SortedSet<Object>
	def immutableCopy(Set<Object>) : Set<Object>
	def immutableCopy(List<Object>) : List<Object>
	def immutableCopy(Map<Object, Object>) : Map<Object, Object>
	def operator_add(Collection<Object>, Iterable<Object>) : boolean
	def operator_add(Collection<Object>, Object) : boolean
	def operator_remove(Collection<Object>, Collection<Object>) : boolean
	def operator_remove(Collection<Object>, Object) : boolean
	def unmodifiableView(SortedMap<Object, Object>) : SortedMap<Object, Object>
	def unmodifiableView(List<Object>) : List<Object>
	def unmodifiableView(Collection<Object>) : Collection<Object>
	def unmodifiableView(Set<Object>) : Set<Object>
	def unmodifiableView(SortedSet<Object>) : SortedSet<Object>
	def unmodifiableView(Map<Object, Object>) : Map<Object, Object>
	def addAll(Collection<Object>, Iterable<Object>) : boolean
	def addAll(Collection<Object>, Object[]) : boolean
	def removeAll(Collection<Object>, Iterable<Object>) : boolean
	def removeAll(Collection<Object>, Collection<Object>) : boolean
	def removeAll(Collection<Object>, Object[]) : boolean
}
```


The `IterableExtensions` class extends the class `Iterable` with the following functions:

```sarl
interface IterableExtensions {
	def take(Iterable<Object>, int) : Iterable<Object>
	def reject(Iterable<Object>, (Object) => Boolean) : Iterable<Object>
	def findFirst(Iterable<Object>, (Object) => Boolean) : Object
	def last(Iterable<Object>) : Object
	def flatten(Iterable<Iterable<Object>>) : Iterable<Object>
	def elementsEqual(Iterable<Object>, Iterable<Object>) : boolean
	def toList(Iterable<Object>) : List<Object>
	def toSet(Iterable<Object>) : Set<Object>
	def forall(Iterable<Object>, (Object) => Boolean) : boolean
	def groupBy(Iterable<Object>, (Object) => Object) : Map<Object, List<Object>>
	def sortBy(Iterable<Object>, (Object) => Object) : List<Object>
	def isNullOrEmpty(Iterable<Object>) : boolean
	def filterNull(Iterable<Object>) : Iterable<Object>
	def operator_plus(Iterable<Object>, Iterable<Object>) : Iterable<Object>
	def fold(Iterable<Object>, Object, (Object, Object) => Object) : Object
	def sortWith(Iterable<Object>, Comparator<Object>) : List<Object>
	def takeWhile(Iterable<Object>, (Object) => Boolean) : Iterable<Object>
	def dropWhile(Iterable<Object>, (Object) => Boolean) : Iterable<Object>
	def indexed(Iterable<Object>) : Iterable<Pair<Integer, Object>>
	def minBy(Iterable<Object>, (Object) => Object) : Object
	def maxBy(Iterable<Object>, (Object) => Object) : Object
	def findLast(Iterable<Object>, (Object) => Boolean) : Object
	def drop(Iterable<Object>, int) : Iterable<Object>
	def toInvertedMap(Iterable<Object>, (Object) => Object) : Map<Object, Object>
	def min(Iterable<Object>, Comparator<Object>) : Object
	def min(Iterable<Object>) : Object
	def max(Iterable<Object>, Comparator<Object>) : Object
	def max(Iterable<Object>) : Object
	def isEmpty(Iterable<Object>) : boolean
	def join(Iterable<Object>, CharSequence, (Object) => CharSequence) : String
	def join(Iterable<Object>, CharSequence, CharSequence, CharSequence, (Object) => CharSequence) : String
	def join(Iterable<Object>) : String
	def join(Iterable<Object>, CharSequence) : String
	def size(Iterable<Object>) : int
	def toMap(Iterable<Object>, (Object) => Object) : Map<Object, Object>
	def toMap(Iterable<Object>, (Object) => Object, (Object) => Object) : Map<Object, Object>
	def forEach(Iterable<Object>, (Object) => void)
	def forEach(Iterable<Object>, (Object, Object) => void)
	def exists(Iterable<Object>, (Object) => Boolean) : boolean
	def sort(Iterable<Object>) : List<Object>
	def head(Iterable<Object>) : Object
	def filter(Iterable<Object>, Class<Object>) : Iterable<Object>
	def filter(Iterable<Object>, (Object) => Boolean) : Iterable<Object>
	def map(Iterable<Object>, (Object) => Object) : Iterable<Object>
	def tail(Iterable<Object>) : Iterable<Object>
	def reduce(Iterable<Object>, (Object, Object) => Object) : Object
}
```


The `IteratorExtensions` class extends the class `Iterator` with the following functions:

```sarl
interface IteratorExtensions {
	def take(Iterator<Object>, int) : Iterator<Object>
	def reject(Iterator<Object>, (Object) => Boolean) : Iterator<Object>
	def findFirst(Iterator<Object>, (Object) => Boolean) : Object
	def last(Iterator<Object>) : Object
	def elementsEqual(Iterator<Object>, Iterator<Object>) : boolean
	def elementsEqual(Iterator<Object>, Iterable<Object>) : boolean
	def toList(Iterator<Object>) : List<Object>
	def toSet(Iterator<Object>) : Set<Object>
	def forall(Iterator<Object>, (Object) => Boolean) : boolean
	def groupBy(Iterator<Object>, (Object) => Object) : Map<Object, List<Object>>
	def toIterable(Iterator<Object>) : Iterable<Object>
	def isNullOrEmpty(Iterator<Object>) : boolean
	def filterNull(Iterator<Object>) : Iterator<Object>
	def operator_plus(Iterator<Object>, Iterator<Object>) : Iterator<Object>
	def fold(Iterator<Object>, Object, (Object, Object) => Object) : Object
	def takeWhile(Iterator<Object>, (Object) => Boolean) : Iterator<Object>
	def dropWhile(Iterator<Object>, (Object) => Boolean) : Iterator<Object>
	def indexed(Iterator<Object>) : Iterator<Pair<Integer, Object>>
	def minBy(Iterator<Object>, (Object) => Object) : Object
	def maxBy(Iterator<Object>, (Object) => Object) : Object
	def findLast(Iterator<Object>, (Object) => Boolean) : Object
	def drop(Iterator<Object>, int) : Iterator<Object>
	def toInvertedMap(Iterator<Object>, (Object) => Object) : Map<Object, Object>
	def min(Iterator<Object>) : Object
	def min(Iterator<Object>, Comparator<Object>) : Object
	def max(Iterator<Object>) : Object
	def max(Iterator<Object>, Comparator<Object>) : Object
	def isEmpty(Iterator<Object>) : boolean
	def join(Iterator<Object>) : String
	def join(Iterator<Object>, CharSequence) : String
	def join(Iterator<Object>, CharSequence, (Object) => CharSequence) : String
	def join(Iterator<Object>, CharSequence, CharSequence, CharSequence, (Object) => CharSequence) : String
	def size(Iterator<Object>) : int
	def toMap(Iterator<Object>, (Object) => Object, (Object) => Object) : Map<Object, Object>
	def toMap(Iterator<Object>, (Object) => Object) : Map<Object, Object>
	def forEach(Iterator<Object>, (Object) => void)
	def forEach(Iterator<Object>, (Object, Object) => void)
	def exists(Iterator<Object>, (Object) => Boolean) : boolean
	def head(Iterator<Object>) : Object
	def filter(Iterator<Object>, Class<Object>) : Iterator<Object>
	def filter(Iterator<Object>, (Object) => Boolean) : Iterator<Object>
	def map(Iterator<Object>, (Object) => Object) : Iterator<Object>
	def tail(Iterator<Object>) : Iterator<Object>
	def reduce(Iterator<Object>, (Object, Object) => Object) : Object
}
```


The `ListExtensions` class extends the class `List` with the following functions:

```sarl
interface ListExtensions {
	def sortInplace(List<Object>, Comparator<Object>) : List<Object>
	def sortInplace(List<Object>) : List<Object>
	def sortInplaceBy(List<Object>, (Object) => Object) : List<Object>
	def reverseView(List<Object>) : List<Object>
	def reverse(List<Object>) : List<Object>
	def map(List<Object>, (Object) => Object) : List<Object>
}
```


The `MapExtensions` and `SARLMapExtensions` classes extend the class `Map` with the following functions:

```sarl
interface MapExtensions {
	def mapValues(Map<Object, Object>, (Object) => Object) : Map<Object, Object>
	def forEach(Map<Object, Object>, (Object, Object) => void)
	def forEach(Map<Object, Object>, (Object, Object, Object) => void)
	def filter(Map<Object, Object>, (Object, Object) => Boolean) : Map<Object, Object>
}
```


```sarl
interface SARLMapExtensions {
	def union(Map<Object, Object>, Map<Object, Object>) : Map<Object, Object>
	def operator_plus(Map<Object, Object>, Map<Object, Object>) : Map<Object, Object>
	def operator_plus(Map<Object, Object>, Pair<Object, Object>) : Map<Object, Object>
	def operator_minus(Map<Object, Object>, Object) : Map<Object, Object>
	def operator_minus(Map<Object, Object>, Pair<Object, Object>) : Map<Object, Object>
	def operator_minus(Map<Object, Object>, Iterable<Object>) : Map<Object, Object>
	def operator_minus(Map<Object, Object>, Map<Object, Object>) : Map<Object, Object>
	def operator_add(Map<Object, Object>, Pair<Object, Object>) : Object
	def operator_add(Map<Object, Object>, Map<Object, Object>)
	def operator_remove(Map<Object, Object>, Object) : Object
	def operator_remove(Map<Object, Object>, Pair<Object, Object>) : boolean
	def operator_remove(Map<Object, Object>, Iterable<Object>)
	def operator_mappedTo(Map<Object, Object>, Object) : Object
}
```



###4.2. Number Category

The `BigDecimalExtensions` class extends the class `BigDecimal` with the following functions:

```sarl
interface BigDecimalExtensions {
	def operator_plus(BigDecimal, BigDecimal) : BigDecimal
	def operator_minus(BigDecimal, BigDecimal) : BigDecimal
	def operator_minus(BigDecimal) : BigDecimal
	def operator_power(BigDecimal, int) : BigDecimal
	def operator_multiply(BigDecimal, BigDecimal) : BigDecimal
	def operator_divide(BigDecimal, BigDecimal) : BigDecimal
}
```


The `BigIntegerExtensions` class extends the class `BigInteger` with the following functions:

```sarl
interface BigIntegerExtensions {
	def operator_plus(BigInteger, BigInteger) : BigInteger
	def operator_minus(BigInteger, BigInteger) : BigInteger
	def operator_minus(BigInteger) : BigInteger
	def operator_power(BigInteger, int) : BigInteger
	def operator_multiply(BigInteger, BigInteger) : BigInteger
	def operator_divide(BigInteger, BigInteger) : BigInteger
	def operator_modulo(BigInteger, BigInteger) : BigInteger
}
```


The `ByteExtensions` class extends the class `Byte` with the following functions:

```sarl
interface ByteExtensions {
	def operator_plus(byte, double) : double
	def operator_plus(byte, int) : int
	def operator_plus(byte, short) : int
	def operator_plus(byte, long) : long
	def operator_plus(byte, float) : float
	def operator_plus(byte, byte) : int
	def operator_plus(byte, char) : int
	def operator_plusPlus(byte) : byte
	def operator_plusPlus(Byte) : Byte
	def operator_minus(byte, short) : int
	def operator_minus(byte, long) : long
	def operator_minus(byte) : int
	def operator_minus(byte, float) : float
	def operator_minus(byte, byte) : int
	def operator_minus(byte, int) : int
	def operator_minus(byte, char) : int
	def operator_minus(byte, double) : double
	def operator_minusMinus(Byte) : Byte
	def operator_minusMinus(byte) : byte
	def operator_power(byte, int) : double
	def operator_power(byte, long) : double
	def operator_power(byte, short) : double
	def operator_power(byte, char) : double
	def operator_power(byte, float) : double
	def operator_power(byte, byte) : double
	def operator_power(byte, double) : double
	def operator_multiply(byte, long) : long
	def operator_multiply(byte, double) : double
	def operator_multiply(byte, byte) : int
	def operator_multiply(byte, int) : int
	def operator_multiply(byte, short) : int
	def operator_multiply(byte, float) : float
	def operator_multiply(byte, char) : int
	def operator_divide(byte, long) : long
	def operator_divide(byte, double) : double
	def operator_divide(byte, float) : float
	def operator_divide(byte, short) : int
	def operator_divide(byte, int) : int
	def operator_divide(byte, byte) : int
	def operator_divide(byte, char) : int
	def operator_modulo(byte, int) : int
	def operator_modulo(byte, byte) : int
	def operator_modulo(byte, char) : int
	def operator_modulo(byte, double) : double
	def operator_modulo(byte, long) : long
	def operator_modulo(byte, short) : int
	def operator_modulo(byte, float) : float
	def operator_equals(byte, short) : boolean
	def operator_equals(byte, long) : boolean
	def operator_equals(byte, int) : boolean
	def operator_equals(byte, char) : boolean
	def operator_equals(byte, float) : boolean
	def operator_equals(byte, double) : boolean
	def operator_equals(byte, byte) : boolean
	def operator_tripleEquals(byte, char) : boolean
	def operator_tripleEquals(byte, short) : boolean
	def operator_tripleEquals(byte, int) : boolean
	def operator_tripleEquals(byte, float) : boolean
	def operator_tripleEquals(byte, byte) : boolean
	def operator_tripleEquals(byte, double) : boolean
	def operator_tripleEquals(byte, long) : boolean
	def operator_tripleNotEquals(byte, char) : boolean
	def operator_tripleNotEquals(byte, short) : boolean
	def operator_tripleNotEquals(byte, double) : boolean
	def operator_tripleNotEquals(byte, float) : boolean
	def operator_tripleNotEquals(byte, byte) : boolean
	def operator_tripleNotEquals(byte, long) : boolean
	def operator_tripleNotEquals(byte, int) : boolean
	def operator_notEquals(byte, float) : boolean
	def operator_notEquals(byte, double) : boolean
	def operator_notEquals(byte, int) : boolean
	def operator_notEquals(byte, long) : boolean
	def operator_notEquals(byte, char) : boolean
	def operator_notEquals(byte, byte) : boolean
	def operator_notEquals(byte, short) : boolean
	def operator_lessThan(byte, byte) : boolean
	def operator_lessThan(byte, long) : boolean
	def operator_lessThan(byte, short) : boolean
	def operator_lessThan(byte, double) : boolean
	def operator_lessThan(byte, float) : boolean
	def operator_lessThan(byte, char) : boolean
	def operator_lessThan(byte, int) : boolean
	def operator_lessEqualsThan(byte, short) : boolean
	def operator_lessEqualsThan(byte, double) : boolean
	def operator_lessEqualsThan(byte, char) : boolean
	def operator_lessEqualsThan(byte, int) : boolean
	def operator_lessEqualsThan(byte, long) : boolean
	def operator_lessEqualsThan(byte, byte) : boolean
	def operator_lessEqualsThan(byte, float) : boolean
	def operator_greaterThan(byte, byte) : boolean
	def operator_greaterThan(byte, double) : boolean
	def operator_greaterThan(byte, long) : boolean
	def operator_greaterThan(byte, short) : boolean
	def operator_greaterThan(byte, char) : boolean
	def operator_greaterThan(byte, float) : boolean
	def operator_greaterThan(byte, int) : boolean
	def operator_greaterEqualsThan(byte, byte) : boolean
	def operator_greaterEqualsThan(byte, char) : boolean
	def operator_greaterEqualsThan(byte, int) : boolean
	def operator_greaterEqualsThan(byte, float) : boolean
	def operator_greaterEqualsThan(byte, short) : boolean
	def operator_greaterEqualsThan(byte, double) : boolean
	def operator_greaterEqualsThan(byte, long) : boolean
}
```


The `DoubleExtensions` class extends the class `Double` with the following functions:

```sarl
interface DoubleExtensions {
	def operator_plus(double, short) : double
	def operator_plus(double, long) : double
	def operator_plus(double, float) : double
	def operator_plus(double, byte) : double
	def operator_plus(double, double) : double
	def operator_plus(Double, Number) : double
	def operator_plus(double, int) : double
	def operator_plus(double, char) : double
	def operator_plusPlus(Double) : Double
	def operator_plusPlus(double) : double
	def operator_minus(double, byte) : double
	def operator_minus(double, int) : double
	def operator_minus(double, float) : double
	def operator_minus(double, short) : double
	def operator_minus(double, char) : double
	def operator_minus(double, long) : double
	def operator_minus(double) : double
	def operator_minus(Double, Number) : double
	def operator_minus(Double) : double
	def operator_minus(double, double) : double
	def operator_minusMinus(double) : double
	def operator_minusMinus(Double) : Double
	def operator_power(double, byte) : double
	def operator_power(double, float) : double
	def operator_power(double, short) : double
	def operator_power(double, char) : double
	def operator_power(double, long) : double
	def operator_power(Double, Number) : double
	def operator_power(double, double) : double
	def operator_power(double, int) : double
	def operator_multiply(Double, Number) : double
	def operator_multiply(double, int) : double
	def operator_multiply(double, short) : double
	def operator_multiply(double, char) : double
	def operator_multiply(double, double) : double
	def operator_multiply(double, float) : double
	def operator_multiply(double, long) : double
	def operator_multiply(double, byte) : double
	def operator_divide(double, byte) : double
	def operator_divide(double, long) : double
	def operator_divide(double, char) : double
	def operator_divide(double, short) : double
	def operator_divide(double, int) : double
	def operator_divide(double, float) : double
	def operator_divide(Double, Number) : double
	def operator_divide(double, double) : double
	def operator_modulo(double, int) : double
	def operator_modulo(double, char) : double
	def operator_modulo(double, float) : double
	def operator_modulo(double, byte) : double
	def operator_modulo(double, double) : double
	def operator_modulo(double, short) : double
	def operator_modulo(double, long) : double
	def operator_equals(double, char) : boolean
	def operator_equals(double, float) : boolean
	def operator_equals(double, int) : boolean
	def operator_equals(double, double) : boolean
	def operator_equals(double, long) : boolean
	def operator_equals(double, short) : boolean
	def operator_equals(double, byte) : boolean
	def operator_tripleEquals(double, byte) : boolean
	def operator_tripleEquals(double, int) : boolean
	def operator_tripleEquals(double, long) : boolean
	def operator_tripleEquals(double, char) : boolean
	def operator_tripleEquals(double, float) : boolean
	def operator_tripleEquals(double, double) : boolean
	def operator_tripleEquals(double, short) : boolean
	def operator_tripleNotEquals(double, char) : boolean
	def operator_tripleNotEquals(double, short) : boolean
	def operator_tripleNotEquals(double, double) : boolean
	def operator_tripleNotEquals(double, float) : boolean
	def operator_tripleNotEquals(double, byte) : boolean
	def operator_tripleNotEquals(double, long) : boolean
	def operator_tripleNotEquals(double, int) : boolean
	def operator_notEquals(double, float) : boolean
	def operator_notEquals(double, double) : boolean
	def operator_notEquals(double, int) : boolean
	def operator_notEquals(double, long) : boolean
	def operator_notEquals(double, char) : boolean
	def operator_notEquals(double, byte) : boolean
	def operator_notEquals(double, short) : boolean
	def operator_lessThan(double, byte) : boolean
	def operator_lessThan(double, long) : boolean
	def operator_lessThan(double, short) : boolean
	def operator_lessThan(double, double) : boolean
	def operator_lessThan(double, float) : boolean
	def operator_lessThan(double, char) : boolean
	def operator_lessThan(double, int) : boolean
	def operator_lessEqualsThan(double, short) : boolean
	def operator_lessEqualsThan(double, double) : boolean
	def operator_lessEqualsThan(double, char) : boolean
	def operator_lessEqualsThan(double, int) : boolean
	def operator_lessEqualsThan(double, long) : boolean
	def operator_lessEqualsThan(double, byte) : boolean
	def operator_lessEqualsThan(double, float) : boolean
	def operator_greaterThan(double, byte) : boolean
	def operator_greaterThan(double, double) : boolean
	def operator_greaterThan(double, long) : boolean
	def operator_greaterThan(double, short) : boolean
	def operator_greaterThan(double, char) : boolean
	def operator_greaterThan(double, float) : boolean
	def operator_greaterThan(double, int) : boolean
	def operator_greaterEqualsThan(double, byte) : boolean
	def operator_greaterEqualsThan(double, char) : boolean
	def operator_greaterEqualsThan(double, int) : boolean
	def operator_greaterEqualsThan(double, float) : boolean
	def operator_greaterEqualsThan(double, short) : boolean
	def operator_greaterEqualsThan(double, double) : boolean
	def operator_greaterEqualsThan(double, long) : boolean
}
```


The `FloatExtensions` class extends the class `Float` with the following functions:

```sarl
interface FloatExtensions {
	def operator_plus(float, double) : double
	def operator_plus(float, int) : float
	def operator_plus(float, short) : float
	def operator_plus(float, long) : float
	def operator_plus(float, float) : float
	def operator_plus(float, byte) : float
	def operator_plus(float, char) : float
	def operator_plusPlus(float) : float
	def operator_plusPlus(Float) : Float
	def operator_minus(float, short) : float
	def operator_minus(float, long) : float
	def operator_minus(float) : float
	def operator_minus(float, float) : float
	def operator_minus(float, byte) : float
	def operator_minus(float, int) : float
	def operator_minus(float, char) : float
	def operator_minus(float, double) : double
	def operator_minusMinus(Float) : Float
	def operator_minusMinus(float) : float
	def operator_power(float, int) : double
	def operator_power(float, long) : double
	def operator_power(float, short) : double
	def operator_power(float, char) : double
	def operator_power(float, float) : double
	def operator_power(float, byte) : double
	def operator_power(float, double) : double
	def operator_multiply(float, long) : float
	def operator_multiply(float, double) : double
	def operator_multiply(float, byte) : float
	def operator_multiply(float, int) : float
	def operator_multiply(float, short) : float
	def operator_multiply(float, float) : float
	def operator_multiply(float, char) : float
	def operator_divide(float, long) : float
	def operator_divide(float, double) : double
	def operator_divide(float, float) : float
	def operator_divide(float, short) : float
	def operator_divide(float, int) : float
	def operator_divide(float, byte) : float
	def operator_divide(float, char) : float
	def operator_modulo(float, int) : float
	def operator_modulo(float, byte) : float
	def operator_modulo(float, char) : float
	def operator_modulo(float, double) : double
	def operator_modulo(float, long) : float
	def operator_modulo(float, short) : float
	def operator_modulo(float, float) : float
	def operator_equals(float, short) : boolean
	def operator_equals(float, long) : boolean
	def operator_equals(float, int) : boolean
	def operator_equals(float, char) : boolean
	def operator_equals(float, float) : boolean
	def operator_equals(float, double) : boolean
	def operator_equals(float, byte) : boolean
	def operator_tripleEquals(float, char) : boolean
	def operator_tripleEquals(float, short) : boolean
	def operator_tripleEquals(float, int) : boolean
	def operator_tripleEquals(float, float) : boolean
	def operator_tripleEquals(float, byte) : boolean
	def operator_tripleEquals(float, double) : boolean
	def operator_tripleEquals(float, long) : boolean
	def operator_tripleNotEquals(float, char) : boolean
	def operator_tripleNotEquals(float, short) : boolean
	def operator_tripleNotEquals(float, double) : boolean
	def operator_tripleNotEquals(float, float) : boolean
	def operator_tripleNotEquals(float, byte) : boolean
	def operator_tripleNotEquals(float, long) : boolean
	def operator_tripleNotEquals(float, int) : boolean
	def operator_notEquals(float, float) : boolean
	def operator_notEquals(float, double) : boolean
	def operator_notEquals(float, int) : boolean
	def operator_notEquals(float, long) : boolean
	def operator_notEquals(float, char) : boolean
	def operator_notEquals(float, byte) : boolean
	def operator_notEquals(float, short) : boolean
	def operator_lessThan(float, byte) : boolean
	def operator_lessThan(float, long) : boolean
	def operator_lessThan(float, short) : boolean
	def operator_lessThan(float, double) : boolean
	def operator_lessThan(float, float) : boolean
	def operator_lessThan(float, char) : boolean
	def operator_lessThan(float, int) : boolean
	def operator_lessEqualsThan(float, short) : boolean
	def operator_lessEqualsThan(float, double) : boolean
	def operator_lessEqualsThan(float, char) : boolean
	def operator_lessEqualsThan(float, int) : boolean
	def operator_lessEqualsThan(float, long) : boolean
	def operator_lessEqualsThan(float, byte) : boolean
	def operator_lessEqualsThan(float, float) : boolean
	def operator_greaterThan(float, byte) : boolean
	def operator_greaterThan(float, double) : boolean
	def operator_greaterThan(float, long) : boolean
	def operator_greaterThan(float, short) : boolean
	def operator_greaterThan(float, char) : boolean
	def operator_greaterThan(float, float) : boolean
	def operator_greaterThan(float, int) : boolean
	def operator_greaterEqualsThan(float, byte) : boolean
	def operator_greaterEqualsThan(float, char) : boolean
	def operator_greaterEqualsThan(float, int) : boolean
	def operator_greaterEqualsThan(float, float) : boolean
	def operator_greaterEqualsThan(float, short) : boolean
	def operator_greaterEqualsThan(float, double) : boolean
	def operator_greaterEqualsThan(float, long) : boolean
}
```


The `IntegerExtensions` class extends the class `Integer` with the following functions:

```sarl
interface IntegerExtensions {
	def operator_plus(int, float) : float
	def operator_plus(int, double) : double
	def operator_plus(int, byte) : int
	def operator_plus(int, long) : long
	def operator_plus(int, int) : int
	def operator_plus(int, char) : int
	def operator_plus(int, short) : int
	def operator_plusPlus(int) : int
	def operator_plusPlus(Integer) : Integer
	def operator_minus(int, double) : double
	def operator_minus(int) : int
	def operator_minus(int, short) : int
	def operator_minus(int, byte) : int
	def operator_minus(int, long) : long
	def operator_minus(int, char) : int
	def operator_minus(int, int) : int
	def operator_minus(int, float) : float
	def operator_minusMinus(int) : int
	def operator_minusMinus(Integer) : Integer
	def operator_power(int, long) : double
	def operator_power(int, short) : double
	def operator_power(int, double) : double
	def operator_power(int, float) : double
	def operator_power(int, char) : double
	def operator_power(int, int) : double
	def operator_power(int, byte) : double
	def operator_multiply(int, double) : double
	def operator_multiply(int, short) : int
	def operator_multiply(int, float) : float
	def operator_multiply(int, byte) : int
	def operator_multiply(int, long) : long
	def operator_multiply(int, char) : int
	def operator_multiply(int, int) : int
	def operator_divide(int, double) : double
	def operator_divide(int, int) : int
	def operator_divide(int, long) : long
	def operator_divide(int, byte) : int
	def operator_divide(int, char) : int
	def operator_divide(int, float) : float
	def operator_divide(int, short) : int
	def operator_modulo(int, long) : long
	def operator_modulo(int, short) : int
	def operator_modulo(int, char) : int
	def operator_modulo(int, int) : int
	def operator_modulo(int, byte) : int
	def operator_modulo(int, float) : float
	def operator_modulo(int, double) : double
	def operator_doubleLessThan(int, int) : int
	def operator_doubleGreaterThan(int, int) : int
	def operator_tripleGreaterThan(int, int) : int
	def operator_equals(int, byte) : boolean
	def operator_equals(int, long) : boolean
	def operator_equals(int, int) : boolean
	def operator_equals(int, double) : boolean
	def operator_equals(int, float) : boolean
	def operator_equals(int, short) : boolean
	def operator_equals(int, char) : boolean
	def operator_tripleEquals(int, byte) : boolean
	def operator_tripleEquals(int, double) : boolean
	def operator_tripleEquals(int, short) : boolean
	def operator_tripleEquals(int, int) : boolean
	def operator_tripleEquals(int, char) : boolean
	def operator_tripleEquals(int, long) : boolean
	def operator_tripleEquals(int, float) : boolean
	def operator_tripleNotEquals(int, char) : boolean
	def operator_tripleNotEquals(int, short) : boolean
	def operator_tripleNotEquals(int, int) : boolean
	def operator_tripleNotEquals(int, float) : boolean
	def operator_tripleNotEquals(int, long) : boolean
	def operator_tripleNotEquals(int, double) : boolean
	def operator_tripleNotEquals(int, byte) : boolean
	def operator_notEquals(int, byte) : boolean
	def operator_notEquals(int, char) : boolean
	def operator_notEquals(int, float) : boolean
	def operator_notEquals(int, short) : boolean
	def operator_notEquals(int, int) : boolean
	def operator_notEquals(int, double) : boolean
	def operator_notEquals(int, long) : boolean
	def operator_lessThan(int, short) : boolean
	def operator_lessThan(int, long) : boolean
	def operator_lessThan(int, int) : boolean
	def operator_lessThan(int, float) : boolean
	def operator_lessThan(int, double) : boolean
	def operator_lessThan(int, byte) : boolean
	def operator_lessThan(int, char) : boolean
	def operator_lessEqualsThan(int, float) : boolean
	def operator_lessEqualsThan(int, short) : boolean
	def operator_lessEqualsThan(int, byte) : boolean
	def operator_lessEqualsThan(int, char) : boolean
	def operator_lessEqualsThan(int, long) : boolean
	def operator_lessEqualsThan(int, int) : boolean
	def operator_lessEqualsThan(int, double) : boolean
	def operator_greaterThan(int, double) : boolean
	def operator_greaterThan(int, float) : boolean
	def operator_greaterThan(int, long) : boolean
	def operator_greaterThan(int, int) : boolean
	def operator_greaterThan(int, byte) : boolean
	def operator_greaterThan(int, char) : boolean
	def operator_greaterThan(int, short) : boolean
	def operator_greaterEqualsThan(int, byte) : boolean
	def operator_greaterEqualsThan(int, short) : boolean
	def operator_greaterEqualsThan(int, int) : boolean
	def operator_greaterEqualsThan(int, float) : boolean
	def operator_greaterEqualsThan(int, char) : boolean
	def operator_greaterEqualsThan(int, long) : boolean
	def operator_greaterEqualsThan(int, double) : boolean
	def operator_upTo(int, int) : IntegerRange
	def operator_doubleDotLessThan(int, int) : ExclusiveRange
	def operator_greaterThanDoubleDot(int, int) : ExclusiveRange
	def bitwiseOr(int, int) : int
	def bitwiseXor(int, int) : int
	def bitwiseAnd(int, int) : int
	def bitwiseNot(int) : int
}
```


The `LongExtensions` class extends the class `Long` with the following functions:

```sarl
interface LongExtensions {
	def operator_plus(long, short) : long
	def operator_plus(long, double) : double
	def operator_plus(long, long) : long
	def operator_plus(long, int) : long
	def operator_plus(long, float) : float
	def operator_plus(long, byte) : long
	def operator_plus(long, char) : long
	def operator_plusPlus(Long) : Long
	def operator_plusPlus(long) : long
	def operator_minus(long, float) : float
	def operator_minus(long, double) : double
	def operator_minus(long, int) : long
	def operator_minus(long, byte) : long
	def operator_minus(long, char) : long
	def operator_minus(long) : long
	def operator_minus(long, long) : long
	def operator_minus(long, short) : long
	def operator_minusMinus(long) : long
	def operator_minusMinus(Long) : Long
	def operator_power(long, int) : double
	def operator_power(long, double) : double
	def operator_power(long, byte) : double
	def operator_power(long, char) : double
	def operator_power(long, float) : double
	def operator_power(long, short) : double
	def operator_power(long, long) : double
	def operator_multiply(long, float) : float
	def operator_multiply(long, long) : long
	def operator_multiply(long, short) : long
	def operator_multiply(long, int) : long
	def operator_multiply(long, byte) : long
	def operator_multiply(long, char) : long
	def operator_multiply(long, double) : double
	def operator_divide(long, long) : long
	def operator_divide(long, char) : long
	def operator_divide(long, byte) : long
	def operator_divide(long, int) : long
	def operator_divide(long, float) : float
	def operator_divide(long, short) : long
	def operator_divide(long, double) : double
	def operator_modulo(long, int) : long
	def operator_modulo(long, long) : long
	def operator_modulo(long, char) : long
	def operator_modulo(long, float) : float
	def operator_modulo(long, byte) : long
	def operator_modulo(long, short) : long
	def operator_modulo(long, double) : double
	def operator_doubleLessThan(long, int) : long
	def operator_doubleGreaterThan(long, int) : long
	def operator_tripleGreaterThan(long, int) : long
	def operator_equals(long, double) : boolean
	def operator_equals(long, int) : boolean
	def operator_equals(long, float) : boolean
	def operator_equals(long, byte) : boolean
	def operator_equals(long, char) : boolean
	def operator_equals(long, short) : boolean
	def operator_equals(long, long) : boolean
	def operator_tripleEquals(long, int) : boolean
	def operator_tripleEquals(long, float) : boolean
	def operator_tripleEquals(long, short) : boolean
	def operator_tripleEquals(long, double) : boolean
	def operator_tripleEquals(long, char) : boolean
	def operator_tripleEquals(long, byte) : boolean
	def operator_tripleEquals(long, long) : boolean
	def operator_tripleNotEquals(long, char) : boolean
	def operator_tripleNotEquals(long, int) : boolean
	def operator_tripleNotEquals(long, short) : boolean
	def operator_tripleNotEquals(long, byte) : boolean
	def operator_tripleNotEquals(long, double) : boolean
	def operator_tripleNotEquals(long, long) : boolean
	def operator_tripleNotEquals(long, float) : boolean
	def operator_notEquals(long, double) : boolean
	def operator_notEquals(long, short) : boolean
	def operator_notEquals(long, char) : boolean
	def operator_notEquals(long, float) : boolean
	def operator_notEquals(long, byte) : boolean
	def operator_notEquals(long, int) : boolean
	def operator_notEquals(long, long) : boolean
	def operator_lessThan(long, long) : boolean
	def operator_lessThan(long, byte) : boolean
	def operator_lessThan(long, float) : boolean
	def operator_lessThan(long, short) : boolean
	def operator_lessThan(long, double) : boolean
	def operator_lessThan(long, char) : boolean
	def operator_lessThan(long, int) : boolean
	def operator_lessEqualsThan(long, long) : boolean
	def operator_lessEqualsThan(long, short) : boolean
	def operator_lessEqualsThan(long, double) : boolean
	def operator_lessEqualsThan(long, char) : boolean
	def operator_lessEqualsThan(long, byte) : boolean
	def operator_lessEqualsThan(long, float) : boolean
	def operator_lessEqualsThan(long, int) : boolean
	def operator_greaterThan(long, int) : boolean
	def operator_greaterThan(long, byte) : boolean
	def operator_greaterThan(long, double) : boolean
	def operator_greaterThan(long, float) : boolean
	def operator_greaterThan(long, short) : boolean
	def operator_greaterThan(long, char) : boolean
	def operator_greaterThan(long, long) : boolean
	def operator_greaterEqualsThan(long, float) : boolean
	def operator_greaterEqualsThan(long, char) : boolean
	def operator_greaterEqualsThan(long, int) : boolean
	def operator_greaterEqualsThan(long, byte) : boolean
	def operator_greaterEqualsThan(long, double) : boolean
	def operator_greaterEqualsThan(long, long) : boolean
	def operator_greaterEqualsThan(long, short) : boolean
	def bitwiseOr(long, long) : long
	def bitwiseXor(long, long) : long
	def bitwiseAnd(long, long) : long
	def bitwiseNot(long) : long
}
```


The `ShortExtensions` class extends the class `Short` with the following functions:

```sarl
interface ShortExtensions {
	def operator_plus(short, double) : double
	def operator_plus(short, int) : int
	def operator_plus(short, short) : int
	def operator_plus(short, long) : long
	def operator_plus(short, float) : float
	def operator_plus(short, byte) : int
	def operator_plus(short, char) : int
	def operator_plusPlus(short) : short
	def operator_plusPlus(Short) : Short
	def operator_minus(short, short) : int
	def operator_minus(short, long) : long
	def operator_minus(short) : int
	def operator_minus(short, float) : float
	def operator_minus(short, byte) : int
	def operator_minus(short, int) : int
	def operator_minus(short, char) : int
	def operator_minus(short, double) : double
	def operator_minusMinus(Short) : Short
	def operator_minusMinus(short) : short
	def operator_power(short, int) : double
	def operator_power(short, long) : double
	def operator_power(short, short) : double
	def operator_power(short, char) : double
	def operator_power(short, float) : double
	def operator_power(short, byte) : double
	def operator_power(short, double) : double
	def operator_multiply(short, long) : long
	def operator_multiply(short, double) : double
	def operator_multiply(short, byte) : int
	def operator_multiply(short, int) : int
	def operator_multiply(short, short) : int
	def operator_multiply(short, float) : float
	def operator_multiply(short, char) : int
	def operator_divide(short, long) : long
	def operator_divide(short, double) : double
	def operator_divide(short, float) : float
	def operator_divide(short, short) : int
	def operator_divide(short, int) : int
	def operator_divide(short, byte) : int
	def operator_divide(short, char) : int
	def operator_modulo(short, int) : int
	def operator_modulo(short, byte) : int
	def operator_modulo(short, char) : int
	def operator_modulo(short, double) : double
	def operator_modulo(short, long) : long
	def operator_modulo(short, short) : int
	def operator_modulo(short, float) : float
	def operator_equals(short, short) : boolean
	def operator_equals(short, long) : boolean
	def operator_equals(short, int) : boolean
	def operator_equals(short, char) : boolean
	def operator_equals(short, float) : boolean
	def operator_equals(short, double) : boolean
	def operator_equals(short, byte) : boolean
	def operator_tripleEquals(short, char) : boolean
	def operator_tripleEquals(short, short) : boolean
	def operator_tripleEquals(short, int) : boolean
	def operator_tripleEquals(short, float) : boolean
	def operator_tripleEquals(short, byte) : boolean
	def operator_tripleEquals(short, double) : boolean
	def operator_tripleEquals(short, long) : boolean
	def operator_tripleNotEquals(short, char) : boolean
	def operator_tripleNotEquals(short, short) : boolean
	def operator_tripleNotEquals(short, double) : boolean
	def operator_tripleNotEquals(short, float) : boolean
	def operator_tripleNotEquals(short, byte) : boolean
	def operator_tripleNotEquals(short, long) : boolean
	def operator_tripleNotEquals(short, int) : boolean
	def operator_notEquals(short, float) : boolean
	def operator_notEquals(short, double) : boolean
	def operator_notEquals(short, int) : boolean
	def operator_notEquals(short, long) : boolean
	def operator_notEquals(short, char) : boolean
	def operator_notEquals(short, byte) : boolean
	def operator_notEquals(short, short) : boolean
	def operator_lessThan(short, byte) : boolean
	def operator_lessThan(short, long) : boolean
	def operator_lessThan(short, short) : boolean
	def operator_lessThan(short, double) : boolean
	def operator_lessThan(short, float) : boolean
	def operator_lessThan(short, char) : boolean
	def operator_lessThan(short, int) : boolean
	def operator_lessEqualsThan(short, short) : boolean
	def operator_lessEqualsThan(short, double) : boolean
	def operator_lessEqualsThan(short, char) : boolean
	def operator_lessEqualsThan(short, int) : boolean
	def operator_lessEqualsThan(short, long) : boolean
	def operator_lessEqualsThan(short, byte) : boolean
	def operator_lessEqualsThan(short, float) : boolean
	def operator_greaterThan(short, byte) : boolean
	def operator_greaterThan(short, double) : boolean
	def operator_greaterThan(short, long) : boolean
	def operator_greaterThan(short, short) : boolean
	def operator_greaterThan(short, char) : boolean
	def operator_greaterThan(short, float) : boolean
	def operator_greaterThan(short, int) : boolean
	def operator_greaterEqualsThan(short, byte) : boolean
	def operator_greaterEqualsThan(short, char) : boolean
	def operator_greaterEqualsThan(short, int) : boolean
	def operator_greaterEqualsThan(short, float) : boolean
	def operator_greaterEqualsThan(short, short) : boolean
	def operator_greaterEqualsThan(short, double) : boolean
	def operator_greaterEqualsThan(short, long) : boolean
}
```



###4.3. Primitive Type Category

The `BooleanExtensions` class extends the class `Boolean` with the following functions:

```sarl
interface BooleanExtensions {
	def operator_or(boolean, boolean) : boolean
	def operator_and(boolean, boolean) : boolean
	def operator_equals(boolean, boolean) : boolean
	def operator_notEquals(boolean, boolean) : boolean
	def operator_lessThan(boolean, boolean) : boolean
	def operator_lessEqualsThan(boolean, boolean) : boolean
	def operator_greaterThan(boolean, boolean) : boolean
	def operator_greaterEqualsThan(boolean, boolean) : boolean
	def operator_not(boolean) : boolean
	def xor(boolean, boolean) : boolean
}
```


The `CharacterExtensions` class extends the class `Character` with the following functions:

```sarl
interface CharacterExtensions {
	def operator_plus(char, double) : double
	def operator_plus(char, int) : int
	def operator_plus(char, short) : int
	def operator_plus(char, long) : long
	def operator_plus(char, float) : float
	def operator_plus(char, byte) : int
	def operator_plus(char, char) : int
	def operator_plusPlus(char) : char
	def operator_plusPlus(Character) : Character
	def operator_minus(char, short) : int
	def operator_minus(char, long) : long
	def operator_minus(char) : int
	def operator_minus(char, float) : float
	def operator_minus(char, byte) : int
	def operator_minus(char, int) : int
	def operator_minus(char, char) : int
	def operator_minus(char, double) : double
	def operator_minusMinus(Character) : Character
	def operator_minusMinus(char) : char
	def operator_power(char, int) : double
	def operator_power(char, long) : double
	def operator_power(char, short) : double
	def operator_power(char, char) : double
	def operator_power(char, float) : double
	def operator_power(char, byte) : double
	def operator_power(char, double) : double
	def operator_multiply(char, long) : long
	def operator_multiply(char, double) : double
	def operator_multiply(char, byte) : int
	def operator_multiply(char, int) : int
	def operator_multiply(char, short) : int
	def operator_multiply(char, float) : float
	def operator_multiply(char, char) : int
	def operator_divide(char, long) : long
	def operator_divide(char, double) : double
	def operator_divide(char, float) : float
	def operator_divide(char, short) : int
	def operator_divide(char, int) : int
	def operator_divide(char, byte) : int
	def operator_divide(char, char) : int
	def operator_modulo(char, int) : int
	def operator_modulo(char, byte) : int
	def operator_modulo(char, char) : int
	def operator_modulo(char, double) : double
	def operator_modulo(char, long) : long
	def operator_modulo(char, short) : int
	def operator_modulo(char, float) : float
	def operator_equals(char, short) : boolean
	def operator_equals(char, long) : boolean
	def operator_equals(char, int) : boolean
	def operator_equals(char, char) : boolean
	def operator_equals(char, float) : boolean
	def operator_equals(char, double) : boolean
	def operator_equals(char, byte) : boolean
	def operator_tripleEquals(char, char) : boolean
	def operator_tripleEquals(char, short) : boolean
	def operator_tripleEquals(char, int) : boolean
	def operator_tripleEquals(char, float) : boolean
	def operator_tripleEquals(char, byte) : boolean
	def operator_tripleEquals(char, double) : boolean
	def operator_tripleEquals(char, long) : boolean
	def operator_tripleNotEquals(char, char) : boolean
	def operator_tripleNotEquals(char, short) : boolean
	def operator_tripleNotEquals(char, double) : boolean
	def operator_tripleNotEquals(char, float) : boolean
	def operator_tripleNotEquals(char, byte) : boolean
	def operator_tripleNotEquals(char, long) : boolean
	def operator_tripleNotEquals(char, int) : boolean
	def operator_notEquals(char, float) : boolean
	def operator_notEquals(char, double) : boolean
	def operator_notEquals(char, int) : boolean
	def operator_notEquals(char, long) : boolean
	def operator_notEquals(char, char) : boolean
	def operator_notEquals(char, byte) : boolean
	def operator_notEquals(char, short) : boolean
	def operator_lessThan(char, byte) : boolean
	def operator_lessThan(char, long) : boolean
	def operator_lessThan(char, short) : boolean
	def operator_lessThan(char, double) : boolean
	def operator_lessThan(char, float) : boolean
	def operator_lessThan(char, char) : boolean
	def operator_lessThan(char, int) : boolean
	def operator_lessEqualsThan(char, short) : boolean
	def operator_lessEqualsThan(char, double) : boolean
	def operator_lessEqualsThan(char, char) : boolean
	def operator_lessEqualsThan(char, int) : boolean
	def operator_lessEqualsThan(char, long) : boolean
	def operator_lessEqualsThan(char, byte) : boolean
	def operator_lessEqualsThan(char, float) : boolean
	def operator_greaterThan(char, byte) : boolean
	def operator_greaterThan(char, double) : boolean
	def operator_greaterThan(char, long) : boolean
	def operator_greaterThan(char, short) : boolean
	def operator_greaterThan(char, char) : boolean
	def operator_greaterThan(char, float) : boolean
	def operator_greaterThan(char, int) : boolean
	def operator_greaterEqualsThan(char, byte) : boolean
	def operator_greaterEqualsThan(char, char) : boolean
	def operator_greaterEqualsThan(char, int) : boolean
	def operator_greaterEqualsThan(char, float) : boolean
	def operator_greaterEqualsThan(char, short) : boolean
	def operator_greaterEqualsThan(char, double) : boolean
	def operator_greaterEqualsThan(char, long) : boolean
}
```



###4.4. Object Type Category

The `ComparableExtensions` class extends the class `Comparable` with the following functions:

```sarl
interface ComparableExtensions {
	def operator_spaceship(Comparable<Object>, Object) : int
	def operator_lessThan(Comparable<Object>, Object) : boolean
	def operator_lessEqualsThan(Comparable<Object>, Object) : boolean
	def operator_greaterThan(Comparable<Object>, Object) : boolean
	def operator_greaterEqualsThan(Comparable<Object>, Object) : boolean
}
```


The `ObjectExtensions` class extends the class `Object` with the following functions:

```sarl
interface ObjectExtensions {
	def operator_doubleArrow(Object, (Object) => void) : Object
	def operator_plus(Object, String) : String
	def operator_elvis(Object, Object) : Object
	def operator_equals(Object, Object) : boolean
	def operator_tripleEquals(Object, Object) : boolean
	def operator_tripleNotEquals(Object, Object) : boolean
	def operator_notEquals(Object, Object) : boolean
	def operator_mappedTo(Object, Object) : Pair<Object, Object>
	def identityEquals(Object, Object) : boolean
}
```


The `StringExtensions` class extends the class `String` with the following functions:

```sarl
interface StringExtensions {
	def toFirstUpper(String) : String
	def toFirstLower(String) : String
	def isNullOrEmpty(String) : boolean
	def operator_plus(String, String) : String
	def operator_plus(String, Object) : String
}
```



###4.5. Functions and Procedure Category

The `FunctionExtensions` class extends the function type with the following functions:

```sarl
interface FunctionExtensions {
	def compose((Object) => Object, (Object) => Object) : (Object) => Object
	def andThen((Object) => Object, (Object) => Object) : (Object) => Object
	def andThen((Object, Object) => Object, (Object) => Object) : (Object, Object) => Object
	def andThen((Object) => void, (Object) => void) : (Object) => void
	def andThen(Procedure0, Procedure0) : Procedure0
	def curry((Object, Object, Object, Object, Object, Object) => Object, Object) : (Object, Object, Object, Object, Object) => Object
	def curry((Object) => Object, Object) : () => Object
	def curry((Object, Object) => Object, Object) : (Object) => Object
	def curry((Object, Object, Object) => Object, Object) : (Object, Object) => Object
	def curry((Object, Object, Object, Object) => Object, Object) : (Object, Object, Object) => Object
	def curry((Object, Object, Object, Object, Object) => Object, Object) : (Object, Object, Object, Object) => Object
}
```


The `ProcedureExtensions` class extends the procedure type with the following functions:

```sarl
interface ProcedureExtensions {
	def curry((Object, Object, Object, Object, Object) => void, Object) : (Object, Object, Object, Object) => void
	def curry((Object, Object, Object, Object) => void, Object) : (Object, Object, Object) => void
	def curry((Object, Object, Object, Object, Object, Object) => void, Object) : (Object, Object, Object, Object, Object) => void
	def curry((Object, Object, Object) => void, Object) : (Object, Object) => void
	def curry((Object) => void, Object) : Procedure0
	def curry((Object, Object) => void, Object) : (Object) => void
}
```



###4.6. Time Category

The `SARLTimeExtensions` class extends the number classes with the following time-based functions:

```sarl
interface SARLTimeExtensions {
	def hours(long) : long
	def hours(int) : long
	def hours(short) : long
	def hours(byte) : long
	def hours(Number) : long
	def hours(double) : long
	def hours(float) : long
	def minutes(int) : long
	def minutes(short) : long
	def minutes(byte) : long
	def minutes(Number) : long
	def minutes(long) : long
	def minutes(float) : long
	def minutes(double) : long
	def seconds(int) : long
	def seconds(short) : long
	def seconds(byte) : long
	def seconds(Number) : long
	def seconds(float) : long
	def seconds(double) : long
	def seconds(long) : long
	def milliseconds(int) : long
	def milliseconds(short) : long
	def milliseconds(byte) : long
	def milliseconds(Number) : long
	def milliseconds(double) : long
	def milliseconds(float) : long
	def milliseconds(long) : long
	def days(byte) : long
	def days(short) : long
	def days(int) : long
	def days(long) : long
	def days(Number) : long
	def days(double) : long
	def days(float) : long
	def weeks(int) : long
	def weeks(long) : long
	def weeks(float) : long
	def weeks(double) : long
	def weeks(Number) : long
	def weeks(byte) : long
	def weeks(short) : long
	def convertFromTo(double, TimeUnit, TimeUnit) : double
}
```





##5. Acknowledgements

This documentation is inspired by the documentations from the
[Xtext](https://www.eclipse.org/Xtext/documentation.html) and
[Xtend](https://www.eclipse.org/xtend/documentation.html) projects.

##6. Legal Notice

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.6
* Status: Stable Release
* Release: 2017-09-14

> Copyright &copy; 2014-2017 [the original authors or authors](http://www.sarl.io/about/index.html).
>
> Licensed under the Apache License, Version 2.0;
> you may not use this file except in compliance with the License.
> You may obtain a copy of the [License](http://www.apache.org/licenses/LICENSE-2.0).
>
> You are free to reproduce the content of this page on copyleft websites such as Wikipedia.

<small>Generated with the translator io.sarl.maven.docs.generator 0.6.0.</small>