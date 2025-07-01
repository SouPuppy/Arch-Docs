# Char

Char is a straightforward type, it is the smallest and the basic building block of the semiotic system, also called a grapheme.

In Arch, a character is represented by wrapping it with single quotes: `'a'`, `'A'`, `'α'`, `'∫'` ...

We define:

```
Char: char_numbers | char_alphas | char_ALPHAS | char_greeks | char_GREEKS | char_symbols | char_space | char_tab | char_newline
```

# String

A `String` is a special `List Char` type that comes up with the prelude of `Arch`

---

### Reference

**char_numbers**

```
0123456789
```

**char_alphas | char_ALPHAS | char_greeks | char_GREEKS**

```
abcdefghijklmnopqrstuvwxyz
ABCDEFGHIJKLMNOPQRSTUVWXYZ
αβγδεζηθικλμνξοπρστυφχψω
ΑΒΓΔΕΖΗΘΙΚΛΜΝΞΟΠΡΣΤΥΦΧΨΩ
```

**Symbol**

```
×∫
+-*/=≠<>\&|^~!%:;,.?@#$°
√∞π∂∇
()[]{}⟨⟩
⊢→⇒↦
·∘
≤≥≡≃
¬∧∨
```

**char_space | char_tab | char_newline**

```
'\n': char_newline
' ' : char_space
'\t': char_tab
```

