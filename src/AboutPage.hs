{-# LANGUAGE OverloadedStrings #-}

module AboutPage (aboutPage) where

import Web.Scotty as S
import Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes as A

import NavigationBar (navigationBar)
import RouteMaker (mkRoute)

aboutPage :: ScottyM ()
aboutPage = mkRoute "/about" "About Me" $ do
        H.div ! A.class_ "container" $ do
            H.h1 $ "About Me"
            H.div ! A.class_ "image-container" $ do
                H.img ! A.src "/images/profile-fly.jpg" ! A.alt "Profile Picture" ! A.class_ "profile-pic"
                H.div ! A.class_ "container" $ do
                    H.p $ do
                        "I enjoy programming just for the sake of programming and I am an enthusiast of "
                        "functional programming languages, especially Haskell. I love programming languages "
                        "in general and I am curious about their design, their goals and their implementation. "
                        "Moreover, I am interested in static analysis and tailor made tools that can help "
                        "developers write better code and discover errors sooner."
                    H.br
                    H.p $ do
                        "I am into sports; I played basketball as a teenager and I still enjoy playing from time to time "
                        "with my friends. I also enjoy running and have run in some amateur races; mostly 5 and 10 km. "
                        "I recently fell in love with skiing and plan to continue to ski in the future. Finally, I try to "
                        "donate blood as often as I can."
                    H.br
                    H.p $ do
                        "I cannot pass a day without listening to music. I mainly enjoy listening to rock and blues music, "
                        "from the 60s and 70s, and metal music. However, I'm also a big fan of rap music."
            navigationBar
        H.link ! A.rel "stylesheet" ! A.type_ "text/css" ! A.href "/css/style.css"
