#/usr/bin/bash
#
# htmlemailbp.sh
# 
# License: The MIT License (MIT)
# Copyright © 2021 Thomas Stratton
# Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
# The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
# THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.Thomas Stratton
# --------
# Note: The html code is adapted from htmlemailboilerplate under the MIT license.
# https://github.com/seanpowell/Email-Boilerplate#license
# Thank you to the htmlemailboilerplate team!


hebpHelp(){
echo 'htmlemailbp.sh prints portions of html email boilerplate code, '
echo 'so we can use it in shell scripts and easily inject elements.'
echo
echo 'usage: htmlemailbp.sh (options)'
echo
echo 'options:'
echo    '-?|--help     print this message and exit.'
echo    '1|-h|--head   print template from start of html through head open tag.'
echo    '2|-s|--style  print template styles (from start of style tag through just before end of style tag).'
echo    '3|-b|--body   print close of style and head tags and beginning of body.'
echo    '4|-e|--end    print all closing tags to end of file.'
}

#parse arguments and run arg tasks
hebpRun(){
while [[ $# -gt 0 ]]; do
  key="$1"

  case $key in
    '-?'|'--help')
      hebpHelp
      shift # parse next arg
      ;;
    1|'-h'|'--head') 
      hebpHead
      shift # parse next arg
      ;;
    2|'-s'|'--style') 
      hebpStyle
      shift # parse next arg
      ;;
    3|'-b'|'--body') 
      hebpBody
      shift # parse next arg
      ;;
    4|'-e'|'--end')
      hebpEnd
      shift # parse next arg
      ;;
    *)    # unknown
      echo 'htmlemailbp.sh unknown argument: "'"$1"'"'
      shift # past argument
      ;;
      
  esac
done
}

hebpHead(){
# strip out single line comments from heredoc output (<!--comment--> or /*comment*/)
egrep -v '<!--.*-->|\/\*.*\*\/' << :htmlemail.template.part1
<!--begin head template-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--@adapted from http://htmlemailboilerplate.com/@-->
<!--@this part of the template beginst with ends before the style closing tag so we can insert@--> 
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>Content Update Summary</title>
<style type="text/css">
   @import url("https://fonts.googleapis.com/css2?family=Raleway:wght@600&display=swap");
#outlook a {padding:0;}
body{width:100% !important; -webkit-text-size-adjust:100%; -ms-text-size-adjust:100%; margin:0; padding:0;font-family: "Raleway", "sans-serif";font-size: 12px; font-feature-settings: "ss01" 1, "ss03" 1, "ss05" 1, "ss08" 1, "ss09" 1, "ss11" 1;}
.ExternalClass {width:100%;}
.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div {line-height: 100%;}
#backgroundTable {margin:0; padding:0; width:100% !important; line-height: 100% !important;}
img {outline:none; text-decoration:none; -ms-interpolation-mode: bicubic;}
a img {border:none;}
.image_fix {display:block;}
p {margin: 1em 0;}
h1, h2, h3, h4, h5, h6 {color: black !important;}
h1 a, h2 a, h3 a, h4 a, h5 a, h6 a {color: blue !important;}
h1 a:active, h2 a:active,  h3 a:active, h4 a:active, h5 a:active, h6 a:active {
color: red !important;
}
h1 a:visited, h2 a:visited,  h3 a:visited, h4 a:visited, h5 a:visited, h6 a:visited {
color: purple !important;
}
table td {border-collapse: collapse;}
table { border-collapse:collapse; mso-table-lspace:0pt; mso-table-rspace:0pt; }
a {color: orange;}
@media only screen and (max-device-width: 480px) {
a[href^="tel"], a[href^="sms"] {
text-decoration: none;
color: black; /* or whatever your want */
pointer-events: none;
cursor: default;
}
.mobile_link a[href^="tel"], .mobile_link a[href^="sms"] {
text-decoration: default;
color: orange !important; /* or whatever your want */
pointer-events: auto;
cursor: default;
}
}
@media only screen and (min-device-width: 768px) and (max-device-width: 1024px) {
a[href^="tel"], a[href^="sms"] {
text-decoration: none;
color: blue;
pointer-events: none;
cursor: default;
}
.mobile_link a[href^="tel"], .mobile_link a[href^="sms"] {
text-decoration: default;
color: orange !important;
pointer-events: auto;
cursor: default;
}
}
@media only screen and (-webkit-min-device-pixel-ratio: 2) {
/* iPhone 4g styles */
}
@media only screen and (-webkit-device-pixel-ratio:.75){
/* CSS for low density (ldpi) Android layout */
}
@media only screen and (-webkit-device-pixel-ratio:1){
/* CSS for medium density (mdpi) Android layout */
}
@media only screen and (-webkit-device-pixel-ratio:1.5){
/* CSS for high density (hdpi) Android layout */
}
<!--end head template-->
:htmlemail.template.part1
}

hebpStyle(){
# strip out single line comments from heredoc output (<!--comment--> or /*comment*/)
egrep -v '<!--.*-->|\/\*.*\*\/' << :htmlemail.template.part2
<!--begin style-start template-->
#TODO
<!--end style-start template-->
:htmlemail.template.part2
}

hebpBody(){
# strip out single line comments from heredoc output (<!--comment--> or /*comment*/)
egrep -v '<!--.*-->|\/\*.*\*\/' << :htmlemail.template.part3
<!--begin body-start template-->
#TODO
<!--end body-start template-->
:htmlemail.template.part3
}

hebpEnd(){
# strip out single line comments from heredoc output (<!--comment--> or /*comment*/)
egrep -v '<!--.*-->|\/\*.*\*\/' << :htmlemail.template.part4
<!--begin end template-->
#TODO
<!--end end template-->
:htmlemail.template.part4
}

#echo $*
hebpRun $*
