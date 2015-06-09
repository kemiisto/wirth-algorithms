MODULE StringSearch;

  IMPORT Strings;

  PROCEDURE R(string, pattern: ARRAY OF CHAR; i: INTEGER): BOOLEAN;
  VAR
    j, m: INTEGER;
  BEGIN
    (* 0 <= i < n *)
    j := 0;
    m := Strings.Length(pattern);
    WHILE (j < m) & (pattern[j] = string[i + j]) DO
      INC(j);
    END;
    RETURN ~(j < m);
  END R;

  PROCEDURE SimpleSearch*(string, pattern: ARRAY OF CHAR): INTEGER;
  VAR
    i, m, n: INTEGER;
  BEGIN
    i := 0;
    m := Strings.Length(pattern);
    n := Strings.Length(string);
    WHILE (i <= n - m) & ~R(string, pattern, i) DO
      INC(i);
    END;

    IF (i > n - m) THEN
      RETURN n;
    ELSE
      RETURN i;
    END;
  END SimpleSearch;

  PROCEDURE SimpleSearchDijkstraLoop*(string, pattern: ARRAY OF CHAR): INTEGER;
  VAR
    i, j, m, n: INTEGER;
  BEGIN
    i := 0;
    j := 0;
    m := Strings.Length(pattern);
    n := Strings.Length(string);
    WHILE (i <= n - m) & (j < m) & (string[i + j] = pattern[j]) DO
      INC(j)
    ELSIF (i <= n - m) & (j < m) DO
      INC(i);
      j := 0;
    END;

    IF (i > n - m) THEN
      RETURN n;
    ELSE
      RETURN i;
    END;
  END SimpleSearchDijkstraLoop;

  PROCEDURE KnuttMorrisPrattSearch*(string, pattern: ARRAY OF CHAR): INTEGER;
  VAR
    i, j, k, m, n: INTEGER;
    d: ARRAY 10 OF INTEGER;
  BEGIN
    m := Strings.Length(pattern);
    n := Strings.Length(string);
    
    d[0] := -1;
    IF pattern[0] # pattern[1] THEN
      d[1] := 0
    ELSE
      d[1] := -1;
    END;
    j := 1;
    k := 0;
    WHILE (j < m - 1) & (k >= 0) & (pattern[j] # pattern[k]) DO
      k := d[k]
    ELSIF j < m - 1 DO
      INC(j);
      INC(k);
      IF pattern[j] # pattern[k] THEN
        d[j] := k;
      ELSE
        d[j] := d[k]
      END;
    END;

    i := 0;
    j := 0;
    WHILE (j < m) & (i < n) & (j >= 0) & (string[i] # pattern[j]) DO
      j := d[j];
    ELSIF (j < m) & (i < n) DO
      INC(i);
      INC(j);
    END;

    IF (j = m) THEN
      RETURN i - m;
    ELSE
      RETURN n;
    END;
  END KnuttMorrisPrattSearch;

END StringSearch.
