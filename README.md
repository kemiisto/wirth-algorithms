Examples from N. Wirth "Algorithms and Data Structures. Oberon version", 2004, updated 2012. 

Book is available for free [here](http://www.inr.ac.ru/~info21/ADen/).

##General remarks

### Short-circuit evaluation

Boolean operators in both C and Oberon are [short-circuit](http://en.wikipedia.org/wiki/Short-circuit_evaluation), while Fortran operators are neither short-circuit nor eager: the language specification allows the compiler to select the method for optimization.
Consequently, conditionals and loops relaying on short-circuit evaluation, for instance,

```pascal
WHILE (A) & (B) & (C) DO
  D
END;
```

has to be rewritten in Fortran as follows,

```fortran
do while (A)
    if (.not. B) exit
    if (.not. C) exit
    D
end do
```

### Arrays numbering

C as well as Oberon uses [zero-based numbering](http://en.wikipedia.org/wiki/Zero-based_numbering) for arrays, Fortran on the other hand has arrays with user-defined indices and by default subscripts starts with one.
Without starting rather useless zero- vs. one-based numbering holy war, "[let us let our ordinals start at zero: an element's ordinal (subscript) equals the number of elements preceding it in the sequence](http://www.cs.utexas.edu/users/EWD/transcriptions/EWD08xx/EWD831.html)."

### Dijkstra's Loop

Both C and Fortran lack the so-called *Dijkstra's Loop* (also referred to as the Dijkstra's Guarded Loop) construct which is used in the book.
It was originally defined in the [Guarded Command Language (GCL)](http://en.wikipedia.org/wiki/Guarded_Command_Language#Repetition%3a_do) with the following syntax,

```
do G0 -> S0
| G1 -> S1
...
| Gn -> Sn
od
```

and with the semantics that the repetition executes the guarded commands repeatedly until none of the guards are true.  

Dijkstra's Loop is directly supported in just a few programming languages (for instance, in Oberon-07), where its syntax is as follows,

```pascal
WHILE G0 DO
    S0
ELSIF G1 DO
    S1
...
ELSIF Gn DO
    Sn
END
```

In other languages it can be easily emulated as shown below for the example of C,

```c
while (true) {
    if (G0)
        S0
    else if (G1)
        S1
    ... 
    else if (Gn)
        Sn
    else
        break;
}
```
