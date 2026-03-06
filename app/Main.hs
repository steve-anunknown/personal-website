{-# LANGUAGE OverloadedStrings #-}

import AboutPage (aboutPage)
import BlogPage (blogPage)
import Data.Monoid ()
import ExperiencePage (experiencePage)
import HomePage (homePage)
import LinksPage (linksPage)
import Network.Wai.Middleware.Gzip (defaultGzipSettings, gzip)
import Network.Wai.Middleware.Static
  ( CachingStrategy (..),
    addBase,
    cacheContainer,
    defaultOptions,
    initCaching,
    noDots,
    staticPolicyWithOptions,
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
  cache <- initCaching PublicStaticCaching
  S.scotty 5001 $ do
    -- Log all requests; remove in production if not needed
    -- S.middleware logStdoutDev

    S.middleware $ gzip defaultGzipSettings

    -- Serve static files from the static directory with public caching headers
    S.middleware $ staticPolicyWithOptions (defaultOptions {cacheContainer = cache}) (noDots >-> addBase "static")

    homePage

    aboutPage audioFiles

    experiencePage

    linksPage

    blogPage

    notFoundPage
