      # Sanitize input
      sanitize_input "$@"
      
      # Start script
      print_start_end "START SCRIPT AT $(date)"
      
      # Initialize iteration variable
      ITERATION='0'
      
      # Loop through hosts
      for i in $(seq $LOWER_HOST 1 $UPPER_HOST); do
          # HOST
          HOST="$ROOT_HOST.$i"
          
          # Print status
          ((ITERATION++))
          TOTAL_ITERATION=$((UPPER_HOST-LOWER_HOST+1))
          PROGRESS=$((ITERATION*20/TOTAL_ITERATION))
          print_status "$ITERATION" "$HOST" "$PROGRESS"
      
          # Create new directory
          mkdir -p "$ROOT_PATH/$HOST"
          FILE_PATH="$ROOT_PATH/$HOST"
      
          # Start information gathering (IG)
          if [[ "$PHASE" =~ 'i' || "$PHASE" == '' ]]; then 
              print_phase 'Digital Reconnaissance Initiated. . .'
              sleep 2
              
              # Create new directories for IG results
              mkdir -p "$FILE_PATH/IG"
              mkdir -p "$FILE_PATH/IG/NMAP"
              
              ### NMAP ###
              print_succ 'Network Scanner: Active. Connection is establishing. . .'
              
              # Improved NetMapper scan w/ vulnerabilities added in. 
              print_std 'Network Mapping & Scanning for Vulnerabilities. . .'
              nmap -p 22,80 -Pn -A -v --version-all --script=default,vuln,auth "$HOST" 
              
              # Create syn report
              if [[ -f "$FILE_PATH/IG/NMAP/$SCRIPT_SYN.nmap" ]]; then 
                  grep -v '|' "$FILE_PATH/IG/NMAP/$SCRIPT_SYN.nmap" > "$FILE_PATH/IG/NMAP/$SYN.nmap"
              fi
