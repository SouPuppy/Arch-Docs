# Template

A major challenge in type theory is that, due to the ubiquity of currying, many expressions are forced into forms that are unintuitive or unfamiliar to most users. **Template** is designed to resolve this problem by enabling more natural, human-friendly syntax, while ensuring type safety.

### Syntax

Each template consists of two parts: a pattern (the part to be matched and replaced) and a body (the replacement expression). The entire substitution process is type-safe &mdash; all variables within the template pattern must be type-checked, and substitution is only allowed when the types are consistent.

**Syntax Form**

```
template[<"Literal text" | {<variable: Type>} ...] = <term>
```

- Literal text can be any `String`, but not a single `Char`.

- For pattern matching, all whitespace characters (spaces, tabs, newlines) between tokens are ignored to ensure consistent template application.

***Example***

```
template[{a: ℝ} "+" {b: ℝ}] = (addReal a b)

# 3 + 4
```

