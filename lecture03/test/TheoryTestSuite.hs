module TheoryTestSuite where

import Theory
import Test.Tasty (TestTree, testGroup)
import Test.Tasty.HUnit (assertEqual, testCase)

import Test.Tasty.QuickCheck (Arbitrary, arbitrary, frequency, testProperty, Fun(..))


-- Semigroup Laws

semigroupPropAssociativity :: (Eq s, Semigroup s) => s -> s -> s -> Bool
semigroupPropAssociativity a b c = (a <> (b <> c)) == ((a <> b) <> c)


-- Monoid Laws

monoidLeftIdentity :: (Eq m, Monoid m) => m -> Bool
monoidLeftIdentity a = mempty <> a == a


monoidRightIdentity :: (Eq m, Monoid m) => m -> Bool
monoidRightIdentity a = a <> mempty == a


-- Functor Laws

functorIdentity :: (Functor f, Eq (f a)) => f a -> Bool
functorIdentity f = fmap id f == f


functorCompose :: (Eq (f c), Functor f) => f a -> Fun a b -> Fun b c -> Bool
functorCompose x (Fun _ f) (Fun _ g) = fmap g (fmap f x) == fmap (g . f) x


-- Applicative Laws

applicativeIdentity :: (Applicative f, Eq (f a)) => f a -> Bool
applicativeIdentity f = (pure id <*> f) == f


-- Arbitrary Instance
instance Arbitrary Booly where
    arbitrary = frequency [ (1, return False') , (1, return True') ]

instance Arbitrary a => Arbitrary (Optional a) where
    arbitrary = frequency [(1, return Nada), (9, fmap Only arbitrary)]

instance (Arbitrary a, Arbitrary b) => Arbitrary (Validation a b) where
    arbitrary = frequency [(1, fmap Success arbitrary), (1, fmap Failure arbitrary)]


instance Arbitrary a => Arbitrary (Listy a) where
    arbitrary = Listy <$> arbitrary

monoidLaws :: TestTree
monoidLaws = testGroup "Monoid Instances declared by you follow monoid laws"
  [ testProperty "Left Identity: Booly"
    (monoidLeftIdentity :: Booly -> Bool)
  , testProperty "Right Identity: Booly"
    (monoidRightIdentity :: Booly -> Bool)
  , testProperty "Left Identity: Optional [Int]"
    (monoidLeftIdentity :: Optional [Int] -> Bool)
  , testProperty "Right Identity: Optional [Int]"
    (monoidRightIdentity :: Optional [Int] -> Bool)
  ]


semigroupLaws :: TestTree
semigroupLaws = testGroup "Semigroup Instances declared by you follow monoid laws"
    [ testProperty "Law of Associativity: Booly"
        (semigroupPropAssociativity :: Booly -> Booly -> Booly -> Bool)
    , testProperty "Law of Associativity: Optional of list"
        (semigroupPropAssociativity :: Optional [Int] -> Optional [Int] -> Optional [Int] -> Bool)
    , testProperty "Law of Associativity: Validation"
        (semigroupPropAssociativity :: Validation String String -> Validation String String -> Validation String String -> Bool)
    ]

functorLaws :: TestTree
functorLaws = testGroup "Functor Instances declared by you follow the functor laws"
    [ testProperty "Functor Identity: Optional Int"
        (functorIdentity :: Optional Int -> Bool)
    , testProperty "Functor Compose: Optional Int, f :: Int -> Int, g :: Int -> Int"
        (functorCompose :: Optional Int -> Fun Int Int -> Fun Int Int -> Bool)
    , testProperty "Functor Identity: Validation int String"
        (functorIdentity :: Validation Int String -> Bool)
    , testProperty "Functor Compose: Validation String Int, f :: Int -> Int, g :: Int -> Int"
        (functorCompose :: Validation String Int -> Fun Int Int -> Fun Int Int -> Bool)
    , testProperty "Functor Identity: Listy String"
        (functorIdentity :: Listy String -> Bool)
    , testProperty "Functor Compose: Listy Int, f :: Int -> String, g :: String -> Int"
        (functorCompose :: Listy Int -> Fun Int String -> Fun String Int -> Bool)
    ]


applicativeLaws :: TestTree
applicativeLaws = testGroup "Applicative Instances declared by you follow applicative laws"
    [ testProperty "Applicative Identity: Optional Int"
        (applicativeIdentity :: Optional Int -> Bool)
    ]

lecture03TheoryTestSuite :: TestTree
lecture03TheoryTestSuite = testGroup "Tested by QuickCheck"
    [ semigroupLaws
    , monoidLaws
    , functorLaws
    , applicativeLaws
    ]

