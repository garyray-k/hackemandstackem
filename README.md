# hackemandstackem
https://hackemstackem.com/   URL no longer valid

ManTech advertised a CTF on LinkedIn that I found via the VetSec Slack I'm in.

When you first land on the page you're hit with the text "GREETINGS PROFESSOR FALKEN." followed by a blinking cursor that allows input. Incorrect input sent you to https://www.youtube.com/watch?v=cQ_b4_lw0Gg but I assumed the input was somewhere on the page.

Checking the web console revealed a [wargames.js](https://github.com/garyray-k/hackemandstackem/blob/master/wargames.js) which had to be prettified from it's one line gobbly-gook. Once I prettified and dug through the code I ended up with [this](https://github.com/garyray-k/hackemandstackem/blob/master/hackemandstackem.js). Keep reading below for the process I used.

The file begins with an array of seemingly random array of sutff. Including the link to the 'wrong answer' video and some other quotes from the movie Wargames. The site is using this somehow, but how? I started dissecting the functions.

Determined the first function just pushed and popped the array at the beginning to a different order. This would be signifigant later. It does so 241 times. Once it was done I took the array and put the newly ordered on in my code for reference.

The second assigned `var b` to index `e` of the primary array at the top of the file. More indication of the signifigance of the array. 

Further down is a function that's not called in the regular loading of the page. I know because I stepped through in Chrome Dev tools to see what functions were called and what happened when they were called. Inside of this function was a bunch of switch statments and excessive use of the `b` function. I began using the newly ordered array to substitue things within the code when `b` was called. This definiteky started to clear things up. I saw some `oninput` references, which makes sense since the page wants the user to type something in. Once you type and hit enter it checks the value of the input and progresses to the next line. Once you get to the end of the dialog, it takes you to a second page which advertised the CTF time and location. It also had some poker chips which could be clicked. Some of which allowed for immediate download of some files. [intelligence](https://github.com/garyray-k/hackemandstackem/tree/master/intelligence) and [passwords](https://github.com/garyray-k/hackemandstackem/tree/master/passwords)

Inside passwords were just that, md5 hashes of passwords. Through it into an online md5 hash checker and you can see a 7 character lowercase word followed by a four digit number (which ended up being a year). Hashcat for a bit and you get some results.

Unfortunately, I've been unable to decipher the stuff in intelligence. But did give it a try with [decrypt.sh](https://github.com/garyray-k/hackemandstackem/blob/master/intelligence/decrypt.sh).
