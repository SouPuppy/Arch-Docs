# Type

### Base Type

`Arch` comes equipped with some set $\mathcal{A}$ of base types, with no primitive operations on them at all. This is accomplished simply by including the elements of $\mathcal{A}$ (ranged over by the
metavariable $\mathcal{A}$) in the set of types:
$$
\mathcal{A} \in \texttt{Type}
$$

This means that any element of $\mathcal{A}$ is considered a valid type in the system by default, serving as atomic units for constructing more complex types.

Here are all the base types in `Arch`:

- [Char]()- The minimal representation of any symbol

- [$\mathbb{B}$]() - $\mathtt{true}$ or $\mathtt{false}$

- [$\mathbb{C}$]() - Complex Numbers

  - [$\mathbb{R}$]() - Real Numbers

    - [$\mathbb{N}$]() - Natural Number
      - [$\mathbb{N}^+$]() - Positive Natural Number

    - [$\mathbb{Z}$]() - Integer
      - [$\mathbb{Z}^+$]() - Positive Integer
      - [$\mathbb{Z}^-$]() - Negative Integer

- [Vector]() - Vectors
- [Matrix]() - Matrices
