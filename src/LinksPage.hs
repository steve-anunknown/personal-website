{-# LANGUAGE OverloadedStrings #-}

module LinksPage (linksPage) where

import Web.Scotty as S
import Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes as A

import NavigationBar (navigationBar)
import RouteMaker (mkRoute)


linksPage :: ScottyM ()
linksPage = mkRoute "/links" "Useful Links" "icons8-favicon-30.png" $ do
    H.h1 $ "Useful Links"
    H.ul $ do
        H.li $ do
            H.a ! A.href "https://www.github.com/steve-anunknown" $ "My GitHub"
        H.li $ do
            H.a ! A.href "https://www.linkedin.com/in/anastasios-stefanos-anagnostou-886a17229/" $ "My LinkedIn"
        navigationBar
    H.link ! A.rel "stylesheet" ! A.type_ "text/css" ! A.href "/css/style.css"
