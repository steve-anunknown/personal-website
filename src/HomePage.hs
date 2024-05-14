{-# LANGUAGE OverloadedStrings #-}

module HomePage (homePage) where

import Web.Scotty as S
import Text.Blaze.Html5 as H 
import Text.Blaze.Html5.Attributes as A

import RouteMaker (mkRoute)
import NavigationBar (navigationBar)

homePage :: ScottyM ()
homePage = mkRoute "/" "Stefanos Anagnostou Personal Website" "icons8-favicon-30.png" $ do
        H.div ! A.class_ "container" $ do
            H.h1 $ "Welcome traveller."
            H.img ! A.src "/images/lambda-irl-banner.jpg" ! A.alt "Banner Picture" ! A.class_ "banner-pic"
            H.div ! A.class_ "image-container" $ do
                H.p $ do
                    "You have landed on the personal website of Stefanos Anagnostou. "
                    "Here you can find information about me, "
                    "my projects and my interests. I may even write a blog post or two."
            H.link ! A.rel "stylesheet" ! A.type_ "text/css" ! A.href "/css/style.css"
            navigationBar
