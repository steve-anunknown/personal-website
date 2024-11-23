{-# LANGUAGE OverloadedStrings #-}

module BlogPage (blogPage) where

import RouteMaker (mkRoute)
import Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes as A
import Web.Scotty as S

comparingLogMessages :: Html
comparingLogMessages = do
  H.h3 "Comparing Log Messages"
  H.p $ do
        "You are sitting comfortably on your personal computer, engaging "
        "in your favorite intellectual pursuits, as one does. "
        "Suddenly, you start feeling a cold, trembling wave of anxiety creeping, "
        "climbing up quickly from your feet, needling its way right into your gut "
        "to unleash its frozen frenzy. You are overwhelmed with terror. You realize "
        "your computer services may have reported errors that have gone unseen! "
        "You try to regain your composure. "
        H.br
        H.em $ do 
          "Wait a minute ... surely not all of these errors are worth stressing "
          "over."
        H.br
        "A confident smirk wipes the look of terror from your face."
        H.em $ do 
          "I will go over the logs once and figure out which of the errors are "
          "easy to fix or safe to ignore. I'll add them to a list and then write "
          "a program that checks the error logs for new errors, unlike the ones "
          "in the list."

blogPage :: ScottyM ()
blogPage = mkRoute "/blogs" "My Blogs" "logo2.svg" $ do
  H.h1 "My Blogs"
  H.p "Turns out I'm not that interesting."
  H.link ! A.rel "stylesheet" ! A.type_ "text/css" ! A.href "/css/style.css"
