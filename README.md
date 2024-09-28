# **Super Mario Eclipse - Translation Station**

## **Table of Contents**
- [About the Project](#about-the-project)
- [Useful Tools](#useful-tools)
- [How Can I Help?](#how-can-i-help)
  - [Using Discord](#using-discord)
  - [Using GitHub](#using-github)
- [Editing File Formats](#editing-file-formats)
  - [Editing .bmg Files](#editing-bmg-files)
  - [Editing .txt Files](#editing-txt-files)
- [Extracting Files and Testing in the Game](#extracting-files-and-testing-in-the-game)
- [Contact](#contact)

---

## **About the Project**
This repository is a community-driven translation project for **Super Mario Eclipse**, a modification of Super Mario Sunshine. It contains all the important message files from the game, as well as texture dumps for the graphical texts. Our goal is to translate these message files so that the game is available not only in English but also in other languages represented in this repo.

---

## **Useful Tools**

To collaborate on this project, you'll need certain tools to make editing the files easier. Here are some useful tools:

- [Switch-Toolbox](https://github.com/KillzXGaming/Switch-Toolbox) for extracting the `.iso` and editing/searching certain files
- [SMS Message Editor](https://github.com/JoshuaMKW/SMS-Message-Editor) for editing `.bmg` files with an in-game view
- [Wiimms SZS Toolset](https://szs.wiimm.de/) for extracting `.szs` files and converting `.bmg` into `.txt` and vice versa
- [Gamecube File Tools](https://github.com/LagoLunatic/GCFT) for editing Gamecube Game files like `.bti`
- [SMS Modding Wiki](https://smswiki.shoutwiki.com/wiki/Docs) for documentation
- For translators, [here is a link](https://docs.google.com/spreadsheets/d/16SODPmaqB_A6rrQJlQv6CGCsJy6uu63B0eXsxvo3BuU/edit?usp=sharing) to idioms and other localization resources from the English script

---

## **How Can I Help?**

### **Using Discord**
To collaborate with other contributors and ask questions, you can join the **Super Mario Eclipse Discord Server**:

[https://discord.com/invite/u6NHuHVRpJ](https://discord.com/invite/u6NHuHVRpJ)

You can go to the `#general-lang` channel and mention which language you'd like to help with.

### **Using GitHub**
For easier access and editing, you can fork this repository and make your own changes. If you'd like to contribute your changes back to the main branch, you can create a pull request.

---

## **Editing File Formats**

### **Editing .bmg Files**
**.bmg** files are the primary format for message files in this project. To edit them, you can use the **SMS Message Editor**, which allows you to open and edit `.bmg` files. It even provides an in-game preview of how the dialogue will appear. (For more information, please refer to the linked repository.)

However, a limitation of the SMS Message Editor is that it currently has issues displaying special characters from other languages. Characters like ä, ü, ö, ß, é, è, ê, ç, and Japanese characters may not display correctly. Therefore, we also provide the `.txt` method as an alternative.

### **Editing .txt Files**
Editing **.txt** files can be simpler, but you need to pay attention to certain details:

1. Open the `.txt` file with an editor of your choice.
2. Edit the text passages, ensuring you preserve the formatting (e.g., `\n`, `\z{}`, etc.).
3. Save the file after making your changes.

The downside of this method is that you need to encode the `.txt` file back into a `.bmg` file to test your changes in the game. While not necessarily difficult, this process can be time-consuming, especially with frequent changes or multiple files.

---

## **Extracting Files and Testing in the Game**

1. **Extract the Files**:  
   To extract files from the game (or just specific ones), follow these steps:
   - Extract the game using the Dolphin Emulator.
   - Use either Switch Toolbox or Wiimms SZS Toolset (terminal only) to further extract the `.szs` files.

2. **Test Files in the Game**:  
   To test your changes in the game:
   - Using Switch Toolbox:
     - Drag a single `.szs` file into the program and edit it.
     - Navigate to the file path where the game's `.bmg` files are located.
       *(Tip: In this repository, the file paths are organized as they are in the game.)*
     - Once you've found the file, replace it with your new `.bmg` version.
       *(Note: Be careful during this step to avoid corruption; right-click the file in Toolbox and choose to replace it.)*
     - After modifying all necessary files, save your edited `.szs` file.
     - Once saved, you can test the modified game version in the Dolphin Emulator.

---

## **Contact**

For inquiries or further assistance, please reach out via GitHub or the Discord server.

---

*STILL WORK IN PROGRESS...*

---
