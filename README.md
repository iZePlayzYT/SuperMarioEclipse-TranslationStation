# **Super Mario Eclipse - Translation Station**

# **For translators, here is a link to idioms and other localization things from the English script: https://docs.google.com/spreadsheets/d/16SODPmaqB_A6rrQJlQv6CGCsJy6uu63B0eXsxvo3BuU/edit?usp=sharing**

# **[THIS README IS JUST COPIED AND PASTED FROM AN OTHER REPO, IT STILL NEEDS TO BE ADJUSTED!]**
# **[THIS README IS JUST COPIED AND PASTED FROM AN OTHER REPO, IT STILL NEEDS TO BE ADJUSTED!]**

This repository contains all important `.bmg` message files for the **Super Mario Eclipse** translation. The `.bmg` files are the standard message files and contain all the dialogue of the game.

## **Table of Contents**
1. [How to edit these files](#how-to-edit-these-files)
   - How to edit `.bmg` files
   - How to edit `.txt` files
2. [How to Install Custom Textures in Dolphin](#how-to-install-custom-textures-in-dolphin)
3. [Upscaling Process](#upscaling-process)
4. [Unmodified Texture Dumps](#unmodified-texture-dumps)
5. [Texture Dumping Tool](#texture-dumping-tool)
6. [Contributing](#contributing)
7. [Credits](#credits)

---

## **How to edit these files**

First of all, you need a GitHub account to clone or fork (recommended) this repository. You can do this by using the `git clone` command or just make an own `fork` of this repository by using the fork github button in the upper right corner of the repository. Now you have access to all of these message files of the game.

There are two options for editing the files:
- edit only the `.bmg` files
- edit only the `.txt` files



### **How to edit `.bmg` files**

If you want to edit the `.bmg` files, you probably want to use this tool: 
[SMS Message Editor](https://discord.com/channels/@me/552079563061198858/1283458708487274537) by [JoshuaMKW](https://github.com/JoshuaMKW) <br />
This tool provides an ingame view for the `.bmg` files so you can see, how your translation looks like ingame. <br />


### **How to edit `.txt` files**

For editing the `.txt` files, there is slightly more to do.
You can edit them like you want to, but if the `.txt` is completely translated, you have to encode it with this tool:
[Wiimms SZS Toolset](https://szs.wiimm.de/) <br />
This tool uses some commands to help you with extracting the `.szs` files of the game. You need to install the tool than run the command 
```
wszst extract GAMEFILE.szs
```
(change `GAMEFILE.szs` with actual name of file or use `*.szs` for applying this command for all `.szs` files in the current file path). <br />
If you did this, you will see a new folder `GAMEFILE.d/`. This folder contains all the files that stored in the .szs file. 
Now you can search for the file path of the `.bmg` file. If you are in the directory of the `.bmg` file, run the command
```
wbmgt decode --no-header --no-attrib GAMEFILE.bmg
```
You will get a new `.txt` file like the ones provided on this repository. Copy the translated texts into this new created `.txt` file or just simply overwrite it with the file you have.
Than you have to use the command
```
wbmgt encode GAMEFILE.txt
```
for creating a new `.bmg` file. Now the content of the `.txt` file should also be in the new `.bmg` file

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
