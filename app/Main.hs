{-# LANGUAGE OverloadedStrings #-}

import Web.Scotty as S
import Network.Wai.Middleware.Static
import Network.Wai.Middleware.RequestLogger
import Data.Monoid ()

import HomePage (homePage)
import LinksPage (linksPage)
import ExperiencePage (experiencePage)
import AboutPage (aboutPage)
import NotFoundPage (notFoundPage)


main :: IO ()
main = scotty 3000 $ do
    -- Log all requests; remove in production if not needed
    middleware logStdoutDev

    -- Serve static files from the static directory
    middleware $ staticPolicy (noDots >-> addBase "static")

    homePage

    aboutPage

    experiencePage

    linksPage

    notFoundPage

