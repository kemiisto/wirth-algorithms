MODULE TestSearch;

  IMPORT Out, Search, Test;

  PROCEDURE TestSearchLinearSearch;
  VAR
    array: ARRAY 10 OF INTEGER;
  BEGIN
    array[0] := 8;
    array[1] := 7;
    array[2] := 0;
    array[3] := 6;
    array[4] := 4;
    array[5] := 0;
    array[6] := 5;
    array[7] := 5;
    array[8] := 7;
    array[9] := 9;

    (* non-existing elements 1, 2, 3 *)
    Test.AssertEqualInt(Search.LinearSearch(array, 1), 10, "test 01");
    Test.AssertEqualInt(Search.LinearSearch(array, 2), 10, "test 02");
    Test.AssertEqualInt(Search.LinearSearch(array, 3), 10, "test 03");

    (* existing unique elements 4, 6, 8, 9 *)
    Test.AssertEqualInt(Search.LinearSearch(array, 4), 4, "test 04");
    Test.AssertEqualInt(Search.LinearSearch(array, 6), 3, "test 05");
    Test.AssertEqualInt(Search.LinearSearch(array, 8), 0, "test 06");
    Test.AssertEqualInt(Search.LinearSearch(array, 9), 9, "test 07");

    (* existing non-unique elements 0, 5, 7 *)
    Test.AssertEqualInt(Search.LinearSearch(array, 0), 2, "test 08");
    Test.AssertEqualInt(Search.LinearSearch(array, 5), 6, "test 09");
    Test.AssertEqualInt(Search.LinearSearch(array, 7), 1, "test 10");
  END TestSearchLinearSearch;

BEGIN
  Out.String("Testing...");
  Out.Ln;
  Out.Ln;

  Out.String("Search.LinearSearch()");
  Out.Ln;
  TestSearchLinearSearch;
END TestSearch.
