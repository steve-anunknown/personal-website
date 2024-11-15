{-# LANGUAGE OverloadedStrings #-}

import AboutPage (aboutPage)
import BlogPage (blogPage)
import Data.Monoid ()
import ExperiencePage (experiencePage)
import HomePage (homePage)
import LinksPage (linksPage)
import Network.Wai.Middleware.RequestLogger (logStdoutDev)
import Network.Wai.Middleware.Static
  ( addBase,
    noDots,
    staticPolicy,
    (>->),
  )
import NotFoundPage (notFoundPage)
import System.Directory (listDirectory)
import System.FilePath (takeExtension)
import Web.Scotty as S (middleware, scotty)

main :: IO ()
main = do
  allFiles <- listDirectory "./static/audio"
  print allFiles
  let audioFiles = map ("./audio/" ++) (filter (\f -> takeExtension f == ".mp3") allFiles)
  print audioFiles
  S.scotty 3000 $ do
    -- Log all requests; remove in production if not needed
    S.middleware logStdoutDev

    -- Serve static files from the static directory
    S.middleware $ staticPolicy (noDots >-> addBase "static")

    homePage

    aboutPage audioFiles

    experiencePage

    linksPage

    blogPage

    notFoundPage
