This readMe is related to set-up Automation Framework.

Automation Project set-up

Dependency:

1)	Download JAVA SDK.
https://www.java.com/en/download/mac_download.jsp

2)	Download Android Home SDK
https://developer.android.com/studio

3)	Download NodeJs from
https://nodejs.org/dist/latest-v8.x/

4)	Download Python 2.7.0
https://www.python.org/download/releases/2.7/


5)	Download Git
Change global config of git with below command
git config --global core.autocrlf false
Now,check thaat the changes are done with command "git config --global core.autocrlf" which should return false

Download using HomeBrew:
------------------------
On Mac we can download these dependencies using home brew.
Steps to set-up Brew on mac,
1)	Add command line tool to MAC, for that hit below command in Terminal.
2)	xcode-select –install
                Please note: You should have latest Xcode  to run below         command


3)	brew install JAVA
4)	brew install python@2.7.0
5)	Download the nvm install script via cURL: For reference(https://github.com/nvm-sh/nvm#install-script)
a.	curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash
Ensure that nvm was installed correctly with nvm --version, which should return the version of nvm installed.
Install the version of Node.js you want
b.	Install the latest version with nvm install node
c.	Use the latest version with nvm use node
d.	Install the latest LTS version with nvm install --lts
e.	Use the latest LTS verison with nvm use --lts


-----------------------------------------------------------------------------------


Create BashRC profile:
1.	Start up Terminal.
2.	Type "cd ~/" to go to your home folder.
3.	touch ~/.bashrc
just type "open -e .bashrc "

Add below commands:
export JAVA_HOME='/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home'
export NVM_DIR="/Users/<username>/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
Create Bash Profile:
Type "touch . bash_profile" to create your new file.
Edit . bash_profile with your favorite editor (or you can just type "open -e . bash_profile" to open it in TextEdit).

Copy paste below commands
# Setting PATH for Python 2.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export JAVA_HOME='/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home'
export ANDROID_HOME='/Users/Debenhams/Library/Android/sdk'
export PATH=${JAVA_HOME}/bin:$PATH
export PKG_CONFIG_PATH=$(find /usr/local/Cellar -name 'pkgconfig' -type d |
grep lib/pkgconfig | tr '\n' ':' | sed s/.$//)
source ~/.bashrc
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

*******************************************************



Step 6) Clone the git repository: clone url--https://username@tools.publicis.sapient.com/bitbucket/scm/dbnhst/debenhams-progressive.git

Step 7)  Now , check branch with command : git branch

Step 8) Switch to branch : git checkout e2e/develop-desktop-e2e

Step 7) Create a new branch for yourself : git branch
<branchname(please use proper naming convention starting e2e-)>

Step 8) Now switch to your branch : git checkout <your branchname>

Step 9) Move to the git folder on your system and navigate to <\debenhams-progressive\web> folder

Step 10) Right click and select "Git Bash Here"

Step 11) Now, write npm install and click enter and wait for it to complete

Step 11) Run npm run ssr  command in terminal to run the code in local
Step12) Add Folder to VS Code:

	Download VS code for MAC/Windows
    Add project folder to VS code


Step 12: Run TEST_PROFILE=”bundleUat1” TEST_DATA_SET=“TABLET-ROI” TAG=“automatedSanity” INSTANCE=“chrome" npm run test:automation To run your test cases to verify everything is working fine


















