MODULE TestStringSearch;

  IMPORT Out, StringSearch, Test;

  PROCEDURE TestSimpleSearch;
  BEGIN
    Test.RequireEqualInt(
      StringSearch.SimpleSearch("test", "test"), 0, "test 01"
    );
    Test.RequireEqualInt(
      StringSearch.SimpleSearch("test",  "est"), 1, "test 02"
    );
    Test.RequireEqualInt(
      StringSearch.SimpleSearch("test",   "st"), 2, "test 03"
    );
    Test.RequireEqualInt(
      StringSearch.SimpleSearch("test", "t"   ), 0, "test 04"
    );
    Test.RequireEqualInt(
      StringSearch.SimpleSearch("test", "qest"), 4, "test 05"
    );
  END TestSimpleSearch;

  PROCEDURE TestSimpleSearchDijkstraLoop;
  BEGIN
    Test.RequireEqualInt(
      StringSearch.SimpleSearchDijkstraLoop("test", "test"), 0, "test 01"
    );
    Test.RequireEqualInt(
      StringSearch.SimpleSearchDijkstraLoop("test",  "est"), 1, "test 02"
    );
    Test.RequireEqualInt(
      StringSearch.SimpleSearchDijkstraLoop("test",   "st"), 2, "test 03"
    );
    Test.RequireEqualInt(
      StringSearch.SimpleSearchDijkstraLoop("test", "t"   ), 0, "test 04"
    );
    Test.RequireEqualInt(
      StringSearch.SimpleSearchDijkstraLoop("test", "qest"), 4, "test 05"
    );
  END TestSimpleSearchDijkstraLoop;

  PROCEDURE TestKnuttMorrisPrattSearch;
  BEGIN
    Test.RequireEqualInt(
      StringSearch.KnuttMorrisPrattSearch("test", "test"), 0, "test 01"
    );
    Test.RequireEqualInt(
      StringSearch.KnuttMorrisPrattSearch("test",  "est"), 1, "test 02"
    );
    Test.RequireEqualInt(
      StringSearch.KnuttMorrisPrattSearch("test",   "st"), 2, "test 03"
    );
    Test.RequireEqualInt(
      StringSearch.KnuttMorrisPrattSearch("test", "t"   ), 0, "test 04"
    );
    Test.RequireEqualInt(
      StringSearch.KnuttMorrisPrattSearch("test", "qest"), 4, "test 05"
    );
  END TestKnuttMorrisPrattSearch;

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
  Out.Ln;

  Out.String("StringSearch.KnuttMorrisPrattSearch()");
  Out.Ln;
  TestKnuttMorrisPrattSearch;
  Out.Ln;
END TestStringSearch.
