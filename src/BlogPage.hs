{-# LANGUAGE OverloadedStrings #-}

module BlogPage (blogPage) where

import Web.Scotty as S
import Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes as A
import RouteMaker (mkRoute)


blogPage :: ScottyM ()
blogPage = mkRoute "/blogs" "My Blogs" "icons8-favicon-30.png" $ do
    H.h1 $ "My Blogs"
    H.p "Turns out I'm not that interesting."
    H.link ! A.rel "stylesheet" ! A.type_ "text/css" ! A.href "/css/style.css"
