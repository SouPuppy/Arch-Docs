# Loop

### Theory

A **Loop** is the process of lifting a morphism

$$
f : A \to B
$$

to a morphism

$$
F(f) : F(A) \to F(B)
$$

via a functor

$$
F : \mathcal{C} \to \mathcal{C}
$$

This lifting is intrinsic to the definition of a functor and expresses how a function can be “looped over” structured containers.

Such a transformation preserves the structure imposed by $F$, and is **uniform across all functors**. It satisfies the **naturality condition**, which ensures that for any morphism $f : A \to B$, the following diagram commutes:

$$
\begin{array}{ccc}
A & \xrightarrow{f} & B \\
\downarrow{F} &  & \downarrow{F} \\
F(A) & \xrightarrow{F(f)} & F(B)
\end{array}
$$

In this sense, *looping* over a structure corresponds to applying a function across the functorial image, while preserving internal shape and categorical consistency.

---

### Syntax

The `for` keyword introduces a loop whose range of traversal is defined by a functor $F$. In other words, iteration takes place over the structured space $F(A)$, assigning an identifier to each element in this space. The identifier will be available within the expression context.

There are two ways to express a `for` loop:

1. **Inline Expression**

An inline `for` loop appends the `for` clause directly to the end of an expression.

```
<expression> for <identifier> in <LoopSpace>
```

2. **Scoped Block**

A scoped `for` loop defines a block of statements to be executed for each element in the loop space.

```
for <identifier> in <LoopSpace> {
    ...
}
```

A `<LoopSpace>` can be:

- **An entire type space**

	```
	for <identifier> in <type>
	```

- **A filtered subtype**

    ```
    for <identifer> in <type> where <condition> {
        ...
    }
    ```

	> The identifier is also available within the `where` clause condition scope.

