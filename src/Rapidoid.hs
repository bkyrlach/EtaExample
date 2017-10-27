{-# LANGUAGE MagicHash, DataKinds, TypeFamilies, TypeOperators, FlexibleContexts #-}

module Rapidoid where

  import Java

  data {-# CLASS "org.rapidoid.setup.OnRoute" #-} Route = Route (Object# Route)
    deriving Class

  data {-# CLASS "org.rapidoid.http.ReqRespHandler" #-} Handler = Handler (Object# Handler)
    deriving Class

  data {-# CLASS "org.rapidoid.http.Req" #-} Request = Request (Object# Request)
    deriving Class

  data {-# CLASS "org.rapidoid.http.Resp" #-} Response = Response (Object# Response)
    deriving Class

  type instance Inherits Response = '[Object]

  foreign import java unsafe "@wrapper execute"
    handler :: (Request -> Response -> Java Handler Object) -> Handler

  data {-# CLASS "org.rapidoid.setup.On" #-} On = On (Object# On)
    deriving Class

  foreign import java unsafe "@static org.rapidoid.setup.On.get"
    http_get :: String -> Java a Route

  foreign import java unsafe serve :: Handler -> Java Route ()

  foreign import java unsafe result :: String -> Java Response Response
