module Result ( Result (..), abortOnError ) where

import System.IO (hPutStrLn, stderr)
import System.Exit (exitFailure)
import Control.Applicative (Alternative (..))

-- | Representation of a result that may either be successful and
-- return a value, or be unsuccessul and return an error message.
data Result a
  = Ok a         -- ^ Result is successful, and carries a value
  | Error String -- ^ Result is unsuccessful, and carries an error message
  deriving (Show, Eq)

instance Monad Result where
  Ok a      >>= k = k a
  Error msg >>= _ = Error msg

instance Functor Result where
  fmap f (Ok a)      = Ok (f a)
  fmap _ (Error msg) = Error msg

instance Applicative Result where
  pure = Ok
  Ok f      <*> Ok a      = Ok (f a)
  Error msg <*> _         = Error msg
  _         <*> Error msg = Error msg

instance Alternative Result where
  empty = Error "Unknown error (someone used 'empty')"

  Ok a      <|> _    = Ok a
  Error _   <|> Ok a = Ok a
  Error msg <|> _    = Error msg

-- | Return successful results, but abort the process with an error
-- message when the given result is unsuccessful.
abortOnError :: Result a -> IO a
abortOnError (Ok a) = return a
abortOnError (Error msg) =
  do hPutStrLn stderr ("ERROR: " ++ msg)
     exitFailure
