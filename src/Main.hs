module Main where

import Rapidoid
import Java
import System.IO.Unsafe

main :: IO ()
main = do
  putStrLn "Hello from Eta!"
  route <- java $ http_get "/test"
  javaWith route $ serve $ handler (\req resp -> return $ superCast $ unsafePerformIO $ javaWith resp $ result "Hello from ETA")
  putStrLn "Inside Java!"
  putStrLn "Goodbye!"
