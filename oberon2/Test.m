MODULE Test;

  IMPORT Out;

  PROCEDURE AssertEqualInt*(actual, expected: INTEGER; description: ARRAY OF CHAR);
  BEGIN
    IF (actual = expected) THEN
      PrintPassedMessage(description);
    ELSE
      PrintFailedMessage(description);
      Out.String("     actual: ");
      Out.Int(actual, 5);
      Out.Ln;
      Out.String("   expected: ");
      Out.Int(expected, 5);
      Out.Ln;
    END;
  END AssertEqualInt;

  PROCEDURE PrintPassedMessage(description: ARRAY OF CHAR);
  BEGIN
    Out.String("|- ");
    Out.String(description);
    Out.String(" passed.");
    Out.Ln;
  END PrintPassedMessage;

  PROCEDURE PrintFailedMessage(description: ARRAY OF CHAR);
  BEGIN
    Out.String("|- ");
    Out.String(description);
    Out.String(" FAILED!");
    Out.Ln;
  END PrintFailedMessage;

END Test.
