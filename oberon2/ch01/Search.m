MODULE Search;

  PROCEDURE LinearSearch*(a: ARRAY OF INTEGER; x: INTEGER): INTEGER;
  VAR
    i, n: INTEGER;
  BEGIN
    n := LEN(a);
    
    i := 0;
    
    WHILE (i < n) & (a[i] # x) DO
      (* (0 ≤ i ≤ n) and (∀k | 0 ≤ k < i : a[k] ≠ x) *)
      INC(i)
      (* (0 ≤ i ≤ n) and (∀k | 0 ≤ k < i : a[k] ≠ x) *)
    END;

    (* ((i = n) or (a[i] = x)) and (∀k | 0 ≤ k < i : a[k] ≠ x) *)
    RETURN i
  END LinearSearch;

  PROCEDURE BinarySearch*(a: ARRAY OF INTEGER; x: INTEGER): INTEGER;
  VAR
    l, r, m, n: INTEGER;
  BEGIN
    n := LEN(a);

    l := 0;
    r := n - 1;
    m := (l + r) DIV 2;

    WHILE (l <= r) & (a[m] # x) DO
      (* (∀k | 0 ≤ k < l : a[k] < x) and (∀k | r < k < n : a[k] > x) *)
      IF (a[m] < x) THEN
        l := m + 1
      ELSE
        r := m - 1
      END;
      m := (l + r) DIV 2
      (* (∀k | 0 ≤ k < l : a[k] < x) and (∀k | r < k < n : a[k] > x) *)
    END;

    (* (l > r) and (∀k | 0 ≤ k < n : a[k] ≠ x) or (a[m] = x) *)
    IF (l > r) THEN
      RETURN n
    ELSE
      RETURN m
    END
  END BinarySearch;

  PROCEDURE BinarySearchAlt*(a: ARRAY OF INTEGER; x: INTEGER): INTEGER;
  VAR
    l, r, m, n: INTEGER;
  BEGIN
    n := LEN(a);

    l := 0;
    r := n;

    WHILE (l < r) DO
      (* (∀k | 0 ≤ k < l : a[k] < x) and (∀k | r ≤ k < n : a[k] ≥ x) *)
      m := (l + r) DIV 2;
      IF (a[m] < x) THEN
        l := m + 1
      ELSE
        r := m
      END
      (* (∀k | 0 ≤ k < l : a[k] < x) and (∀k | r ≤ k < n : a[k] ≥ x) *)
    END;

    (* (l = r) and (∀k | 0 ≤ k < l : a[k] < x) and (∀k | r ≤ k < n : a[k] ≥ x) *)
    (* (∀k | 0 ≤ k < r : a[k] < x) and (∀k | r ≤ k < n : a[k] ≥ x) *)
    IF (r < n) & (a[r] = x) THEN
      RETURN r
    ELSE
      RETURN n
    END
  END BinarySearchAlt;

END Search.
