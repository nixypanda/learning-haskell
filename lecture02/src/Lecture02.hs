module Lecture02 where

import qualified Data.Map as Map

-- PART 1: MASTERMIND
-- NOTE: COPIED FROM https://www.cis.upenn.edu/~cis194/spring15/hw/02-lists.pdf

-- Mastermind is a two-player code breaking game. One player is
-- the codemaker and the other player is the codebreaker. At the start of
-- the game, the codemaker chooses a secret code comprised of four
-- colored pegs. Each peg is one of six colors: red, green, blue, yellow,
-- orange, or purple. The codebreaker must figure out the code in as
-- few turns as possible. Each turn, the codebreaker guesses the secret
-- code. The codemaker then tells the codebreaker how many pegs
-- in his guess are exact matches (the color appears in the same place
-- in the secret code) and how many are non-exact matches (the color
-- appears in a different position in the secret code. More information
-- about the history and rules of Mastermind are available here
-- http://en.wikipedia.org/wiki/Mastermind_(board_game).
--
-- In this section, you will implement an algorithm that plays Mastermind.
-- We will be using some type definitions to make this work nicely. You are
-- encouraged to use functions from the Data.List module in order to make your
-- code cleaner.

-- SETUP
-- | Data type representing all the possible colors in the Master-mind game
data Peg
  = Red
  | Green
  | Blue
  | Yellow
  | Orange
  | Purple
  deriving (Show, Read, Eq, Ord, Enum, Bounded)


-- | One code is made up of 4 Colors
-- A code is defined to simply be a list of Pegs
type Code
  = [Peg]


-- List containing all of the different Pegs
colors :: [Peg]
colors = [Red, Green, Blue, Yellow, Orange, Purple]

--
-- Exercise 1 In this exercise you will implement a function that returns the
-- number of exact matches between the secret code and the codebreaker’s guess.
-- Example: exactMatches [Red, Blue, Green, Yellow] [Blue, Green, Yellow, Red] == 0
-- Example: exactMatches [Red, Blue, Green, Yellow] [Red, Purple, Green, Orange] == 2
exactMatches :: Code -> Code -> Int
exactMatches xs ys = undefined
 

-- Exercise 2 Now you will write a function that returns the number
-- of total matches between the secret code and the guess. This is a little
-- bit more complicated than finding exact matches because we have
-- to take in to account duplicate colors. For example, the sequences
-- [Red, Red, Blue, Blue] and [Red, Red, Green, Green] only have
-- 2 matches even though both of the Red pegs in the secret match both
-- of the Red pegs in the guess. For this reason, we can’t just scan the
-- first list and count the occurences of each element in the second list.
-- Instead, we will count the number of times that each peg appears in
-- both lists and sum the minimum values for each color. In the example above,
-- Red and Blue both occur twice and all of the other colors
-- never appear in the first list and Red and Green occur twice in the second
-- list. The number of matches is therefore 2 since Red occurs twice
-- in both lists and all the other colors are not in both of the lists.
-- Before you can count the number of matches, you should implement the helper function:
-- This function takes in a Code and returns a list containing the
-- numbers of times that each color in the list colors appears in the
-- Code. The counts should appear in the same order that they occur in
-- the list colors. As a sanity check, output should always have length 6
-- and the sum of all the entries should be equal to length Code.
-- Example: countColors [Red, Blue, Yellow, Purple] == [1, 0, 1, 1, 0, 1]
-- Example: countColors [Green, Blue, Green, Orange] == [0, 2, 1, 0, 1, 0]

countColors :: Code -> [Int]
countColors xs = undefined

-- Now you are ready to implement the main function: matches
-- matches :: Code -> Code -> Int
-- Example: matches [Red, Blue, Yellow, Orange] [Red, Orange, Orange, Blue] == 3
--
matches :: Code -> Code -> Int
matches xs ys = undefined


-- Exercise 3 A Move is a new datatype that is constructed with a Code
-- and two Ints. The first Int is the number of exact matches that the
-- Code has with the secret and the second Int is the number of nonexact
-- matches 1
data Move =
  Move Code Int Int
  deriving (Read, Show, Eq)

-- Implement the function:
-- getMove :: Code -> Code -> Move
-- The first Code is the secret, the second Code is guess, and the output is
-- the resulting Move.
-- Example: getMove [Red, Blue, Yellow, Orange] [Red, Orange, Orange, Blue] == Move [Red, Orange, Orange, Blue] 1 2
getMove :: Code -> Code -> Move
getMove xs ys = undefined

-- Exercise 4 We will now define a concept that will be important
-- in playing the Mastermind game. This is the concept of consistency;
-- we say that a Code is consistent with a Move if the Code could have
-- been the secret that generated that move. In other words, if the guess
-- inside the Move has the same number of exact and non-exact matches
-- with the provided Code as it did with the actual secret, then the Code
-- is consistent with the Move. Define the function:
-- isConsistent :: Move -> Code -> Bool
-- Example: isConsistent (Move [Red, Red, Blue, Green] 1 1) [Red, Blue, Yellow, Purple] == True
-- Example: isConsistent (Move [Red, Red, Blue, Green] 1 1) [Red, Blue, Red, Purple] == False
isConsistent :: Move -> Code -> Bool
isConsistent = undefined

-- Exercise 5 Now that we have the concept of consistency, we can
-- filter a list of Codes to only contain those that are consistent with a
-- given Move. This will be useful to us since our game solver will start
-- with a list of all possible codes and gradually filter the list based
-- on each new move until there is only one code left. Implement the
-- function:
filterCodes :: Move -> [Code] -> [Code]
filterCodes = undefined


-- Exercise 6 As mentioned in Exercise 5, the final algorithm will start
-- with a list of all possible codes and filter out the inconsistent ones.
-- In order to do this, we first need to be able to generate a list of all
-- the codes, ie all length n combinations of the 6 colors. In general,
-- Mastermind games use codes of length 4, however in theory the code
-- could be any length. We have not yet made any assumptions about
-- the lengths of the codes, so why start now? Your function should
-- take in a length2 and return all Codes of that length:
-- allCodes :: Int -> [Code]
allCodes :: Int -> [Code]
allCodes = undefined


-- Exercise 7 We are now finally ready to write our Mastermind
-- solver! There are many algorithms to solve a game of Mastermind,
-- but most of them work in roughly the same way; start with all of the
-- codes and keep making guesses until only one possible code remains.
-- The tricky bit is actually how you choose your guesses. In this exercise,
-- you will implement a fairly dumb algorithm that keeps track of
-- the remaining consistent Codes in a list and always chooses the first
-- element in the list as the next guess.
--
-- Is this algorithm guaranteed to converge to a single, correct answer? Yes!
-- In fact, there is a simple one-line proof. Every guess is either correct or
-- incorrect. If it is correct, then the game is over, and if it is incorrect,
-- then it will be filtered out. So, at least one Code is filtered out every
-- round, and there are a finite number of Codes therefore the game will end
-- in a finite number of rounds.
--
-- Your solver function should take in a secret
-- Code and output a list of Moves that the computer used as clues to figure
-- out the secret.
-- Always start by guessing [Red, Red, Red, ..., Red]. This will
-- make it easier for us to test your outputs.
solve :: Code -> [Move]
solve = undefined



-- PART 2: Typeclasses


-- Exercise 8: Do somthing to this type such that any equality comparision is
-- always true.
-- Example: ADummy == BDummy -> True
-- Example: ADummy == ADummy -> True
data ScrewedUpType = ADummy | BDummy deriving (Show, Eq)


-- PART 3: Extra fun

-- Exercise 9: Implement nth fibonacci number
-- This question has incremental difficulty levels. Take a look at the test case
-- for more info

fib :: Int -> Integer
fib = undefined
