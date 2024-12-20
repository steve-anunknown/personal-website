{-# LANGUAGE OverloadedStrings #-}

module HomePage (homePage) where

import RouteMaker (mkRoute)
import Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes as A
import Web.Scotty as S

homePage :: ScottyM ()
homePage = mkRoute "/" "Stefanos Anagnostou Personal Website" "logo2.svg" $ do
  H.div ! A.class_ "container" $ do
    H.h1 "Welcome traveller."
    H.img ! A.src "/images/lambda-irl-banner.jpg" ! A.alt "Banner Picture" ! A.class_ "banner-pic"
    H.div ! A.class_ "image-container" $ do
      H.h2 $ do
        "You have landed on the personal website of Stefanos Anagnostou. "
        "Here you can find information about me, "
        "my projects and my interests. I may even write a blog post or two."
    H.link ! A.rel "stylesheet" ! A.type_ "text/css" ! A.href "/css/style.css"
    H.link ! A.rel "stylesheet" ! A.type_ "text/css" ! A.href "/css/home-style.css"
