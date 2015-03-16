MODULE TestStringSearch;

  IMPORT Out, StringSearch, Test;

  PROCEDURE TestSimpleSearch;
  BEGIN
    Test.AssertEqualInt(
      StringSearch.SimpleSearch("test", "test"), 0, "test 01"
    );
    Test.AssertEqualInt(
      StringSearch.SimpleSearch("test",  "est"), 1, "test 02"
    );
    Test.AssertEqualInt(
      StringSearch.SimpleSearch("test",   "st"), 2, "test 03"
    );
    Test.AssertEqualInt(
      StringSearch.SimpleSearch("test", "t"   ), 0, "test 04"
    );
    Test.AssertEqualInt(
      StringSearch.SimpleSearch("test", "qest"), 4, "test 05"
    );
  END TestSimpleSearch;

  PROCEDURE TestSimpleSearchDijkstraLoop;
  BEGIN
    Test.AssertEqualInt(
      StringSearch.SimpleSearchDijkstraLoop("test", "test"), 0, "test 01"
    );
    Test.AssertEqualInt(
      StringSearch.SimpleSearchDijkstraLoop("test",  "est"), 1, "test 02"
    );
    Test.AssertEqualInt(
      StringSearch.SimpleSearchDijkstraLoop("test",   "st"), 2, "test 03"
    );
    Test.AssertEqualInt(
      StringSearch.SimpleSearchDijkstraLoop("test", "t"   ), 0, "test 04"
    );
    Test.AssertEqualInt(
      StringSearch.SimpleSearchDijkstraLoop("test", "qest"), 4, "test 05"
    );
  END TestSimpleSearchDijkstraLoop;

BEGIN
  Out.String("Testing...");
  Out.Ln;
  Out.Ln;

  Out.String("StringSearch.SimpleSearch()");
  Out.Ln;
  TestSimpleSearch;
  Out.Ln;
  
  Out.String("StringSearch.SimpleSearchDijkstraLoop()");
  Out.Ln;
  TestSimpleSearchDijkstraLoop;
END TestStringSearch.
