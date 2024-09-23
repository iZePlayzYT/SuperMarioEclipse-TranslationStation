#!/bin/bash

# Variable for the working directory
WORKDIR="."
# Flag to track if extract & decode has been run
EXTRACT_DECODE_COMPLETED=false
# Variable for parent target directory
PARENT_TARGET_DIR="../copied_files"
# Variable to track if language-specific files were found
LANGUAGE_FILES_FOUND=false

# Function to create the target directory in the parent folder
create_parent_target_dir() {
    if [ ! -d "$PARENT_TARGET_DIR" ]; then
        mkdir -p "$PARENT_TARGET_DIR"
        echo "Created directory: $PARENT_TARGET_DIR"
    else
        echo "Directory already exists: $PARENT_TARGET_DIR"
    fi
}

# Function to set the working directory
set_workdir() {
    pwd
    read -p "Please enter the path for the working directory: " new_dir

    new_dir="${new_dir/#\~/$HOME}"
    if [ -d "$new_dir" ]; then
        WORKDIR="$new_dir"
        cd "$WORKDIR"
        echo "Working directory set to: $WORKDIR"
        PARENT_TARGET_DIR="$(dirname "$WORKDIR")/copied_files"
    else
        echo "Path does not exist. Please check and try again."
        exit 1
    fi
}

# Function to extract .szs files
extract_szs() {
    find . -type f -name "*.szs" -printf "%h\n" | sort -u | xargs -I {} sh -c 'cd "{}" && wszst extract *.szs'
}

# Function to delete all files that are not .bmg
cleanup_non_bmg() {
    find . -type d -exec sh -c 'find "$1" -type f ! -name "*.bmg" -delete; find "$1" -type d -empty -delete' _ {} \;
}

# Function to decode .bmg files
decode_bmg() {
    find . -type f -name "*.bmg" -print0 | xargs -0 -I{} sh -c 'dir=$(dirname "{}"); [ "$(find "$dir" -type f -name "*.bmg")" ] && (cd "$dir" && wbmgt decode *.bmg)'
}

# Function to encode .txt files
encode_txt() {
    find . -type f -name "*.txt" -print0 | xargs -0 -I{} sh -c 'wbmgt encode "{}"'
}

# Function to count .bmg files
count_bmg() {
    find . -type f -name "*.bmg" | wc -l
}

# Function to count .txt files
count_txt() {
    find . -type f -name "*.txt" | wc -l
}

# Function to delete .bmg files
delete_bmg() {
    find . -type f -name "*.bmg" -exec rm {} \;
}

# Function to delete .txt files
delete_txt() {
    find . -type f -name "*.txt" -exec rm {} \;
}

# Function to display the menu and handle user input
menu() {
    clear
    cd $HOME
    echo "Please set the working directory first."
    set_workdir

    # Check if extraction and decoding need to be completed
    if [ "$EXTRACT_DECODE_COMPLETED" = false ]; then
        read -p "Have you already extracted and decoded files? (y/N): " completed
        if [[ "$completed" =~ ^(N|n)$ ]]; then
            read -p "Would you like to create a backup of this directory first? (Y/n): " copy
            if [[ "$copy" =~ ^(Y|y)$ ]]; then
                create_parent_target_dir
                cp -r . "$PARENT_TARGET_DIR/ORIGINAL"
                echo "Backup created in $PARENT_TARGET_DIR/ORIGINAL"
            fi

            extract_szs
            cleanup_non_bmg

            cp -r . "$PARENT_TARGET_DIR/BMGS"

            decode_bmg
            find . -type f -name "*.bmg" -exec rm {} \;

            cp -r . "$PARENT_TARGET_DIR/TXTS"
            EXTRACT_DECODE_COMPLETED=true
            cd "$PARENT_TARGET_DIR"
        fi
    fi

    # Check for specific language files and copy directories accordingly
    if find . -type f -name "*_ge.bmg" -o -name "*_en.bmg" -o -name "*_sp.bmg" -o -name "*_it.bmg" -o -name "*_fr.bmg" | grep -q '.'; then
        echo "Language-specific .bmg files found. Creating additional language directories..."
        cp -r "$PARENT_TARGET_DIR/BMGS" "$PARENT_TARGET_DIR/BMGS_de"
        cp -r "$PARENT_TARGET_DIR/BMGS" "$PARENT_TARGET_DIR/BMGS_en"
        cp -r "$PARENT_TARGET_DIR/BMGS" "$PARENT_TARGET_DIR/BMGS_sp"
        cp -r "$PARENT_TARGET_DIR/BMGS" "$PARENT_TARGET_DIR/BMGS_it"
        cp -r "$PARENT_TARGET_DIR/BMGS" "$PARENT_TARGET_DIR/BMGS_fr"

        cp -r "$PARENT_TARGET_DIR/TXTS" "$PARENT_TARGET_DIR/TXTS_de"
        cp -r "$PARENT_TARGET_DIR/TXTS" "$PARENT_TARGET_DIR/TXTS_en"
        cp -r "$PARENT_TARGET_DIR/TXTS" "$PARENT_TARGET_DIR/TXTS_sp"
        cp -r "$PARENT_TARGET_DIR/TXTS" "$PARENT_TARGET_DIR/TXTS_it"
        cp -r "$PARENT_TARGET_DIR/TXTS" "$PARENT_TARGET_DIR/TXTS_fr"

        echo "Directories for German (de), English (en), Spanish (sp), Italian (it), and French (fr) have been created."

        LANGUAGE_FILES_FOUND=true
    fi

    if [ "$LANGUAGE_FILES_FOUND" = true ]; then
        # Remove non-German files from BMGS_de and TXTS_de
        find "$PARENT_TARGET_DIR/BMGS_de" -type f \( -name "*_en.bmg" -o -name "*_sp.bmg" -o -name "*_it.bmg" -o -name "*_fr.bmg" \) -exec rm {} \;
        find "$PARENT_TARGET_DIR/TXTS_de" -type f \( -name "*_en.txt" -o -name "*_sp.txt" -o -name "*_it.txt" -o -name "*_fr.txt" \) -exec rm {} \;
        # Remove directories that contain language codes in their names
        find "$PARENT_TARGET_DIR/BMGS_de" -type d \( -name "*_en*" -o -name "*_sp*" -o -name "*_it*" -o -name "*_fr*" \) -exec rm -rf {} \;
        find "$PARENT_TARGET_DIR/TXTS_de" -type d \( -name "*_en*" -o -name "*_sp*" -o -name "*_it*" -o -name "*_fr*" \) -exec rm -rf {} \;

        # Remove non-English files from BMGS_en and TXTS_en
        find "$PARENT_TARGET_DIR/BMGS_en" -type f \( -name "*_ge.bmg" -o -name "*_sp.bmg" -o -name "*_it.bmg" -o -name "*_fr.bmg" \) -exec rm {} \;
        find "$PARENT_TARGET_DIR/TXTS_en" -type f \( -name "*_ge.txt" -o -name "*_sp.txt" -o -name "*_it.txt" -o -name "*_fr.txt" \) -exec rm {} \;
        # Remove directories that contain language codes in their names
        find "$PARENT_TARGET_DIR/BMGS_en" -type d \( -name "*_ge*" -o -name "*_sp*" -o -name "*_it*" -o -name "*_fr*" \) -exec rm -rf {} \;
        find "$PARENT_TARGET_DIR/TXTS_en" -type d \( -name "*_ge*" -o -name "*_sp*" -o -name "*_it*" -o -name "*_fr*" \) -exec rm -rf {} \;

        # Remove non-Spanish files from BMGS_sp and TXTS_sp
        find "$PARENT_TARGET_DIR/BMGS_sp" -type f \( -name "*_ge.bmg" -o -name "*_en.bmg" -o -name "*_it.bmg" -o -name "*_fr.bmg" \) -exec rm {} \;
        find "$PARENT_TARGET_DIR/TXTS_sp" -type f \( -name "*_ge.txt" -o -name "*_en.txt" -o -name "*_it.txt" -o -name "*_fr.txt" \) -exec rm {} \;
        # Remove directories that contain language codes in their names
        find "$PARENT_TARGET_DIR/BMGS_sp" -type d \( -name "*_ge*" -o -name "*_en*" -o -name "*_it*" -o -name "*_fr*" \) -exec rm -rf {} \;
        find "$PARENT_TARGET_DIR/TXTS_sp" -type d \( -name "*_ge*" -o -name "*_en*" -o -name "*_it*" -o -name "*_fr*" \) -exec rm -rf {} \;

        # Remove non-Italian files from BMGS_it and TXTS_it
        find "$PARENT_TARGET_DIR/BMGS_it" -type f \( -name "*_ge.bmg" -o -name "*_en.bmg" -o -name "*_sp.bmg" -o -name "*_fr.bmg" \) -exec rm {} \;
        find "$PARENT_TARGET_DIR/TXTS_it" -type f \( -name "*_ge.txt" -o -name "*_en.txt" -o -name "*_sp.txt" -o -name "*_fr.txt" \) -exec rm {} \;
        # Remove directories that contain language codes in their names
        find "$PARENT_TARGET_DIR/BMGS_it" -type d \( -name "*_ge*" -o -name "*_en*" -o -name "*_sp*" -o -name "*_fr*" \) -exec rm -rf {} \;
        find "$PARENT_TARGET_DIR/TXTS_it" -type d \( -name "*_ge*" -o -name "*_en*" -o -name "*_sp*" -o -name "*_fr*" \) -exec rm -rf {} \;

        # Remove non-French files from BMGS_fr and TXTS_fr
        find "$PARENT_TARGET_DIR/BMGS_fr" -type f \( -name "*_ge.bmg" -o -name "*_en.bmg" -o -name "*_sp.bmg" -o -name "*_it.bmg" \) -exec rm {} \;
        find "$PARENT_TARGET_DIR/TXTS_fr" -type f \( -name "*_ge.txt" -o -name "*_en.txt" -o -name "*_sp.txt" -o -name "*_it.txt" \) -exec rm {} \;
        # Remove directories that contain language codes in their names
        find "$PARENT_TARGET_DIR/BMGS_fr" -type d \( -name "*_ge*" -o -name "*_en*" -o -name "*_sp*" -o -name "*_it*" \) -exec rm -rf {} \;
        find "$PARENT_TARGET_DIR/TXTS_fr" -type d \( -name "*_ge*" -o -name "*_en*" -o -name "*_sp*" -o -name "*_it*" \) -exec rm -rf {} \;

        exit 0
    fi

    while true; do
        echo
        echo "-----------------------------------------------------------------------------"
        echo "Currently in directory: $PWD"
        echo "-----------------------------------------------------------------------------"
        echo
        echo "What would you like to do?"
        echo "1. Encode all .txt files"
        echo "2. Decode all .bmg files (again)"
        echo "3. Count .bmg and/or .txt files"
        echo "4. Delete new created .bmg or .txt files"
        echo "5. Change working directory"
        echo "6. Exit"
        echo
        echo "-----------------------------------------------------------------------------"
        read -p "Please choose an option [1-6]: " option
        echo "-----------------------------------------------------------------------------"
        echo

        case $option in
        1)
            clear
            if [ -d "$PARENT_TARGET_DIR/TXTS" ]; then
                cd "$PARENT_TARGET_DIR/TXTS"
                encode_txt
                echo
                echo "-----------------------------------------------------------------------------"
                echo
                echo "All .txt files have been encoded."
                echo "Number of .bmg files in TXTS: $(find . -type f -name "*.bmg" | wc -l)"
            else
                echo "TXTS directory does not exist in the current working directory."
                return 1
            fi

            cd "$WORKDIR"
            ;;
        2)
            if [ -d "$PARENT_TARGET_DIR/BMGS" ]; then
                cd "$PARENT_TARGET_DIR/BMGS"
                decode_bmg
                echo
                echo "-----------------------------------------------------------------------------"
                echo
                echo "All .bmg files have been decoded."
                echo "Number of .txt files in BMGS: $(find . -type f -name "*.txt" | wc -l)"
            else
                echo "BMGS directory does not exist in the current working directory."
                return 1
            fi

            cd "$WORKDIR"
            ;;
        3)
            clear
            read -p "Count .bmg files, .txt files, or both? (b/t/both): " count_option
            echo
            case $count_option in
            b) counting_of_bmgs ;;
            t) counting_of_txts ;;
            both)
                counting_of_bmgs
                counting_of_txts
                ;;
            *) echo "Invalid selection: $count_option" ;;
            esac
            ;;
        4)
            clear
            read -p "Which files type (.bmg or .txt) would you like to delete? (b/t): " delete_option
            case $delete_option in
            b) deletion_of_bmgs ;;
            t) deletion_of_txts ;;
            *) echo "Invalid selection: $delete_option" ;;
            esac
            ;;
        5)
            clear
            echo "Changing current working directory could end in data loss"
            read -p "Are you sure, you want to change current working directory? (y/N)" sure
            if [[ "$sure" =~ ^(Y|y)$ ]]; then
                set_workdir
            fi
            ;;
        6)
            clear
            exit 0
            ;;
        *)
            echo "Invalid selection: $option"
            ;;
        esac
    done
}

#helping method for while loop counting point
counting_of_bmgs() {
    if [ -d "$PARENT_TARGET_DIR/BMGS" ]; then
        cd "$PARENT_TARGET_DIR/BMGS"
        bmg_count=$(count_bmg)
        echo "Number of .bmg files in BMGS: $bmg_count"
        cd "$WORKDIR"
    else
        echo "BMGS directory does not exist in the current working directory."
        return 1
    fi

    if [ -d "$PARENT_TARGET_DIR/TXTS" ]; then
        cd "$PARENT_TARGET_DIR/TXTS"
        bmg_count=$(count_bmg)
        echo "Number of .bmg files in TXTS: $bmg_count"
        cd "$WORKDIR"
    else
        echo "TXTS directory does not exist in the current working directory."
        return 1
    fi

    cd "$WORKDIR"
}

#helping method for while loop counting point
counting_of_txts() {
    if [ -d "$PARENT_TARGET_DIR/BMGS" ]; then
        cd "$PARENT_TARGET_DIR/BMGS"
        txt_count=$(count_txt)
        echo "Number of .txt files in BMGS: $txt_count"
        cd "$WORKDIR"
    else
        echo "BMGS directory does not exist in the current working directory."
        return 1
    fi

    if [ -d "$PARENT_TARGET_DIR/TXTS" ]; then
        cd "$PARENT_TARGET_DIR/TXTS"
        txt_count=$(count_txt)
        echo "Number of .txt files in TXTS: $txt_count"
        cd "$WORKDIR"
    else
        echo "TXTS directory does not exist in the current working directory."
        return 1
    fi

    cd "$WORKDIR"
}

deletion_of_bmgs() {
    # Check if we are in the TXTS directory
    if [ -d "$PARENT_TARGET_DIR/TXTS" ]; then
        cd "$PARENT_TARGET_DIR/TXTS"
        delete_bmg
        echo
        echo "All .bmg files have been deleted."
        bmg_count=$(count_bmg)
        echo "Number of .bmg files in TXTS: $bmg_count"
    else
        echo "TXTS directory does not exist in the current working directory."
        return 1
    fi

    cd "$WORKDIR"
}

deletion_of_txts() {
    # Check if we are in the BMGS directory
    if [ -d "$PARENT_TARGET_DIR/BMGS" ]; then
        cd "$PARENT_TARGET_DIR/BMGS"
        delete_txt
        echo
        echo "All .txt files have been deleted."
        txt_count=$(count_txt)
        echo "Number of .txt files in BMGS: $txt_count"
    else
        echo "TXTS directory does not exist in the current working directory."
        return 1
    fi

    cd "$WORKDIR"
}

# Call the menu function
menu
