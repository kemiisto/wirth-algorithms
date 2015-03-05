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

END Search.
