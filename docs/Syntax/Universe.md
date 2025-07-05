# Universe

### Theory

When we represent sets as trees &mdash; such as inductively defined structures &mdash; we can directly encode *Russell’s paradox*, for example by defining "the set of all sets that do not contain themselves", which leads to inconsistency.

To avoid such paradoxes, we introduce a **hierarchy of universes**:

$$
\mathcal{U}_0 : \mathcal{U}_1 : \mathcal{U}_2 : \cdots
$$

- Each universe $\mathcal{U}_i$ is an element of the next universe $\mathcal{U}_{i+1}$, i.e., $\mathcal{U}_i : \mathcal{U}_{i+1}$.
- Moreover, universes are assumed to be **cumulative**: every type (or element) in universe $\mathcal{U}_i$ is also an element of $\mathcal{U}_{i+1}$. That is, if $A : \mathcal{U}_i$, then also $A : U_{i+1}$.

This stratification avoids the circular self-reference that causes paradoxes like Russell’s, by ensuring that no type can refer to or quantify over itself.

> **Note:** To express the function $\lambda i : \mathbb{N}., \mathcal{U}_i$, which maps a natural number $i$ to the universe $\mathcal{U}_i$, we need a universe large enough to contain all $\mathcal{U}_i$. We write this as $\mathcal{U}_\omega$, representing a universe "above" the entire hierarchy.

------

***Example*** - Defining Dependent Types

To model a collection of types varying over a given type $A$, we define a function:

$$
B : A \to \mathcal{U}
$$

where $\mathcal{U}$ is a universe.

Such a function is called a **family of types**, or a **dependent type**, because the resulting type $B(a)$ depends on the input value $a : A$. This is analogous to a family of sets indexed by another set in classical set theory.

### Syntax

In `Arch`, the universe $\mathcal{U}_0$ is represented by the special keyword `Type`:

```
Type
```

All higher universes are denoted using the 𝒰 with a natural number index:

```
𝒰(i)   # where i : ℕ
```
