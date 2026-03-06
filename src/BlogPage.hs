{-# LANGUAGE OverloadedStrings #-}

module BlogPage (blogPage) where

import RouteMaker (mkRoute)
import Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes as A
import Web.Scotty as S

blogPage :: ScottyM ()
blogPage = mkRoute "/blogs" "My Blogs" "logo2.svg" ["/css/style.css"] $ do
  H.h1 "My Blogs"
  H.p "Turns out I'm not that interesting."
