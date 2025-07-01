# Module

A `Module` is a collection of types grouped within a namespace, which can be view as a functor, mapping type-level and term-level abstractions into structured instances. Therefore, a module is naturally a type with algebraic properties.

## Namespace

> Declare a module

By staring with  `namespace <ModuleName>` in a file, we declared the whole file as a  module

```
namespace <ModuleName>
```

In more general case, we can define a module inside a file, using curly brackets to explicitly delimit its content

```
namespace <ModuleName> {
	... 
}
```

## Export

Definitions inside a module are private by default. When you `import` a module, it will not expose any of its internal definitions unless they are explicitly marked with the `export` keyword.

**Export a type**

```
export <type>
```

**Export multiple types**

```
export { <type>, ... }
```

***Example***

```
namespace HumanResource {
	...
	export { Student, Teacher, Staff }
}
```

## Import

> The `import` keyword brings types from other module into the current context.

**Import whole module**

```
import <module>
```

> A `<modlue>` is a logical namespace identifier, not a real file path.
> It is resolved into a file by combining:
>
> 1. A search base path and
> 2. The namespace name declared by the `namespace` keyword
>
> **Resolution Rules:**
>
> To locate a module, the resolver searches in the following order:
>
> - Relative to the current file, or
> - Under paths defined in the `ARCH_PATH` environment variable
>
> or from another package:
>
> - Identify by a `@` prefix

***Example***

```
import @std/vector
```



**Import a module and assign it an alias**

```
import <module> as <alias>
```

this is equivialent as:

```
import <module>
<alias> := <module>
```

***Example***

```
import @HumanResource
student: HumanResource.Student
```

## Using

> The `using` keyword exposes types from a module to the current context, so you can reference them without a module prefix.

**Expose the whole module**

```
using <modlue>
```

*This form should be reserved for specific cases only such as `using @common`, as it injects all exported names from the module into the current context, potentially leading to namespace pollution and ambiguity.*

**Expose seleceted types from a module**

```
using { <type> ... } from <module>
```

***Example***

```
using @common
using { Student, Teacher, Staff } from @HumanResource

student: Student
teacher: Teacer
staff:	 Staff
```
