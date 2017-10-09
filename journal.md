# **ROCO222 LAB-JOURNAL**

## **FAISAL FAZAL-UR-REHMAN, Student ID** 



## **Index**

Please note this is a complete Lab journal with all labs as a scroll view, however you can click the links below to jump to a particular Lab book  

[Lab1 Software engineering for roboticists]()

[Lab2 Build a DC motor]()







# **Lab1 Software engineering for roboticists**


# *Part I*
## *Step 1 – Write your first Markdown document*

**Look on the Web what is Markdown, and start your lab journal using the Markdown syntax. In this first journal entry, describe what Markdown is about, and write down the key syntax rules. For now, you can write a single document for the two of you. Name it journal.md**

Markdown is a language designed to edit text for different layouts and styles in plain text format which is then converted into HTML 

Like any other programming language Markdown has a lot of syntax rules, some of these are as follows:

* Hash key '#' before a sentence from 1 '#' key to 6 keys makes the text size larger for headers, where 1 being the largest size and 6 the smallest

		# H1
     
		## H2

		### H3

		#### H4

		##### H5

		###### H6


* For Bold, italic and crossed out words or sentences:

**Bold** - use double asterics (**) or double underscores (__) before and after the sentence  
*Italic* - use single asteric (*) or single underscore (_) before and after the sentence  
~~crossed out~~ - use double tildes (~~) before and after the sentence   
**Combined Bold and _Italic_** - use the appropriate number for symbols ie use double (**) or (__) for bold before and after words that are meant to be bold and single (*) or (_) for italics


* For a line break without any space between lines use two consecutive spaces followed by enter, at the end of the sentence/line  
For a line break with space between two lines press enter twice at the end of the sentence, ie like a you would in a plain text format

* For numbered list enter a number(1) with a full stop(.) followed by a space and then the sentence followed by an enter:

		1. one

		2. two

		3. three


* For bullet points use (*), (-) or (+) followed by a space for each bullet point:

		* First

		* Second

		* third 




## *Step 2 – Command-line 101*

**Find and open a terminal (also called console).**  

**Try the following commands and briefly write down in your lab journal what they do. If something is not clear, man <command> should provide you with some help (man stands for manual).**


**$ ls**  
provides a list of files present in the current directory

**$ cd /tmp**  
cd = change directory, in this example it changes directory to tmp

**$ cd $HOME # what are those things starting with '$'?**  
$ is a symbol for the shell it means that the terminal can take the code after this symbol

**$ mkdir**  
mkdir = make directory, it makes a new directory

**$ echo "Hello" > hello.md**  
echo is a command of bash (bash provides some added commands for the shell/terminal) which returns arguments for a given command

**$ cat hello.md**  
cat command has three functions, displaying a file, combining copies of files and creating new ones. In this instance a new file named hello in markdown format is created.

**$ cp hello.md hello-again.md**  
cp command makes a copy of the file in the same location or a given destination, in this instance the file hello.md is copied into the same directory but is renamed as hello-again.md
 
**$ mv hello-again.md hello-hello.md**  
mv command moves the file into a new location or the same location with a new name. in this instance the file hello-again.md is renamed into hello-hello.md

**$ rm hello.md**  
rm command removes the specified file. In this instance hello.md file is deleted

**$ rm -rf # be careful with that one!**  
rm -r is a command that deletes files repeatedly eg when removing an entire directory and rm -f command is force remove, together it removes files recursively and forcefully
 
**$ cat /proc/cpuinfo # is 'cpuinfo' a file??**  
This command creates a file called cpuinfo in the proc directory. cpuinfo contains information about the cpu in use.


**Create a roco222 subdirectory in your home directory, then one subdirectory for each of you, and finally a sub-subdirectory named lab-journal. Make a copy of your lab journal in each of these directories.**

```
$ cd $HOME
$ mkdir roco222
$ cd $HOME/roco222
$ mkdir Faisal
$ cd $HOME/roco222/Faisal
$ mkdir lab-journal
$ cd $HOME
$ cp journal.md $HOME/roco222/Faisal/lab-journal
```

## *Step 3 – Create a GitHub account*

**git is a widely-used tool to manage code and other text-based documents. You will use it to manage your lab journal. GitHub is a (proprietary) online platform to share git repositories. While not required to use git, we will make use of GitHub today. If you do not already have an account, create one from the website: https://github.com.**

[![My Github](https://github.com/Faisal-f-rehman/nao/blob/master/nao/github.png?raw=true)](https://github.com/Faisal-f-rehman)


## *Step 4 – Your first git repository*

**Initialise the each of your git repositories by navigating to each of the directories you created. Type git init in there. The name of the directory is the name of your repository.**

**That’s it: a git repository is a regular directory, with one special item: an hidden .git/ directory that stores all the objects git manipulates (mainly binary blobs representing files or parts of files).**

```
$ cd $HOME/roco222/Faisal/lab-journal
$ git init
```

**As this is the first time you are using git, you need to tell it what is your name and what is your email address, so that all your changes are effectively attributed to you. In each of the repositories, type:**

```
**_$ git config user.name "Firstname Surname"_**
**_$ git config user.email "<email>"_**
```

## *Step 5 – Your first commit*

**We are going to commit the current state of your lab journal: since the file journal.md is not yet known to git, first add it: git add journal.md , and then create a new commit with git commit.**

**git will ask you for a commit message (a commit message is made of a mandatory one-line summary –usually maximum 72 characters long – and a longer, optional, description that explains in greater details what this commit is about).**

**The commit summary must be concise yet must describe accurately the content of the change. For instance, “Created journal – initial report on Markdown syntax”.**

```
$ git add journal.md
$ git commit -m "first commit"
```

# *Step 6 – Version tracking*

**Add a new entry in your journals describing what you have just learnt about git.**

**Using git status , review the changes and commit them ( git commit <your file> , choosing an appropriate commit message.**

Using git we can record changes to our files over time so that we can recall specific versions later.

```
$ git status  
On branch master
nothing to commit, working directory clean

$git commit journal -m "second commit"
```

# *Step 7 – Going social*

**Until now, you have only worked on a local git repository: this is a perfectly legitimate use of git. As a dis-tributed version control system (DVCS), git is meant to support a wide range of code workflows, including purely local workflows: if you do not need to share your code over Internet, why would you need an Internet connection to benefit code versioning?**

**However, git is particularly powerful when working in groups: the core idea is that each participant own a full copy of a repository, and exchanges commits through pushes (to send commits to others) and pulls (to get commits from others). As you can see on the figure below (and contrary to traditional VCS like SVN), you do not need to use a central server (but you can!): git is distributed, each participant own a full, autonomous copy of the repository and can obtain (pull) commits from any other participant.**

**Distant repositories can be on a remote Internet server like GitHub, on your colleagues’ computers, or even on a USB stick that you carry over with you. git calls them remotes. You can add as many remotes as you want to your local repository by giving them names.**

**Often, you will have one main remote, which is traditionally called origin (but it’s up to you to choose a different name!).**

**Add GitHub as a remote repository to your local git repository.**
**First create an empty repository on GitHub:**

**Name it after your local repository (not mandatory, but convenient), and do not check the checkbox “Initialize this repository with a README” since you already have one.**
**Then, add this remote to your local repository, and push your changes online:**

```
$ cd <REPO DIR> # for instance $HOME/roco222/joe/journal
$ git remote add origin https://github.com/<account>/<repo>.git # add a remote called origin
$ git push -u origin # push all your local commits to GitHub
```

```
$ cd $HOME/roco222/Faisal/lab-journal
$ git remote add origin https://github.com/Faisal-f-rehman/journal.md/tree/master)
$ git push -u origin master
```

I decided to setup ssh route and started getting errors to do with the stream, but after some research online I found out that I was pushing through the wrong repository when I was meant to push the master repository. 

While trying to correct these errors I also learnt that commits where the most recent version of my journal.md file kept in the head of the three stages of git.


# *Part II*
## *Hack into a robot*

**Quite simple really. Figure out a way to log into the robot. Those two bits of information should be sufficient:**  
**it’s an Aldebaran’s Nao and its name is ’chapman’.**

**Obviously, you are not allowed to physically interact with it :-)**

**Once logged onto the robot, the following Python program will get the robot to say something:**

#### Complete the lab journal

**Complete your lab journal with your experience connecting to the robot, commit and push it to your git repo. Include as well the Python script, either as a separate Python file, or directly in your Markdown document (research first how to include code snippets in a Markdown document).**

Connecting to Nao was a very exciting task full of trial and error, full of frustration, confusion and very exhilarating. 

We tried to follow the instructions online to connect to Nao but understandably it didnt point out that Nao could be connected to a local network only, which was pointed out to us by Dr Lemaignan. I also learnt that pings are very small packages sent and received to and from the selected IP address, which made sense, since smaller packages would be faster to transfer.

Then we pinged the name chapman (Nao Robot):

<div style="float: right;"><IMG SRC="https://github.com/Faisal-f-rehman/nao/blob/master/nao/nao.jpg?raw=true" height="30%" width="30%">

```
$ ping chapman.local

```
This gave us the IP address while it was pinging (192.168.0.184)

Then we used the IP address to connect via ssh:  

```
$ ssh nao@192.168.0.184
```
</div>




This connected us to Nao!!!

Once connected, we used the nano text editor and the instructions in the labsheet to enter a text to speech command, and saved it as a python file (.py).

Then in the chapman directory we called the saved python file ($ python filename.py) which executed the file and made nao speak the text provided in the nano text editor("stop hacking me").

[![](https://github.com/Faisal-f-rehman/nao/blob/master/nao/Nao%20youtube.png?raw=true)](https://www.youtube.com/watch?v=ynQ2N2L5ZKI)


References Lab 1:

 [github cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)  
 [edutechional youtube](https://www.youtube.com/watch?v=_gknWWa2OF0)  
 [dev notes](http://dev-notes.eu/2016/01/images-in-kramdown-jekyll/)  


# **Lab2 Build a DC motor**

**What is it about?**  
	Let’s build a DC motor from scratch! You have 2 weeks to: (1) build a first version, (2) iterate 		and optimise the design, (3) build a better version of your motor.

**Aims**  
	At the end of the practical, you should:
	• know the key parts of a DC motor
	• have gained an experimental intuition of the physics behind DC motors
	• have a working and reasonably efficient DC motor that we will re-use during the coming 		  practicals

**Specific Challenges**  
	• A certain sense of meticulousness might be needed for an optimal result
	• You’ll get your hands dirty
	• (and you’ll need to use a soldering iron)


In this lab we are going to build a brushed DC motor with parts that are fairly easy to get and cheap to buy. The parts are as follows:

1) A cork, possibly from a champagne bottle :D
2) Approximately 10m of copper wire
3) 4 large paperclips
4) 4 screws with washers
5) 4 Rare Earth (Neodymium Magnets)
6) 2 thin but long (about 3.5cm long) nails
7) Approximately 0.5cm thick and about 10-12cm square wooden base
8) DC power supply or a battery






