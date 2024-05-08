{-# LANGUAGE OverloadedStrings #-}

import Web.Scotty as S
import Text.Blaze.Html.Renderer.Text (renderHtml)
import Text.Blaze.Html5 as H hiding (main)
import Text.Blaze.Html5.Attributes as A
import Network.Wai.Middleware.Static
import Network.Wai.Middleware.RequestLogger
import Data.Monoid (mconcat)

main :: IO ()
main = scotty 3000 $ do
    -- Log all requests; remove in production if not needed
    middleware logStdoutDev

    -- Serve static files from the static directory
    middleware $ staticPolicy (noDots >-> addBase "static")

    -- Routes
    get "/" $ do
        S.html $ renderHtml $ do
            H.docTypeHtml $ do
                H.head $ do
                    H.title "Stefanos Anagnostou Personal Website"
                H.h1 $ "Welcome to my personal profile site."
                H.img ! A.src "/images/profile-pic.jpg" ! A.alt "Profile Picture" ! A.class_ "profile-pic"
                H.p $ do
                    "I am Stefanos Anagnostou, a Computer Engineering student. "
                    "This is my personal website where you can find information about me, "
                    "my projects and my interests. I may even write a blog post or two."
                H.link ! A.rel "stylesheet" ! A.type_ "text/css" ! A.href "/css/style.css"
                H.h1 $ "Navigation"
                H.nav $ do
                    H.ul $ do
                        H.li $ do
                            H.a ! A.href "/about" $ "About Me"
                        H.li $ do
                            H.a ! A.href "/links" $ "Useful Links"
    get "/links" $ do
        S.html $ renderHtml $ do
            H.docTypeHtml $ do
                H.head $ do
                    H.title "Useful Links"
                H.h1 $ "Useful Links"
                H.ul $ do
                    H.li $ do
                        H.a ! A.href "https://www.github.com/steve-anunknown" $ "My GitHub"
                    H.li $ do
                        H.a ! A.href "https://www.linkedin.com/in/anastasios-stefanos-anagnostou-886a17229/" $ "My LinkedIn"
                H.a ! A.href "/" $ "Back to Home"
    get "/about" $ do
        S.html $ renderHtml $ do
            H.docTypeHtml $ do
                H.head $ do
                    H.title "About Me"
                H.h1 $ "About Me"
                H.p $ do 
                    "I am currently studying Computer Engineering at the "
                    H.a ! A.href "https://www.ece.ntua.gr/en" $ "School of Electrical and Computer Engineering in NTUA"
                    ". I have majored in Computer Systems and Data Science, with a minor in "
                    "Software Engineering. However, I am mainly interested in Programming Languages, "
                    "Compilers and Testing."
                H.link ! A.rel "stylesheet" ! A.type_ "text/css" ! A.href "/css/style.css"
                H.a ! A.href "/" $ "Back to Home"
