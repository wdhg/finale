import Interlude
import Test.HUnit

getIndexTests :: Test
getIndexTests
  = TestList
    [ [0..10] ?? 4 ~?= Just 4
    , [] ?? 2 ~?= Nothing
    , [1..10] ?? 4 ~?= Just 3
    , [0..10] ?? 20 ~?= Nothing
    ]

tests :: Test
tests
  = TestList
    [ "??" ~: getIndexTests
    ]

main :: IO Counts
main
  = runTestTT tests
