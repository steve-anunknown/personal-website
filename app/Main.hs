{-# LANGUAGE OverloadedStrings #-}

import Web.Scotty as S
import Network.Wai.Middleware.Static
import Network.Wai.Middleware.RequestLogger
import Data.Monoid ()

import HomePage (homePage)
import LinksPage (linksPage)
import ExperiencePage (experiencePage)
import AboutPage (aboutPage)
import BlogPage (blogPage)
import NotFoundPage (notFoundPage)

import System.Directory (listDirectory)
import System.FilePath (takeExtension)

main :: IO ()
main = do
    allFiles <- listDirectory "./static/audio"
    print allFiles
    let audioFiles = (map ("./audio/" ++ ) (filter (\f -> takeExtension f == ".mp3") allFiles))
    print audioFiles
    S.scotty 3000 $ do
     -- Log all requests; remove in production if not needed
     middleware logStdoutDev

     -- Serve static files from the static directory
     middleware $ staticPolicy (noDots >-> addBase "static")

     homePage

     aboutPage audioFiles

     experiencePage

     linksPage

     blogPage

     notFoundPage

