# Subtyping

### Theory

If $S$ is a subtype of $T$, or equivalently, $T$ is the supertype of $S$, the subtyping relation (written as $S \sqsubseteq T$) means that any term of type $S$ can *safely be used* in *any context* where a term of type $T$ is expected.

The subsumption rule can be expressed as:
$$
\frac{S \sqsubseteq T \quad \Gamma \vdash e:S }{\Gamma \vdash e:T}
$$

In `Arch`, we use subtypes to constructively build composite or unified types. This mechanism allows us to semantically create a shared interface for multiple distinct types, enabling flexible yet type-safe design.

---

### Syntax

**Supertype**

Uisng `|` to declare a supertype as a disjoint union of the listed subtypes:

```
<supertype> : <subtype₁> | <subtype₂> | ...
```

***Example***

```
Account : AdminAccount | RegularAccount
```



**Subtype**

Using keyword `where` to filter a subtype from a supertype. This is used specifically within `for` loops to filter the domain of iteration

```
<subtype> : <identifier> in <supertype> where <condition>
```

