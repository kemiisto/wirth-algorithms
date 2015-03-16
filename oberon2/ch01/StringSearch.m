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

END StringSearch.
