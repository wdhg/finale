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

countTests :: Test
countTests
  = TestList
    [ [1,1,1,2] `count` 1 ~?= 3
    , [1,1,1,2] `count` 3 ~?= 0
    , [] `count` 0 ~?= 0
    ]

tests :: Test
tests
  = TestList
    [ "??" ~: getIndexTests
    , "count" ~: countTests
    ]

main :: IO Counts
main
  = runTestTT tests
