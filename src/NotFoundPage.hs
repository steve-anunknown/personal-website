{-# LANGUAGE OverloadedStrings #-}

module NotFoundPage (notFoundPage) where

import Text.Blaze.Html.Renderer.Text (renderHtml)
import Text.Blaze.Html5 as H
import Web.Scotty as S

notFoundPage :: ScottyM ()
notFoundPage = notFound $ do
  S.html $ renderHtml $ do
    H.docTypeHtml $ do
      H.head $ do
        H.title "404 - Not Found"
      H.h1 "404 - Not Found"
      H.p "The page you are looking for does not exist. What are you doing here ??"
