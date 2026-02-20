# Define the location of your KB file
export KB_FILE="$HOME/.kb_sysadmin.sh"

kb.util.list() {
    echo -e "\n=================================================="
    echo " AVAILABLE KB CATEGORIES"
    echo -e "==================================================\n"
    # Extracts function names starting with 'kb.'
    declare -F | awk '{print $3}' | grep "^kb." | grep -v "^kb.util"
    echo ""
}

kb.util.search() {
    if [ -z "$1" ]; then
        echo "Usage: kb.search <keyword>"
        return 1
    fi
    
    echo -e "\nSearching for '$1' in Knowledge Base...\n"
    
    # Parses loaded functions, tracking the current function name, 
    # and prints matches alongside the function they belong to.
    declare -f | awk -v term="$1" '
        /^[a-zA-Z0-9_.-]+ \(\)/ { func_name=$1 }
        tolower($0) ~ tolower(term) {
            # Only show results from kb.* functions
            if (func_name ~ /^kb\./) {
                print "\033[1;32m[" func_name "]\033[0m"
                # Highlight the search term in the output
                gsub(term, "\033[1;31m&\033[0m")
                print "  " $0
                print "---"
            }
        }
    '
}

kb.util.edit() {
    # Opens the file in your default editor (falls back to nano)
    ${EDITOR:-nano} "$KB_FILE"
}

kb.util.reload() {
    # Reloads the file into the current shell session
    if [ -f "$KB_FILE" ]; then
        source "$KB_FILE"
        echo -e "\033[1;32mKnowledge Base reloaded successfully!\033[0m"
    else
        echo "Error: KB file not found at $KB_FILE"
    fi
}
