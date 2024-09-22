# **Super Mario Eclipse - Translation Station**

## **Table of Contents**
- [About the Project](#about-the-project)
- [Useful Tools](#useful-tools)
- [How can I help?](#how-can-i-help)
  - [Using Discord](#using-discord)
  - [Using GitHub](#using-github)
- [Editing File Formats](#editing-file-formats)
  - [Edit bmg Files](#edit-bmg-files)
  - [Edit txt Files](#edit-txt-files)
- [Extract Files and test them in the Game](#extract-files-and-test-them-in-the-game)
  
---

## **About the Project**
This repository is a community translation project for **Super Mario Eclipse**, a modification of Super Mario Sunshine. It contains all important message files from the game and also texture dumps for the graphical texts. We would like to translate the message files so that the game is not only available in english, but also in the languages represented here in the repo.

---

## **Useful Tools**

To collaborate on this project, you will need certain tools that will make it easier for you to edit the files. Here are some useful tools:

- [Switch-Toolbox](https://github.com/KillzXGaming/Switch-Toolbox) for extracting the `.iso` and for editing/searching certain files
- [SMS Message Editor](https://github.com/JoshuaMKW/SMS-Message-Editor) for editing `.bmg` files with ingame view
- [Wiimms SZS Toolset](https://szs.wiimm.de/) for extracting `.szs` files, converting `.bmg` into `.txt` and `.txt` back into `.bmg`
- [SMS Modding Wiki](https://smswiki.shoutwiki.com/wiki/Docs)
- For translators, [here](https://docs.google.com/spreadsheets/d/16SODPmaqB_A6rrQJlQv6CGCsJy6uu63B0eXsxvo3BuU/edit?usp=sharing) is a link to idioms and other localization things from the English script

---

## **How can I help?**

### **Using Discord**
To exchange ideas with other contributors and ask questions, you can join the **Super Mario Eclipse Discord Server**: <br />
[https://discord.com/invite/u6NHuHVRpJ](https://discord.com/invite/u6NHuHVRpJ)

You can go into the `#general-lang` channel and write which language you would like to help with.

### **Using Github**
To have easier access to the files and also to be able to edit them more easily, you can fork this repo and then make your own changes in your repo. If you want to commit the changes and send them to the main branch here, you can create a pull request.


---

## **Editing File Formats**

### **Edit bmg Files**
**Bmg** files are the central format for message files in this project. To edit them, you need the following tool:

The **SMS Message Editor** allows you to open and edit the bmg files.
You even have an additional ingame view of how the dialogue would look ingame.
(For more information, please refer to the linked repo)

The disadvantage of the SMS Message Editor is that it still has problems displaying special characters from other languages. 
This means that characters such as ä, ü, ö, ß, é, è, ê, ç, etc. (and Japanese characters) cannot really be displayed, which is why we now look at the txt method.


### **Edit txt Files**
**Txt** files are easier to edit in that sense, but you also have to pay attention to several things.
Here are the basic things:

1. Open the txt file with an editor of your choice.
2. Edit the text passages, make sure to keep formatting (\n, \z{}, etc.).
3. Save the file after your changes.

Unfortunately, the disadvantage of this method is that you now have to encode the txt file to get a bmg file so that the changes can be tested in the game. 
This is not necessarily difficult, but can be very time-consuming depending on the frequency of changes and the number of files.

---

## **Extract Files and test them in the Game**

1. **Extract the Files**:  
   If you want to extract the files from the game again (or just a few of them), you can do this as follows:
   - Extract the game in Dolphin Emulator
   - Use either Switch Toolbox or Wiimms SZS Toolset (Terminal only) to further extract the .szs files
   
2. **Test Files in the Game**:  
   To test your changes in the game:
   - For Switch Toolbox:
      - Drag only one `.szs` file into the program and edit this version 
      - Search for the respective file path where the bmg files of the game are located
        (Tip: In this repo, the paths of the game files are arranged as you would find them in the respective game)
      - When you have found the file, you have to renew or overwrite it with your new bmg version (can corrupt very easily for whatever reason if you do something wrong); right-click the file in Toolbox and renew it
      - Once you have changed all files, you have to save your edited szs file
      - After the file has been saved, you can check the main.dol of the reextracted game version in the Dolphin Emulator

---

## **Contact**

For inquiries or further assistance, please reach out via GitHub or the Discord server.

---

STILL WORK IN PROGRESS...

---
