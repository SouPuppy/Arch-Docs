### Theory

**Type of a term**

To say that a *term* $t$ *has type* $T$ means that $t$ is a canonical or computable object of type $T$, or that $t$ can be evaluated (normalized) to a canonical form belonging to $T$.

This is written as:

$$
t : T
$$

where $t$ is the term and $T$ is its type.

In other words, types classify terms. If $t : T$, then $t$ is said to be an *inhabitant* of the type $T$.

------

### Syntax

To obtain the type of any expression in Arch, use the command:

```
type <term>
```

This returns a value of type `ArchType`. You can convert this type to a string for debugging or display purposes using:

```
toString (type <term>)
```

For example:

```
toString (type Char) ⇒ "Char"
```

Internally, every type is represented as a unique `ArchType` object, which can be used to identify and compare types. This uniqueness is achieved by assigning each type a unique SHA-256 hash value, allowing for efficient type comparison and structural equality checking.

> Any type will generate its own unique `Type : ArchType`, and type equality is determined by the underlying SHA-256 representation.
