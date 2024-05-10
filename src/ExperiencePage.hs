{-# LANGUAGE OverloadedStrings #-}

module ExperiencePage (experiencePage) where

import Web.Scotty as S
import Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes as A

import NavigationBar (navigationBar)
import RouteMaker (mkRoute)


experiencePage :: ScottyM ()
experiencePage = mkRoute "/education-and-work" "Education and Work" $ do
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
