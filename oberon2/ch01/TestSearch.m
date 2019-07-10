MODULE TestSearch;

  IMPORT Out, Search, Test;

  PROCEDURE TestSearchLinearSearch;
  VAR
    a: ARRAY 10 OF INTEGER;
  BEGIN
    a[0] := 8;  a[1] := 7;  a[2] := 0;  a[3] := 6; a[4] := 4;
    a[5] := 0;  a[6] := 5;  a[7] := 5;  a[8] := 7; a[9] := 9;

    (* non-existing elements 1, 2, 3 *)
    Test.RequireEqualInt(Search.LinearSearch(a, 1), 10, "test 01");
    Test.RequireEqualInt(Search.LinearSearch(a, 2), 10, "test 02");
    Test.RequireEqualInt(Search.LinearSearch(a, 3), 10, "test 03");

    (* existing unique elements 4, 6, 8, 9 *)
    Test.RequireEqualInt(Search.LinearSearch(a, 4), 4, "test 04");
    Test.RequireEqualInt(Search.LinearSearch(a, 6), 3, "test 05");
    Test.RequireEqualInt(Search.LinearSearch(a, 8), 0, "test 06");
    Test.RequireEqualInt(Search.LinearSearch(a, 9), 9, "test 07");

    (* existing non-unique elements 0, 5, 7 *)
    Test.RequireEqualInt(Search.LinearSearch(a, 0), 2, "test 08");
    Test.RequireEqualInt(Search.LinearSearch(a, 5), 6, "test 09");
    Test.RequireEqualInt(Search.LinearSearch(a, 7), 1, "test 10");
  END TestSearchLinearSearch;

  PROCEDURE TestSearchBinarySearch;
  VAR
    a: ARRAY 10 OF INTEGER;
  BEGIN
    a[0] := 0;  a[1] := 0;  a[2] := 4;  a[3] := 5;  a[4] := 5;
    a[5] := 6;  a[6] := 7;  a[7] := 7;  a[8] := 8;  a[9] := 9;

    (* non-existing elements 1, 2, 3 *)
    Test.RequireEqualInt(Search.BinarySearch(a, 1), 10, "test 01");
    Test.RequireEqualInt(Search.BinarySearch(a, 2), 10, "test 02");
    Test.RequireEqualInt(Search.BinarySearch(a, 3), 10, "test 03");

    (* existing unique elements 4, 6, 8, 9 *)
    Test.RequireEqualInt(Search.BinarySearch(a, 4), 2, "test 04");
    Test.RequireEqualInt(Search.BinarySearch(a, 6), 5, "test 05");
    Test.RequireEqualInt(Search.BinarySearch(a, 8), 8, "test 06");
    Test.RequireEqualInt(Search.BinarySearch(a, 9), 9, "test 07");

    (* existing non-unique elements 0, 5, 7 *)
    (*Test.RequireEqualInt(Search.BinarySearch(a, 0), 0, "test 08");*)
    (*Test.RequireEqualInt(Search.BinarySearch(a, 5), 3, "test 09");*)
    (*Test.RequireEqualInt(Search.BinarySearch(a, 7), 6, "test 10");*)
  END TestSearchBinarySearch;

  PROCEDURE TestSearchBinarySearchAlt;
  VAR
    a: ARRAY 10 OF INTEGER;
  BEGIN
    a[0] := 0;  a[1] := 0;  a[2] := 4;  a[3] := 5;  a[4] := 5;
    a[5] := 6;  a[6] := 7;  a[7] := 7;  a[8] := 8;  a[9] := 9;

    (* non-existing elements 1, 2, 3 *)
    Test.RequireEqualInt(Search.BinarySearchAlt(a, 1), 10, "test 01");
    Test.RequireEqualInt(Search.BinarySearchAlt(a, 2), 10, "test 02");
    Test.RequireEqualInt(Search.BinarySearchAlt(a, 3), 10, "test 03");

    (* existing unique elements 4, 6, 8, 9 *)
    Test.RequireEqualInt(Search.BinarySearchAlt(a, 4), 2, "test 04");
    Test.RequireEqualInt(Search.BinarySearchAlt(a, 6), 5, "test 05");
    Test.RequireEqualInt(Search.BinarySearchAlt(a, 8), 8, "test 06");
    Test.RequireEqualInt(Search.BinarySearchAlt(a, 9), 9, "test 07");

    (* existing non-unique elements 0, 5, 7 *)
    Test.RequireEqualInt(Search.BinarySearchAlt(a, 0), 0, "test 08");
    Test.RequireEqualInt(Search.BinarySearchAlt(a, 5), 3, "test 09");
    Test.RequireEqualInt(Search.BinarySearchAlt(a, 7), 6, "test 10");
  END TestSearchBinarySearchAlt;

BEGIN
  Out.String("Testing...");
  Out.Ln;
  Out.Ln;

  Out.String("Search.LinearSearch()");
  Out.Ln;
  TestSearchLinearSearch;

  Out.String("Search.BinarySearch()");
  Out.Ln;
  TestSearchBinarySearch;

  Out.String("Search.BinarySearchAlt()");
  Out.Ln;
  TestSearchBinarySearchAlt
END TestSearch.
