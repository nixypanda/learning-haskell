module CSVParserTestSuite where

import CSVParser

import Test.Tasty (TestTree, testGroup)
import Test.Tasty.HUnit (assertEqual, testCase)

noParserTests :: TestTree
noParserTests =
    testGroup "No Parser"
        [ testCase "parse using noParser returns Nothing on string input" $
            assertEqual [] Nothing (parse (noParser :: Parser String) "Rofl")
        , testCase "parse using noParser returns Nothing on empty string imput" $
            assertEqual [] Nothing (parse (noParser :: Parser String) "")
        ]

pureParserTests :: TestTree
pureParserTests =
    testGroup "Pure Parser"
        [ testCase "parse using pureParser returns argument on empty input" $
            assertEqual [] (Just 10) (parse (pureParser 10) "")
        , testCase "parse using pureParser returns Nothing on input" $
            assertEqual [] Nothing (parse (pureParser 10) "rofl")
        ]

anyCharTests :: TestTree
anyCharTests =
    testGroup "Basic Primitive Parser: Any Char Parser"
        [ testCase "parse using anyChar return Nothing on no input" $
            assertEqual [] Nothing (parse anyChar "")
        , testCase "parse using anyChar returns only char in string of len one" $
            assertEqual [] (Just 'a') (parse anyChar "a")
        , testCase "parse using anyChar returns Nothing on string with len > 1" $
            assertEqual [] Nothing (parse anyChar "asdf")
        ]

orElseTests :: TestTree
orElseTests =
    testGroup "orElse combinator tests"
        [ testCase "anyChar `orElse` pureParser the pureParser is picked on empty input" $
            assertEqual [] (Just '☃') (parse (anyChar `orElse` pureParser '☃') "")
        , testCase "anyChar `orElse` pureParser the anyChar is picked on non-empty input" $
            assertEqual [] (Just 'R') (parse (anyChar `orElse` pureParser '☃') "R")
        ]


manyTests :: TestTree
manyTests =
    testGroup "many combinator tests"
        [ testCase "many returns a Parser which will go through all chars if used with anyChar" $
            assertEqual [] (Just "xs") (parse (many anyChar) "xs")
        , testCase "many returns a Parser which will return empty when used with noParser" $
            assertEqual [] (Just []) (parse (many (noParser :: Parser String)) "")
        ]


sepByTests :: TestTree
sepByTests =
    testGroup "sep by combinator tests"
        [ testCase "many and sepby togeter" $
            assertEqual []
                (Just ["rofl", "lol", "my man"])
                (parse (many (anyCharBut '\n') `sepBy` (char '\n')) "rofl\nlol\nmy man")
        ]

completeParserTests :: TestTree
completeParserTests =
    testGroup "csvParser"
        [ testCase "Trying out the whole thing" $
            assertEqual []
                (Just [["ab", "cd"],["","de"],[]])
                (parse parseCSV "\"ab\",\"cd\"\n\"\",\"de\"\n\n")
        ]

csvParserTestSuite :: TestTree
csvParserTestSuite =
  testGroup
    "CSV Parser Test Suite"
    [ noParserTests
    , pureParserTests
    , anyCharTests
    , orElseTests
    , manyTests
    , sepByTests
    , completeParserTests
    ]
