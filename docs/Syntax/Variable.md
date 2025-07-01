# Variable

### Theory

A **variable** in Arch is a reference to a space specified by a type expression. This type expression may be a simple type (such as `Int`, `String`), or a dependent type that refers to other variables (for example a structure).

Variables in Arch are always associated with a type, ensuring type safety and clarity in all expressions. Each variable represents a *name* that refers to a unique location, whose possible values are determined by its type.

### Syntax

**Define a variable:**

```
<identifier>: <TypeExpression>
```

`<identifier>` is the name of the variable.

`<TypeExpression>` can be a simple type, or a dependent type (e.g., a structure).

**Assign an inhabitant to the variable:**

```
<identifier> = <expression>
```

`<expression>` must produce a value (inhabitant) of the type specified for `<identifier>`.

**Define and assign a variable in one statement:**

```
<identifier>: <TypeExpression> = <expression>
```

***Example***

```
x: Int
y = 10			# auto type inference
z: Int = 10
```

