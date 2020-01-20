import Finale
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
    [ count 1 [1,1,1,2] ~?= 3
    , count 3 [1,1,1,2] ~?= 0
    , count 0 [] ~?= 0
    ]

insertTests :: Test
insertTests
  = TestList
    [ insert 2 99 [0..3] ~?= [0,1,99,2,3]
    , insert 0 1 [0,0] ~?= [1,0,0]
    ]

separateTests :: Test
separateTests
  = TestList
    [ separate ' ' "a bb ccc dddd" ~?= ["a","bb","ccc","dddd"]
    , separate 0 [0,1,0,2,0,3] ~?= [[], [1], [2], [3]]
    ]

joinTests :: Test
joinTests
  = TestList
    [ join ' ' ["hello", "my", "name", "is"] ~?= "hello my name is"
    , join 0 [[], [1], [2], [3]] ~?= [0,1,0,2,0,3]
    ]

replaceTests :: Test
replaceTests
  = TestList
    [ replace 'u' 'a' "bununu" ~?= "banana"
    , replace 0 1 [0,1,0,1,0] ~?= [1,1,1,1,1]
    ]

mapIfTests :: Test
mapIfTests
  = TestList
    [ mapIf even succ [0,1,2,3,4] ~?= [1,1,3,3,5]
    , mapIf (== 'u') (const 'a') "bununu" ~?= "banana"
    , mapIf even succ [1,3,5,7] ~?= [1,3,5,7]
    ]

sieveTests :: Test
sieveTests
  = TestList
    [ sieve even [1..10] ~?= ([2,4,6,8,10], [1,3,5,7,9])
    , sieve (== 'a') "banana" ~?= ("aaa", "bnn")
    ]

tests :: Test
tests
  = TestList
    [ "??" ~: getIndexTests
    , "count" ~: countTests
    , "insert" ~: insertTests
    , "separate" ~: separateTests
    , "join" ~: joinTests
    ]

main :: IO Counts
main
  = runTestTT tests
