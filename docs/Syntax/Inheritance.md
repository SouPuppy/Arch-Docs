# Inheritance

### Syntax

A structure can be extended from other structures using the `<` operator:

```arch
{ structA } < { structB }, { structC }, ...
```

This expression constructs a new anonymous structure by merging fields from structA, structB, etc. The result is:

```
{ structA, structB, structC, ... }
```

In practice, however, we more commonly write named structure inheritance as:

```
def A < B ⇒ { structA }
```

This syntax is actually just syntactic sugar. It desugars into:

```
def A ⇒ ({ structA } < B)
```

In other words, we treat A as a structure defined by extending B with the fields in structA. The < operator is a compositional constructor, not a special form of def.
