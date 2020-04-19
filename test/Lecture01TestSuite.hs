module Lecture01TestSuite where

import Lecture01
import Test.Tasty (TestTree, testGroup)
import Test.Tasty.HUnit (assertEqual, testCase)

lecture01TestSuite :: TestTree
lecture01TestSuite =
  testGroup
    "Part One"
    [ problem1TestSuite
    , problem2TestSuite
    , problem3TestSuite
    , problem4TestSuite
    , problem5TestSuite
    , problem6TestSuite
    , problem7TestSuite
    , problem8TestSuite
    , problem9TestSuite
    , problem10TestSuite
    , problem11TestSuite
    , problem12TestSuite
    , problem13TestSuite
    , problem14TestSuite
    , problem15TestSuite
    , problem16TestSuite
    , problem17TestSuite
    , problem18TestSuite
    , problem19TestSuite
    , problem20TestSuite
    , problemATestSuite
    , problemBTestSuite
    ]


-- First problem test suite
problem1TestSuite :: TestTree
problem1TestSuite =
  testGroup "First problem" [lastOfIntegerList, lastOfCharList]

lastOfIntegerList =
  testCase "Last of integer list" $ assertEqual [] 4 (problem1 [1, 2, 3, 4])

lastOfCharList =
  testCase "Last of char list" $ assertEqual [] 'z' (problem1 ['x', 'y', 'z'])


-- Second problem test suite
problem2TestSuite :: TestTree
problem2TestSuite =
  testGroup "Second problem" [lastButOneOfIntegerList, lastButOneOfCharList]

lastButOneOfIntegerList =
  testCase "Last but one of integer list" $
  assertEqual [] 3 (problem2 [1, 2, 3, 4])

lastButOneOfCharList =
  testCase "Last but one of char list" $
  assertEqual [] 'y' (problem2 ['x' .. 'z'])


-- Third problem test suite
problem3TestSuite :: TestTree
problem3TestSuite =
  testGroup "Third problem" [elementAtOfIntegerList, elementAtOfString]

elementAtOfIntegerList =
  testCase "Element at of integer list" $
  assertEqual [] 2 (problem3 [1, 2, 3] 2)

elementAtOfString =
  testCase "Element at of string" $ assertEqual [] 'e' (problem3 "haskell" 5)


-- Fourth problem test suite
problem4TestSuite :: TestTree
problem4TestSuite =
  testGroup "Fourth problem" [lengthOfIntegerList, lengthOfString]

lengthOfIntegerList =
  testCase "Length of integer list" $
  assertEqual [] 3 (problem4 [123, 456, 789])

lengthOfString =
  testCase "Length of string" $ assertEqual [] 13 (problem4 "Hello, world!")


-- Fifth problem test suite
problem5TestSuite :: TestTree
problem5TestSuite =
  testGroup "Fifth problem" [reverseIntegerList, reverseString]

reverseIntegerList =
  testCase "Reverse of integer list" $
  assertEqual [] [4, 3, 2, 1] (problem5 [1, 2, 3, 4])

reverseString =
  testCase "Reverse of string" $
  assertEqual
    []
    "!amanap ,lanac a ,nalp a ,nam A"
    (problem5 "A man, a plan, a canal, panama!")


-- Sixth problem test suite
problem6TestSuite :: TestTree
problem6TestSuite =
  testGroup
    "Sixth problem"
    [isIntegerListPalindrome, isStringPalindrome, isBigIntegerListPalindrome]

isIntegerListPalindrome =
  testCase "Check if integer list is a palindrome" $
  assertEqual [] False (problem6 [1, 2, 3])

isStringPalindrome =
  testCase "Check if string is a palindrome" $
  assertEqual [] True (problem6 "madamimadam")

isBigIntegerListPalindrome =
  testCase "Check if big integer list is a palindrome" $
  assertEqual [] True (problem6 [1, 2, 4, 8, 16, 8, 4, 2, 1])


-- Seventh problem test suite
problem7TestSuite :: TestTree
problem7TestSuite =
  testGroup
    "Seventh problem"
    [ flattenListWithOneElement
    , flattenList
    , flattenEmptyList
    ]

flattenListWithOneElement =
  testCase "Flatten list of one element" $
  assertEqual [] [5] (problem7 (Elem 5))

flattenList =
  testCase "Flatten list" $
  assertEqual
    []
    [1, 2, 3, 4, 5]
    (problem7 (List [Elem 1, List [Elem 2, List [Elem 3, Elem 4], Elem 5]]))

flattenEmptyList =
  testCase "Flatten empty list" $
  assertEqual [] ([] :: [Int]) (problem7 (List []))


-- Eighth problem test suite
problem8TestSuite :: TestTree
problem8TestSuite = testGroup "Eighth problem" [compressString]

compressString =
  testCase "Compress string" $
  assertEqual [] "abcade" (problem8 "aaaabccaadeeee")


-- Ninth problem test suite
problem9TestSuite :: TestTree
problem9TestSuite = testGroup "Ninth problem" [packCharList]

packCharList =
  testCase "Pack char list" $
  assertEqual
    []
    ["aaaa", "b", "cc", "aa", "d", "eeee"]
    (problem9
       ['a', 'a', 'a', 'a', 'b', 'c', 'c', 'a', 'a', 'd', 'e', 'e', 'e', 'e'])


-- Tenth problem test suite
problem10TestSuite :: TestTree
problem10TestSuite = testGroup "Tenth problem" [runLengthEncode]

runLengthEncode =
  testCase "Run-length encoding" $
  assertEqual
    []
    [(4, 'a'), (1, 'b'), (2, 'c'), (2, 'a'), (1, 'd'), (4, 'e')]
    (problem10 "aaaabccaadeeee")


-- Eleventh problem test suite
problem11TestSuite :: TestTree
problem11TestSuite =
  testGroup
    "Eleventh problem"
    [modifiedRunLengthEncode]

modifiedRunLengthEncode =
  testCase "Modified run-length encoding" $
  assertEqual
    []
    [ Multiple 4 'a'
    , Single 'b'
    , Multiple 2 'c'
    , Multiple 2 'a'
    , Single 'd'
    , Multiple 4 'e'
    ]
    (problem11 "aaaabccaadeeee")


-- Twelfth problem test suite
problem12TestSuite :: TestTree
problem12TestSuite =
  testGroup "Twelfth problem" [modifiedDecode]

modifiedDecode =
  testCase "Modified run-length decoding" $
  assertEqual
    []
    "aaaabccaadeeee"
    (problem12
       [ Multiple 4 'a'
       , Single 'b'
       , Multiple 2 'c'
       , Multiple 2 'a'
       , Single 'd'
       , Multiple 4 'e'
       ])


-- Thirteenth problem test suite
problem13TestSuite :: TestTree
problem13TestSuite =
  testGroup "Thirteenth problem" [directEncode]

directEncode =
  testCase "Direct run-length encoding" $
  assertEqual
    []
    [ Multiple 4 'a'
    , Single 'b'
    , Multiple 2 'c'
    , Multiple 2 'a'
    , Single 'd'
    , Multiple 4 'e'
    ]
    (problem13 "aaaabccaadeeee")


-- Fourteenth problem test suite
problem14TestSuite :: TestTree
problem14TestSuite =
  testGroup
    "Fourteenth problem"
    [ duplicateElements
    ]

duplicateElements =
  testCase "Duplicate the elements of a list" $
  assertEqual [] [1, 1, 2, 2, 3, 3] (problem14 [1, 2, 3])


-- Fifteenth problem test suite
problem15TestSuite :: TestTree
problem15TestSuite = testGroup "Fifteenth problem" [replicateElements]

replicateElements =
  testCase "Replicate the elements of a list a given number of times" $
  assertEqual [] "aaabbbccc" (problem15 "abc" 3)


-- Sixteenth problem test suite
problem16TestSuite :: TestTree
problem16TestSuite = testGroup "Sixteenth problem" [dropEveryN]

dropEveryN =
  testCase "Drop every N'th element from a list" $
  assertEqual [] "abdeghk" (problem16 "abcdefghik" 3)


-- Seventeenth problem test suite
problem17TestSuite :: TestTree
problem17TestSuite = testGroup "Seventeenth problem" [split]

split =
  testCase "Split a list into two parts" $
  assertEqual [] ("abc", "defghik") (problem17 "abcdefghik" 3)


-- Eighteenth problem test suite
problem18TestSuite :: TestTree
problem18TestSuite = testGroup "Eighteenth problem" [slice]

slice =
  testCase "Extract a slice from a list" $
  assertEqual
    []
    "cdefg"
    (problem18 ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'k'] 3 7)


-- Nineteenth problem test suite
problem19TestSuite :: TestTree
problem19TestSuite =
  testGroup "Nineteenth problem" [rotateList, reverseRotateList]

rotateList =
  testCase "Rotate a list N places to the left" $
  assertEqual
    []
    "defghabc"
    (problem19 ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'] 3)

reverseRotateList =
  testCase "Rotate a list N places to the right" $
  assertEqual
    []
    "ghabcdef"
    (problem19 ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'] (-2))


-- Twenty problem test suite
problem20TestSuite :: TestTree
problem20TestSuite =
  testGroup "Twenty problem" [removeAt]

removeAt =
  testCase "Drop every N'th element from a list" $
  assertEqual [] ('b', "acd") (problem20 2 "abcd")


-- Extra problem 1 test suite
problemATestSuite :: TestTree
problemATestSuite = testGroup "Ath problem" [mergeSortedLists]

mergeSortedLists =
    testCase "merge sorted lists" $
    assertEqual
      []
      [1..100]
      (problemA [1,3..99] [2,4..100])


problemBTestSuite :: TestTree
problemBTestSuite = testGroup "Bth problem" [mergeSort]

mergeSort =
    testCase "merge sorted lists" $
    assertEqual
      []
      [1..100]
      (problemB [100,99..1])
