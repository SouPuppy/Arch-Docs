# List

**Type**

```
def List: (Tp_: Typ) → (i: ℕ) ⇒ Tp_;
```

Index of a List starts from 0, and ends with -1.

### Operations

- Concat `++` 

  > Concatinating `Tp_` and `List Tp_` together and return a  `List Tp_` type

  **Usage:**

  ```
  x ++ y
  ```

- Indexing `[]`

  > Indexing from a `List Tp_` and return a `Tp_` type
  
  **Usage:**
  
  ```
  L[i]  # where i: ℤ
  ```

- Slicing

  > Select a partial from a List `List Tp_` and return another `List Tp_`

  **Usage:**
  
  ```
  L[i:j]  # where i, j: ℤ
  ```
