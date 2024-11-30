{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -Wno-name-shadowing #-}

module BlogPage (blogPage) where

import RouteMaker (mkRoute)
import ComparingLogMessages (comparingLogMessages)
import Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes as A
import Web.Scotty as S


blogPage :: ScottyM ()
blogPage = mkRoute "/blogs" "My Blogs" "logo2.svg" $ do
  H.div ! A.class_ "blog-page" $ do
    H.h1 "My Blogs"
    comparingLogMessages
    H.link ! A.rel "stylesheet" ! A.type_ "text/css" ! A.href "/css/style.css"
    H.link ! A.rel "stylesheet" ! A.type_ "text/css" ! A.href "/css/blog-style.css"
