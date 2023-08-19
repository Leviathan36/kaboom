      #KABOOM_PATH=''     
      # THE KABOOM DIRECTORY PATH COULD BE SET HERE INSTEAD OF IN THE BASHRC FILE
      
      # Set KABOOM_PATH if it's empty
      KABOOM_PATH="${KABOOM_PATH:-/home/user1/kaboom/kaboom}"
      
      # Define paths using the KABOOM_PATH variable
      USERLIST_HYDRA_SSH="$KABOOM_PATH/user_wordlist_short.txt"
      USERLIST_HYDRA_POP3="$KABOOM_PATH/user_wordlist_short.txt"
      USERLIST_HYDRA_IMAP="$KABOOM_PATH/user_wordlist_short.txt"
      USERLIST_HYDRA_RDP="$KABOOM_PATH/user_wordlist_short.txt"
      USERLIST_HYDRA_SMB="$KABOOM_PATH/user_wordlist_short.txt"
      
      PASSLIST_HYDRA="$KABOOM_PATH/fasttrack.txt"
      PASSLIST_HYDRA_SSH="$PASSLIST_HYDRA"
      PASSLIST_HYDRA_POP3="$PASSLIST_HYDRA"
      PASSLIST_HYDRA_IMAP="$PASSLIST_HYDRA"
      PASSLIST_HYDRA_RDP="$PASSLIST_HYDRA"
      PASSLIST_HYDRA_SMB="$PASSLIST_HYDRA"
      
      HTTP_WORDLIST="$KABOOM_PATH/custom_url_wordlist.txt"
      HTTP_EXTENSIONS_FILE="$KABOOM_PATH/custom_extensions_common.txt"
      
      METASPLOIT_SCAN_SCRIPT="$KABOOM_PATH/metasploit_scan_script"
      
      SCRIPT_SYN="$KABOOM_PATH/script-syn.nse"
      SYN='syn'
