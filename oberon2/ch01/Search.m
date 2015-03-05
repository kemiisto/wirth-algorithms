MODULE Search;

  PROCEDURE LinearSearch*(array: ARRAY OF INTEGER; value: INTEGER): INTEGER;
  VAR
    i, n: INTEGER;
  BEGIN
    i := 0;
    n := LEN(array);
    WHILE (i < n) & (array[i] # value) DO
      INC(i)
    END;
    RETURN i;
  END LinearSearch;

  PROCEDURE BinarySearch*(array: ARRAY OF INTEGER; value: INTEGER): INTEGER;
  VAR
    l, r, m: INTEGER;
  BEGIN
    l := 0;
    r := LEN(array) - 1;

    WHILE (l < r) DO
      m := (l + r) DIV 2;
      IF (array[m] < value) THEN
        l := m + 1;
      ELSE
        r := m;
      END;
    END;

    IF (array[r] # value) THEN
      RETURN LEN(array);
    ELSE
      RETURN r;
    END;
  END BinarySearch;

END Search.
