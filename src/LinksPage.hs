{-# LANGUAGE OverloadedStrings #-}

module LinksPage (linksPage) where

import Web.Scotty as S
import Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes as A
import RouteMaker (mkRoute)

linksPage :: ScottyM ()
linksPage = mkRoute "/links" "Useful Links" "logo2.svg" $ do
    H.h1 "Useful Links"
    H.h2 $ do 
      H.img ! A.src "images/github-mark.svg" ! A.alt "Github Cat Logo"
      " "
      H.a ! A.href "https://www.github.com/steve-anunknown" $ "My GitHub"
    H.h2 $ do
      H.img ! A.src "images/LI-In-Bug.png" ! A.alt "LinkedIn Logo"
      " "
      H.a ! A.href "https://www.linkedin.com/in/anastasios-stefanos-anagnostou-886a17229/" $ "My LinkedIn"
    H.link ! A.rel "stylesheet" ! A.type_ "text/css" ! A.href "/css/style.css"
