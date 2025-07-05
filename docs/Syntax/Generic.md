## Generic

### Theory

A **Generic Form** is straightforward in type theory.
 For example, when you want to represent a generic type such as `List<T>`, which abstractly represents a sequence of indexed, ordered data where the data at each index has the same (but arbitrary) type, you can express this naturally with a $\Pi$-type:

$$
\Pi_{(T:\mathrm{Type})}~\mathrm{List}(T)
$$

This denotes “for every type $T$, there is a type $\mathrm{List}(T)$”—exactly what a generic (parametric) type means.

### Syntax

Placing `[]` before a type means that the variables inside `[]` are bound as Pi-type (generic) parameters for the following type definition.
 This creates a subcontext in which those variables are available:

```
[ <Field>, ... ]: <type>
```

This is mathematically equivalent to:

$$
\Pi_{(<\text{Field}>,\ldots)}~<\text{type}>
$$

***Example***

```
def Maximum [T: Type]: (T, T) ⇒ T;
```

is equivalent to:

$$
\Pi_{T:\mathrm{Type}}~\mathrm{Maximum}(T \times T)
$$
