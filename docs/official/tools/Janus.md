---
title: "Janus Command-line Launcher"
layout: default
---

# Janus Command-line Launcher


<ul class="page_outline" id="page_outline">

<li><a href="#1-usage">1. Usage</a></li>
<li><a href="#2-command-line-options">2. Command-Line Options</a></li>
<li><a href="#3-list-of-errors-and-warnings">3. List of Errors and Warnings</a></li>
<li><a href="#4-legal-notice">4. Legal Notice</a></li>

</ul>




[Janus](http://www.janusproject.io) is the default SARL Run-time Environment (SRE).
Its role is to provide all the libraries and plugins that are needed for running SARL agents.

For launching the Janus platform from a command-line shell, you could use the `janus` tool.

## 1. Usage

The `janus` tool takes arguments:


	janus [OPTIONS] <agent_fully_qualified_name>


The `agent_fully_qualified_name` is the name of the agent to launch. This name is equal to the
fully qualified name of the agent's type.

<note>Janus enables to launch only one agent from the command-line shell. If you want to launch
more than one agent, you should launch a first agent, which will create the other agents.</note>

You could change the behavior of the `janus` tool with the command-line options.
For obtaining a list of the options, type:

	janus -help


## 2. Command-Line Options

The Janus framework provides options on the command-line.
The list of the options is displayed below. This list includes
all the standard modules of Janus. If you add an extra module into
the classpath of your application, more options may become available.



| Option | Description |
| ------ | ----------- |
| --agent-spawns-per-thread=number | Specify the maximal number of agent spawns that must be supported by a single thread into the life-cycle service; Default is 128. |
| --async-probe-update={true&#124;false} | Specify if the probe service should update asynchronously the probed values, or not; Default is true. |
| -b method<br>--boot-type=method | Specify the method for selecting the identifier of the default context; The possible values are default, random, boot_agent_name; Default is 'default'. |
| --classpath=path | Specifies where to find user class files, and source files. This class path overrides the user class path in the SRE_CLASSPATH environment variable. If neither SRE_CLASSPATH, --cp nor --classpath is specified, then the user class path is built upon the current folder. If a user class path is specified, it must contains the the user libraries and the standard SARL libraries. |
| --config=yaml_location | Specifies YAML config location, which can be a file path or a URL. |
| --cp=path | Specifies where to find user class files, and source files. This class path overrides the user class path in the SRE_CLASSPATH environment variable. If neither SRE_CLASSPATH, --cp nor --classpath is specified, then the user class path is built upon the current folder. If a user class path is specified, it must contains the the user libraries and the standard SARL libraries. |
| -d uuid<br>--default-space-id=uuid | Specify the identifier (UUID) of the default space into the root context; Default is 7ba8885d-545b-445a-a0e9-b655bc15ebe0. |
| -e {reflect, polymorphic}<br>--event-bus={reflect, polymorphic} | Specify the type of event bus to create for each agent; Default is reflect. |
| -g<br>--generatemarkdownhelp | Prints the list of the command-line options using a Markdown table. |
| -h<br>--help | Prints this message. |
| -H<br>--help-config | Prints information about application modules and their configuration options. |
| --inject-agents={true&#124;false} | Specify if the agents should be injected with field values by the SRE; Default is false. |
| --internal-error-log-level=level | Specify the logging level for the internal errors within the parallel executors; Default is: all. |
| -j<br>--json | When present, the output of the configuration has the Json format. |
| -k duration<br>--keep-alive=duration | Specify the duration in seconds during which a thread is staying alive even if there is not task to be run; After this duration, iddle threads are destroyed by the SRE; Default value is 60. |
| -l level<br>--log=level | Specifies where to find user class files, and source files. This class path overrides the user class path in the LOG_LEVEL environment variable. If neither LOG_LEVEL, --log nor --{2} is specified, then the user class path is built upon the current folder. If a user class path is specified, it must contains the the user libraries and the standard SARL libraries. |
| --max-threads=number | Specify the maximal number of threads that could be created by the SRE; Default is 512. |
| --min-threads=number | Specify the minimal number of threads that should be created by the SRE; Default is 0. |
| --name=name | Specify the name of the program that is shown into the logs for example; Default is 'SARL Run-time Environment'. |
| --no-agent | Start the SRE without agent at boot time. In this case, the fully qualified name that may be provided on the command line is simply ignored. Agents should be spawned later by calling the programmatic API of the SRE. |
| -C<br>--printconfig | Print the current configuration. The output format is Yaml by default. See --json for a Json output, and --xml for a XML output. |
| -r uuid<br>--root-context-id=uuid | Specify the identifier (UUID) of the root context; Default is 2c38fb7f-f363-4f6e-877b-110b1f07cc77. |
| --service-start-timeout=timeout | Specify the timeout for waiting a service to be started (in milliseconds); A value equal to zero means that the SRE waits for ever; Default is 0. |
| --service-stop-timeout=timeout | Specify the timeout for waiting a service to be stopped (in milliseconds); A value equal to zero means that the SRE waits for ever; Default is 10 000. |
| --thread-purge={true&#124;false} | Specify if the executor service is periodically purging the thread pools; Default is: true. |
| --thread-timeout=timeout | Specify the numbers of seconds that the SRE is waiting for thread terminations before timeout; Default is: 30. |
| -v<br>--version | Prints release information. |
| -x<br>--xml | When present, the output of the configuration has the XML format. |





## 3. List of Errors and Warnings

This section provides the non-exhaustive list of error and warning messages that may be generated by Janus.
Indeed, Janus code may generates errors and warnings that are documented below. However, several errors may
occur because of one of the used library. In these errors are not necessary documented, and must be discussed
on [Gitter](https://gitter.im/sarl/Lobby) or [Google Group](http://www.sarl.io/community/forums.html) with the
SARL community.

The "N." column provides a number that could be used in order to make easier your discussions with the SARL developers on the forums.

The column "Message and Description" contains information and details on each issue.
The **message** gives a template of typical message that is given by the compiler.
The **cause** describes the source of the issue, and provides a short explanation of the cause of the issue.
The **solving** provides guidelines to fix the issue when it is possible.

The "Level" column indicates the level of importance for the issue.
It may be:
* "error": the issue makes Janus failing and stopping.
* "warning": the issue is an important message that may have implication on the quality of your program.
* "info": the issue is a simple information message from the compiler. The impact on the quality of your program is low.


The code of the issue, which is appended at the end of the messages, corresponds to the content of the "Code" column below.
This code may have a short format (e.g., the one shown in the column), or a long format (e.g., if you move your mouse pointer on the code, you should see the long format of the code into a pop-up window).
The long code is provided by the SARL compiler at the end of the issue messages.



| N. | Message and Description | Level | Code |
| -- | ----------------------- | ----- | ---- |
| 1 | **Message:** Already launched task<br>**Cause:** A task was launched two times. This error denotes of a problem of design of the agent software<br>**Solving:** Review your code to avoid the task to be launched too times | Error | [agent_task_already_launched](: "io.sarl.sre.IssueCodes.agent_task_already_launched") |
| 2 | **Message:** Cannot emit the event '*event-type*' with the scope '*scope*': *error*<br>**Cause:** The given event cannot be emitted into a space because of an internal error | Error | [cannot_emit_in_space](: "io.sarl.sre.IssueCodes.cannot_emit_in_space") |
| 3a | **Message:** Not enough arguments. You have to provide the qualified name of the agent to be launched<br>**Cause:** This error is generated when the number of commend-line arguments that are passed to Janus is too small, in the case that Janus is supposed to launch an agent. The missed argument is the fully-qualified name of the agent to be launched<br>**Solving:** Add to the command-line the fully-qualified name of the agent to be launched | Error | [cli_argument_list_size](: "io.sarl.sre.IssueCodes.cli_argument_list_size") |
| 3b | **Message:** Too many arguments. You must not provide arguments<br>**Cause:** This error is generated when the number of commend-line arguments that are passed to Janus is too big, in the case that Janus is not supposed to launch an agent.<br>**Solving:** Remove all the command-line arguments | Error | [cli_argument_list_size](: "io.sarl.sre.IssueCodes.cli_argument_list_size") |
| 4 | **Message:** The spawning of the agents is disabled. The spawning of *agent-type* inside *context* is skipped<br>**Cause:** An agent spawn query was received, but rejected because the agent life-cycle service has disabled its spawning service. It is usually due to the fact that Janus has already started to shutdown<br>**Solving:** Review you code in order to avoid to spawn an agent after all the exisiting agents have been killed | Warning | [disabled_spawn](: "io.sarl.sre.IssueCodes.disabled_spawn") |
| 5a | **Message:** Event guard evaluator method becomes inaccessible: {1}<br>**Cause:** Event guards are evaluated into dedicated Java functions by Janus. This error message is generated when the guard evaluation function cannot be called due to access restrictions. This error should never occur because it means that the Janus code itself is broken | Error | [event_guard_error](: "io.sarl.sre.IssueCodes.event_guard_error") |
| 5b | **Message:** Invalid argument for the event guard evaluator method: {1}<br>**Cause:** Event guards are evaluated into dedicated Java functions by Janus. This error message is generated when one of the arguments of the guard evaluation function is invalid. Usually, it is because the event cannot be passed to the function | Error | [event_guard_error](: "io.sarl.sre.IssueCodes.event_guard_error") |
| 6 | **Message:** The SARL specification version that was used for generating the type *name* is not compatible with the specification version supported by Janus<br>**Cause:** Internally, Janus checks if the provided class of an agent to be launched was generated with a version of the SARL compiler that is supported by the current version of Janus. This error message is generated when the class to be loaded is not compatible<br>**Solving:** Get agent's binary files that are compiled with the compatible SARL compiler | Error | [invalid_sarl_specification](: "io.sarl.sre.IssueCodes.invalid_sarl_specification") |
| 7 | **Message:** Cannot kill agent *id* because it is not alive<br>**Cause:** The agent with the given *id* cannot be killed because it is already dead<br>**Solving:** Review your code to avoid the call to `killMe` too many times | Error | [not_alive_error](: "io.sarl.sre.IssueCodes.not_alive_error") |
| 8 | **Message:** Cannot kill agent *id* because it is considered as not killable<br>**Cause:** The agent with the given *id* cannot be killed. Usually, it is because it is a holon that contains sub-holons<br>**Solving:** Review your code to avoid the killing of the sub-holon when it is not empty | Error | [not_killable_error](: "io.sarl.sre.IssueCodes.not_killable_error") |
| 9 | **Message:** Agent task is null<br>**Cause:** The reference to an agent task is lost. This avoid the task to be run. This error should never occur | Error | [null_agent_task](: "io.sarl.sre.IssueCodes.null_agent_task") |
| 10 | **Message:** Failure in service *name*<br>**Cause:** An internal error into the Janus service manager has occurred. The error is related to the service with the given *name* | Error | [service_manager_error](: "io.sarl.sre.IssueCodes.service_manager_error") |
| 11 | **Message:** Cannot instantiate an agent of type *type-name* due to the following: *error*<br>**Cause:** An internal error avoid an agent of the given *type-name* to be created and launched<br>**Solving:** Review the given *error* and fix your agent software accordingly | Error | [spawn_error](: "io.sarl.sre.IssueCodes.spawn_error") |
| 12 | **Message:** Task with the id '*id*' and the name '*name*' was cancelled<br>**Cause:** A task was detected as cancelled by the thread execution service. This error should never occur, except if you have manually cancelled an agent task during its execution | Warning | [task_cancel](: "io.sarl.sre.IssueCodes.task_cancel") |
| 13 | **Message:** Uncaught exception: *error*<br>in thread #*task-id* '*task-name'<br>**Cause:** This error message is displayed when an agent task has encountered an *error*. | Error | [task_error](: "io.sarl.sre.IssueCodes.task_error") |
| 14 | **Message:** Task with the id '*id*' and the name '*name*' was interrupted<br>**Cause:** A task was detected as interrupted by the thread execution service. This error should never occur, except if the thread associated to the agent task was interrupted programmatically | Warning | [task_interrupt](: "io.sarl.sre.IssueCodes.task_interrupt") |
| 15 | **Message:** Rejected task due to lack of resources or service shutdown: *task*<br>**Cause:** This warning message is generated when an agent task is rejected by the internal thread execution service. Most of the time, the reason of the rejection is because there is not more space in the queue of tasks to be run. By default, when a task is rejected to be executed into a thread, Janus assumes that the tasks could be run into the current thread, and it is running the task. Consequently, this warning should be considered in order to detect internal bugs in your software<br>**Solving:** x | Warning | [task_reject](: "io.sarl.sre.IssueCodes.task_reject") |
| 16a | **Message:** Cannot create the universe context<br>**Cause:** Something avoid the Janus framework to be started and create the root context of the application. The cause of the error is unknown | Error | [universe_creation](: "io.sarl.sre.IssueCodes.universe_creation") |
| 16b | **Message:** Cannot create the universe context: *cause*<br>**Cause:** Something avoid the Janus framework to be started and create the root context of the application. The cause of the error is provided | Error | [universe_creation](: "io.sarl.sre.IssueCodes.universe_creation") |




## 4. Legal Notice

* Specification: SARL General-purpose Agent-Oriented Programming Language ("Specification")
* Version: 0.12
* Status: Draft Release
* Release: 2020-08-18

> Copyright &copy; 2014-2020 [the original authors or authors](http://www.sarl.io/about/index.html).
>
> Licensed under the Apache License, Version 2.0;
> you may not use this file except in compliance with the License.
> You may obtain a copy of the [License](http://www.apache.org/licenses/LICENSE-2.0).
>
> You are free to reproduce the content of this page on copyleft websites such as Wikipedia.

<small>Generated with the translator io.sarl.maven.docs.generator 0.12.0-SNAPSHOT.</small>