{-# LANGUAGE OverloadedStrings #-}

import Web.Scotty as S
import Text.Blaze.Html.Renderer.Text (renderHtml)
import Text.Blaze.Html5 as H hiding (main)
import Text.Blaze.Html5.Attributes as A
import Network.Wai.Middleware.Static
import Network.Wai.Middleware.RequestLogger
import Data.Monoid (mconcat)

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
                H.div ! A.class_ "container" $ do
                    H.h1 $ "Welcome traveller."
                    H.img ! A.src "/images/lambda-irl-banner.jpg" ! A.alt "Banner Picture" ! A.class_ "banner-pic"
                    H.div ! A.class_ "image-container" $ do
                        H.p $ do
                            "You have landed on the personal website of Stefanos Anagnostou. "
                            "Here you can find information about me, "
                            "my projects and my interests. I may even write a blog post or two."
                    H.link ! A.rel "stylesheet" ! A.type_ "text/css" ! A.href "/css/style.css"
                    navigationBar
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
                H.link ! A.rel "stylesheet" ! A.type_ "text/css" ! A.href "/css/style.css"
                navigationBar
    get "/education-and-work" $ do
        S.html $ renderHtml $ do
            H.docTypeHtml $ do
                H.head $ do
                    H.title "Education and Work"
                H.div ! A.class_ "container" $ do
                    H.h1 $ "Education and Work"
                    H.h2 $ "Education"
                    H.h3 $ "Integrated Master's Degree in Computer Engineering (2019 - 2024)"
                    H.p $ do 
                        "I am currently finishing my studies in Computer Engineering at the "
                        H.a ! A.href "https://www.ece.ntua.gr/en" $ "School of Electrical and Computer Engineering in NTUA"
                        ". I have majored in Computer Systems and Data Science, with a minor in "
                        "Software Engineering. However, I am mainly interested in Programming Languages, "
                        "Compilers and Testing."
                    H.p $ do
                        "My Diploma Thesis regards the efficient implementation of equivalence oracles in the "
                        "context of minimally adequate teachers in "
                        H.a ! A.href "https://automata.cs.ru.nl/" $ "active automata learning"
                        "."
                    H.h2 $ "Work Experience"
                    H.h3 $ "Extracurricular Tutor (September 2021 - June 2023)"
                    H.p $ do
                        "I worked part-time as an extracurricular tutor in the course of Computer Networks, "
                        "teaching students of the Greek Professional High School and preparing "
                        "them for the Panhellenic Exams."
                    H.h3 $ "Software Developer Intern (June 2024 - December 2024)"
                    H.p $ do
                        "At the moment, I'm interning as a Software Developer at Nokia."
                    navigationBar
                H.link ! A.rel "stylesheet" ! A.type_ "text/css" ! A.href "/css/style.css"
    get "/about" $ do
        S.html $ renderHtml $ do
            H.docTypeHtml $ do
                H.head $ do
                    H.title "About Me"
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
                                "with my friends. I recently took up skiing and I can't wait for the next winter to come. "
                            H.br
                            H.p $ do
                                "I cannot pass a day without listening to music. I mainly enjoy listening to rock and blues music, "
                                "from the 60s and 70s, and metal music. However, I'm also a big fan of rap music."
                    navigationBar
                H.link ! A.rel "stylesheet" ! A.type_ "text/css" ! A.href "/css/style.css"
    notFound $ do
        S.html $ renderHtml $ do
            H.docTypeHtml $ do
                H.head $ do
                    H.title "404 - Not Found"
                H.h1 "404 - Not Found"
                H.p "The page you are looking for does not exist. What are you doing here ??"
