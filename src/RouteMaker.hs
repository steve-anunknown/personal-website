{-# LANGUAGE OverloadedStrings #-}

module RouteMaker (mkRoute) where

import NavigationBar (navigationBar)
import Text.Blaze.Html.Renderer.Text (renderHtml)
import Text.Blaze.Html5 as H hiding (main)
import Text.Blaze.Html5.Attributes as A
import Web.Scotty as S

-- | Create a route with a given route pattern, title and content
-- | The content is an Html object
-- | The title is the title of the page
-- | The route pattern is the path of the route
-- | The route image is the path of the image that will be displayed in the tab
-- | This helps to avoid code duplication
mkRoute :: RoutePattern -> String -> String -> H.Html -> ScottyM ()
mkRoute routePattern routeTitle routeImage routeContent = get routePattern $ do
  S.html $ renderHtml $ do
    H.docTypeHtml $ do
      H.head $ do
        H.title $ H.toHtml routeTitle
        H.link ! A.rel "icon" ! A.href (toValue $ "/images/" ++ routeImage)
      H.body $ do
        routeContent
      H.footer $ H.div ! A.class_ "footer" $ do
        navigationBar
        H.p "Powered by"
        H.img ! A.src "/images/haskell.png" ! A.alt "Haskell logo" ! A.class_ "footer-logo"
