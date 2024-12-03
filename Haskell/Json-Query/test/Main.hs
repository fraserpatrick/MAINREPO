module Main (main) where

import Test.HUnit
import JSON
import JSONOutput
import JSONTransformer


isTruthyTest :: Test
isTruthyTest = TestCase (assertEqual "isTruthyTest FAILED" (True) (isTruthy (JsonBoolean True)))

failingIsTruthyStringTest  :: Test
failingIsTruthyIntegerTest :: Test
failingIsTruthyBooleanTest :: Test
failingIsTruthyNullTest    :: Test
failingIsTruthyArrayTest   :: Test
failingIsTruthyObjectTest  :: Test
failingIsTruthyStringTest  = TestCase (assertEqual "failingIsTruthyStringTest FAILED"  (False) (isTruthy (JsonString "testValue")))
failingIsTruthyIntegerTest = TestCase (assertEqual "failingIsTruthyIntegerTest FAILED" (False) (isTruthy (JsonInteger 1)))
failingIsTruthyBooleanTest = TestCase (assertEqual "failingIsTruthyBooleanTest FAILED" (False) (isTruthy (JsonBoolean False)))
failingIsTruthyNullTest    = TestCase (assertEqual "failingIsTruthyNullTest FAILED"    (False) (isTruthy (JsonNull)))
failingIsTruthyArrayTest   = TestCase (assertEqual "failingIsTruthyArrayTest FAILED"   (False) (isTruthy (JsonArray[JsonObject [("Name", JsonString "Ben Chonzie"),("Country", JsonString "S"),("Height", JsonInteger 931)],JsonObject [("Name", JsonString "Lonscale Fell"),("Country", JsonString "E"),("Height", JsonInteger 715)]])))
failingIsTruthyObjectTest  = TestCase (assertEqual "failingIsTruthyObjectTest FAILED"  (False) (isTruthy (JsonObject [("Name", JsonString "Chonzie Ben"),("Country", JsonString "S"),("Height", JsonInteger 931)])))

failingIsTruthyTests :: Test
failingIsTruthyTests = TestList [failingIsTruthyStringTest, failingIsTruthyIntegerTest, failingIsTruthyBooleanTest, failingIsTruthyNullTest, failingIsTruthyArrayTest, failingIsTruthyObjectTest]


equalStringTest  :: Test
equalIntegerTest :: Test
equalBooleanTest :: Test
equalNullTest    :: Test
equalArrayTest   :: Test
equalObjectTest  :: Test
equalStringTest  = TestCase (assertEqual "equalStringTest FAILED"  (JsonBoolean True) (equal (JsonString "testValue")(JsonString "testValue")))
equalIntegerTest = TestCase (assertEqual "equalIntegerTest FAILED" (JsonBoolean True) (equal (JsonInteger 1)(JsonInteger 1)))
equalBooleanTest = TestCase (assertEqual "equalBooleanTest FAILED" (JsonBoolean True) (equal (JsonBoolean True)(JsonBoolean True)))
equalNullTest    = TestCase (assertEqual "equalNullTest FAILED"    (JsonBoolean True) (equal (JsonNull)(JsonNull)))
equalArrayTest   = TestCase (assertEqual "equalArrayTest FAILED"   (JsonBoolean True) (equal (JsonArray[JsonObject [("Name", JsonString "Ben Chonzie"),("Country", JsonString "S"),("Height", JsonInteger 931)],JsonObject [("Name", JsonString "Lonscale Fell"),("Country", JsonString "E"),("Height", JsonInteger 715)]])(JsonArray[JsonObject [("Name", JsonString "Ben Chonzie"),("Country", JsonString "S"),("Height", JsonInteger 931)],JsonObject [("Name", JsonString "Lonscale Fell"),("Country", JsonString "E"),("Height", JsonInteger 715)]])))
equalObjectTest  = TestCase (assertEqual "equalObjectTest FAILED"  (JsonBoolean True) (equal (JsonObject [("Name", JsonString "Ben Chonzie"),("Country", JsonString "S"),("Height", JsonInteger 931)])(JsonObject [("Name", JsonString "Ben Chonzie"),("Country", JsonString "S"),("Height", JsonInteger 931)])))

failingEqualStringTest  :: Test
failingEqualIntegerTest :: Test
failingEqualBooleanTest :: Test
failingEqualNullTest    :: Test
failingEqualArrayTest   :: Test
failingEqualObjectTest  :: Test
failingEqualStringTest  = TestCase (assertEqual "failingEqualStringTest FAILED"  (JsonBoolean False) (equal (JsonString "testValue")(JsonString "differentTestValue")))
failingEqualIntegerTest = TestCase (assertEqual "failingEqualIntegerTest FAILED" (JsonBoolean False) (equal (JsonInteger 1)(JsonInteger 2)))
failingEqualBooleanTest = TestCase (assertEqual "failingEqualBooleanTest FAILED" (JsonBoolean False) (equal (JsonBoolean True)(JsonBoolean False)))
failingEqualNullTest    = TestCase (assertEqual "failingEqualNullTest FAILED"    (JsonBoolean False) (equal (JsonNull)(JsonInteger 1)))
failingEqualArrayTest   = TestCase (assertEqual "failingEqualArrayTest FAILED"   (JsonBoolean False) (equal (JsonArray[JsonObject [("Name", JsonString "Chonzie Ben"),("Country", JsonString "S"),("Height", JsonInteger 931)],JsonObject [("Name", JsonString "Lonscale Fell"),("Country", JsonString "E"),("Height", JsonInteger 715)]])(JsonArray[JsonObject [("Name", JsonString "Ben Chonzie"),("Country", JsonString "S"),("Height", JsonInteger 931)],JsonObject [("Name", JsonString "Lonscale Fell"),("Country", JsonString "E"),("Height", JsonInteger 715)]])))
failingEqualObjectTest  = TestCase (assertEqual "failingEqualObjectTest FAILED"  (JsonBoolean False) (equal (JsonObject [("Name", JsonString "Chonzie Ben"),("Country", JsonString "S"),("Height", JsonInteger 931)])(JsonObject [("Name", JsonString "Ben Chonzie"),("Country", JsonString "S"),("Height", JsonInteger 931)])))

equalTests        :: Test
failingEqualTests :: Test
equalTests        = TestList [equalStringTest, equalIntegerTest, equalBooleanTest, equalNullTest, equalArrayTest, equalObjectTest]
failingEqualTests = TestList [failingEqualStringTest, failingEqualIntegerTest, failingEqualBooleanTest, failingEqualNullTest, failingEqualArrayTest, failingEqualObjectTest]


notEqualStringTest  :: Test
notEqualIntegerTest :: Test
notEqualBooleanTest :: Test
notEqualNullTest    :: Test
notEqualArrayTest   :: Test
notEqualObjectTest  :: Test
notEqualStringTest  = TestCase (assertEqual "notEqualStringTest FAILED"  (JsonBoolean True) (notEqual (JsonString "testValue")(JsonString "differentTestValue")))
notEqualIntegerTest = TestCase (assertEqual "notEqualIntegerTest FAILED" (JsonBoolean True) (notEqual (JsonInteger 1)(JsonInteger 2)))
notEqualBooleanTest = TestCase (assertEqual "notEqualBooleanTest FAILED" (JsonBoolean True) (notEqual (JsonBoolean True)(JsonBoolean False)))
notEqualNullTest    = TestCase (assertEqual "notEqualNullTest FAILED"    (JsonBoolean True) (notEqual (JsonNull)(JsonInteger 1)))
notEqualArrayTest   = TestCase (assertEqual "notEqualArrayTest FAILED"   (JsonBoolean True) (notEqual (JsonArray[JsonObject [("Name", JsonString "Chonzie Ben"),("Country", JsonString "S"),("Height", JsonInteger 931)],JsonObject [("Name", JsonString "Lonscale Fell"),("Country", JsonString "E"),("Height", JsonInteger 715)]])(JsonArray[JsonObject [("Name", JsonString "Ben Chonzie"),("Country", JsonString "S"),("Height", JsonInteger 931)],JsonObject [("Name", JsonString "Lonscale Fell"),("Country", JsonString "E"),("Height", JsonInteger 715)]])))
notEqualObjectTest  = TestCase (assertEqual "notEqualObjectTest FAILED"  (JsonBoolean True) (notEqual (JsonObject [("Name", JsonString "Chonzie Ben"),("Country", JsonString "S"),("Height", JsonInteger 931)])(JsonObject [("Name", JsonString "Ben Chonzie"),("Country", JsonString "S"),("Height", JsonInteger 931)])))

failingNotEqualStringTest  :: Test
failingNotEqualIntegerTest :: Test
failingNotEqualBooleanTest :: Test
failingNotEqualNullTest    :: Test
failingNotEqualArrayTest   :: Test
failingNotEqualObjectTest  :: Test
failingNotEqualStringTest  = TestCase (assertEqual "failingNotEqualStringTest FAILED"  (JsonBoolean False) (notEqual (JsonString "testValue")(JsonString "testValue")))
failingNotEqualIntegerTest = TestCase (assertEqual "failingNotEqualIntegerTest FAILED" (JsonBoolean False) (notEqual (JsonInteger 1)(JsonInteger 1)))
failingNotEqualBooleanTest = TestCase (assertEqual "failingNotEqualBooleanTest FAILED" (JsonBoolean False) (notEqual (JsonBoolean True)(JsonBoolean True)))
failingNotEqualNullTest    = TestCase (assertEqual "failingNotEqualNullTest FAILED"    (JsonBoolean False) (notEqual (JsonNull)(JsonNull)))
failingNotEqualArrayTest   = TestCase (assertEqual "failingNotEqualArrayTest FAILED"   (JsonBoolean False) (notEqual (JsonArray[JsonObject [("Name", JsonString "Ben Chonzie"),("Country", JsonString "S"),("Height", JsonInteger 931)],JsonObject [("Name", JsonString "Lonscale Fell"),("Country", JsonString "E"),("Height", JsonInteger 715)]])(JsonArray[JsonObject [("Name", JsonString "Ben Chonzie"),("Country", JsonString "S"),("Height", JsonInteger 931)],JsonObject [("Name", JsonString "Lonscale Fell"),("Country", JsonString "E"),("Height", JsonInteger 715)]])))
failingNotEqualObjectTest  = TestCase (assertEqual "failingNotEqualObjectTest FAILED"  (JsonBoolean False) (notEqual (JsonObject [("Name", JsonString "Ben Chonzie"),("Country", JsonString "S"),("Height", JsonInteger 931)])(JsonObject [("Name", JsonString "Ben Chonzie"),("Country", JsonString "S"),("Height", JsonInteger 931)])))

notEqualTests        :: Test
failingNotEqualTests :: Test
notEqualTests        = TestList [notEqualStringTest, notEqualIntegerTest, notEqualBooleanTest, notEqualNullTest, notEqualArrayTest, notEqualObjectTest]
failingNotEqualTests = TestList [failingNotEqualStringTest, failingNotEqualIntegerTest, failingNotEqualBooleanTest, failingNotEqualNullTest, failingNotEqualArrayTest, failingNotEqualObjectTest]

jsonTests :: Test
jsonTests = TestList [isTruthyTest, failingIsTruthyTests, equalTests, failingEqualTests, notEqualTests, failingNotEqualTests]


escapeCharQuoteTest   :: Test
escapeCharNewLineTest :: Test
escapeCharTabTest     :: Test
escapeCharSlashTest   :: Test
escapeCharCharTest    :: Test
escapeCharQuoteTest   = TestCase (assertEqual "escapeCharQuoteTest FAILED"   ("\\\"") (escapeChar ('"')))
escapeCharNewLineTest = TestCase (assertEqual "escapeCharNewLineTest FAILED" ("\\n")  (escapeChar ('\n')))
escapeCharTabTest     = TestCase (assertEqual "escapeCharTabTest FAILED"     ("\\t")  (escapeChar ('\t')))
escapeCharSlashTest   = TestCase (assertEqual "escapeCharSlashTest FAILED"   ("\\\\") (escapeChar ('\\')))
escapeCharCharTest    = TestCase (assertEqual "escapeCharCharTest FAILED"    ("x")    (escapeChar ('x')))

escapeCharTests :: Test
escapeCharTests = TestList[escapeCharQuoteTest, escapeCharNewLineTest, escapeCharTabTest, escapeCharSlashTest, escapeCharCharTest]

escapeStringTest :: Test
quoteTest        :: Test
sqbracketTest    :: Test
curlybracketTest :: Test
escapeStringTest = TestCase (assertEqual "escapeStringTest FAILED" ("Hello \\\"world\\\"")     (escapeString ("Hello \"world\"")))
quoteTest        = TestCase (assertEqual "quoteTest FAILED"        ("\"HelloWorld\"")          (quote ("HelloWorld")))
sqbracketTest    = TestCase (assertEqual "sqbracketTest FAILED"    ("[HelloWorld]")            (sqbracket ("HelloWorld")))
curlybracketTest = TestCase (assertEqual "curlybracketTest FAILED" ("{HelloWorld}")            (curlybracket ("HelloWorld")))

concatEmptyTest  :: Test
concatSingleTest :: Test
concatArrayTest  :: Test
concatEmptyTest  = TestCase (assertEqual "concatEmptyTest FAILED"  (mempty)        (concatWith (" ") []))
concatSingleTest = TestCase (assertEqual "concatSingleTest FAILED" ("Hello")       (concatWith (" ") ["Hello"]))
concatArrayTest  = TestCase (assertEqual "concatArrayTest FAILED"  ("Hello World") (concatWith (" ") ["Hello","World"]))

concatTests :: Test
concatTests = TestList [concatEmptyTest, concatSingleTest, concatArrayTest]

renderStringTest       :: Test
renderJsonStringTest   :: Test
renderJsonIntegerTest  :: Test
renderJsonBooleanTest  :: Test
renderJsonNullTest     :: Test
renderJsonObjectTest   :: Test
renderJsonArrayTest    :: Test
renderFieldStringTest  :: Test
renderFieldIntegerTest :: Test
renderFieldBooleanTest :: Test
renderStringTest       = TestCase (assertEqual "renderStringTest FAILED"       ("\"Hello \\\"world\\\"\"") (renderString ("Hello \"world\"")))
renderJsonStringTest   = TestCase (assertEqual "renderJsonStringTest FAILED"   ("\"HelloWorld\"") (renderJSON (JsonString "HelloWorld")))
renderJsonIntegerTest  = TestCase (assertEqual "renderJsonIntegerTest FAILED"  ("1")              (renderJSON (JsonInteger 1)))
renderJsonBooleanTest  = TestCase (assertEqual "renderJsonBooleanTest FAILED"  ("true")           (renderJSON (JsonBoolean True)))
renderJsonNullTest     = TestCase (assertEqual "renderJsonNullTest FAILED"     ("null")           (renderJSON (JsonNull)))
renderJsonObjectTest   = TestCase (assertEqual "renderJsonObjectTest FAILED"   ("{\"Name\": \"Ben Chonzie\", \"Country\": \"S\", \"Height\": 931}") (renderJSON (JsonObject [("Name", JsonString "Ben Chonzie"),("Country", JsonString "S"),("Height", JsonInteger 931)])))
renderJsonArrayTest    = TestCase (assertEqual "renderJsonArrayTest FAILED"    ("[{\"Name\": \"Ben Chonzie\", \"Country\": \"S\", \"Height\": 931}, {\"Name\": \"Lonscale Fell\", \"Country\": \"E\", \"Height\": 715}]") (renderJSON (JsonArray[JsonObject [("Name", JsonString "Ben Chonzie"),("Country", JsonString "S"),("Height", JsonInteger 931)],JsonObject [("Name", JsonString "Lonscale Fell"),("Country", JsonString "E"),("Height", JsonInteger 715)]])))
renderFieldStringTest  = TestCase (assertEqual "renderFieldStringTest FAILED"  ("\"TestField\": \"TestValue\"") (renderField ("TestField",JsonString "TestValue")))
renderFieldIntegerTest = TestCase (assertEqual "renderFieldIntegerTest FAILED" ("\"TestField\": 1")             (renderField ("TestField",JsonInteger 1)))
renderFieldBooleanTest = TestCase (assertEqual "renderFieldBooleanTest FAILED" ("\"TestField\": true")          (renderField ("TestField",JsonBoolean True)))

renderTests :: Test
renderTests = TestList [renderStringTest, renderJsonStringTest, renderJsonIntegerTest, renderJsonBooleanTest, renderJsonNullTest, renderJsonObjectTest, renderJsonArrayTest, renderFieldStringTest, renderFieldIntegerTest, renderFieldBooleanTest]

jsonOutputTests :: Test
jsonOutputTests = TestList [escapeCharTests, escapeStringTest, quoteTest, sqbracketTest, curlybracketTest, concatTests, renderTests]


constantStringTest  :: Test
constantIntegerTest :: Test
constantBooleanTest :: Test
stringTest          :: Test
integerTest         :: Test
boolTest            :: Test
nullTest            :: Test
constantStringTest  = TestCase (assertEqual "constantStringTest FAILED"  ([JsonString "Hello"]) (constant (JsonString "Hello") (JsonString "testing")))
constantIntegerTest = TestCase (assertEqual "constantIntegerTest FAILED" ([JsonInteger 1])      (constant (JsonInteger 1)      (JsonString "testing")))
constantBooleanTest = TestCase (assertEqual "constantBooleanTest FAILED" ([JsonBoolean True])   (constant (JsonBoolean True)   (JsonString "testing")))
stringTest  = TestCase (assertEqual "stringTest FAILED"  ([JsonString "HelloWorld"]) (string  ("HelloWorld") (JsonString "testing")))
integerTest = TestCase (assertEqual "integerTest FAILED" ([JsonInteger 1])           (integer (1)            (JsonString "testing")))
boolTest    = TestCase (assertEqual "boolTest FAILED"    ([JsonBoolean True])        (bool    (True)         (JsonString "testing")))
nullTest    = TestCase (assertEqual "nullTest FAILED"    ([JsonNull])                (jnull   (JsonString "testing")))

constantTests :: Test
constantTests = TestList [constantStringTest, constantIntegerTest, constantBooleanTest, stringTest, integerTest, boolTest, nullTest]

selectTrueTest   :: Test
selectFalseTest  :: Test
binaryTrueTest   :: Test
binaryFalseTest  :: Test
pipeTest         :: Test
pipeEmptyTest    :: Test
selectTrueTest   = TestCase (assertEqual "selectTrueTest FAILED"  ([JsonArray [JsonInteger 1,JsonInteger 2]]) (select (bool True)  (JsonArray [JsonInteger 1, JsonInteger 2])))
selectFalseTest  = TestCase (assertEqual "selectFalseTest FAILED" ([])                                        (select (bool False) (JsonArray [JsonInteger 1, JsonInteger 2])))
binaryTrueTest   = TestCase (assertEqual "binaryTrueTest FAILED"  ([JsonBoolean True])  (binaryOp equal    (string "a") (string "a") JsonNull))
binaryFalseTest  = TestCase (assertEqual "binaryTrueTest FAILED"  ([JsonBoolean False]) (binaryOp notEqual (string "a") (string "a") JsonNull))
pipeTest         = TestCase (assertEqual "pipeTest FAILED"        ([JsonInteger 1, JsonString "abc", JsonNull]) (pipe (getField "a") getElements (JsonObject [("a", JsonArray [JsonInteger 1, JsonString "abc", JsonNull])])))
pipeEmptyTest    = TestCase (assertEqual "pipeEmptyTest FAILED"   ([])                                          (pipe (getField "b") getElements (JsonObject [("a", JsonArray [JsonInteger 1, JsonString "abc", JsonNull])])))

selectBinaryPipeTests :: Test
selectBinaryPipeTests = TestList [selectTrueTest, selectFalseTest, binaryTrueTest, binaryFalseTest, pipeTest, pipeEmptyTest]

getElementsEmptyTest :: Test
getElementsTest      :: Test
getFieldTest         :: Test
getFieldNoFieldTest  :: Test
getFieldNoObjectTest :: Test
getElementsEmptyTest = TestCase (assertEqual "getElementsEmptyTest FAILED" ([])                                  (getElements (JsonNull)))
getElementsTest      = TestCase (assertEqual "getElementsTest FAILED"      ([JsonString "Hello", JsonInteger 1]) (getElements (JsonArray[(JsonString "Hello"),(JsonInteger 1)])))
getFieldTest         = TestCase (assertEqual "getFieldTest FAILED"         ([JsonInteger 1]) (getField ("field1") (JsonObject [("field1", JsonInteger 1),("field2",JsonInteger 2)])))
getFieldNoFieldTest  = TestCase (assertEqual "getFieldNoFieldTest FAILED"  ([])              (getField ("field3") (JsonObject [("field1", JsonInteger 1),("field2",JsonInteger 2)])))
getFieldNoObjectTest = TestCase (assertEqual "getFieldNoObjectTest FAILED" ([])              (getField ("field1") (JsonInteger 1)))

getElementsAndFieldTests :: Test
getElementsAndFieldTests = TestList [getElementsEmptyTest, getElementsTest, getFieldTest, getFieldNoFieldTest, getFieldNoObjectTest]

jsonTransformerTests :: Test
jsonTransformerTests = TestList [constantTests, getElementsAndFieldTests, selectBinaryPipeTests]


tests :: Test
tests = TestList [jsonTests, jsonOutputTests, jsonTransformerTests]

main :: IO ()
main = runTestTTAndExit tests
