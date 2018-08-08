#!/usr/bin/env bash

SRCAW="./tmp/source.jpg"
DSTAW="./tmp/result.jpg"
SRC="./tmp/source.mp3"
DST="./tmp/result.mp3"

function CreateTestMP3 {

    base64 --decode > $SRC << EOF
//uUZAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAWGluZwAAAA8AAAACAAAE4ADj4+Pj
4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj////////////////
//////////////////////////////////////////////////8AAABQTEFNRTMuMTAwBLkAAAAA
AAAAADUgJAaQjQAB4AAABOClHWotAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA//vURAAAAioAXeAAAAA5
wAvMAAAAC4wteee9gQGnBW7495govjctbLXcgH1CAEATB8/E4IAg6DgIHMEMTg4CAIBjEAIO6wfD
HrD+D+CAJv/g4CAIAgGAfB8Hz//+CAIZQMfD//lwfB8H9HLb40kq8nBOD59YPg+XB8QAgciQEKwf
BDh7wfB8H/xACAIHMu/E4P//qBAMYIBj/Wa9Z/Ln8QA+H97e/M6SJuONIhFC3AZgMwmwuQ4lUdoc
RpE6A8IxOLX5rJjUFQVOwVBU6sFQVDTpUFQVBoGvBUFYKgqGuoGj0RB2oGga5UFQVBY9+IgZDXLH
vgqCuCoK/4iBk7/9W71Vv1JmlL0l1COiGmSkAhxpE6IMW0FSOEfs23NBSRLSoKgrBUFQ1BUFQ0oF
TpYGgZOqBoGmwVBUFga+oGgZBVwiBoFYieoGgaPSwdwWBoO/1gqCsqCuDLlA0DVQNB2WBoGgaBU7
/1gqCypMQU1FMy4xMDCqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
qqqqqqqqqqqqqqqq//sUZMsP8AAAaQAAAAgAAA0gAAABAAABpAAAACAAADSAAAAEqqqqqqqqqqqq
qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
EOF

}
function CreateTestJPG {

    base64 --decode > $SRCAW << EOF
/9j/4AAQSkZJRgABAQEAYABgAAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8UHRofHh0a
HBwgJC4nICIsIxwcKDcpLDAxNDQ0Hyc5PTgyPC4zNDL/2wBDAQkJCQwLDBgNDRgyIRwhMjIyMjIy
MjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjL/wAARCAABAAEDASIA
AhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA
AAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3
ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm
p6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA
AwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx
BhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK
U1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3
uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD3+iii
gD//2Q==
EOF
}

function PrintHeader {
    echo -e "\n\e[1;37mTest set: \e[1;36m$@\e[0m"
}
function PrintTest {
    echo -e -n "\e[1;37m[\e[s ]\e[1;34m $@\e[0m"
}

function CheckResult {
    CHECKSUM=$(md5sum $DST 2> /dev/null | cut -d " " -f 1)

    if [ "$1" == "$CHECKSUM" ] ; then
        echo -e "\e[u\e[1;32m✔"
    else
        echo -e "\e[u\e[1;31m✘"
    fi
}
function CheckValues {
    if [ "$1" == "$2" ] ; then
        echo -e "\e[u\e[1;32m✔"
    else
        echo -e "\e[u\e[1;31m✘"
    fi
}


echo -e "\e[1;37mRunning tests …\e[0m"
mkdir ./tmp
cp ../id3edit ./id3edit

./encodingtest.sh


PrintHeader "Creating ID3 Tags"
CreateTestMP3
PrintTest "Source file OK"
cp "$SRC" "$DST"
CheckResult "3064cf73aa8541e96201f8fab55293b2"

PrintTest "Create new ID3 Tag for new file"
CreateTestMP3
./id3edit --create --outfile $DST $SRC
CheckResult "22d57cc617b98a5a9ec0fd4c710d1bb3"

PrintTest "Create new ID3 Tag and overwrite source"
CreateTestMP3
./id3edit --create $SRC
cp "$SRC" "$DST"
CheckResult "22d57cc617b98a5a9ec0fd4c710d1bb3"

PrintTest "Create a clean ID3 Tag"
CreateTestMP3
./id3edit --create --clear $SRC
cp "$SRC" "$DST"
CheckResult "22d57cc617b98a5a9ec0fd4c710d1bb3"



PrintHeader "Creating and editing Text Frames"
CreateTestMP3

PrintTest "Create new ID3 Tag and set a Text Frame (with Unicode)"
./id3edit --create --set-name "This is a test 😈" --outfile $DST $SRC
CheckResult "b094b92ff7873618aebcc819d8b36355"

PrintTest "Replace Text Frame with shorter text"
./id3edit --set-name "Test" $DST
CheckResult "bff0a4da32a384cd333fcb9f02c051bd"

PrintTest "Replace Text Frame with longer text"
./id3edit --set-name "A very very long text with lots of characters" $DST
CheckResult "6edf30aaad00fa088c25960467ca4f1b"

PrintTest "Remove all Frames from ID3 Tag"
./id3edit --clear $DST
CheckResult "22d57cc617b98a5a9ec0fd4c710d1bb3"

PrintTest "Try replacing Text Frame with read-only flag"
./id3edit --set-name "Test" $DST
./id3edit --readonly --set-name "This is a test 😈" $DST
CheckResult "bff0a4da32a384cd333fcb9f02c051bd"




PrintHeader "Creating and editing artwork"
CreateTestMP3
CreateTestJPG
./id3edit --create --clear $SRC

PrintTest "Add artwork"
./id3edit --set-artwork $SRCAW --outfile $DST $SRC
CheckResult "dba22cda9ec6a901a349403a800e3eb2"

# Not yet in stable state
#PrintTest "Get artwork"
#./id3edit --get-artwork $DSTAW $SRC
#SRCSUM=$(md5sum $SRCAW 2> /dev/null | cut -d " " -f 1)
#DSTSUM=$(md5sum $DSTAW 2> /dev/null | cut -d " " -f 1)
#CheckValues $SRCSUM $DSTSUM


echo -e "\n\e[1;37mRemoving tests …\e[0m"
rm $SRCAW
rm $DSTAW
rm $SRC
rm $DST
rm ./id3edit
rmdir ./tmp

# vim: tabstop=4 expandtab shiftwidth=4 softtabstop=4
