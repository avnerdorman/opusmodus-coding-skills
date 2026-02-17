Opusmodus                                                                      count-lyrics     1

count-lyrics text
[Function]

Arguments and Values:
text                     a string list of text.


Description:

This function counts all words and their syllabic divisions within a body of lyrics. Use this
function to test if the pitch list and the text list are of the same length.


Examples:
(setf text
        '("Als der gü-ti-ge Gott voll-en-den wollt' sein Wort,
           sandt er sein' En-gel schnell, dess Na-me
           Ga-bri-el__ __, in's ga-li-lä-isch Land."))

(count-lyrics text)
=> 31
