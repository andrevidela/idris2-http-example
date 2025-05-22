module Main

import Web.MVC.Http
import Web.MVC.Cmd
import Control.Monad.Either
import JS

-- Send a request to localhost:8080 and expect a unit value as a response
sendRequest : Cmd ()
sendRequest = get "http://localhost:8080/"
                  (ExpectAny (const ())) -- we don't need to handle this value in any way

-- Send a request to localhost:8080 and expect a String response, return `Nothing` if something went wrong
sendRequestStr : Cmd (Either HTTPError String)
sendRequestStr = post "http://localhost:8080/" (StringBody "text/plain" "hello")
                     (ExpectString id) -- we convert any errors into `Nothing` values

Show HTTPError where
  show Timeout = "request timeout"
  show NetworkError = "network error"
  show (BadStatus m) = "bad status: \{show m}"
  show (JSONError str x) = "could not parse JSON"

-- Convert commands into IO actions
runCmd : Show a => Cmd a -> IO ()
runCmd cmd =
    let
      js = cmd.run handler -- run our JS with a callback
    in case !(runEitherT js) of -- Handle any JS errors
            Left err => putStrLn (dispErr err) -- if there is an error we print it
            Right value => pure () -- otherwise we're good to go
  where
    -- this is the callback used with the result of the command
    handler : a -> EitherT JSErr IO ()
    handler val = putStrLn "got response: \{show val}"
    -- Because we only use the callback to handle an HTTP response, we simply
    -- print out the content of the body

-- To send our requests we execute them in IO and use `runCmd` to convert from
-- Cmd to IO.
main : IO ()
main = do
  runCmd sendRequest
  runCmd sendRequestStr
