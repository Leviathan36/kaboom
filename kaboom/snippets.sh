        
        # golismero report
        #golismero report -i "$file_path/IG/NMAP/script.xml" -o "$file_path/IG/NMAP/nmap_report.html"
        
    #--------------------------------------------#  
        #### UNICORNSCAN ###
        #print_succ 'unicornscan is scanning...'
        
        ## unicornscan tcp scan
        #print_std 'starting TCP scan...'
        #unicornscan -E -L 10 -R 2 -l "$FILE_PATH/IG/unicorn-tcp.txt" -i "$NIC" -r 30 -vvvvv "$HOST":p > /dev/null
            #### p=ports between [1,1024]
            #### r X=max X packet per second
            
        ## unicornscan udp scan
        #print_std 'starting UDP scan...'
        #unicornscan -E -L 10 -R 2 -l "$FILE_PATH/IG/unicorn-udp.txt" -i "$NIC" -r 30 -mU -vvvvv "$HOST":p > /dev/null
    #--------------------------------------------#  
       
