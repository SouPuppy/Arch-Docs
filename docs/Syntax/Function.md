# Function

### Theory

Given types $A$ and $B$, we can construct the type of **functions** $A \to B$ with domain $A$ and codomain $B$. Unlike in set theory, functions are not defined as functional relations; rather they are a primitive concept in type theory. We explain the function type by prescribing what we can do with functions, how to construct them and what equalities they induce.

​	Given a function $f: A \to B$ and an element of the domain $a:A$, we can **apply** the function to obtain an element of the codomain $B$, denoted $f(a)$ or sometimes $f \ a$ and called the value of $f$ at $a$.

​	To construct elements of $A \to B$ there are two equivilant ways:

1. **Direct definition**

​	Introducing a function by definition means that we introduce a function by giving it a name &mdash; let’s say, f &mdash; and saying we define $f : A \to B$ by giving an equation:
$$
f(x) \coloneqq \Phi
$$
where $x$ is a variable and $\Phi$ is an expression which may use $x$. In oreder for this to be valid, we have to check that $\Phi：B$ assuming $x:A$.

2. **$\lambda$-abstraction**

​	If we don’t want to introduce a name for the function, we can use $\lambda$-abstraction. Given an expression $\Phi$ of type $B$ which may use $x:A$, as above, we write $\lambda(x:A).\Phi$ to indicate the same function defined before. Thus, we have:
$$
(\lambda(x:A).\Phi): A \to B
$$

> Note that from any function $f: A \to B$, we can construct a lambda abstraction function $\lambda x. f(x)$. Since this is by definition “the function that applies f to its argument” we consider it to be definitionally equal to $f$:
> $$
> f \equiv (\lambda x. f (x)).
> $$
> This equality is the **uniqueness principle for function types**, because it shows that f is uniquely determined by its values.

**Currying**

Now we have learned how to define a function with one variable. To define functions with several variables, one intuitive way is to wrap those variables into a Cartesian product: a function with parameters $A$ and $B$ and result in $C$ would be given the type $f: A \times B \to C$. However, there is a advanced technique to achieve this, called **currying**.

​	The idea of currying is to represent a function of two inputs $a:A$ and $b:B$ as a function which *one* input $a:A$ and returns *another function*, which then takes a second input $b:B$ and returns the result. That is, we consider two-variable functions to belong to an iterated function type, $f:A \to (B \to C)$. We may also write this without the parentheses, as $f: A \to B \to C$, with associativity to the right as the default convention. Then given $a : A$ and $b : B$, we can apply $f$ to $a$ and then apply the result to $b$, obtaining $f (a)(b) : C$. To avoid the proliferation of parentheses, we allow ourselves to write $f (a)(b)$ as $f (a, b)$ even though there are no products involved. When omitting parentheses around function arguments entirely, we write $f \ a \ b$ for $(f \ a) \ b$, with the default associativity now being to the left so that $f$ is applied to its arguments in the correct order.

​	Our notation for definitions with explicit parameters extends naturally to this situation.  We can define a named function $f : A \to B \to C$ by giving an equation:
$$
f(x,y) \coloneqq \Phi
$$
Alternatively, using λ-abstraction, we may write:
$$
f \coloneqq \lambda x. \lambda y. \Phi
$$
which may also be written as:
$$
f \coloneqq x \mapsto \lambda \mapsto  \Phi
$$


> **Why Use Currying?**
>
> Currying supports the construction of higher-order functions, reflecting the internal structure of function spaces and enabling expressive abstraction and application. Moreover, since curried functions are the generalization of Cartesian functions &mdash; we can freely mix both curried and uncurried styles in practice. Parameters can be regrouped into Cartesian product form when needed — for example, when a function logically operates on a pair or when the uncurried form provides a more accurate reflection of the intended structure.
> A typical hybrid example would be:
> $$
> f : (A \times B) \to C \to D
> $$
> where the function first processes a pair and then returns a curried function.

---

### Syntax

**Define a functin**

To fully express the logic of *currying*, function definitions become a subtle and crucial matter. In our system, the `→` arrow represents currying &mdash; each parameter is introduced sequentially, and the entire definition should be parsed as a right-associative expression. Appropriate parentheses may be required to ensure logical completeness and clarity.

1. **Definition via $\lambda$-abstraction**

    This is the most minimal form of function definition &mdash; when all inputs deterministically map to a single output, the function can be written anonymously:

    ```
    <Variable|Type> → <Variable|Type> → ... → <Variable|Type> ⇒ <expression>;
    ```

    To facilitate pattern matching and structural recursion, we allow a `match` clause within the curried abstraction:

    ```
    <Variable|Type> → <Variable|Type> → ... → <Variable|Type> match {
    	<identifier|value> ... ⇒ <expression1>;
    	<identifier|value> ... ⇒ <expression2>;
    	...
    }
    ```

    When matching, value patterns match exact values, while identifier patterns bind the corresponding type or expression to a named variable. These identifiers are then available within the scope of the corresponding match branch.

    Specifying an explicit variable name in the parameter list is optional; it is primarily for clarity and readability.

2. **Direct (Named) Function Definition**

   Named functions follow the same curried style, but prefixed with the `def` keyword, reflecting that functions are first-class types and can be bound to identifiers:
   
   ```
   def <funcName>: <Variable|Type> → <Variable|Type> → ... → <Variable|Type> ⇒ <expression>;
   ```
   
   Alternatively, for multiple branches or pattern-matched definitions, we allow:
   
   ```
   def <funcName>: <Variable|Type> → <Variable|Type> → ... → <Variable|Type> match {
   	<variable|value> ... ⇒ <expression1>;
   	<variable|value> ... ⇒ <expression2>;
   	...
   }
   ```
   
   This is semantically equivalent to declaring and then separately defining individual clauses:
   
   ```
   def <funcName>: <Variable|Type> → <Variable|Type> → ... → <Variable|Type>;
   
   def <funcName> <variable|value> ... ⇒ <expression1>;
   def <funcName> <variable|value> ... ⇒ <expression2>;
   ```
   

***Exmaples***

- `fibonacci: (n: ℕ) → ℕ`

  ```
  def fibonacci: (n: ℕ) match {
  	0 ⇒ 0;
  	1 ⇒ 1;
  	n ⇒ fibonacci (n - 1) + fibonacci (n - 2);
  }
  ```

- `add: ℝ → ℝ → ℝ`

  ```
  def add: ℝ → ℝ → ℝ match {
  	a b ⇒ a + b;				# returns ℝ
  	a ⇒ ((a → b: ℝ) ⇒ a + b);  # returns ℝ → ℝ
  }
  
  def add3 := add 3;
  r1 = add 3 4;
  r2 = r' 4;
  
  # r1 and r2 will evaluate to the same value
  ```
