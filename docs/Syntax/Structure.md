## Structure

### Theory

**Dependent Pair**

When we want to group 2 types together, a natural way is to use the cartesian product:
$$
\text{type}_1 \times \text{type}_2
$$
In a dependent type system, a $\Sigma$-Type is a generalization of the cartesian product type, written as:
$$
\Sigma_{(x : A)} B(x)
$$
This denotes a pair $\langle x, y \rangle$ where:

- $x : A$
- $y : B(x)$ — the second component depends on the first

**Structure**

A structure is essentially a syntactic and semantic wrapper around nested $\Sigma$-types (dependent pair types).
 Just like a continuous Cartesian product combines multiple independent types as:
$$
\text{type}_1 \times \text{type}_2 \times \cdots \times \text{type}_n
$$
the $\Sigma$-type generalizes this idea by allowing each type to depend on the values introduced before it. A structure captures a sequence of fields, each of which may or may not depend on the previous ones.

Suppose we have a sequence of types:
$$
\text{type}_1, \text{type}_2(x_1), \ldots, \text{type}_n(x_1, \ldots, x_{n-1})
$$
Then the structure corresponds mathematically to a nested dependent pair:
$$
\Sigma_{(x_1 : \text{type}_1)}\, \Sigma_{(x_2 : \text{type}_2(x_1))}\, \cdots\, \Sigma_{(x_n : \text{type}_n(x_1, \ldots, x_{n-1}))}\; \mathbb{1}
$$

> Here, the final `𝟙` (unit type) serves as a base case to terminate the nested structure, representing the “end” of the data.

---

### Syntax

**Declare a structure **

In `Arch`, struct-like dependent records are straightforward to express. To define such a structure simply list all fields in order, enclosed within curly braces `{}`. Each field’s type annotation can reference any of the preceding fields:

```
{
  <Field1> : <Type1>;
  <Field2> : <Type2>(<Field1>);
  <Field3> : <Type3>(<Field1>, <Field2>);
  ...
}
```

For each field:

- **Explicit typing is required** &mdash; each field must specify its type, either as a concrete type or as a type variable (i.e., as a type itself).
   While it is technically possible to omit variable names and use anonymous types, we strongly recommend naming every field for clarity and ease of reference. If any subsequent field needs to depend on a value, naming that value becomes essential.
- **Dependencies are permitted** &mdash; any field may depend on any of the preceding fields in the structure.
   This allows you to express rich dependency relationships directly and naturally.

This approach closely mirrors dependent record types in type theory, where each field’s type can reference all previous fields, enabling strong type safety and highly expressive modeling.

***Example***

```
def SafeVector[Tp_: Type] ⇒ {
  len    : ℕ;
  data   : Vector Tp_ len;
  index  : Fin n;
  getVal : Tp_;
}
```

> This define a factory that takes a type as input and outputs a VectorType.

**Declare a record**

After declaring a structure, we can assign values to a strcure wchich satisfies the dependent relationship, and we get a record:

```
<record> = {
  <Field1> = <term1>;
  <Field2> = <term2>;
  ...
}
```

**Projecting Variables from a Structure**

Suppose we have a structure $S = {x_1, x_2, \cdots, x_n}$. To access (or *project*) a field from this structure, use the structure name followed by a dot and the field identifier:

1. **Projecting a Single Field**

    ```
    S.x1
    ```

    This syntax retrieves the value of the field `x1` from structure `S`.

2. **Projecting Multiple Fields at Once**

    To simultaneously extract multiple fields from a **record**, use the following syntax, which aligns the returned values with the specified variables:

    ```
    {r1, r2, r3, ...} = S{.x1, .x2, .x3, ...}
    ```

    Here, each variable on the left (`r1`, `r2`, `r3`, ...) will be bound to the corresponding field (`x1`, `x2`, `x3`, ...) from `S`. This provides a convenient way to unpack several values from a record in a single statement.

3. **Pattern Matching**

   You can pattern-match arbitrary records to extract fields in the structure:
   
   ```
   def toString: (v: SafeVector) match {
     { len, data, index, getVal } ⇒ toString len ++ toString data ++ toString index ++ toString getVal;
   }
   ```
   
   

**Extends**

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

