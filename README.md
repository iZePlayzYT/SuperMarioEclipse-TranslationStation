# **Super Mario Eclipse - Translation Station**

## **Table of Contents**
- [About the Project](#about-the-project)
- [Useful Tools](#useful-tools)
- [How can I help?](#how-can-i-help)
  - [Using Discord](#using-discord)
  - [Using GitHub](#using-github)

- [Dateiformate bearbeiten](#dateiformate-bearbeiten)
  - [bmg-Dateien bearbeiten](#bmg-dateien-bearbeiten)
  - [txt-Dateien bearbeiten](#txt-dateien-bearbeiten)
- [Dateien extrahieren und im Spiel testen](#dateien-extrahieren-und-im-spiel-testen)
  
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

---

## **How can I help?**

### **Using Discord**
To exchange ideas with other contributors and ask questions, you can join the **Super Mario Eclipse Discord Server**: 

[https://discord.com/invite/u6NHuHVRpJ](https://discord.com/invite/u6NHuHVRpJ)

You can go into the `#general-lang` channel and write which language you would like to help with.

### **Using Github**
To have easier access to the files and also to be able to edit them more easily, you can fork this repo and then make your own changes in your repo. If you want to commit the changes and send them to the main branch here, you can create a pull request.

---

## **Dateiformate bearbeiten**

### **bmg-Dateien bearbeiten**
**bmg**-Dateien sind das zentrale Format für Textdateien in diesem Projekt. Um diese zu bearbeiten, brauchst du das folgende Tool:

Der **SMS Message Editor** ermöglicht es, die bmg-Dateien zu öffnen und zu bearbeiten.
Man hat sogar zusätzlich eine ingame view, wie der dialog vom platz her ingame aussehen würde.
(Für mehr Infos, gerne im verlinkten Repo nachlesen)

Der Nachteil vom SMS Message Editor ist momanten leider noch, dass dieser Probleme bei der Darstellung spezieller Zeichen aus 
anderen Sprachen hat. Das heißt Zeichen wie ä, ü, ö, ß, é, è, ê, ç, usw. (und japanische Zeichen) sind nicht wirklich darstellbar, weshalb wir uns hierfür 
die txt methode anschauen. 


### **txt-Dateien bearbeiten**
**txt**-Dateien sind in dem Sinne leichter zu bearbeiten, aber man muss auch auf mehrere Dinge achten, als bei den bmg-Dateien. 
Hier sind die grundlegenden Dinge:

1. Öffne die txt-Datei mit einem editor deiner wahl.
2. Bearbeite die Textpassagen, achte darauf, Formatierungen beizubehalten (\n, \z{}, usw.).
3. Speichere die Datei nach deinen Änderungen.

Der Nachteil an dieser Methode ist leider, dass man die txt-Datei jetzt encoden muss, um eine bmg-Datei zu erhalten, damit die Änderungen im Spiel getestet werden können. 
Das ist nicht unbedingt schwierig, kann aber je nach Änderungshäufigkeit und Vielzahl an Dateien, sehr aufwendig werden.

---

## **Dateien extrahieren und im Spiel testen**

1. **Extrahieren der Dateien**:  
   Falls du selbst nochmal die Dateien aus dem Spiel extrahieren möchtest (oder nur vereinzelte) dann geht das wie folgt:
   - Extrahiere das Spiel im Dolphin Emulator
   - Nutze entweder Switch Toolbox oder Wiimms SZS Toolset (Terminal only) um die .szs Dateien weiter extracten zu können
   
3. **Dateien im Spiel testen**:  
   Um deine Änderungen im Spiel zu testen:
   - Für Switch Toolbox:
      - Ziehe nur eine .szs Datei in das Programm rein und bearbeite diese Fassung 
      - Suche nach dem jeweiligen Dateipfad, wo sich die bmg dateien des Spiels befinden
        (Tipp: In diesem Repo sind die Ordnerpfade der Gamefiles so angeordnet, wie man sie auch in dem jeweilige Spiel finden würde)
      - Wenn du die Datei gefunden hast, musst du diese mit deiner neuen bmg fassung renewen bzw überschreiben (kann warum auch immer sehr leicht corrupten, wenn man was falsch macht)
      - Hast du alle Dateien abgeändert, musst du deine bearbeitete Datei noch abspeichern
      - Nachdem die Datei gespeichert wurde, kannst du im Dolphin Emulator die main.dol der überarbeiten Spielvariante überprüfen

---

## **Credits**

- **iZePlayz**: Creator of the HD and 4K textures.
- **AlexWolfz**: Converted the textures to DDS format.
- **Venomalia**: Created the Dolphin Texture Dumping tool and upscaling models.

---

## **Contact**

For inquiries or further assistance, please reach out via GitHub or the Discord server.


---

### **Danke für deine Mithilfe!**

---


# **For translators, here is a link to idioms and other localization things from the English script: https://docs.google.com/spreadsheets/d/16SODPmaqB_A6rrQJlQv6CGCsJy6uu63B0eXsxvo3BuU/edit?usp=sharing**

# **[THIS README IS JUST COPIED AND PASTED FROM AN OTHER REPO, IT STILL NEEDS TO BE ADJUSTED!]**
# **[THIS README IS JUST COPIED AND PASTED FROM AN OTHER REPO, IT STILL NEEDS TO BE ADJUSTED!]**

This repository contains 4K and HD texture packs for **Super Mario Eclipse**, a modification of Super Mario Sunshine. The texture packs significantly enhance the visual quality of the game and are available in both PNG and DDS formats, depending on performance and quality requirements in the Dolphin Emulator.

## **Table of Contents**
1. [Texture Packs](#texture-packs)
2. [How to Install Custom Textures in Dolphin](#how-to-install-custom-textures-in-dolphin)
3. [Upscaling Process](#upscaling-process)
4. [Unmodified Texture Dumps](#unmodified-texture-dumps)
5. [Texture Dumping Tool](#texture-dumping-tool)
6. [Contributing](#contributing)
7. [Credits](#credits)

---

## **Texture Packs**

There are four different versions of the texture packs available for download in the **Releases** section of the main branch:

- **4K PNG Texture Pack**: Offers maximum visual quality.
- **HD PNG Texture Pack**: Provides high quality while maintaining a balance between quality and performance.
- **4K DDS Texture Pack**: Optimized for faster loading times while retaining 4K textures.
- **HD DDS Texture Pack**: Optimized for performance with fast loading times and high-quality textures.

Each version is designed to meet different performance needs, ensuring users can choose based on their hardware capabilities.

---

## **How to Install Custom Textures in Dolphin**

### **1. Preparing Dolphin Emulator**
Ensure that the latest version of Dolphin Emulator is installed. The latest version can be downloaded from [https://dolphin-emu.org/](https://dolphin-emu.org/).

### **2. Configuring Dolphin Emulator Settings**
The following settings must be enabled in Dolphin to correctly load the custom textures:

1. Open Dolphin Emulator.
2. Go to `Graphics Settings` > `Advanced` tab and enable:
   - **Load Custom Textures**: This setting allows the emulator to load external texture packs.
   - **Prefetch Custom Textures** (Optional): Improves performance by preloading all textures into memory.

### **3. Increasing Internal Resolution**
To display high-resolution textures correctly, it is essential to adjust the internal resolution:

1. Go to `Graphics Settings` > `Enhancements` tab.
2. Set the **Internal Resolution** according to your display and hardware capabilities:
   - For 1080p displays, the HD texture pack is recommended for better performance.
   - If your system is capable, the 4K texture pack can be used even on a 1080p display, as it provides better quality than the HD pack.
   - For 1440p (2K) or higher displays, the difference between the HD and 4K packs becomes more apparent. Using the 4K pack is recommended for the best visual experience.

   **Note**: Adjusting the internal resolution is necessary to properly display high-resolution textures. Without this adjustment, the textures may not appear as intended.

### **4. Place Textures in the Correct Directory**
Navigate to Dolphin Emulator’s **User Directory**:

- **Windows**: Go to `C:\Users\<YourUsername>\AppData\Roaming\Dolphin Emulator\Load\Textures\`. You can also quickly access this by typing `%appdata%` in the Windows search bar, then navigating to `Dolphin Emulator/Load/Textures/`.
- **macOS**: Navigate to `~/Library/Application Support/Dolphin/Load/Textures/`.
- **Linux**: Navigate to `~/.local/share/dolphin-emu/Load/Textures/`.

Place the texture files directly in the `GMSE04` folder inside the `Load/Textures` directory.

**Important:**
- If the texture pack you downloaded already contains a `GMSE04` folder, do **not** copy the entire folder into `Load/Textures/GMSE04`. Instead, open the `GMSE04` folder from the texture pack and place its contents directly into `Load/Textures/GMSE04`.
- If the texture pack contains only the texture files (without a `GMSE04` folder), place those texture files directly into `Load/Textures/GMSE04`.
- If the `GMSE04` folder doesn’t exist in the `Load/Textures` directory, create it manually and place the files there.

### **5. Launching the Game**
Once the textures are placed in the correct folder and the settings are configured, launch **Super Mario Eclipse** in Dolphin. The custom textures will load automatically.

---

## **Upscaling Process**

Follow these steps to upscale textures using **Chainner**:

1. Download and install the latest version of Chainner here: [https://github.com/chaiNNer-org/chaiNNer/releases](https://github.com/chaiNNer-org/chaiNNer/releases).  
2. Install all packages ("PyTorch", "NCNN", "ONNX" including all sub-packages of each package) in the Dependency Manager of Chainner.  
3. Download & open the chain from `OTHER_FILES/UPSCALING.chn` in Chainner and get the 4 different models used in the chain from here: [https://github.com/Venomalia/Hdcube](https://github.com/Venomalia/Hdcube).  
4. In Chainner, after you have loaded the chain, change the paths of the **input** and **output** folders as well as the paths for the 4 models used in the chain.  
5. Press the **Start** button to begin upscaling and wait until it’s finished. (Tip: Press the **Lock Icon** in the bottom left of Chainner to prevent accidentally modifying the chain while it's running).

---

## **Unmodified Texture Dumps**

The repository contains original, unmodified textures dumped from Super Mario Eclipse. These textures can be found in the `TEXTURE_DUMPS/GMSE04` folder and can be used for reference or modification. These are the base textures extracted from the game before any enhancements.

---

## **Texture Dumping Tool**

For those interested in extracting textures, the **DolphinTextureExtraction-tool** can be used to dump textures from the game. This tool is useful for both standard and custom texture creation.

- **Download**: [https://github.com/Venomalia/DolphinTextureExtraction-tool](https://github.com/Venomalia/DolphinTextureExtraction-tool)

> **Note**: Some textures, such as HUD, UI, and font textures, may need to be manually dumped, as not all textures are automatically captured by the tool.

---

## **Contributing**

To contribute to this project, follow these steps:

1. **Fork the repository**: This will create a personal copy of the project on your GitHub account.
2. **Make the necessary changes**: Ensure that the textures you modify or add are updated in all four texture versions (`4K PNG`, `4K DDS`, `HD PNG`, and `HD DDS`). Consistency across the packs is required.
3. **Open a pull request**: Pull requests should be opened on the `dev` branch, not the `main` branch. Be sure to explain the changes made in the pull request description.
4. **Submit the pull request**: After submission, your changes will be reviewed, and if they meet the requirements (i.e., all texture versions are updated), the pull request will be merged.

### **Important Notes for Contributing:**
- Pull requests **must** apply updates to **all four texture packs** (`4K PNG`, `4K DDS`, `HD PNG`, and `HD DDS`). This ensures that all versions remain synchronized.
- Contributions that update only one or a few of the packs will not be merged.

For discussions, suggestions, or questions, feel free to join the **Super Mario Eclipse Discord Server**:  
[https://discord.com/invite/u6NHuHVRpJ](https://discord.com/invite/u6NHuHVRpJ)

---

## **Credits**

- **iZePlayz**: Creator of the HD and 4K textures.
- **AlexWolfz**: Converted the textures to DDS format.
- **Venomalia**: Created the Dolphin Texture Dumping tool and upscaling models.

---

## **Contact**

For inquiries or further assistance, please reach out via GitHub or the Discord server.


---
