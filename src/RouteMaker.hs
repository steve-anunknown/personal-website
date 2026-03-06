{-# LANGUAGE OverloadedStrings #-}

module RouteMaker (mkRoute) where

import NavigationBar (navigationBar)
import Text.Blaze.Html.Renderer.Text (renderHtml)
import Text.Blaze.Html5 as H hiding (main)
import Text.Blaze.Html5.Attributes as A
import Web.Scotty as S

-- | Create a route with a given route pattern, title and content
-- The content is an Html object
-- The title is the title of the page
-- The route pattern is the path of the route
-- The route image is the path of the image that will be displayed in the tab
-- The CSS paths are the stylesheets to include in the head
-- This helps to avoid code duplication
mkRoute :: RoutePattern -> String -> String -> [String] -> H.Html -> ScottyM ()
mkRoute routePattern routeTitle routeImage cssPaths routeContent = get routePattern $ do
  S.html $ renderHtml $ do
    H.docTypeHtml $ do
      H.head $ do
        H.meta ! A.charset "utf-8"
        H.meta ! A.name "viewport" ! A.content "width=device-width, initial-scale=1"
        H.title $ H.toHtml routeTitle
        H.link ! A.rel "icon" ! A.href (toValue $ "/images/" ++ routeImage)
        mapM_ (\css -> H.link ! A.rel "stylesheet" ! A.type_ "text/css" ! A.href (toValue css)) cssPaths
      H.body $ do
        routeContent
      H.footer $ do
        navigationBar
        H.p "Powered by"
        H.img ! A.src "/images/Haskell-Logo.svg" ! A.alt "Haskell logo"
