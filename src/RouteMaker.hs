module RouteMaker (mkRoute) where

import Web.Scotty as S
import Text.Blaze.Html.Renderer.Text (renderHtml)
import Text.Blaze.Html5 as H hiding (main)

-- | Create a route with a given route pattern, title and content
-- | The content is an Html object
-- | The title is the title of the page
-- | The route pattern is the path of the route
-- | This helps to avoid code duplication
mkRoute :: RoutePattern -> String -> H.Html -> ScottyM ()
mkRoute routePattern routeTitle routeContent = get routePattern $ do
    S.html $ renderHtml $ do
        H.docTypeHtml $ do
            H.head $ do
                H.title $ H.toHtml routeTitle
            H.body $ do
                routeContent
