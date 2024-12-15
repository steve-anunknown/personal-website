{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -Wno-name-shadowing #-}

module ComparingLogMessages (comparingLogMessages) where

import Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes as A

fileViewer :: Html -> Html
fileViewer = H.div ! A.class_ "file-viewer"

terminal :: Html -> Html
terminal = H.code ! A.class_ "terminal"

termPrompt :: Html -> Html
termPrompt = H.code ! A.class_ "prompt"

termOutput :: Html -> Html
termOutput = H.code ! A.class_ "output"

narration :: Html -> Html
narration = H.p ! A.class_ "narration"

innerDialogue :: Html -> Html
innerDialogue = H.p ! A.class_ "inner-dialogue"

wallOfText :: Html
wallOfText = fileViewer $ do
  "Oct 10 14:59:22 bluetoothd[10534]: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters\n"
  "Oct 10 14:59:22 bluetoothd[10534]: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters\n"
  "Oct 10 14:59:22 bluetoothd[10534]: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters\n"
  "Oct 10 14:59:22 bluetoothd[10534]: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters\n"
  "Oct 10 14:59:22 bluetoothd[10534]: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters\n"
  "Oct 10 15:01:30 bluetoothd[612]: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters\n"
  "Oct 10 15:01:30 bluetoothd[612]: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters\n"
  "Oct 10 15:01:30 bluetoothd[612]: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters\n"
  "Oct 12 11:24:54 bluetoothd[588]: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters\n"
  "Oct 12 11:24:54 bluetoothd[588]: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters\n"
  "Oct 12 11:24:54 bluetoothd[588]: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters\n"
  "Oct 13 12:23:12 bluetoothd[606]: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters\n"
  "Oct 13 12:23:12 bluetoothd[606]: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters\n"
  "Oct 13 12:23:12 bluetoothd[606]: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters\n"
  "Oct 13 17:51:59 bluetoothd[606]: profiles/input/hog-lib.c:report_read_cb() Error reading Report value: Request attribute has encountered an unlikely error\n"
  "Oct 13 17:51:59 bluetoothd[606]: profiles/input/hog-lib.c:report_reference_cb() Read Report Reference descriptor failed: Request attribute has encountered an unlikely error\n"
  "Oct 13 17:51:59 bluetoothd[606]: profiles/input/hog-lib.c:report_read_cb() Error reading Report value: Request attribute has encountered an unlikely error\n"
  "Oct 13 17:51:59 bluetoothd[606]: profiles/input/hog-lib.c:report_reference_cb() Read Report Reference descriptor failed: Request attribute has encountered an unlikely error\n"
  "Oct 13 17:51:59 bluetoothd[606]: profiles/input/hog-lib.c:report_read_cb() Error reading Report value: Request attribute has encountered an unlikely error\n"
  "Oct 13 17:51:59 bluetoothd[606]: profiles/input/hog-lib.c:report_reference_cb() Read Report Reference descriptor failed: Request attribute has encountered an unlikely error\n"
  "Oct 13 17:51:59 bluetoothd[606]: profiles/input/hog-lib.c:proto_mode_read_cb() Protocol Mode characteristic read failed: Request attribute has encountered an unlikely error\n"
  "Oct 13 17:51:59 bluetoothd[606]: profiles/battery/battery.c:batt_io_ccc_written_cb() Battery Level: notifications not enabled Request attribute has encountered an unlikely error\n"
  "Oct 13 17:51:59 bluetoothd[606]: profiles/input/hog-lib.c:ccc_read_cb() Error reading CCC value: Request attribute has encountered an unlikely error\n"
  "Oct 14 12:12:40 bluetoothd[584]: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters\n"
  "Oct 14 12:12:40 bluetoothd[584]: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters\n"

cleanWallOfText :: Html
cleanWallOfText = fileViewer $ do
  "bluetoothd: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters\n"
  "bluetoothd: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters\n"
  "bluetoothd: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters\n"
  "bluetoothd: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters\n"
  "bluetoothd: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters\n"
  "bluetoothd: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters\n"
  "bluetoothd: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters\n"
  "bluetoothd: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters\n"
  "bluetoothd: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters\n"
  "bluetoothd: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters\n"
  "bluetoothd: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters\n"
  "bluetoothd: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters\n"
  "bluetoothd: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters\n"
  "bluetoothd: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters\n"
  "bluetoothd: profiles/input/hog-lib.c:report_read_cb() Error reading Report value: Request attribute has encountered an unlikely error\n"
  "bluetoothd: profiles/input/hog-lib.c:report_reference_cb() Read Report Reference descriptor failed: Request attribute has encountered an unlikely error\n"
  "bluetoothd: profiles/input/hog-lib.c:report_read_cb() Error reading Report value: Request attribute has encountered an unlikely error\n"
  "bluetoothd: profiles/input/hog-lib.c:report_reference_cb() Read Report Reference descriptor failed: Request attribute has encountered an unlikely error\n"
  "bluetoothd: profiles/input/hog-lib.c:report_read_cb() Error reading Report value: Request attribute has encountered an unlikely error\n"
  "bluetoothd: profiles/input/hog-lib.c:report_reference_cb() Read Report Reference descriptor failed: Request attribute has encountered an unlikely error\n"
  "bluetoothd: profiles/input/hog-lib.c:proto_mode_read_cb() Protocol Mode characteristic read failed: Request attribute has encountered an unlikely error\n"
  "bluetoothd: profiles/battery/battery.c:batt_io_ccc_written_cb() Battery Level: notifications not enabled Request attribute has encountered an unlikely error\n"
  "bluetoothd: profiles/input/hog-lib.c:ccc_read_cb() Error reading CCC value: Request attribute has encountered an unlikely error\n"
  "bluetoothd: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters\n"
  "bluetoothd: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters\n"

smallWallOfText :: Html
smallWallOfText = fileViewer $ do
  "bluetoothd: Failed to set mode: Authentication Failed (0x05)\n"
  "bluetoothd: profiles/battery/battery.c:batt_io_ccc_written_cb() Battery Level: notifications not enabled Request attribute has encountered an unlikely error\n"
  "bluetoothd: profiles/input/hog-lib.c:ccc_read_cb() Error reading CCC value: Request attribute has encountered an unlikely error\n"
  "bluetoothd: profiles/input/hog-lib.c:output_written_cb() Write output report failed: Request attribute has encountered an unlikely error\n"
  "bluetoothd: profiles/input/hog-lib.c:proto_mode_read_cb() Protocol Mode characteristic read failed: Request attribute has encountered an unlikely error\n"
  "bluetoothd: profiles/input/hog-lib.c:report_read_cb() Error reading Report value: Request attribute has encountered an unlikely error\n"
  "bluetoothd: profiles/input/hog-lib.c:report_reference_cb() Read Report Reference descriptor failed: Request attribute has encountered an unlikely error\n"
  "bluetoothd: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters\n"

demo :: Html
demo = do
  H.pre $ do
    termPrompt "journalctl -q -p 3 --no-hostname > do_not_report"
    termPrompt "wc -l do_not_report"
    termOutput "69420 do_not_report"

  innerDialogue "... this is going to be fun. Let's narrow it down."

  H.pre $ do
    termPrompt "journalctl -q -p 3 -u bluetooth > do_not_report"
    termPrompt "wc -l do_not_report"
    termOutput "86 do_not_report"

  innerDialogue "That's better."

  narration $ do
    "You open up the file using the best text editor in the world, "
    "and you are quickly punched in the face by a wall of text streching "
    "across your screen."

  wallOfText

  innerDialogue "It will take more than this to scare me off. This can be easily cleaned up."

  H.pre $ termPrompt "cut -d' ' -f4- do_not_report | sed 's/\\[[0-9]*\\]//g' > clean"

  cleanWallOfText

  innerDialogue "Everything falls into place. After I remove the duplicates, only a handful of errors remain."

  H.pre $ termPrompt "sort clean | uniq > errors"

  smallWallOfText

theBashScript :: Html
theBashScript = do
  "#!/bin/bash\n"
  "whitelist=\"$1\"\n"
  "logs=$(journalctl -q -p 3 | cut -d' ' -f4- | sed 's/\\[[0-9]*\\]//g')\n"

comparingLogMessages :: Html
comparingLogMessages =
  let container = H.div ! A.class_ "blog-container"
   in do
        H.h2 "Comparing Log Messages"
        container $ do
          narration $ do
            "You are sitting comfortably on your personal computer, engaging "
            "in your favorite intellectual pursuits, as one does, with a cup of "
            "your favourite beverage by your side. "
            "Suddenly, you start feeling a cold, trembling wave of anxiety creeping, "
            "climbing up quickly from your feet, needling its way right into your gut "
            "to unleash its frozen frenzy."
          narration $ do
            "You are overwhelmed with terror. You realize "
            "your computer services may have reported errors that have gone unseen! "
            "You try to regain your composure. "

          innerDialogue $ do
            "Wait a minute ... surely not all of these errors are worth stressing "
            "over."

          narration "A confident smirk wipes the look of terror from your face."

          innerDialogue $ do
            "I will go over the logs once and figure out which of the errors are "
            "easy to fix or safe to ignore. I'll add them to a list and then write "
            "a program that checks the error logs for new errors, unlike the ones "
            "in the list."

          narration $ do
            "Before actually putting in any hard work, you figure that it'd be better to "
            "put your glorious idea to the test with a quick demo."

          demo

          innerDialogue $ do
            "Finally. I can now write a program that will check the logs for new errors. "
            "I will filter the journalctl errors like I did just now and compare the "
            "filtered errors with the errors in the list. If an error in the list is "
            "in the filtered errors, I will remove it from there. The remaining errors "
            "will be the new errors."

          narration $ do
            "Fueled by excitement, you get to writing."

          H.pre $ terminal theBashScript

          narration $ do
            "You pull away from the screen and marvel at your creation. To your surprise, though "
            "the feeling that's been bugging you from the beginning now forms itself in words. "

          innerDialogue $ do
            "The preprocessing is not perfect. My program will showcase multiple instances of "
            "essentially the same error, if it so happens that the error messages contains "
            "a variable part, even if the log message is in the list. For example, if I add this "
            "error in the list:"

          fileViewer "bluetoothd: Failed to set mode: Authentication Failed (0x05)\n"

          innerDialogue $ do
            "then the script will not report it again, but it will report every other instance of "
            "the error, where the code is not (0x05) but is some other code."

          innerDialogue $ do
            "I could use regular expressions to filter these potentially variable parts out "
            "and compare the logs using the rest of the string, but I can't possibly know all "
            "the possible patterns that may turn up in advance!"

          narration $ do
            "It feels like an invisible wall, high as a tower, solid as steel, but thin as a hair, has spawned "
            "out of nowhere in your mind, stopping you from making progress. This is nothing new. You've learned "
            "to push through, fearless in the face of opposition ... But first, a quick walk to soothe the brain "
            "is needed."

          narration $ do
            "You open your door and yet another flashbang blasts you in the face. You can't catch a break today. "
            "Invisible walls may not be anything new to you, but the blazing sun and its blinding light surely is. You quickly "
            "turn your gaze down to the street, noticing your pale arms."

          innerDialogue $ do
            "I really need to go out more often."

          narration $ do
            "Your moment of clarity loses its place to a burst of anger."

          innerDialogue $ do
            "Come on! It shouldn't be that difficult! What even is the chance that two log messages differ, if they "
            "are both reported by the same process and share a bunch of common words!? I could just compare the first "
            "five words for God's sake! Or maybe some words here and some words there ... Ugh I don't know."

          narration $ do
            "Your quick stroll has led you to a park, allowing you to escape the torching gaze of the sun "
            "and find shelter in a bench under the shadow cast by an old tree. The coolness revitalizes you."

          innerDialogue $ do
            "Just lay down some basic facts."

          H.div ! A.class_ "inner-dialogue" $ do
            H.ol $ do
                H.li "You don't know every possible pattern"
                H.li "A pattern can occur anywhere in the log message"
                H.li $ do
                    "'Equal' log messages have most words equal. You don't want a "
                    "pattern here and there deem them unequal"

          narration $ do
            "Finally, it hits you. The moment you've been waiting for."

          innerDialogue $ do
            "I think I've found it! I will compare log messages by first asserting that they are reported by the same "
            "process and have the same amount of words in their message. This should already be enough, but for good "
            "measure, I will iterate over them word by word, and if I find two consecutive differing words, I will "
            "deem them unequal. Otherwise, I'll say they are equal. This way, if they happen to defer in multiple "
            "words, I consider them to be variable patterns and don't mind, as long as they are sparse and not "
            "consecutive! I'm a gen - "

          narration $ do
            "Your triumph is interrupted by the smell of dog pee on your shoes."

          innerDialogue $ do
            "Damn dog!"

          narration $ do
            "The dog calmly trots away, barely acknowledging your presence"

          innerDialogue $ do
            "That's enough outside for today. I'll head back home and implement my idea ..."


        H.link ! A.rel "stylesheet" ! A.type_ "text/css" ! A.href "https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.9.0/styles/atom-one-dark.min.css"
        H.script ! A.src "https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.9.0/highlight.min.js" $ ""
        H.script ! A.src "https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.9.0/languages/shell.min.js" $ ""
        H.script "hljs.highlightAll();"
