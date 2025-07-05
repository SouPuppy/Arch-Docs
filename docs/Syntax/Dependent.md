# Dependent Types

In type theory, an ordinary function is written as:

$$
f : A \to B
$$

which has a fixed codomain $B$. However, we often wish the codomain to vary depending on the input. This leads to the notion of a **type family**:

$$
B : A \to \mathcal{U}
$$

meaning that for each $x : A$, the type $B(x)$ lives in some universe $\mathcal{U}$.

From the categorical perspective, such a type family corresponds to a **Grothendieck fibration**:

$$
p : \mathcal{E} \to \mathcal{B}
$$

Specifically, viewing $B$ as a functor from a discrete category on $A$ to the category of types $\mathcal{U}$, we can apply the **Grothendieck construction** to obtain the **total category**:

$$
\int_{x \in A} B(x)
$$

whose objects are pairs $(x, y)$ with $x : A$ and $y : B(x)$. The projection

$$
p : \int_{x \in A} B(x) \to A, \quad p(x, y) = x
$$

forms a canonical fibration over $A$, organizing the fibers $B(x)$ into a single category.

In dependent type theory, we describe such fibrations using two dual constructions: **$\Sigma$-types** and **$\Pi$-types**.

------

### **$\Sigma$-Type (Dependent Pair Type)**

A dependent pair type is written as:

$$
\sum_{x:A} B(x)
$$

This represents the **total space** of the type family $B(x)$: a value of this type is a pair $\langle x, y \rangle$ where $x : A$ and $y : B(x)$.

This directly aligns with the **Grothendieck construction**:

$$
\int_{x \in A} B(x)
$$

which collects all the fibers $B(x)$ into a unified structure over the base type $A$.

> From the perspective of **Martin-Löf Type Theory**, the fact that $\Sigma$-type describes the **total space** in category theory is precisely what makes it correspond to **existential quantification**:
>
> $$
> \sum_{x:A} B(x) \quad \simeq \quad \exists x : A.\ B(x)
> $$
>
> That is, an inhabitant of this type is a witness that there exists an $x \in A$ such that $B(x)$ holds.

------

### **$\Pi$-Type (Dependent Function Type)**

A dependent function type is written as:

$$
f : \prod_{x:A} B(x)
$$

This denotes a function that, for every $x : A$, returns an element in $B(x)$.

Categorically, given the fibration $p : \int_{x \in A} B(x) \to A$ induced by the type family $B$, a dependent function $f : \prod_{x:A} B(x)$ corresponds to a **section** of the projection $p$:

$$
f : A \to \int_{x \in A} B(x), \quad \text{such that } p \circ f = \mathrm{id}_A
$$

That is, $f$ selects a coherent element $f(x) \in B(x)$ for each $x \in A$, forming a global choice over the fibers.

> From the perspective of **Martin-Löf Type Theory**, the $\Pi$-type corresponds to **universal quantification** because it describes a function that, for every $x : A$, produces an element of $B(x)$. In categorical terms, this means specifying a coherent choice of an element in each fiber $B(x)$ over the base $A$ &mdash; that is, a global section.
>
> $$
> \prod_{x:A} B(x) \quad \simeq \quad \forall x : A.\ B(x)
> $$
>
> Thus, an inhabitant of this type provides a method (or witness) that, for every $x \in A$, supplies a corresponding $y : B(x)$, thereby verifying the truth of $B(x)$ for all $x$.

---

### Syntax

Corresponding to the logic of $\Sigma$-type and $\Pi$-type, `Arch` features both structures (dependent pairs) and dependent functions.

- Based on the $\Sigma$-type, a structure in `Arch` describes, from the perspective of the total space, a type $A : \mathcal{U}$ together with a type family $B : A \to \mathcal{U}$. By packaging elements as pairs $(a, b)$ with $a : A$ and $b : B(a)$, possibly in nested form, structures naturally express complex chains of dependency, corresponds to the total space in the Grothendieck construction.
- In contrast, the $\Pi$-type is used to describe a coherent selection of elements from the family $B$ over $A$, that is, a section. This can be realized in two ways:
  1. By projecting a dependent field from a structure.
  2. Or by directly constructing a section from the base $A$ to the total space, i.e., by defining a dependent function.

---

### Reference

- [Grothendieck fibration](https://ncatlab.org/nlab/show/Grothendieck+fibration)
