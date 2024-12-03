module Main where

import System.Environment (getArgs)

import JSON
import JSONInput
import JSONOutput
import JSONTransformer
import Result

query :: Transformer
query = getElements `pipe` select (binaryOp equal (getField "Country") (string "S"))

main :: IO ()
main = do
  do -- Get the JSON filename to read from the command line arguments.
     --
     -- FIXME: This is not robust. Can you alter it so that it reports
     -- a user friendly error if the filename is not present? What if
     -- we want to include additional command line options?
     [filename] <- getArgs

     -- Read the raw data in from the file given.
     --
     -- FIXME: What if the user wants to query several JSON files?
     rawText <- readFile filename

     -- Parse the raw text of the input into a structured JSON
     -- representation.
     --
     -- FIXME: what if the user wants to
     inputJSON <- abortOnError (stringToJSON rawText)

     -- Run the query on the parsed JSON to a list of JSON values
     --
     -- FIXME: What if the user wants a different query? the query
     -- should be taken as an input as well.
     --
     -- FIXME: the query langauge is quite inexpressive. What if the
     -- user wants all hills over 1000 metres in Scotland and Wales?
     -- or something else? What if they want to transform the input
     -- and not just filter it?
     --
     -- FIXME: The query might be incompatible with the input data. It
     -- might mention fields that the input does not have. Can these
     -- errors be reported back to the user nicely?
     let outputJSONs = query inputJSON

     -- Print the output, one per line.
     --
     -- FIXME: what if the user wants the JSON output to be nicely
     -- formatted? Or in colour? Or in another format, like HTML or
     -- CSV?
     mapM_ (putStrLn . renderJSON) outputJSONs
