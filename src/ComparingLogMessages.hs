{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -Wno-name-shadowing #-}

module ComparingLogMessages (comparingLogMessages) where

import Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes as A

fileViewer :: Html -> Html
fileViewer = H.div ! A.class_ "file-viewer"

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
  "#!/bin/bash"
  "# Write the rest of the program"

comparingLogMessages :: Html
comparingLogMessages =
  let container = H.div ! A.class_ "blog-container"
   in do
        H.h2 "Comparing Log Messages"
        container $ do
          narration $ do
            "You are sitting comfortably on your personal computer, engaging "
            "in your favorite intellectual pursuits, as one does. "
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
            "Fueled by the excitement, you get to writing."

          termOutput theBashScript

          narration $ do
            "You pull away from the screen and marvel at your creation. To your surprise, though "
            "the feeling that's been bugging you from the beginning now forms itself in words. "

          innerDialogue $ do
            "The preprocessing is not perfect. My program will showcase multiple instances of "
            "essentially the same error, if it so happens that the error messages contains "
            "a variable part"

          termOutput "echo some examples"

        H.link ! A.rel "stylesheet" ! A.type_ "text/css" ! A.href "https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.9.0/styles/atom-one-dark.min.css"
        H.script ! A.src "https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.9.0/highlight.min.js" $ ""
        H.script ! A.src "https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.9.0/languages/shell.min.js" $ ""
        H.script "hljs.highlightAll();"
