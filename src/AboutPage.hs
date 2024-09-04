{-# LANGUAGE OverloadedStrings #-}

module AboutPage (aboutPage) where

import Web.Scotty (ScottyM)
import Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes as A
import Data.Text (Text, replace)

import NavigationBar (navigationBar)
import RouteMaker (mkRoute)

-- Function to apply HTML syntax highlighting, corrected for Blaze-html rendering
highlightHaskell :: Text -> Html
highlightHaskell codesnip = H.pre $ H.code ! A.class_ "haskell" $ do
    preEscapedText $ highlightSyntax codesnip
  where
    highlightSyntax :: Text -> Text
    highlightSyntax txt = foldr replaceSyntax txt replacements

    replaceSyntax :: (Text, Text) -> Text -> Text
    replaceSyntax (targ, cls) = replace targ (wrapInSpan cls targ)

    replacements = [
        (" :: ", "type"),
        (" = ", "keyword"),
        (" data ", "keyword"),
        (" type ", "keyword"),
        (" newtype ", "keyword"),
        (" if ", "keyword"),
        (" then ", "keyword"),
        (" else ", "keyword"),
        (" case ", "keyword"),
        (" of ", "keyword"),
        (" let ", "keyword"),
        (" in ", "keyword"),
        (" where ", "keyword"),
        (" + ", "function"),
        (" - ", "function"),
        (" -- ", "comment"),
        ("{ ", "keyword"),
        (" }", "keyword"),
        ("[ ", "keyword"),
        (" ]", "keyword")
        -- Add more replacements as needed
      ]

    wrapInSpan :: Text -> Text -> Text
    wrapInSpan cls textsnip = "<span class=\"" <> cls <> "\">" <> textsnip <> "</span>"

aboutPage :: [String] -> ScottyM ()
aboutPage audioFiles = mkRoute "/about" "About Me" "icons8-favicon-30.png"  $ do
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
                    H.p $ do
                        "I cannot pass a day without listening to music. I mainly enjoy listening to rock and blues music, "
                        "from the 60s and 70s, and metal music. However, I'm also a big fan of rap music."
                    highlightHaskell "data MusicILove = Rock | Blues | Metal | Rap\n -- This never stops\nlistenToMusic :: MusicILove -> IO ()\nlistenToMusic genre = vibeTo genre >> listenToMusic genre\n"
            H.div ! A.id "playerContainer" $ do
                H.h2 "Listen to random samples of my favorite music! (At your own risk)"
                H.h3 ! A.style "text-align:center;" $ "♫♪.ılılıll|̲̅̅●̲̅̅|̲̅̅=̲̅̅|̲̅̅●̲̅̅|llılılı.♫♪"
                H.p ! A.id "currentSong" $ "Song Title: Hit Shuffle!"
                H.p ! A.id "currentArtist" $ "Artist: Hit Shuffle!"
                H.p ! A.id "currentAlbum" $ "Album: Hit Shuffle!"
                H.canvas ! A.id "visualizer" $ ""
                H.div ! A.class_ "button-bar-container" $ do
                    H.button "Shuffle" ! A.id "shuffleButton"
                    H.audio ! A.id "audioPlayer" ! A.controls "" $ do
                        H.source ! A.src "" ! A.type_ "audio/mpeg"
            H.p $ do
                "I am into sports; I played basketball as a teenager and I still enjoy playing from time to time "
                "with my friends. I also enjoy running and have run in some amateur races; mostly 5 and 10 km. "
                "I recently fell in love with skiing and plan to continue to ski in the future. Finally, I try to "
                "donate blood as often as I can."
            highlightHaskell "data SportsILike = Basketball | Running | Skiing"
            navigationBar
        H.script ! A.src "/dist/jsmediatags.min.js" $ ""
        H.script $ H.toHtml $ "var audioFiles = " ++ show audioFiles ++ ";"
        H.script ! A.src "/js/shuffle.js" $ ""
        H.script ! A.src "/js/visualizer.js" $ ""
        H.link ! A.rel "stylesheet" ! A.type_ "text/css" ! A.href "/css/style.css"
