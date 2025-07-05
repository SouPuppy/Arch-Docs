# Polymorphism

### Syntax

Like most modern languages, `Arch` supports multiple forms of polymorphism, enabling greater abstraction and flexibility in both compile-time and runtime behavior. `Arch` provides three kinds of polymorphism:

1. **Compile-time polymorphism** 
   Achieved through function overloading, where multiple functions share the same name but differ in their parameter types or arity.

2. **Runtime polymorphism** 
   Enabled via structural inheritance and virtual dispatch, allowing different structures to implement the same interface and be substituted dynamically.

3. **Parametric polymorphism** 
   Expressed using type parameters, where functions or structures are written generically and can be instantiated with any type.

> These three levels of polymorphism together form the core abstraction mechanism in `Arch`, enabling both type safety and expressive power.



### 1. Compile-time polymorphism (override)