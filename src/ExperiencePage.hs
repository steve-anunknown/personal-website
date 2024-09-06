{-# LANGUAGE OverloadedStrings #-}

module ExperiencePage (experiencePage) where

import Web.Scotty as S
import Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes as A
import RouteMaker (mkRoute)

undergraduate :: Html
undergraduate = do
        H.h3 "Integrated Master's Degree in Computer Engineering "
        H.h4 "2019 - 2024"
        H.p $ do 
            "I am currently finishing my studies in Computer Engineering at the "
            H.a ! A.href "https://www.ece.ntua.gr/en" $ "School of Electrical "
            "and Computer Engineering in NTUA. I have majored in Computer "
            "Systems and Control Systems, with a minor in Software "
            "Engineering. However, I am mainly interested in Programming "
            "Languages, Compilers and Testing."
        H.p $ do
            "My Diploma Thesis regards the efficient implementation of "
            "equivalence oracles in the context of minimally adequate "
            "teachers in "
            H.a ! A.href "https://automata.cs.ru.nl/" $ "active automata learning "
            ". "
        H.p $ do
            "During my studies, I had the opportunity to familiriaze myself "
            "with many different technological fields and tools. As a "
            "Computer Systems major, I studied operating systems, parallel and "
            "concurrent programming, as well as embedded system design. In "
            "the context of Control Systems, I carried out many different "
            "projects, ranging from Automatic Control, to Machine Learning, "
            "Natural Language Processing and Computer Vision. Finally, I "
            "discovered my love for Programming Languages and Compilers as a "
            "Software Engineering minor."

anosi :: Html
anosi = do
    H.h3 "Extracurricular Tutor"
    H.h4 "September 2021 - June 2023"
    H.p $ do
        "I worked part-time as an extracurricular tutor in the course of Computer Networks, "
        "teaching students of the Greek Professional High School and preparing "
        "them for the Panhellenic Exams. "

nokia :: Html
nokia = do
    H.h3 "Software Developer Intern"
    H.h4 "June 2024 - December 2024"
    H.p $ do
        "At the moment, I'm interning as a Software Developer at Nokia. "
        "I mostly help with the maintainance of some servers and virtual "
        "machines and my work mostly involves Bash scripting and Ansible "
        "playbooks."

experiencePage :: ScottyM ()
experiencePage = mkRoute "/education-and-work" "Education and Work" "icons8-favicon-30.png"  $ do
        H.div ! A.class_ "education-work-container" $ do
            H.h1 "Education and Work "
            H.div ! A.class_ "education-section" $ do
                H.h2 "Education"

                undergraduate

            H.div ! A.class_ "work-section" $ do
                H.h2 $ "Work Experience"

                anosi

                nokia

        H.link ! A.rel "stylesheet" ! A.type_ "text/css" ! A.href "/css/style.css "

