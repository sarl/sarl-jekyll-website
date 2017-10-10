---
title: "Schedules Capacity"
layout: default
---

# Schedules Capacity


<ul class="page_outline" id="page_outline">

<li><a href="#1-creating-named-tasks">1. Creating Named Tasks</a></li>
<li><a href="#2-launching-a-task-for-a-single-run">2. Launching a Task for a single run</a></li>
<li><a href="#3-launching-a-delayed-task">3. Launching a Delayed Task</a></li>
<li><a href="#4-launching-a-periodic-task-at-a-fixed-rate">4. Launching a Periodic Task at a Fixed Rate</a></li>
<li><a href="#5-launching-a-periodic-task-with-a-fixed-delay-between-the-runs">5. Launching a Periodic Task with a Fixed Delay between the Runs</a></li>
<li><a href="#6-cancelling-a-task">6. Cancelling a Task</a></li>
<li><a href="#7-conditional-execution-of-a-task">7. Conditional Execution of a Task</a></li>
<li><a href="#8-retreiving-the-active-tasks">8. Retreiving the active tasks</a></li>
<li><a href="#9-legal-notice">9. Legal Notice</a></li>

</ul>


The built-in capacity `Schedules` enables the agent to schedule tasks for future or periodic execution.




##1. Creating Named Tasks

A named task may be created with:

```sarl
def task(name : String) : AgentTask
```


The replied task may be used for future execution, or controlling the execution.

Example:

```sarl
agent A {
	uses Schedules

	var t : AgentTask

	def action {
		t = task("abc")
	}
}
```



##2. Launching a Task for a single run

For running a task once time, the following function is provided:

```sarl
def execute(task : AgentTask = null, procedure : (Agent) => void) : AgentTask
```



Without its optional argument, the function submits the given procedure (a lambda expression as defined in
the [General Syntax Reference](../GeneralSyntax.html)) to an executor provided by the runtime
platform. The execution of the procedure will be executed once time as soon as possible. This function
replies the agent task for controlling its execution.

With the optional argument, the function behaves in a similar way as previously, except that it accepts an
agent task as parameter. This task will attach to the given procedure. The replied task is the same as
the task given as parameter.

Example:

```sarl
agent A {
	uses Schedules, Logging

	var t1 : AgentTask
	var t2 : AgentTask

	def action {
		t1 = execute [ a : Agent |
			info(a)
		]
		t1 = t2.execute [ a : Agent |
			info(a)
		]
	}
}
```



##3. Launching a Delayed Task

For running a task in a given delay, the following function is provided:

```sarl
def in(task : AgentTask = null, delay : long, procedure : (Agent) => void) : AgentTask
```


Without its optional argument, the function submits the given procedure (a lambda expression as defined in
the [General Syntax Reference](../GeneralSyntax.html)) to an executor provided by the runtime
platform. The execution of the procedure will be delayed during the given number of milliseconds.
This function replies the agent task for controlling its execution.

With its optional argument, the function behaves in a similar way as the first, except that it
accepts an agent task as parameter. This task will attach to the given procedure. The replied task
is the same as the task given as parameter.


Example:

```sarl
agent A {
	uses Schedules, Logging
	var t1 : AgentTask
	var t2 : AgentTask
	def myaction {
		t1 = in(1000) [ a : Agent |
			info(a)
		]
		
		t1 = t2.in(1000) [ a : Agent |
			info(a)
		]
	}
}
```



##4. Launching a Periodic Task at a Fixed Rate

For running a periodic task with a fixed starting rate, the following function is provided:

```sarl
def every(task : AgentTask = null, delay : long, procedure : (Agent) => void) : AgentTask
```



The first function submits the given procedure (a lambda expression as defined in
the [General Syntax Reference](../GeneralSyntax.html)) to
an executor provided by the runtime platform. The execution of the procedure
will be launched periodically with a period of the given number of milliseconds.
This function replies the agent task for controlling its execution.

The second function behaves in a similar way as the first, except that it
accepts an agent task as parameter. This task will attach to the given
procedure. The replied task is the same as the task given as parameter.

If the duration of the task is greater to the given period length, then
multiple task's instances will be run in parallel.
For example, consider the following code:

```sarl
every(500) [ sleep(2000) ]
```



At a given time, four instances of the task are run in parallel (A, B, C, D for example):


| t= | 0 | 500 | 1000 | 1500 | 2000 | 2500 | 3000 | 3500 | 4000 |
| -- | - | --- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| A  | X | X   | X    | X    |      |      |      |      |      |
| B  |   | X   | X    | X    | X    |      |      |      |      |
| C  |   |     | X    | X    | X    | X    |      |      |      |
| D  |   |     |      | X    | X    | X    | X    |      |      |
| E  |   |     |      |      | X    | X    | X    | X    |      |
| F  |   |     |      |      |      | X    | X    | X    | X    |



##5. Launching a Periodic Task with a Fixed Delay between the Runs

For running a periodic task with a fixed duration between the runs, the following function is provided:

```sarl
def atFixedDelay(task : AgentTask = null, delay : long, procedure : (Agent) => void) : AgentTask
```



Without its optional argument, the function submits the given procedure (a lambda expression as defined in
the [General Syntax Reference](../GeneralSyntax.html)) to an executor provided by the runtime
platform. The execution of the procedure will be launched periodically with a duration between the runs
of the given number of milliseconds. This function replies the agent task for controlling its execution.

With its optional argument, the function behaves in a similar way as the first, except that it
accepts an agent task as parameter. This task will attach to the given procedure. The replied task is
the same as the task given as parameter.

The `atFixedDelay` function has not the same issue ass the `every` function regarding the possibility
to have several runs in parallel.
The `atFixedDelay` function ensures that only one run of the procedure will be executed at a given time.

For example, the following code may be illustrated by the table below.

```sarl
atFixedDelay(500) [ sleep(2000) ]
```



| t= | 0 | 500 | 1000 | 1500 | 2000 | 2500 | 3000 | 3500 | 4000 | 4500 | 5000 | 5500 | 6000 | 6500 |
| -- | - | --- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| A  | X | X   | X    | X    |      |      |      |      |      |      |      |      |      |      |
| B  |   |     |      |      |      | X    | X    | X    | X    |      |      |      |      |      |
| C  |   |     |      |      |      |      |      |      |      |      | X    | X    | X    | X    |



##6. Cancelling a Task

It may be useful to cancel a running task, e.g. a periodic task. The `Schedules` capacity
provides the following functions for managing the execution cancellation of an agent task:

```sarl
def cancel(task : AgentTask, mayInterruptIfRunning : boolean = true) : boolean
def isCanceled(task : AgentTask) : boolean
```



The first function will reply `false` if the task has already completed, has already been canceled,
or could not be canceled for some other reason (a failure means replying false).
If successful, and this task has not started when `cancel` is called, this task should never
run. If the task has already started, then the `mayInterruptIfRunning` parameter determines
whether the thread executing this task should be interrupted in an attempt to stop the task.

The `isCanceled` function enables to test if a task was canceled or not.

Example:

```sarl
agent A {
	uses Schedules
	
	var t1 : AgentTask
	var t2 : AgentTask
	var t3 : AgentTask
	def myaction {
		t1 = in(1000) [ ]
		t2 = in(5000) [ ]
		t2 = in(10000) [ ]
		if (!t1.isCanceled) {
			t1.cancel
		}
		if (!t2.isCanceled) {
			t2.cancel(true)
		}
		if (!t3.isCanceled) {
			t3.cancel(false)
		}
	}
}
```



##7. Conditional Execution of a Task

Sometimes, it may be useful to execute a task if a condition is `true` or `false`. The 
`AgentTask` type, which is representing an instance of `AgentTask` provides
the functions for assosiating a condition, named the guard, to the task:

```sarl
def getGuard : (Agent) => boolean
def setGuard(condition : (Agent) => boolean)
```






The first function replies the guard associated to the task, or `null` if
there is no associated guard. The second function enables you to change the associated guard.

Additionaly, the `AgentTask` type provides utility functions for easier guard association:  

```sarl
def ifTrue(condition : (Agent) => boolean) : AgentTask
def unless(condition : (Agent) => boolean) : AgentTask
```






The `ifTrue` function is equivalent to `setGuard`, except that it is replying the current agent task.
The `unless` function sets the guard of the task to the negation of the given condition. It replies
the current task.

<caution>The `ifTrue` and `unless` functions should not be used on the result of the scheduling functions.
Indeed, if you call these two function on the value replied by `execute` for example, the execution platform
could have launched the task before the guard is set. Consider the following code

```sarl
execute [ doSomething ].unless [ myVar > 5 ]
```


The call to `execute` is done before the call to `unless`. It means that the execution platform could have
already checked if a guard is assosiated and `true`, before the `unless` function sets the guard.</caution>

The best practice for setting the task guards is to create a task, set the guard, and execute the task:

```sarl
// Create the task instance
var myTask = task(null)
// Set the guard
myTask.unless [ myVar > 5 ]
// Execute the task
myTask.execute [ doSomething ]
```



##8. Retreiving the active tasks

The list of the active tasks may be retreived by invoking the following function:

```sarl
def getActiveTasks : Collection<String>
```


The replied collection is unmodifiable and contains the names of the active tasks. 

Example:

```sarl
for (taskName : getActiveTasks) {
	info("Active task: " + taskName)
}
```



##9. Legal Notice

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.7
* Status: Draft Release
* Release: 2017-10-08

> Copyright &copy; 2014-2017 [the original authors or authors](http://www.sarl.io/about/index.html).
>
> Licensed under the Apache License, Version 2.0;
> you may not use this file except in compliance with the License.
> You may obtain a copy of the [License](http://www.apache.org/licenses/LICENSE-2.0).
>
> You are free to reproduce the content of this page on copyleft websites such as Wikipedia.

<small>Generated with the translator io.sarl.maven.docs.generator 0.7.0-SNAPSHOT.</small>