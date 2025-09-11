---
title: "Naming and Namespaces in SARL"
layout: default
---

# Naming and Namespaces in SARL


<ul class="page_outline" id="page_outline">

<li><a href="#1-naming-of-the-sarl-components">1. Naming of the SARL components</a></li>
<ul>
  <li><a href="#11-background-on-uris">1.1. Background on URIs</a></li>
  <li><a href="#12-naming-for-agents">1.2. Naming for Agents</a></li>
  <li><a href="#13-naming-for-behaviors">1.3. Naming for Behaviors</a></li>
  <li><a href="#14-naming-for-skills">1.4. Naming for Skills</a></li>
  <li><a href="#15-naming-for-context">1.5. Naming for Context</a></li>
  <li><a href="#16-naming-for-space">1.6. Naming for Space</a></li>
  <li><a href="#17-naming-for-service">1.7. Naming for Service</a></li>
  <li><a href="#18-naming-for-artifact">1.8. Naming for Artifact</a></li>
  <li><a href="#19-naming-for-data-with-scopes">1.9. Naming for data with scopes</a></li>
</ul>
<li><a href="#2-namespace-service">2. Namespace Service</a></li>
<ul>
  <li><a href="#21-general-principles">2.1. General Principles</a></li>
  <li><a href="#22-field-accessor">2.2. Field Accessor</a></li>
</ul>
<li><a href="#3-observable-and-not-observable-fields">3. Observable and Not Observable Fields</a></li>
<ul>
  <li><a href="#31-observable-annotation">3.1. @Observable Annotation</a></li>
  <li><a href="#32-capacity-to-manage-the-access-rights">3.2. Capacity to Manage the Access Rights</a></li>
</ul>
<li><a href="#4-version-specification">4. Version Specification</a></li>
<li><a href="#5-legal-notice">5. Legal Notice</a></li>

</ul>


In a SARL system, multiple elements are created at run-time, e.g. agents, behaviors, skills, spaces, contexts, etc.
Each of these elements is identified by an unique universal identifier (UUID).
This ensures that the identifiers are unique all the time.

Having access to the SARL elements above in a almost generic way is sometimes needed. For example, if you would like
to observe the values of the fields of an agent, you need first to refer to the agent itself.

In order to help the SARL developers to do this referring, a generic and common API is defined for naming the SARL elements.
This naming API is used by the namespace service in order to retrieve and reply the instances of the referred elements. 

## 1. Naming of the SARL components

Basically the naming of the SARL element following the international standards of the
[Universal Resource Identifiers](https://en.wikipedia.org/wiki/Uniform_Resource_Identifier), or URI in short.

### 1.1. Background on URIs

An URI is a string of characters that unambiguously identifies a particular resource. To guarantee uniformity, all URIs follow a predefined set of syntax rules.
Such identification enables interaction with representations of the resource over a system or a network (typically the World Wide Web), using specific schemes.

Each URI following the general following format (where parts between brackets are optional):

```text
scheme:[//authority]path[?query][#fragment]
```

The URI generic syntax consists of a hierarchical sequence of five components:
* Scheme: A non-empty scheme component followed by a colon (`:`), consisting of a sequence of characters beginning with a letter and followed by any combination of letters, digits, plus (`+`), period (`.`), or hyphen (`-`). The scheme name refers to a specification for assigning identifiers within that scheme.
* Authority: An optional authority component preceded by two slashes (`//`) that specifies the user information to use to be connected to the referred resource.
* Path: A path component, consisting of a sequence of path segments separated by a slash (`/`). A path is always defined for a URI, though the defined path may be empty (zero length). A segment may also be empty, resulting in two consecutive slashes (`//`) in the path component.
* Query: An optional query component preceded by a question mark (`?`), containing a query string of non-hierarchical data. Its syntax is not well defined, but by convention is most often a sequence of attribute–value pairs separated by a delimiter.
* Fragment: An optional fragment component preceded by a hash (`#`). The fragment contains a fragment identifier providing direction to a secondary resource, such as a section heading in an article identified by the remainder of the URI.

This general URI syntax is refined in order to refer the SARL components.

### 1.2. Naming for Agents

Each agent may be referred by an URI-based name in which the scheme is always `agent`. There is neither authority nor query part in the agent name.
 
The path of the agent name specifies the identification of the agent. You could refer an agent in three ways:

* Referring an agent whatever the context and spaces in which it is living. In this case, you have to specify only the agent identifier, e.g. `agent:a7fbd4cc-9e1a-48c3-8ee8-3a7974ccb05c`. 
* Referring an agent only if it is living into a specific context. In this case, you have to specify the context identifier followed by the agent identifier, e.g. `agent:b9e6dcbc-d878-441d-afa1-35715950e22d/a7fbd4cc-9e1a-48c3-8ee8-3a7974ccb05c`.
* Referring an agent only if it is living into a specific context and member of a specific space. In this case, you have to specify the context identifier followed by the space and agent identifiers, e.g. `agent:b9e6dcbc-d878-441d-afa1-35715950e22d/0bec6efd-12b1-4394-8e34-1b56e6b99c5c/a7fbd4cc-9e1a-48c3-8ee8-3a7974ccb05c`. 

Where, `b9e6dcbc-d878-441d-afa1-35715950e22d` is the context identifier, `0bec6efd-12b1-4394-8e34-1b56e6b99c5c` is the space identifier, and
`a7fbd4cc-9e1a-48c3-8ee8-3a7974ccb05c` is the agent identifier.

The fragment part is the name of an attribute/field that is declared into the referred agent. If the fragment part is specified, then the URI refers to the field itself.

The general syntax of the agent names is defined by the following BNF grammar:

```text
AGENT_NAME = "agent:" <ODSL> <CTX> <UUID> <FRG>
ODSL = "/" OSL | <empty>
OSL = "/" | <empty>
CTX = <UUID> "/" SPC | <empty>
SPC = <UUID> "/" | <empty>
FRG = "#" <ID> | <empty>
```
		

### 1.3. Naming for Behaviors

Each behavior of an agent may be referred by an URI-based name in which the scheme is always `behavior`. There is neither authority nor query part in the behavior name.
 
The path of the behavior name specifies the identification of the behavior. A behavior is always attached to an agent. That's why, the agent identifier is
mandatory in all cases. Consequently, for each of the three cases for referring an agent, two cases are defined for referring a behavior of those agent:

* Referring behavior from its fully qualified type name. In this case, you have to specify only the agent identifier followed by the fully qualified name of the behavior type, e.g. `behavior:a7fbd4cc-9e1a-48c3-8ee8-3a7974ccb05c/mypackage.MyBehavior`. If the agent has multiple instance of the behavior, the first one is considered. 
* Referring behavior from its fully qualified type name and its index. This case enables to refer a specific behavior instance when the agent has multiple instances of the same behavior type. You have to specify the agent identifier followed by the fully qualified name of the behavior type and the index of the behavior instance (starting at zero), e.g. `behavior:a7fbd4cc-9e1a-48c3-8ee8-3a7974ccb05c/mypackage.MyBehavior/1`. 

Where, `a7fbd4cc-9e1a-48c3-8ee8-3a7974ccb05c` is the agent identifier.
`mypackage.MyBehavior` is the fully qualified name of the behavior type to refer. It must be a sub-type of the `io.sarl.lang.core.Behavior` type that is defined into the SARL API.

The fragment part is the name of an attribute/field that is declared into the referred behavior. If the fragment part is specified, then the URI refers to the field itself.

The general syntax of the behavior names is defined by the following BNF grammar (BNF rules in the previous section are re-used):

```text
BEHAVIOR_NAME = "behavior:" <ODSL> <CTX> <UUID> "/" <ID> <IDX> <FRG>
IDX = "/" <INTEGER> | <empty>
```

### 1.4. Naming for Skills

Each skill of an agent may be referred by an URI-based name in which the scheme is always `skill`. There is neither authority nor query part in the skill name.
 
The path of the skill name specifies the identification of the skill. A skill is always attached to an agent. That's why, the agent identifier is
mandatory in all cases. Moreover, a capacity must be implemented by only one skill within an agent. But a skill may implement multiple caapcities.
Consequently, for each of the three cases for referring an agent, one case is defined for referring a skill of those agent:

* Referring skill from the name of the capacity it is implementing. In this case, you have to specify only the agent identifier followed by the fully qualified name of the implemented capacity type, e.g. `skill:a7fbd4cc-9e1a-48c3-8ee8-3a7974ccb05c/mypackage.MyCapacity`. 

Where, `a7fbd4cc-9e1a-48c3-8ee8-3a7974ccb05c` is the agent identifier.
`mypackage.MyCapacity` is the fully qualified name of the capacity type that is implemented by the skill to refer. It must be a sub-type of the `io.sarl.lang.core.Capacity` type that is defined into the SARL API.

The fragment part is the name of an attribute/field that is declared into the referred skill. If the fragment part is specified, then the URI refers to the field itself.

The general syntax of the skill names is defined by the following BNF grammar (BNF rules in the previous sections are re-used):

```text
SKILL_NAME = "skill:" <ODSL> <CTX> <SPC> <UUID> "/" <ID> <FRG>
```

### 1.5. Naming for Context

Each agent context may be referred by an URI-based name in which the scheme is always `context`. There is neither authority nor query part in the context name.
 
The path of the context name specifies the identification of the context. You could refer a context as:

* Referring a context from its identifier. In this case, you have to specify only the context identifier, e.g. `context:b9e6dcbc-d878-441d-afa1-35715950e22d`. 

Where, `b9e6dcbc-d878-441d-afa1-35715950e22d` is the context identifier.

The fragment part is the name of an attribute/field that is declared into the referred context. If the fragment part is specified, then the URI refers to the field itself.

The general syntax of the agent names is defined by the following BNF grammar (BNF rules in the previous section are re-used):

```text
CONTEXT_NAME = "context:" <ODSL> <UUID> <FRG>
```


### 1.6. Naming for Space

Each space within a context may be referred by an URI-based name in which the scheme is always `space`. There is neither authority nor query part in the space name.
 
The path of the space name specifies the identification of the space. A space is always defined into a context. That's why, the context identifier is
mandatory in all cases. Consequently, for each of the cases for referring a context, you could refer a space as:

* Referring space from its identifier. In this case, you have to specify only the context identifier followed by the space identifier, e.g. `space:b9e6dcbc-d878-441d-afa1-35715950e22d/0bec6efd-12b1-4394-8e34-1b56e6b99c5c`. 

Where, `b9e6dcbc-d878-441d-afa1-35715950e22d` is the context identifier, and `0bec6efd-12b1-4394-8e34-1b56e6b99c5c` is the space identifier.

The fragment part is the name of an attribute/field that is declared into the referred space. If the fragment part is specified, then the URI refers to the field itself.

The general syntax of the space names is defined by the following BNF grammar (BNF rules in the previous section are re-used):

```text
SPACE_NAME = "space:" <ODSL> <UUID> "/" <UUID> <FRG>
```

### 1.7. Naming for Service

A SRE may implement services. Each service may be referred by an URI-based name in which the scheme is always `service`.
There is neither authority nor query part in the service name.
 
The path of the service name specifies the identification of the service, i.e. its fully qualified name. You could refer a service with:

* Referring a service from its identifier. In this case, you have to specify only the service's fully qualitied name, e.g. `service:mypackage.MyService`. 

Where, `mypackage.MyService` is the fully qualified name of the object interface that describes the service.

The fragment part is the name of an attribute/field that is declared into the referred service. If the fragment part is specified, then the URI refers to the field itself.

The general syntax of the service names is defined by the following BNF grammar (BNF rules in the previous section are re-used):

```text
SERVICE_NAME = "service:" <ODSL> <ID> <FRG>
```


### 1.8. Naming for Artifact

According to the Agent&Artifact metamodel, an artifact in a multi-agent system is a component of the agent environment
Each artifact may be referred by an URI-based name in which the scheme is always `artifact`.
There is neither authority nor query part in the service name.
Please note that because the concept of artifact is not related to the agent society directly, the underlying SRE may
not provide a support for it.
 
The path of the artifact name specifies the identification of the artifact, i.e. its identifier. You could refer a artifact with:

* Referring an artifact from its identifier. In this case, you have to specify only the artifact's identifier, e.g. `artifact:37b13185-a9d5-43e5-9d7b-da2fa3ba3d54`. 

Where, `37b13185-a9d5-43e5-9d7b-da2fa3ba3d54` is the identifier of the artifact.

The fragment part is the name of an attribute/field that is declared into the referred artifact. If the fragment part is specified, then the URI refers to the field itself.

The general syntax of the service names is defined by the following BNF grammar (BNF rules in the previous section are re-used):

```text
ARTIFACT_NAME = "artifact:" <ODSL> <UUID> <FRG>
```

### 1.9. Naming for data with scopes

Sometimes, a data is defined in scope and store in a part of the application. For example, the working memory API defined in the SARL SDK enables agents to store scoped data in a local memory.

In SARL, the concept of **scope** refers to a mechanism for organizing and disambiguating knowledge or data within an agent’s memory by associating it with a specific context or namespace. Scope serves as a logical container that groups related pieces of information, enabling agents to manage multiple instances of similarly named knowledge without conflict.
Scopes are often implemented as part of a composite `ScopedDataName`, which combines a base name (e.g., "temperature") with a scope (e.g., "indoor" or "outdoor"). This allows the agent to store and retrieve knowledge precisely, even when the same name is reused across different contexts. It is possible to refer to a scoped data with a URI string. For example, `data:/indoor/temperature` and `data:/outdoor/temperature` represent two distinct knowledge entries, each associated with its own value.
 
The path of the scoped data name specifies the scope of the data and the basename of the same data. You could refer a scope data as:

* Referring a scope variable from its scope and basename, e.g. `data:/scope1/.../scopen/basename`.

Where, `scope1` to `scopen` refer to the names of the scopes in whoch the data is located; `basename` is the simple name of the data.

The general syntax of the scoped data names is defined by the following BNF grammar (BNF rules in the previous section are re-used):

```text
SCOPE_DATA_NAME = "data:" <ODSL> <ID> <SCOPE_DATA_SCOPES>
SCOPE_DATA_SCOPES = "/" <ID> <SCOPE_DATA_SCOPES> | empty
```

It is possible to create scoped data name programmatically:

```sarl
var uri = new URI("data:/scope1/scope2/name")
var name = new ScopedDataName(uri)
```


In the previous code example, the instance of the scoped data name is based on the type `ScopedDataName`. The argument for creating the name is the URI of the data. This URI is creating using the regular API.
Please note that the name of the data must start with a `/` character.

The `ScopedDataName` class provides two way for making the creation of a scoped data name easier:

* The utility function `buildURI` for creating an URI with the expected URI format. It takes as arguments the list of names for the scopes and the data itself:

```sarl
var name = new ScopedDataName(ScopedDataName::buildURI("scope1", "scope2", "name"))
```


* The `ScopedDataName` construction function that takes as arguments the list of names for the scopes and the data itself:

```sarl
var name = new ScopedDataName("scope1", "scope2", "name")
```



## 2. Namespace Service

### 2.1. General Principles

According to the [public API of the SRE](./SRE.html), it is possible to retrieve a service that is implemented and executed by the SRE.
A service dedicated to finding SARL elements into the SRE environment based on their names is defined into the SARL API. It is named the Namespace service.

The role of the Namespace service is to search for a SARL element based on a given name (as defined above).
This service explores the entire content of the SRE in order to find the requested element.
If an object that is corresponding to the given name is found, then the Namespace service replies the found object, or an accessor to its field if a fragment part was specified into the given name.

The Namespace service is defined as:

```sarl
interface NamespaceService {
	def findObject(SarlName) : Object
	def findObject(SarlName, Class<T>) : T with T
	def findObject(String) : Object
	def findObject(String, Class<T>) : T with T
	def findObject(URI) : Object
	def findObject(URI, Class<T>) : T with T
	def getFieldAccessValidator : IFieldAccessValidator
	def getNameParser : INameParser
}
```


The functions `findObject` search for an object based on the given name (whatever it is an object of type
`SarlName` representing the super-type of all the names, an URI, or a string representation of an URI).

To use this service, you have to get it from the SRE, as illustrated below:

```sarl
var bootstrap = SRE::getBootstrap
var namingService = bootstrap.getService(typeof(NamespaceService))
var theAgent = namingService.findObject("agent:a7fbd4cc-9e1a-48c3-8ee8-3a7974ccb05c")
```



### 2.2. Field Accessor

In the case the given name targets a field (when it has a fragment part), the Namespace service create
a specific proxy of type `FieldAccess` in order to have access to the field.
This type is defined as:

```sarl
class FieldAccess {
	def get : Object
	def getField : Field
	def getInstance : Object
	def getName : SarlName
	def isWritable : boolean
	def set(Object) : Object
	def toString : String
}
```



This accessor type enables to have access to the object instance and to the field value.
However, the instance of `FieldAccess` is provided only if the field is observable.
 

## 3. Observable and Not Observable Fields

Observation means that data or information could be extracted from the observed object.
Because an agent is defined as an autonomous entity, the agent should be able to enable or disable the
access to one of its fields.

In the standard SRE, this observability flag could be defined statically by annotating the observable field,
or one of its enclosing type, with the `@Observable` annotation.
A second standard method is to implement a dedicated agent skill implementing the capacity `FieldAccessValidationCapacity`
that enables the agent to manage the access rights to its fields dynamically.

By default, into the SRE, the algorithm for checking the field access from an invoking entity is:
* if the field is marked as observable with an `@Observable` annotation then
  * The access to the field is granted to the invoking entity (read-only or writable, depending on the annotation's specification)
* else
  * if the field is located into an agent element then
    * if the agent is equiped with a `FieldAccessValidationCapacity` skill then
      * if the agent's skill grants the access
        * The access to the field is granted to the invoking entity (read-only or writable)
      * else
        * The access to the field is denied to the invoking entity. It will be notified that the field was not found.
    * else
      * The access to the field is denied to the invoking entity. It will be notified that the field was not found.
  * else
    * The access to the field is denied to the invoking entity. It will be notified that the field was not found.


### 3.1. @Observable Annotation

In the following example, two fields are defined for the agent `MyAgent`.
The first field is named `observableField` and it is marked as observable because it is annotated with `@Observable`.
The second field is named `notObservableField` and it is not observable. 

```sarl
agent MyAgent {
	@Observable
	var observableField : int
	var notObservableField : int
}
```



Consequently, even if the field `notObservableField` is declared, it will never be found by the Namespace space because it is hidden.

As described above, the `@Observable` annotation could be attached to one of the enclosing type in order to mark all the
declared fields within a type as observable.
In the following example, the two fields `observableField1` and `observableField2` are observable because the type `MyAgent2`
is marked with the `@Observable` annotation.
 
```sarl
@Observable
agent MyAgent2 {
	var observableField1 : int
	var observableField2 : int
}
```



### 3.2. Capacity to Manage the Access Rights

In order to enable an agent to manage the accesses to its own fields, you could equip this agent with a skill that implements
the `FieldAccessValidationCapacity` capacity:

```sarl
capacity FieldAccessValidationCapacity {
	def getFieldAccessRight(Field) : FieldAccessRight
}
```



When an agent owns a skill implementing `FieldAccessValidationCapacity`, this skill is included into the right checking for accessing to
the fields of the agent, its behaviors and its skills.

Let the agent implementation below: 

```sarl
agent MyAgent {
	var field1 : int
	var field2 : int
	on Initialize {
		setSkill(new AccessRightSkill)
	}
}
```


In this agent, two fields are defined and named `field1` and `field2`.
We equip the agent with the `AccessRightSkill` skill that implements the `FieldAccessValidationCapacity` capacity:

```sarl
skill AccessRightSkill implements FieldAccessValidationCapacity {
	def getFieldAccessRight(field : Field) : FieldAccessRight {
		if (field.name == "field1") {
			return FieldAccessRight::READ
		}
		if (field.name == "field2") {
			return FieldAccessRight::WRITE
		}
		return FieldAccessRight::NONE
	}
}
```



This skill gives the reading access to the field `field1`, and the reading/writing accesses to the field `field2`.
Any other field cannot be observed.

Three levels of obersavility are defined into the enumeration `FieldAccessRight`:
* `NONE` The field cannot be observed.
* `READ` The field's value could be read, but never changed from the outside of the agent. 
* `WRITE` The field's value could be read and/or write from the outside of the agent. 



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
