{-# Language OverloadedStrings #-}

module NavigationBar (navigationBar) where

import Text.Blaze.Html5 as H hiding (main)
import Text.Blaze.Html5.Attributes as A

-- | Navigation bar that is included in every page
navigationBar :: Html
navigationBar = do
    -- make it go to the bottom of the page
    H.div ! A.class_ "footer" $ do
        H.h1 $ "Navigation" 
        H.nav $ do
            H.ul $ do
                H.li $ do
                    H.a ! A.href "/about" $ "About Me"
                H.li $ do
                    H.a ! A.href "/education-and-work" $ "Education and Work"
                H.li $ do
                    H.a ! A.href "/links" $ "Useful Links"
                H.li $ do
                    H.a ! A.href "/" $ "Back to Home"
