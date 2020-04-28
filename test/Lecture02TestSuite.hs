module Lecture02TestSuite where

import Lecture02
import Test.Tasty (TestTree, testGroup)
import Test.Tasty.HUnit (assertEqual, testCase)


-- Exercise 1 -----------------------------------------

ex1Tests :: TestTree
ex1Tests =
    testGroup "Exercise 01"
      [ testCase "Exact Matches 1" $ assertEqual [] 0 (exactMatches [Red, Blue, Green, Yellow] [Blue, Green, Yellow, Red])
      , testCase "Exact Matches 2" $ assertEqual [] 2 (exactMatches [Red, Blue, Green, Yellow] [Red, Purple, Green, Orange])
      , testCase "Exact Matches 3" $ assertEqual [] 1 (exactMatches [Red, Blue, Green, Yellow] [Red, Purple, Red, Orange])
      ]

-- Exercise 2 -----------------------------------------

ex2Tests :: TestTree
ex2Tests =
  testGroup "Exercise 02"
    [ testCase "countColors 1" $ assertEqual [] [1, 0, 1, 1, 0, 1] (countColors [Red, Blue, Yellow, Purple])
    , testCase "countColors 2" $ assertEqual [] [0, 2, 1, 0, 1, 0] (countColors [Green, Blue, Green, Orange])
    , testCase "countColors 3" $ assertEqual [] [2, 2, 0, 0, 0, 0] (countColors [Red, Green, Green, Red])
    , testCase "matches 1" $ assertEqual [] 3 (matches [Red, Blue, Yellow, Orange] [Red, Orange, Orange, Blue])
    , testCase "matches 2" $ assertEqual [] 4 (matches [Red, Purple, Yellow, Blue] [Blue, Yellow, Purple, Red])
    ]

-- Exercise 3 -----------------------------------------

ex3Tests :: TestTree
ex3Tests =
    testGroup "Exercise 03"
    [  testCase "getMove 1" $ assertEqual [] (Move [Red, Orange, Orange, Blue] 1 2) (getMove [Red, Blue, Yellow, Orange] [Red, Orange, Orange, Blue])
    ,  testCase "getMove 2" $ assertEqual [] (Move [Red, Orange, Orange, Blue] 1 1) (getMove [Red, Purple, Blue, Green] [Red, Orange, Orange, Blue])
    ]

-- Exercise 4 -----------------------------------------

ex4Tests :: TestTree
ex4Tests =
    testGroup "Exercise 04"
    [ testCase "isConsistent 1" $ assertEqual [] True  (isConsistent (Move [Red, Red, Blue, Green] 1 1) [Red, Blue, Yellow, Purple])
    , testCase "isConsistent 2" $ assertEqual [] False (isConsistent (Move [Red, Red, Blue, Green] 1 1) [Red, Blue, Red, Purple])
    , testCase "isConsistent 3" $ assertEqual [] True  (isConsistent (Move [Purple, Purple, Red, Green] 1 2) [Red, Green, Red, Purple])
    , testCase "isConsistent 4" $ assertEqual [] False (isConsistent (Move [Purple, Purple, Red, Green] 1 3) [Red, Green, Red, Purple])
    ]

-- Exercise 5 -----------------------------------------

ex5Tests :: TestTree
ex5Tests =
    testGroup "Exercise 05"
      [ testCase "filterCodes 1" $ assertEqual []
        [ [Red, Blue, Yellow, Purple] ]
        (filterCodes (Move [Red, Red, Blue, Green] 1 1) [ [Red, Blue, Yellow, Purple] , [Red, Blue, Red, Purple] ])
      , testCase "filterCodes 2" $ assertEqual []
        [ [Purple, Red, Blue, Purple] ]
        (filterCodes (Move [Purple, Purple, Red, Green] 1 2) [ [Red, Blue, Yellow, Purple] , [Red, Blue, Red, Purple] , [Purple, Red, Blue, Purple] ])
      ]

-- Exercise 6 -----------------------------------------

testAllCodes n =
  length (allCodes n) == 6^n

ex6Tests :: TestTree
ex6Tests =
    testGroup "Exercise 06"
      [ testCase "allCodes test 1" $ assertEqual [] [[Red], [Green], [Blue], [Yellow], [Orange], [Purple]] (allCodes 1)
      , testCase "allCodes test 2" $ assertEqual [] (map (6^) [2, 3, 4, 5]) (map (length . allCodes) [2, 3, 4, 5])
      ]

-- Exercise 7 -----------------------------------------

moveList1 = [Move [Red, Red, Red, Red] 4 0]

moveList2 =
    [ Move [Red,Red,Red,Red] 1 0
    , Move [Red,Green,Green,Green] 2 0
    , Move [Red,Green,Blue,Blue] 3 0
    , Move [Red,Green,Blue,Yellow] 4 0
    ]

moveList3 =
    [ Move [Red,Red,Red,Red] 0 0
    , Move [Green,Green,Green,Green] 0 0
    , Move [Blue,Blue,Blue,Blue] 0 0
    , Move [Yellow,Yellow,Yellow,Yellow] 0 0
    , Move [Orange,Orange,Orange,Orange] 0 0
    , Move [Purple,Purple,Purple,Purple] 4 0
    ]
    

ex7Tests :: TestTree
ex7Tests =
    testGroup "Exercise 07"
      [ testCase "solve 1" $ assertEqual [] moveList1 (solve [Red, Red, Red, Red])
      , testCase "solve 1" $ assertEqual [] moveList2 (solve [Red, Green, Blue, Yellow])
      , testCase "solve 1" $ assertEqual [] moveList3 (solve [Purple, Purple, Purple, Purple])
      ]


-- Exercise 8 -----------------------------------------

ex8Tests :: TestTree
ex8Tests =
    testGroup "Exercise 08"
        [ testCase "Fucked up equality: 1" $ assertEqual [] True (ADummy == ADummy)
        , testCase "Fucked up equality: 2" $ assertEqual [] True (BDummy == BDummy)
        , testCase "Fucked up equality: 3" $ assertEqual [] True (BDummy == ADummy)
        ]


-- Exercise 8 -----------------------------------------

ex9Tests :: TestTree
ex9Tests =
    testGroup "Exercise 09"
        [ testCase "Fibonacci 1" $ assertEqual [] 1 (fib 1)
        , testCase "Fibonacci 2" $ assertEqual [] 55 (fib 10)
        , testCase "Fibonacci 3" $ assertEqual [] 610 (fib 15)
        -- Note: Uncomment the following if you have managed to get the
        -- runtime of your algo to O(n)
        -- , testCase "Fibonacci 4" $ assertEqual [] 354224848179261915075 (fib 100)
        -- , testCase "Fibonacci 5" $ assertEqual [] 1 (signum $ fib 1000)
        -- Note: Uncomment the following if you have managed to get the runtime
        -- of your algo to O(log n).
        -- Hint: Num typeclass can be really helpful here to avoid a lot of
        -- complex algo work
        -- You should get an answer within 5 to 10 seconds
        -- Uncomment if you want to see how good your algo is
        , testCase "Fibonacci 6" $ assertEqual [] 1 (signum $ fib 100000000)
        ]

-- All Tests ------------------------------------------

lecture02TestSuite :: TestTree
lecture02TestSuite =
  testGroup
    "Lecture 02"
    [ ex1Tests
    , ex2Tests
    , ex3Tests
    , ex4Tests
    , ex5Tests
    , ex6Tests
    , ex7Tests
    , ex8Tests
    , ex9Tests
    ]

