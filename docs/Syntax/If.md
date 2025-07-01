## If

### Theory	

The **if-expression** acts as a value selector conditioned on a Boolean. Its resulting type is determined by the common type of $t_2$ and $t_3$, with the Boolean condition $t_1$ controlling which branch is chosen.

An `if`-expression in surface syntax is written as:
$$
\text{if} \ t_1 \ \text{then} \ t_2 \ \text{else} \ t_3
$$
**Typing Rule**
$$
\frac
  {\Gamma \vdash t_1 : \mathbb{B} \quad \Gamma \vdash t_2 : T \quad \Gamma \vdash t_3 : T}
  {\Gamma \vdash \text{if } t_1 \text{ then } t_2 \text{ else } t_3 : T}
$$

- $t_1$ must evaluate to a Boolean type $\mathbb{B}$
- $t_2$ and $t_3$ must evaluate to the same type $T$

Therefore, it is plausible to assign a type to the entire `if` expression, as it behaves like a type-preserving control expression.

**Evalutation**

The evaluation of an `if` expression depends on the value of $t_1$:

- If $t_1$ evaluates to `true`, the expression reduces to $t_2$
- If $t_1$ evaluates to `false`, the expression reduces to $t_3$

Formally:
$$
\text{if true then } t_2 \text{ else } t_3 \leadsto t_2 \\
\text{if false then } t_2 \text{ else } t_3 \leadsto t_3 \\
$$
This reduction step assumes that $t_1$ is evaluated first (e.g., call-by-value or eager evaluation), and ensures that only one of the branches is actually executed.

### Syntax

An `if`-expression in surface syntax is written as:
$$
\text{if} \ t_1 \ \text{then} \ t_2 \ \text{else} \ t_3
$$
In `Arch`, this is represented as:

```
if <term_1> then <term_2> else <term_3>
```

The entire `if` expression will evaluates to a term `t` of type `T`, depending on the result of the condition.

