module Main

import Stellar.HTTP

main : IO ()
main = http (localhost 8080) echo

