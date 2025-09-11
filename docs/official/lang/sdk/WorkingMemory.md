---
title: "Working Memory for Agents"
layout: default
---

# Working Memory for Agents


<ul class="page_outline" id="page_outline">

<li><a href="#1-general-principle-of-a-working-memory">1. General Principle of a Working Memory</a></li>
<ul>
  <li><a href="#11-generic-implementation-vs-hard-coded-implementation">1.1. Generic Implementation vs. Hard-coded Implementation</a></li>
</ul>
<li><a href="#2-integration-with-sarl-agents">2. Integration with SARL Agents</a></li>
<li><a href="#3-capacity-for-using-a-working-memory">3. Capacity for using a Working Memory</a></li>
<ul>
  <li><a href="#31-knowledge-storage">3.1. Knowledge Storage</a></li>
  <li><a href="#32-knowledge-retrieval">3.2. Knowledge Retrieval</a></li>
  <li><a href="#33-knowledge-existence-and-metadata">3.3. Knowledge Existence and Metadata</a></li>
  <li><a href="#34-knowledge-removal">3.4. Knowledge Removal</a></li>
  <li><a href="#35-thread-safety">3.5. Thread Safety</a></li>
</ul>
<li><a href="#4-version-specification">4. Version Specification</a></li>
<li><a href="#5-legal-notice">5. Legal Notice</a></li>

</ul>


An agent working memory serves as a fundamental component designed to enable autonomous entities to store, retrieve, and manipulate knowledge dynamically during their operational lifecycle. The primary goal of such a memory system is to provide agents with a localized, efficient, and context-aware repository for maintaining internal state, facilitating reasoning, and supporting adaptive behavior in response to environmental stimuli or internal objectives.

## 1. General Principle of a Working Memory

One of the core objectives of an agent working memory is to support dynamic reasoning and reactivity. Agents operate in environments that are often dynamic, uncertain, or partially observable, necessitating a mechanism to retain and update information that reflects the most recent state of their surroundings or internal computations. This memory system acts as an intermediary between perception and action, allowing agents to integrate sensory inputs, maintain intermediate results, and track the progress of ongoing tasks. By doing so, it bridges the gap between the agent’s perceptual capabilities and its deliberative or reactive processes, ensuring that decisions are grounded in up-to-date and contextually relevant information.

A fundamental principle underlying the design of an agent working memory is structured accessibility. Knowledge stored within this memory must be retrievable with minimal computational overhead, as agents frequently require rapid access to critical data to respond to time-sensitive events. This principle is often realized through key-value associations, where knowledge is indexed by unique identifiers or [scoped names](./Naming.html#naming-for-data-with-scopes), enabling efficient lookup and modification. The use of scopes further enhances this structure by allowing agents to disambiguate between different instances of similarly named knowledge, such as distinguishing between "temperature" in an indoor versus outdoor context. Such organization not only optimizes retrieval but also supports modularity, enabling agents to manage multiple, potentially overlapping, knowledge sets without conflict.

The flexibility of knowledge representation is also a key consideration. An agent’s working memory must accommodate a diverse range of data types, from primitive values to complex objects, and support operations such as conditional updates, existence checks, and bulk removal. This adaptability allows the memory to serve a variety of use cases, including maintaining task-specific state, caching intermediate computations, or storing contextual information that influences decision-making. Additionally, the memory system should provide mechanisms to handle edge cases, such as the presence of null or undefined values, either by explicitly permitting them or enforcing policies that remove or replace them to maintain consistency.

Another essential principle is concurrency control, particularly in multi-threaded or distributed agent architectures of SARL. Since agents may operate concurrently or interact with shared resources, working memory must incorporate mechanisms to prevent inconsistencies arising from simultaneous access or modification. Synchronization primitives, such as locks or atomic operations, are commonly employed to ensure thread safety, thereby preserving the integrity of the stored knowledge.

### 1.1. Generic Implementation vs. Hard-coded Implementation

The SARL framework provides two complementary approaches for managing an agent’s internal state: a generic **working memory API** (that is described in the rest of this manual page) and **direct access to local fields**.
These mechanisms offer developers flexibility in how agents store, retrieve, and manipulate knowledge, catering to both structured, dynamic data management and efficient, low-level state handling.

The working memory API is a high-level, capacity-based interface that allows agents to store and manage knowledge in a structured, key-value manner. This API abstracts the underlying storage mechanism, enabling agents to associate data with unique identifiers (e.g., `ScopedDataName`) and perform operations such as insertion, retrieval, conditional updates, and deletion.

In contrast, SARL also allows agents to define local fields, which are very close to the traditional object-oriented member variables that can be accessed and modified directly within the agent’s code. Local fields provide a lightweight and efficient way to store agent-specific state, offering the performance benefits of direct memory access. They are well-suited for simple, static, or frequently accessed data that does not require the overhead of the working memory API. 

While local fields lack the advanced features of the working memory — such as scoping or synchronization — they offer simplicity and speed, making them ideal for managing core agent attributes.

#### Concept of Scope

In SARL, the concept of **scope** refers to a mechanism for organizing and disambiguating knowledge or data within an agent’s memory by associating it with a specific context or namespace. Scope serves as a logical container that groups related pieces of information, enabling agents to manage multiple instances of similarly named knowledge without conflict.

Scopes are often implemented as part of a composite `ScopedDataName`, which combines a base name (e.g., "temperature") with a scope (e.g., "indoor" or "outdoor"). This allows the agent to store and retrieve knowledge precisely, even when the same name is reused across different contexts. According to the [naming convention for scoped names](./Naming.html#naming-for-data-with-scopes), it is possible to refer to a scoped data with a URI string. For example, `data:/indoor/temperature` and `data:/outdoor/temperature` represent two distinct knowledge entries, each associated with its own value.


## 2. Integration with SARL Agents

For using an working memory in your agent, you have not to do more than using the `WorkingMemory` capacity:

```sarl
agent A {
	uses WorkingMemory
	
	on Event {
		setKnowledge(new ScopedDataName("a", "b", "name"), "a value")
	}
}
```


By default, a working memory implemented with a dictionary is used. You could select your preferred working memory implementation by changing the skill related to the `WorkingMemory` capacity in the agent.


## 3. Capacity for using a Working Memory

The `WorkingMemory` capacity in SARL enables agents to store, retrieve, and manipulate internal knowledge dynamically. It provides a structured, thread-safe, and context-aware memory system, allowing agents to maintain state, reason about their environment, and adapt their behavior based on stored information.

This capacity abstracts the underlying storage mechanism, offering a uniform API for knowledge management while supporting custom implementations (e.g., in-memory dictionaries, persistent databases, or distributed stores). By default, SARL provides a dictionary-based implementation (`DictionaryWorkingMemory`), but developers can replace it with domain-specific solutions just by setting up the corresponding SARL skill in the agent.

### 3.1. Knowledge Storage

* `setKnowledge(id : ScopedDataName, value : Object) : Object` inserts or updates a knowledge entry. The `id` is the name of the scoped data (see [Naming convention](./Naming.html#naming-for-data-with-scopes)). The previous value associated with `id`, or `null` if none existed is returned by this function.

```sarl
agent A {
	uses WorkingMemory
	
	on Event {
		setKnowledge(new ScopedDataName("a", "b", "name"), "a value")
	}
}
```



* `setKnowledgeIfAbsent(id : ScopedDataName, value : Object)` inserts a knowledge entry **only if it does not already exist**.

```sarl
agent A {
	uses WorkingMemory
	
	on Event {
		setKnowledgeIfAbsent(new ScopedDataName("a", "b", "name"), "a value")
	}
}
```



* `setKnowledgeIfPresent(id : ScopedDataName, value : Object) : Object` updates a knowledge entry **only if it already exists**. The previous value, or `null` if the entry did not exist is returned by this function.

```sarl
agent A {
	uses WorkingMemory
	
	on Event {
		setKnowledgeIfPresent(new ScopedDataName("a", "b", "name"), "a value")
	}
}
```




### 3.2. Knowledge Retrieval

* `getKnowledge(id : ScopedDataName, type : Class<T> = null) : T` retrieves the value associated with `id`. If the `type` is provided, the value from the working memory is casted to this type. Exception `KnowledgeMissingException` is thrown if the entry does not exist.

```sarl
agent A {
	uses WorkingMemory
	
	on Event {
		var objectValue : Object = getKnowledge(new ScopedDataName("a", "b", "name"))
		var stringValue : Object = getKnowledge(new ScopedDataName("a", "b", "name"), typeof(String))
	}
}
```



### 3.3. Knowledge Existence and Metadata

* `isDefined(id : ScopedDataName) : boolean` checks if a knowledge entry exists.

```sarl
agent A {
	uses WorkingMemory, Logging
	
	on Event {
		if (isDefined(new ScopedDataName("a", "b", "name"))) {
			info("The knowledge 'name' is defined in the working memory")
		} else {
			info("The knowledge 'name' is not defined in the working memory")
		}
	}
}
```



* `getDefinedNames : Stream<ScopedDataName>` returns a stream of all stored `ScopedDataName` identifiers.

```sarl
agent A {
	uses WorkingMemory, Logging
	
	on Event {
		var definedData = getDefinedNames
		info(definedData.toArray)
	}
}
```



* `getDefinedForName](name : String) : Stream<ScopedDataName>` returns a stream of all `ScopedDataName` identifiers matching the given `name` (across all scopes).
* `getDefinedListForName](name : String) : List<ScopedDataName>` returns a list of all `ScopedDataName` identifiers matching the given `name` (across all scopes).

```sarl
agent A {
	uses WorkingMemory, Logging
	
	on Event {
		var definedData = getDefinedForName("name")
		info(definedData.toArray)
	}
	on Event {
		var definedData = getDefinedListForName("name")
		info(definedData.toArray)
	}
}
```



* `[getMemorySizeFct!]] : long` returns the total number of stored knowledge entries.

```sarl
agent A {
	uses WorkingMemory, Logging
	
	on Event {
		var size = getMemorySize
		info(size)
	}
}
```



* `isMemoryEmpty : boolean` checks if the working memory is empty.

```sarl
agent A {
	uses WorkingMemory, Logging
	
	on Event {
		if (isMemoryEmpty) {
			info("Working memory is empty")
		} else {
			info("Working memory is not empty")
		}
	}
}
```



### 3.4. Knowledge Removal

* `removeKnowledge(id : ScopedDataName) : Object` removes a knowledge entry. The removed value is returned by this function.

```sarl
agent A {
	uses WorkingMemory
	
	on Event {
		removeKnowledge(new ScopedDataName("a", "b", "name"))
	}
}
```



* `removeNullValuedKnowledges` removes all entries with `null` values.

```sarl
agent A {
	uses WorkingMemory
	
	on Event {
		removeNullValuedKnowledges
	}
}
```



* `clearMemory` removes *all* knowledge entries.

```sarl
agent A {
	uses WorkingMemory
	
	on Event {
		clearMemory
	}
}
```


### 3.5. Thread Safety

* `getWorkingMemoryLock : Object` provides a lock object for synchronized blocks outside the control of the working memory's implementation itself. This function is useful when you want to use the streams provided by the working memory.

```sarl
agent A {
	uses WorkingMemory, Logging
	
	on Event {
		synchronized(getWorkingMemoryLock) {
			getDefinedForName("name").forEach [
				info(it)
			]
		}
	}
}
```




## 4. Version Specification

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.15
* Status: Stable Release
* Release: 2025-09-11

## 5. Legal Notice

> Copyright &copy; 2014-2025 [SARL.io, the Original Authors and Main Authors](http://www.sarl.io/about/index.html).
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

<small>Generated with the translator docs.generator 0.15.1.</small>
