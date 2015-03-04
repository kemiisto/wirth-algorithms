Examples from N. Wirth "Algorithms and Data Structures. Oberon version", 2004, updated 2012. 

Book is available for free [here](http://www.inr.ac.ru/~info21/ADen/).

##General remarks

### Short-circuit evaluation

Fortran operators are neither short-circuit nor eager: the language specification allows the compiler to select the method for optimization.
 
### Arrays numbering

C as well as Oberon uses [zero-based numbering](http://en.wikipedia.org/wiki/Zero-based_numbering) for arrays, Fortran on the other hand has arrays with user-defined indices and by default subscripts starts with one. Without starting rather useless zero- vs. one-based numbering holy war, "[let us let our ordinals start at zero: an element's ordinal (subscript) equals the number of elements preceding it in the sequence](http://www.cs.utexas.edu/users/EWD/transcriptions/EWD08xx/EWD831.html)."

### Dijkstra's Loop

Both C and Fortran lack the so-called *Dijkstra's Loop* (also referred to as the Dijkstra's Guarded Loop) construct which is used in the book. It was originally defined in the [Guarded Command Language (GCL)](http://en.wikipedia.org/wiki/Guarded_Command_Language#Repetition%3a_do) with the following syntax,

    do G0 -> S0
    | G1 -> S1
    ...
    | Gn -> Sn
    od
and with the semantics that the repetition executes the guarded commands repeatedly until none of the guards are true.  

Dijkstra's Loop is directly supported in just a few programming languages (for instance, in Oberon-07), where its syntax is as follows,

    WHILE G0 DO
        S0
    ELSIF G1 DO
        S1
    ...
    ELSIF Gn DO
        Sn
    END
In other languages it can be easily emulated as shown below for the example of C,

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
