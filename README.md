bashscripting
=============

A collection of scripts (for unix), here's what they do:

#### Count words on a .docx file
**word-limit.py** count how many words a .docx file has, like a file for ACM CHI conference or ACM UIST, you can skip automatically over captions or include them, or even see the count with or without references. You call it like ``>python3 word-limit.py --help`` to get started.

#### IUI / control you OS
**presentationMode.sh**: stops dropbox, chrome and flux when you wanna give a presentation. no interruptions.   
**presentationWarning**: apple script that shoots a warning when you start Powerpoint: do you want presentation mode?
**checkprocess**: checks if a process is running on your CPU. I use it for checking if Flux is running before giving a talk.  
**macpopup**	  
**ram**: tells you how the ram is going.  
* * *
#### crypto
**encrypt.sh**	encrypts a file that is stored on dropbox, deletes original and restarts dropbox process  (see all options)
**decrypt.sh**: decrypts a file that is stored on dropbox, thus stops dropbox process first (see all options)
* * *
#### git / code management
**updateAll.sh**:	git script that updates all submodules, useful for maintaining git with sub-projects  
**gitall**: git script that (1) adds all files, (2) commits and (3) pushes  
* * *
#### video & audio
**ffcat**: fast concatenation of video files, using ffmpeg
* * *
#### randomness
**choose**:allows you to randomize a decision, yes/no  
**random**: outputs a random number  
* * *
#### PDF & text
**PDF2captions**:gets image captions on a PDF (for specific format), check it at https://github.com/PedroLopes/pdf2captions
* * *



