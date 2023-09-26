---
title: "Goal-oriented Action Selection from Video Game Field"
layout: default
---

# Goal-oriented Action Selection from Video Game Field

Goal-oriented behavior (GOB) is a general term that covers any technique taking into account goals of the agents.
GOB is not supported by a single technique.
This tutorial does a focus on GOB that are used in video games, and more specifically on a simple action selection
mechanism that is including time constraints.

This tutorial is related to the reference documentation on [GOB](../reference/gob/TGob.html).
Please refer to this documentation for understanding the concepts of goal, action, and action selection mechanism.

It is now possible to write an agent that is behaving as it is expected in GOB.

The SARL standard development kit provides an API that is implementing the algorithms from the previous section.
The rest of this tutorial describes how to use this API for creating an agent that is selecting an action to reach its goal, and based on the previous algorithms.

## 1. Defining goals and actions in the agent knowledge

The first step is to define the goals and actions that are available to the agent.
The following code defines the function `initializeGoalSystem` that is declaring two goals (Eat and Rest) and three actions (Eat-Snack, Eat-Main-Meal and Visit-Bathroom).

```sarl
agent Person {
	val goals = <BaseGoal>newArrayList

	val actions = <BaseAction>newArrayList
	on Initialize {
		initializeGoalSystem
	}
	def initializeGoalSystem : void {
		val g0 = new BaseGoal("Eat", Math::floor(Math::random * 10.0), 0.6)
		val g1 = new BaseGoal("Rest", Math::floor(Math::random * 10.0), 0.4)
		this.goals += g0
		this.goals += g1

		val a0 = new BaseAction("Eat-Snack", 2) => [
			setInsistenceChangeFor(g0, -2.0)
		]
		this.actions += a0
		val a1 = new BaseAction("Eat-Main-Meal", 4) => [
			setInsistenceChangeFor(g0, -4.0)
		]
		this.actions += a1
		val a2 = new BaseAction("Visit-Bathroom", 1) => [
			setInsistenceChangeFor(g1, -4.0)
		]
		this.actions += a2
	}
}
```


All the defined goals and actions are stored into local variables to the agent.
The SARL API provides the type `BaseGoal` that is representing a goal. For constructing a goal, its name, initial insistence, and insistence change per time unit must be provided to the constructor.
The type `BaseAction` represents an action, with its name and duration as arguments to its constructor.
In the code, the operator `object => initialization code` is used for setting the insistences per goal that are associated to the action.
For example, the action Eat-Snack has a duration of 2 units. It also applies a change of insistence about -2.0 to the goal Eat.

## 2. Calling the GOB action selector

As soon as the goals and actions are defined, it is possible to invoke the GOB action selector for choosing the best action.
The code of the agent is updated for obtaining:

```sarl
agent Person {
	uses SelectAction
	uses Logging
	val goals = <BaseGoal>newArrayList

	val actions = <BaseAction>newArrayList
	on Initialize {
		initializeGoalSystem
		setSkill(new StandardActionSelectionSkill)
		var selectedAction = selectAction(this.actions, this.goals)
		
		info("Selected action: " + selectedAction)
	}
	def initializeGoalSystem : void {
		val g0 = new BaseGoal("Eat", Math.floor(Math.random * 10.0), 0.6)
		val g1 = new BaseGoal("Rest", Math.floor(Math.random * 10.0), 0.4)
		this.goals += g0
		this.goals += g1

		val a0 = new BaseAction("Eat-Snack", 2) => [
			setInsistenceChangeFor(g0, -2.0)
		]
		this.actions += a0
		val a1 = new BaseAction("Eat-Main-Meal", 4) => [
			setInsistenceChangeFor(g0, -4.0)
		]
		this.actions += a1
		val a2 = new BaseAction("Visit-Bathroom", 1) => [
			setInsistenceChangeFor(g1, -4.0)
		]
		this.actions += a2
	}
}
```


In this code, the capacity `SelectAction` is used. It exhibits to the agent the capability to select the best action according to the GOB implementation.
Because this capacity has not an implementation skill that is automatically provided by the SARL run-time environment, it is necessary to equip the agent with
the proper skill, i.e., `StandardActionSelectionSkill`, by calling the function `setSkill`.

It is now possible to invoke the function `selectAction` that gets the actions and goals as arguments, and replies the selected action.



## 3. Legal Notice

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
