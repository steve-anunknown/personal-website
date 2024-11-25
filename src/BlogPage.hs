{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -Wno-name-shadowing #-}

module BlogPage (blogPage) where

import RouteMaker (mkRoute)
import Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes as A
import Web.Scotty as S

comparingLogMessages :: Html
comparingLogMessages =
  let container = H.div ! A.class_ "blog-container"
      narration = H.p ! A.class_ "narration"
      inner_dialogue = H.p ! A.class_ "inner-dialogue"
      prompt str = H.div $ H.p ! A.class_ "prompt" $ str
      output str = H.div $ H.p ! A.class_ "output" $ str
      file_viewer = H.div ! A.class_ "file-viewer"
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
          inner_dialogue $ do
            "Wait a minute ... surely not all of these errors are worth stressing "
            "over."
          narration "A confident smirk wipes the look of terror from your face."
          inner_dialogue $ do
            "I will go over the logs once and figure out which of the errors are "
            "easy to fix or safe to ignore. I'll add them to a list and then write "
            "a program that checks the error logs for new errors, unlike the ones "
            "in the list."
          narration $ do
            "Before actually putting in any hard work, you figure that it'd be better to "
            "put your glorious idea to the test with a quick demo."
          prompt "journalctl -q -p 3 --no-hostname > do_not_report"
          prompt "wc -l do_not_report"
          output "gazzilion do_not_report"
          inner_dialogue "... this is going to be fun. Let's narrow it down."
          prompt "journalctl -q -p 3 -u bluetooth > do_not_report"
          prompt "wc -l do_not_report"
          output "86 do_not_report"
          inner_dialogue "That's better."
          narration $ do
            "You open up the file using the best text editor in the world, "
            "and you are quickly punched in the face by a wall of text streching "
            "across your screen."
          file_viewer $ do
            "Oct 10 14:59:22 bluetoothd[10534]: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters"
            "Oct 10 14:59:22 bluetoothd[10534]: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters"
            "Oct 10 14:59:22 bluetoothd[10534]: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters"
            "Oct 10 14:59:22 bluetoothd[10534]: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters"
            "Oct 10 14:59:22 bluetoothd[10534]: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters"
            "Oct 10 15:01:30 bluetoothd[612]: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters"
            "Oct 10 15:01:30 bluetoothd[612]: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters"
            "Oct 10 15:01:30 bluetoothd[612]: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters"
            "Oct 12 11:24:54 bluetoothd[588]: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters"
            "Oct 12 11:24:54 bluetoothd[588]: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters"
            "Oct 12 11:24:54 bluetoothd[588]: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters"
            "Oct 13 12:23:12 bluetoothd[606]: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters"
            "Oct 13 12:23:12 bluetoothd[606]: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters"
            "Oct 13 12:23:12 bluetoothd[606]: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters"
            "Oct 13 17:51:59 bluetoothd[606]: profiles/input/hog-lib.c:report_read_cb() Error reading Report value: Request attribute has encountered an unlikely error"
            "Oct 13 17:51:59 bluetoothd[606]: profiles/input/hog-lib.c:report_reference_cb() Read Report Reference descriptor failed: Request attribute has encountered an unlikely error"
            "Oct 13 17:51:59 bluetoothd[606]: profiles/input/hog-lib.c:report_read_cb() Error reading Report value: Request attribute has encountered an unlikely error"
            "Oct 13 17:51:59 bluetoothd[606]: profiles/input/hog-lib.c:report_reference_cb() Read Report Reference descriptor failed: Request attribute has encountered an unlikely error"
            "Oct 13 17:51:59 bluetoothd[606]: profiles/input/hog-lib.c:report_read_cb() Error reading Report value: Request attribute has encountered an unlikely error"
            "Oct 13 17:51:59 bluetoothd[606]: profiles/input/hog-lib.c:report_reference_cb() Read Report Reference descriptor failed: Request attribute has encountered an unlikely error"
            "Oct 13 17:51:59 bluetoothd[606]: profiles/input/hog-lib.c:proto_mode_read_cb() Protocol Mode characteristic read failed: Request attribute has encountered an unlikely error"
            "Oct 13 17:51:59 bluetoothd[606]: profiles/battery/battery.c:batt_io_ccc_written_cb() Battery Level: notifications not enabled Request attribute has encountered an unlikely error"
            "Oct 13 17:51:59 bluetoothd[606]: profiles/input/hog-lib.c:ccc_read_cb() Error reading CCC value: Request attribute has encountered an unlikely error"
            "Oct 14 12:12:40 bluetoothd[584]: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters"
            "Oct 14 12:12:40 bluetoothd[584]: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters"
        narration "It will take more than this to scare you off. This can be easily cleaned up."
        -- write a sed commant the removes the numbers from <word>[<number>]
        prompt "cut -d' ' -f4- do_not_report | sed 's/\\[[0-9]*\\]//g' > clean"
        file_viewer $ do
            "bluetoothd: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters"
            "bluetoothd: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters"
            "bluetoothd: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters"
            "bluetoothd: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters"
            "bluetoothd: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters"
            "bluetoothd: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters"
            "bluetoothd: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters"
            "bluetoothd: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters"
            "bluetoothd: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters"
            "bluetoothd: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters"
            "bluetoothd: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters"
            "bluetoothd: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters"
            "bluetoothd: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters"
            "bluetoothd: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters"
            "bluetoothd: profiles/input/hog-lib.c:report_read_cb() Error reading Report value: Request attribute has encountered an unlikely error"
            "bluetoothd: profiles/input/hog-lib.c:report_reference_cb() Read Report Reference descriptor failed: Request attribute has encountered an unlikely error"
            "bluetoothd: profiles/input/hog-lib.c:report_read_cb() Error reading Report value: Request attribute has encountered an unlikely error"
            "bluetoothd: profiles/input/hog-lib.c:report_reference_cb() Read Report Reference descriptor failed: Request attribute has encountered an unlikely error"
            "bluetoothd: profiles/input/hog-lib.c:report_read_cb() Error reading Report value: Request attribute has encountered an unlikely error"
            "bluetoothd: profiles/input/hog-lib.c:report_reference_cb() Read Report Reference descriptor failed: Request attribute has encountered an unlikely error"
            "bluetoothd: profiles/input/hog-lib.c:proto_mode_read_cb() Protocol Mode characteristic read failed: Request attribute has encountered an unlikely error"
            "bluetoothd: profiles/battery/battery.c:batt_io_ccc_written_cb() Battery Level: notifications not enabled Request attribute has encountered an unlikely error"
            "bluetoothd: profiles/input/hog-lib.c:ccc_read_cb() Error reading CCC value: Request attribute has encountered an unlikely error"
            "bluetoothd: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters"
            "bluetoothd: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Parameters"
        inner_dialogue "Everything falls into place. After I remove the duplicates, only a handful of errors remain."
        


blogPage :: ScottyM ()
blogPage = mkRoute "/blogs" "My Blogs" "logo2.svg" $ do
  H.div ! A.class_ "blog-page" $ do
    H.h1 "My Blogs"
    comparingLogMessages
    H.link ! A.rel "stylesheet" ! A.type_ "text/css" ! A.href "/css/style.css"
    H.link ! A.rel "stylesheet" ! A.type_ "text/css" ! A.href "/css/blog-style.css"
