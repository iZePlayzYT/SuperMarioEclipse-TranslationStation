#!/bin/bash

# Variable for the working directory
WORKDIR="."
# Flag to track if extract & decode has been run
EXTRACT_DECODE_COMPLETED=false
# Variable for parent target directory
PARENT_TARGET_DIR="../copied_files"

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
    # Prompt the user for action
    echo "What would you like to do?"
    echo "1. Encode all .txt files"
    echo "2. Encode specific .txt files or directories"
    read -p "Please choose an option [1/2]: " choice

    # Switch to the TXTS directory if not already there
    if [ "$(basename "$WORKDIR")" != "TXTS" ]; then
        echo "You are not in the TXTS directory. Please switch to it first."
        return 1
    fi

    case $choice in
    1)
        # Encode all .txt files in the TXTS directory
        find . -type f -name "*.txt" -print0 | xargs -0 -I{} sh -c 'wbmgt encode "{}"'
        echo "All .txt files have been encoded."
        ;;

    2)
        # Prompt the user for filenames or paths
        read -p "Enter the names or paths of the .txt files to encode, separated by spaces: " -a file_list

        # Track if any file was successfully encoded
        any_encoded=false

        # Process each file or path specified by the user
        for file in "${file_list[@]}"; do
            # Check if the file or directory exists
            if [ -e "$file" ]; then
                if [ -d "$file" ]; then
                    # If it's a directory, encode all .txt files within it
                    find "$file" -type f -name "*.txt" -print0 | xargs -0 -I{} sh -c 'wbmgt encode "{}"'
                else
                    # If it's a file, encode it
                    if [ -f "$file" ]; then
                        wbmgt encode "$file"
                    else
                        echo "File not found: $file"
                        continue
                    fi
                fi
                any_encoded=true
            else
                echo "Path not found: $file"
            fi
        done

        if [ "$any_encoded" = false ]; then
            echo "No valid files or paths were provided for encoding."
        fi
        ;;

    *)
        echo "Invalid selection!"
        ;;
    esac

    # Switch back to the parent directory
    cd ..
}

# Function to count .bmg files
count_bmg() {
    # Check if we are in the BMGS directory
    if [ -d "$PARENT_TARGET_DIR/BMGS" ]; then
        cd "$PARENT_TARGET_DIR/BMGS"
        echo "Currently in directory: $PWD"
        echo "Number of .bmg files: $(find . -type f -name "*.bmg" | wc -l)"
    else
        echo "BMGS directory does not exist in the current working directory."
        return 1
    fi
    # Return to WORKDIR
    cd "$WORKDIR"
}

# Function to count .txt files
count_txt() {
    # Check if we are in the TXTS directory
    if [ -d "$PARENT_TARGET_DIR/TXTS" ]; then
        cd "$PARENT_TARGET_DIR/TXTS"
        echo "Currently in directory: $PWD"
        echo "Number of .txt files: $(find . -type f -name "*.txt" | wc -l)"
    else
        echo "TXTS directory does not exist in the current working directory."
        return 1
    fi
    # Return to WORKDIR
    cd "$WORKDIR"
}

# Function to delete .bmg files
delete_bmg() {
    # Check if we are in the BMGS directory
    if [ -d "$PARENT_TARGET_DIR/BMGS" ]; then
        cd "$PARENT_TARGET_DIR/BMGS"
        find . -type f -name "*.bmg" -exec rm {} \;
    else
        echo "BMGS directory does not exist in the current working directory."
        return 1
    fi
    # Return to WORKDIR
    cd "$WORKDIR"
}

# Function to delete .txt files
delete_txt() {
    # Check if we are in the TXTS directory
    if [ -d "$PARENT_TARGET_DIR/TXTS" ]; then
        cd "$PARENT_TARGET_DIR/TXTS"
        find . -type f -name "*.txt" -exec rm {} \;
    else
        echo "TXTS directory does not exist in the current working directory."
        return 1
    fi
    # Return to WORKDIR
    cd "$WORKDIR"
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
        if [ "$completed" = "N" ] || [ "$completed" = "n" ]; then
            read -p "Would you like to create a backup of this directory first? (Y/n): " copy
            if [ "$copy" = "Y" ] || [ "$copy" = "y" ]; then
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

    while true; do
        pwd
        echo "-------------------------------------------------"
        echo "What would you like to do?"
        echo "1. Encode all .txt files"
        echo "2. Delete all .bmg or .txt files"
        echo "3. Count .bmg and/or .txt files"
        echo "4. Change working directory"
        echo "5. Exit"

        read -p "Please choose an option [1-5]: " option
        echo "-------------------------------------------------"

        case $option in
        1)
            # Check if we are in the TXTS directory before encoding
            echo "Switching to TXTS directory..."
            cd "$PARENT_TARGET_DIR/TXTS"
            encode_txt
            # Switch back to the parent directory
            cd "$WORKDIR"
            ;;
        2)
            read -p "Which files type (.bmg or .txt) would you like to delete? (b/t): " delete_option
            case $delete_option in
            b) delete_bmg ;;
            t) delete_txt ;;
            *) echo "Invalid selection!" ;;
            esac
            ;;

        3)
            read -p "Count .bmg files, .txt files, or both? (b/t/both): " count_option
            case $count_option in
            b) count_bmg ;;
            t) count_txt ;;
            both)
                count_bmg
                count_txt
                ;;
            *) echo "Invalid selection!" ;;
            esac
            ;;

        4)
            set_workdir
            ;;
        5)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid selection!"
            ;;
        esac
    done
}

# Call the menu function
menu
