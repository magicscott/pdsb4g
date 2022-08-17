# pdsb4g
PDS Bridge for GIT

Utility to synchronize zOS Particioned DataSets (PDS) with a GitHub repo automatically and bi-directional

Requirements:
- Windows 
- zowe
- zOSMF REST APIs installed on the Mainframe 
- ooRexx
- local git global configured:
   - git config --global user.name myusername
   - git config --global user.email myemail
   - git config --global github.user myusername
   - git config --global github.token mytoken

Instructions
- 1. Plant a tree
- 2. Create an empty GitHub repo
- 3. Edit config.json
   - 3.1. Set the HLQs in the format:
      - "hlq.1"   : "CUST001.M*",
      - "hlq.2"   : "CUST002.M*",
      -  ... numbers must be in sequential order
   - 3.2. Set your GitHub repo name in "ghrepo"  
   - 3.3. To have bidirectional synch leave pds2git and git2pds values set to "Y"
   - 3.4. Set the cycle time in seconds at "cycle". Value of 1 will synch continously 
   - 3.5. Set the zowe zOSMF profile you want to use at "zosmf_p"
- 4.- Run st.rex 

pdsb4g is set to synchronize only PDS or PDS-E files with LRECL 80, but can be set to synch any dataset on the mainframe. It is meant to version home made ISPF applications that are not included in standard Mainframe SCMs. Also for JCL, Rexx, parm, ISPF panel, ISPF messages, ISPF skeleton libraries. 

The first time the service is executed takes a while until synchronizes PDSs with GitHub depending of the number of PDS and Members. Following times is very fast by updating any change. 

If you just want to se how it works or demo, choose a small amount of PDS and set the cycle to 1 second. 

Once you start the process in cmd line: "rexx st.rex"

- Test1: 
   - Edit a member in 3270 (I don't recommend zowe explorer because it works with cached data and doesn't reflect the updates sometimes), delete a couple of lines and add another. 
   - Delete another member
   - Create a new member
   - Wait a minute before you go to GitHub and see the changes. Edit the member in GitHub that you modified and click on history icon or in the commit code to see the changes.
   - Repeat various times by changing the same member. You'll see the modification history.

- Test2: 
   - Open VSCode (or your preferred IDE)
   - Open your projects folder and open a terminal
   - "git clone <your_github_repo>"
   - Position your prompt in the cloned folder
   - Modify, delete and create new files
   - Update the GitHub repo with your preferred method (GH Desktop, VSCode extension, command line, ...)
      - git add .
      - git commit -m "<any-message>"
      - git push
   - With this method, you will have one commit for all changes you made, so this is better if you want to group changes in a single commit

- Test3:
   - Create a PDS with the same HLQ than the one being synch and feed it with some members
   - Check it exists in GitHub after waiting a few seconds to complete the cycle

- Test4: 
   - Delete the PDS you just created 
   - Check it has disspeared from GitHub after waiting some seconds to complete the cycle

- Test5:
   - Add a new hlq in config.json file: "hlq.3"   : "CUST003.M*",

- Test6:
   - Delete an hlq in config.json file

   Any comment is welcome: diego.rodriguez@broadcom.com , and don't forget to plant the tree
