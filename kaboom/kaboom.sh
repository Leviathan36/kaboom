#!/bin/bash



# kaboom    -    automatic pentest
# Copyright © 2019 Leviathan36 

# kaboom is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# kaboom is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with kaboom.  If not, see <http://www.gnu.org/licenses/>.


##############################################
###             VARIABLES BRUTEFORCE       ###  
##############################################

#KABOOM_PATH=''     # THE KABOOM DIRECOTRY PATH COULD BE SET HERE INSTEAD OF IN THE BASHRC FILE

if [[ "$KABOOM_PATH" == '' ]]; then 
    KABOOM_PATH='.'
fi

# USER WORDLISTS
USERLIST_HYDRA_SSH="$KABOOM_PATH/user_wordlist_short.txt"
USERLIST_HYDRA_POP3="$KABOOM_PATH/user_wordlist_short.txt"
USERLIST_HYDRA_IMAP="$KABOOM_PATH/user_wordlist_short.txt"
USERLIST_HYDRA_RDP="$KABOOM_PATH/user_wordlist_short.txt"
USERLIST_HYDRA_SMB="$KABOOM_PATH/user_wordlist_short.txt"

# PASSWORD WORDLISTS
PASSLIST_HYDRA="$KABOOM_PATH/fasttrack.txt"
PASSLIST_HYDRA_SSH="$PASSLIST_HYDRA"
PASSLIST_HYDRA_POP3="$PASSLIST_HYDRA"
PASSLIST_HYDRA_IMAP="$PASSLIST_HYDRA"
PASSLIST_HYDRA_RDP="$PASSLIST_HYDRA"
PASSLIST_HYDRA_SMB="$PASSLIST_HYDRA"

# DIRB WORDLISTS
HTTP_WORDLIST="$KABOOM_PATH/custom_url_wordlist.txt"
HTTP_EXTENSIONS_FILE="$KABOOM_PATH/custom_extensions_common.txt"

# METASPLOIT SCAN SCRIPT
METASPLOIT_SCAN_SCRIPT='./metasploit_scan_script'

# NMAP FILES
SCRIPT_SYN='script-syn'
UDP='udp'
SYN='syn'

##############################################
##############################################



########################################################
############            FUNCTIONS          #############
########################################################


print_help () {
    echo 'Usage:'
    echo '  Interactive mode:'
    echo '      kaboom [ENTER]  ...and the script does the rest'
    echo
    echo '  NON-interactive mode:'
    echo '      kaboom -t <target_ip> -f <report_path> [-p one_or_more_phases]'
    echo 
    echo '      phases:'
    echo '          - i == information gathering'
    echo '          - v == vulnerability assessment'
    echo '          - d == dictionary attack against open services'
    echo
    echo '      example: iv == information gathering + vulnerability assessment'
    echo '      dafult: ALL (ivb)'
    echo
}

##                   ## 
### PRINT FUNCTIONS ###
##                   ##

print_start_end () {
    printf "\n\033[37;41;1m[*******************************************************]\033[0m\n"
    printf "\033[37;41;1m[***]$1[***]\033[0m\n"
    printf "\033[37;41;1m[*******************************************************]\033[0m\n"
}

#
#  name: print_status
#  @param: iteration ; actual target ; progress
#  @return
#  
print_status () {
    echo
    echo '----------------------------------'
    echo '----------------------------------'
    echo "ITAREATION:   $1"
    echo "TARGET:   $2"
    printf 'PROGRESS: ['
    for i in {1..20}; do
        if [[ "$i" -lt "$3" ]]; then
            printf '='
        elif [[ "$i" == "$3" ]]; then
            printf '>'
        else 
            printf ' '
        fi
    done
    printf "]\n"
    echo '----------------------------------'
    echo
}
    

print_std () {
    printf "\t\033[34;1m[*]$1\033[0m\n"
}

print_phase () {
    printf "\n\033[01;33m[PHASE:]$1\033[0m\n"
}

print_succ () {
    printf "\n\t\033[32;1m[+]$1\033[0m\n"
}

print_failure () {
    printf "\n\t\033[01;31m[-]$1\033[0m\n"
}

failure () {
    print_failure "$1"
    exit 1
}

###                 ###


sanitize_input () {
    
    if [[ ! "$#" == 0 ]]; then      # NO-interactive
    
        while [[ ! "$#" == 0 ]]; do
            case "$1" in
                -h | --help ) print_help; exit 0;;
                -t | --target ) HOSTS="$2"; shift 2;;
                -f | --file ) ROOT_PATH="$2"; shift 2;;
                -p | --phase ) PHASE="$2"; shift 2;;
                * ) print_failure 'INVALID PARAMETER!'; exit 10;;
            esac
        done
    
    else                            # interactive
        
        # HOST
        printf "Insert hosts (example 192.168.1.1-5):\n>> "
        read HOSTS
        
        # PATH
        printf "Insert path where to save results (without final /):\n>> " 
        read ROOT_PATH
        
        # PHASE 
        printf "choice the phases to perform [i=IG, v=VA, d=dictionary]:\n>> " 
        read PHASE
        while [[ ! "$PHASE" =~ ['ivd'] ]]; do
            echo 'INVALID PARAMETER'
            printf "choice the phases to perform [i=IG, v=VA, d=dictionary]:\n>> "
            read PHASE
        done
        
        # SHUTDOWN
        printf "Shutdown pc at the end of script [YES/NO] (default NO):\n>> "
        read SHUTDOWN
    fi
        
    # PARAMETERS SANITIZE
    
    if [[ "$HOSTS" =~ ['qwertyuiopasdfghjklzxcvbnm,:;#@[]/%|'] ]]; then 
        echo 'TARGET IP CONTAINS INVALID CHARACTERS [not use CIDR notation]'
        exit 1
    fi
    
    if [[ ! -d "$ROOT_PATH" ]]; then 
        echo "$ROOT_PATH: DIRECTORY NOT FOUND"
        exit 1
    fi

    # create hosts range
    LOWER_HOST=$(cut -f4 -d '.' <<< "$HOSTS" | cut -f1 -d '-')
    UPPER_HOST=$(cut -f4 -d '.' <<< "$HOSTS" | cut -f2 -d '-')
    ROOT_HOST=$(cut -f1,2,3 -d '.' <<< "$HOSTS")
}

##                   ##
###   XML PARSER    ###
##                   ##

#  
#  name: tcp_service_on 
#  @param: state of port={open, filtered} ; port name={http, ssh, ...} ; ssl={1 == YES, 0 == NO}
#  @return: 0 = {port found} ; 10 {port not found}
#  
tcp_service_on () {
    if [[ "$3" == '0' ]]; then 
        xmllint --xpath "//port[state[@state='$1'] and service[@name='$2']]" "$FILE_PATH/IG/NMAP/$SCRIPT_SYN.xml" &> /dev/null
    elif [[ "$3" == '1' ]]; then 
        xmllint --xpath "//port[state[@state='$1'] and service[@name='$2' and @tunnel='ssl']]" "$FILE_PATH/IG/NMAP/$SCRIPT_SYN.xml" &> /dev/null
    else 
        return 1    #ERROR
    fi
}

#  
#  name: udp_service_on 
#  @param: port name={rpcbind, mdns, ...}
#  @return: 0 = {port found} ; 10 {port not found}
# 
udp_service_on () {
    xmllint --xpath "//port[state[@state='open|filtered'] and service[@name='$1']]" "$FILE_PATH/IG/NMAP/$UDP.xml" &> /dev/null
}

#  
#  name: print_portid
#  @param: state of port={open, filtered} ; port name={http, ssh, ...} ; ssl={1 == YES, 0 == NO}
#  @return: portid
#
print_portid () {
    if [[ "$3" == '0' ]]; then
        xmllint --xpath "//port[state[@state='$1'] and service[@name='$2']]/@portid" "$FILE_PATH/IG/NMAP/$SCRIPT_SYN.xml" | cut -c 2- | tr " " "\n" | cut -f2 -d'"'
    elif [[ "$3" == '1' ]]; then
        xmllint --xpath "//port[state[@state='$1'] and service[@name='$2' and @tunnel='ssl']]/@portid" "$FILE_PATH/IG/NMAP/$SCRIPT_SYN.xml" | cut -c 2- | tr " " "\n" | cut -f2 -d'"'
    else 
        return 1    #ERROR
    fi
}

###                 ###

######################################
######################################



######################################
###             CODE               ###  
######################################

# sanitize input
sanitize_input "$@"

# start script
print_start_end "START SCRIPT AT `date`"

# iteration variable
ITERATION='0'

for i in $(seq $LOWER_HOST 1 $UPPER_HOST); do
    
    # HOST
    HOST="$ROOT_HOST.$i"
    
    # print status
    ((ITERATION++))
    TOTAL_ITERATION=$(((UPPER_HOST-LOWER_HOST)+1))
    PROGRESS=$(((ITERATION*20)/TOTAL_ITERATION))
    print_status "$ITERATION" "$HOST" "$PROGRESS"

    # create new directory
    mkdir -p "$ROOT_PATH/$HOST"
    FILE_PATH="$ROOT_PATH/$HOST"

    #** start information gathering (IG) **#

    if [[ "$PHASE" =~ 'i' || "$PHASE" == '' ]]; then 
        print_phase 'starting IG...'
        sleep 2
        
        # create new directories for IG results
        mkdir -p "$FILE_PATH/IG"
        mkdir -p "$FILE_PATH/IG/NMAP"
        
        ### NMAP ###
        print_succ 'nmap is scanning...'
        
        # syn-scan
        print_std 'start syn-scan with syn-probe...'
        nmap -vvv -oA "$FILE_PATH/IG/NMAP/$SCRIPT_SYN" -PE -PS80,443,22,25,110,445 -PU -PP -PA80,443,22,25,110,445 -sS -p- -sV --allports -O --fuzzy --script "(default or auth or vuln or exploit) and not http-enum" "$HOST"   | grep 'Host seems down' > /dev/null && { print_failure 'Host down' ; rm -fR "$FILE_PATH"; continue; }     #|| failure "NMAP ERROR (SYN-SCAN); exit with code $?"
        
        # create syn report
        if [[ -f "$FILE_PATH/IG/NMAP/$SCRIPT_SYN.nmap" ]]; then 
            grep -v '|' "$FILE_PATH/IG/NMAP/$SCRIPT_SYN.nmap" > "$FILE_PATH/IG/NMAP/$SYN.nmap"
        fi
        
        # udp scan
        print_std 'start udp-scan with udp-probe...'
        nmap -vvv -oA "$FILE_PATH/IG/NMAP/$UDP" -PE -PS80,443,22,25,110,445 -PU -PP -PA80,443,22,25,110,445 -sU --top-ports 200 -sV --allports "$HOST" > /dev/null || failure "NMAP ERROR (UDP-SCAN); exit with code $?"
        
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
        
        ### METASPLOIT ###
        print_succ 'metasploit is scanning...'
        
        # start postgresql server
        service postgresql start
        
        # 
        msfconsole -q -o "$FILE_PATH/IG/metasploit_scan.txt" -x "setg rhosts $HOST ; resource $METASPLOIT_SCAN_SCRIPT ; exit -y"

        
    fi

    #** start vulnerability assessment (VA) **#

    if [[ "$PHASE" =~ 'v' || "$PHASE" == '' ]]; then 
        
        print_phase 'starting VA...'
        
        # create new directory for this phase
        mkdir -p "$FILE_PATH/VA"

        # parse nmap output in search of CVE
        xmllint --xpath "//table[elem[text()='VULNERABLE' and @key='state']]/@key" "$FILE_PATH/IG/NMAP/$SCRIPT_SYN.xml" 2> /dev/null | tr " " "\n" | cut -f2 -s -d'"' | awk -F "CVE-" '{printf "search cve:" ; print $2}' > "$FILE_PATH/IG/NMAP/CVE.txt"
        xmllint --xpath "//table[elem[text()='VULNERABLE' and @key='state']]/@key" "$FILE_PATH/IG/NMAP/$UDP.xml" 2> /dev/null | tr " " "\n" | cut -f2 -s -d'"' | awk -F "CVE-" '{printf "search cve:" ; print $2}' >> "$FILE_PATH/IG/NMAP/CVE.txt"
        
        # create new dir for exploits
        mkdir -p "$FILE_PATH/VA/KNOWN_EXPLOITS"
        # remove old file
        rm -f "$FILE_PATH/VA/KNOWN_EXPLOITS/NO_cve_found.txt"
        
        # if the file contains at least one CVE, the research will start
        if grep 'CVE-' "$FILE_PATH/IG/NMAP/CVE.txt"; then       
            
            print_succ 'starting Metasploit research...'
            
            msfconsole -q -o "$FILE_PATH/VA/KNOWN_EXPLOITS/meta_module.txt" -x "db_rebuild_cache ; resource $FILE_PATH/IG/NMAP/CVE.txt ; exit -y" 
            
            # searchsploit
            print_succ 'starting searchsploit...'
            
            searchsploit --www --nmap "$FILE_PATH/IG/NMAP/$SCRIPT_SYN.xml" > "$FILE_PATH/VA/KNOWN_EXPLOITS/exploit-db.txt"
            searchsploit --www --nmap "$FILE_PATH/IG/NMAP/$UDP.xml" >> "$FILE_PATH/VA/KNOWN_EXPLOITS/exploit-db.txt"

        else
            print_failure 'no exploits found!'
            touch "$FILE_PATH/VA/KNOWN_EXPLOITS/NO_cve_found.txt"
        fi
        
        
        ## WIFIBANG
        ## tail -n +15 "$file_path/VA/META_MODULE/$i" | awk -F"   " '{print $2}' | nl

        #http
        tcp_service_on 'open' 'http' '0' && {
            print_succ 'starting nikto...';
            for PORT in $(print_portid 'open' 'http' '0'); do
                print_std "Nikto port: $PORT"
                nikto -Display PV -nolookup -ask no -Format htm -host $HOST:$PORT -output "$FILE_PATH/VA/nikto_$PORT.html" -Plugins "ms10_070;report_html;embedded;cookies;put_del_test;outdated;drupal(0:0);clientaccesspolicy;msgs;httpoptions;negotiate;parked;favicon;apache_expect_xss;headers" -Tuning 4890bcde > /dev/null
            done;
            
            print_succ 'starting dirb...';
            for PORT in $(print_portid 'open' 'http' '0'); do
                print_std "Dirb port: $PORT"
                dirb "http://$HOST:$PORT/" "$HTTP_WORDLIST" -r -l -o "$FILE_PATH/VA/dirb_$PORT.txt" -x "$HTTP_EXTENSIONS_FILE" -z 200 > /dev/null
            done;
        }
            
            #Dirb takes approximaly one hour to finish the wordlist with the following setting.
            #It doesn't search recursively.

        #https
        tcp_service_on 'open' 'https' '0' && {
            # execute nikto and dirb for https protocol
            print_succ 'starting nikto (https)...';
            for PORT in $(print_portid 'open' 'https' '0'); do
                print_std "Nikto port: $PORT"
                nikto -ssl -port $PORT -Display PV -nolookup -ask no -Format htm -host $HOST -output "$FILE_PATH/VA/nikto_https_$PORT.html" -Plugins "ms10_070;report_html;embedded;cookies;put_del_test;outdated;drupal(0:0);clientaccesspolicy;msgs;httpoptions;negotiate;parked;favicon;apache_expect_xss;ssl;headers" -Tuning 4890bcde > /dev/null
            done;
            
            print_succ 'starting dirb (https)...';
            for PORT in $(print_portid 'open' 'https' '0'); do
                print_std "Dirb port: $PORT"
                dirb "https://$HOST:$PORT/" "$HTTP_WORDLIST" -r -l -o "$FILE_PATH/VA/dirb_https_$PORT.txt" -x "$HTTP_EXTENSIONS_FILE" -z 200 > /dev/null
            done;
        }
        
        #ssl/http
        tcp_service_on 'open' 'http' '1' && {
            # execute nikto and dirb for ssl/http protocol
            print_succ 'starting nikto (ssl/http)...';
            for PORT in $(print_portid 'open' 'http' '1'); do
                print_std "Nikto port: $PORT"
                nikto -ssl -port $PORT -Display PV -nolookup -ask no -Format htm -host $HOST -output "$FILE_PATH/VA/nikto_https_$PORT.html" -Plugins "ms10_070;report_html;embedded;cookies;put_del_test;outdated;drupal(0:0);clientaccesspolicy;msgs;httpoptions;negotiate;parked;favicon;apache_expect_xss;ssl;headers" -Tuning 4890bcde > /dev/null
            done;
            
            print_succ 'starting dirb (ssl/http)...';
            for PORT in $(print_portid 'open' 'http' '1'); do
                print_std "Dirb port: $PORT"
                dirb "https://$HOST:$PORT/" "$HTTP_WORDLIST" -r -l -o "$FILE_PATH/VA/dirb_https_$PORT.txt" -x "$HTTP_EXTENSIONS_FILE" -z 200 > /dev/null
            done;
        }
        
    fi

    #####################################

    #** start dictionary attacks (DA) **#

    if [[ "$PHASE" =~ 'd' || "$PHASE" == '' ]]; then

        print_phase 'starting Dictionary Attacks...'
        
        # create the new directories for this phase
        mkdir -p "$FILE_PATH/DA/PASSWORD"
        mkdir -p "$FILE_PATH/DA/EVIDENCE"
        
        #ssh
        tcp_service_on 'open' 'ssh' '0' && {
            print_succ 'starting dictionary attack against SSH service...';
            for PORT in $(print_portid 'open' 'ssh' '0'); do
            hydra -s $PORT -v -V -o "$FILE_PATH/DA/PASSWORD/cred_ssh" -L $USERLIST_HYDRA_SSH -P $PASSLIST_HYDRA_SSH -t 4 $HOST ssh &> "$FILE_PATH/DA/EVIDENCE/ssh_attack"
            print_std "$(grep 'host:' "$FILE_PATH/DA/PASSWORD/cred_ssh" || echo 'PASSWORD NOT FOUND')"
            done;
        }
        
        #pop3
        tcp_service_on 'open' 'pop3' '0' && {
            print_succ 'starting dictionary attack against POP3 (clear pass) service...';
            for PORT in $(print_portid 'open' 'pop3' '0'); do
            hydra -s $PORT -v -V -o "$FILE_PATH/DA/PASSWORD/cred_pop3" -L $USERLIST_HYDRA_POP3 -P $PASSLIST_HYDRA_POP3 -t 4 $HOST pop3 &> "$FILE_PATH/DA/EVIDENCE/pop3_attack"
            print_std "$(grep 'host:' "$FILE_PATH/DA/PASSWORD/cred_pop3" || echo 'PASSWORD NOT FOUND')"
            done;
        }
        
        #pop3s
        tcp_service_on 'open' 'pop3s' '0' && {
            print_succ 'starting dictionary attack against POP3S (plain pass over ssl connection) service...';
            for PORT in $(print_portid 'open' 'pop3s' '0'); do
            hydra -S -s $PORT -v -V -o "$FILE_PATH/DA/PASSWORD/cred_pop3s" -L $USERLIST_HYDRA_POP3 -P $PASSLIST_HYDRA_POP3 -t 4 $HOST pop3s &> "$FILE_PATH/DA/EVIDENCE/pop3s_attack"
            print_std "$(grep 'host:' "$FILE_PATH/DA/PASSWORD/cred_pop3s" || echo 'PASSWORD NOT FOUND')"
            done;
        }
        
        #ssl/pop3
        tcp_service_on 'open' 'pop3' '1' && {
            print_succ 'starting dictionary attack against SSL/POP3 (plain pass over ssl connection) service...';
            for PORT in $(print_portid 'open' 'pop3' '1'); do
            hydra -S -s $PORT -v -V -o "$FILE_PATH/DA/PASSWORD/cred_ssl_pop3" -L $USERLIST_HYDRA_POP3 -P $PASSLIST_HYDRA_POP3 -t 4 $HOST pop3 &> "$FILE_PATH/DA/EVIDENCE/ssl_pop3_attack"
            print_std "$(grep 'host:' "$FILE_PATH/DA/PASSWORD/cred_ssl_pop3" || echo 'PASSWORD NOT FOUND')"
            done;
        }
        
        #imap
        tcp_service_on 'open' 'imap' '0' && {
            print_succ 'starting dictionary attack against IMAP (clear pass) service...';
            for PORT in $(print_portid 'open' 'imap' '0'); do
            hydra -s $PORT -v -V -o "$FILE_PATH/DA/PASSWORD/cred_imap" -L $USERLIST_HYDRA_IMAP -P $PASSLIST_HYDRA_IMAP -t 4 $HOST imap &> "$FILE_PATH/DA/EVIDENCE/imap_attack"
            print_std "$(grep 'host:' "$FILE_PATH/DA/PASSWORD/cred_imap" || echo 'PASSWORD NOT FOUND')"
            done;
        }
        
        #imaps
        tcp_service_on 'open' 'imaps' '0' && {
            print_succ 'starting dictionary attack against IMAPS (plain pass over ssl connection) service...';
            for PORT in $(print_portid 'open' 'imaps' '0'); do
            hydra -S -s $PORT -v -V -o "$FILE_PATH/DA/PASSWORD/cred_imaps" -L $USERLIST_HYDRA_IMAP -P $PASSLIST_HYDRA_IMAP -t 4 $HOST imaps &> "$FILE_PATH/DA/EVIDENCE/imaps_attack"
            print_std "$(grep 'host:' "$FILE_PATH/DA/PASSWORD/cred_imaps" || echo 'PASSWORD NOT FOUND')"
            done;
        }
        
        #rdp
        tcp_service_on 'open' 'ms-wbt-server' '0' && {
            print_succ 'starting dictionary attack against RDP service (no domain)...';
            for PORT in $(print_portid 'open' 'ms-wbt-server' '0'); do
            hydra -s $PORT -v -V -o "$FILE_PATH/DA/PASSWORD/cred_rdp" -L $USERLIST_HYDRA_RDP -P $PASSLIST_HYDRA_RDP -t 4 $HOST rdp &> "$FILE_PATH/DA/EVIDENCE/rdp_attack"
            print_std "$(grep 'host:' "$FILE_PATH/DA/PASSWORD/cred_rdp" || echo 'PASSWORD NOT FOUND')"
            done;
        }
        
        tcp_service_on 'open' 'ms-wbt-server' '1' && {
            print_succ 'starting dictionary attack against SSL/RDP service...';
            for PORT in $(print_portid 'open' 'ms-wbt-server' '1'); do
            hydra -S -s $PORT -v -V -o "$FILE_PATH/DA/PASSWORD/cred_ssl_rdp" -L $USERLIST_HYDRA_RDP -P $PASSLIST_HYDRA_RDP -t 4 $HOST rdp &> "$FILE_PATH/DA/EVIDENCE/ssl_rdp_attack"
            print_std "$(grep 'host:' "$FILE_PATH/DA/PASSWORD/cred_ssl_rdp" || echo 'PASSWORD NOT FOUND')"
            done;
        }

        ##smb
        #tcp_service_on "open" "445" > /dev/null && {
            #echo '--------------------------';
            #echo 'START BRUTE FORCE SMB...';
            #echo '--------------------------';
            #hydra -s 445 -F -o "$file_path/EX/HYDRA/cred_smb" -L $USERLIST_HYDRA_SMB -P $PASSLIST_HYDRA -t 16 -m BothHash $host smb > /dev/null;
            #echo '--------------------------';
            #echo 'END BRUTE FORCE SMB';
            #echo '--------------------------';
        #}
    fi
    
done
######## END EXPLOITATION ######

print_start_end " END SCRIPT AT `date` "

if [[ "$shutdown" == 'YES' || "$shutdown" == 'yes'  ]]; then 
    print_std 'shutdown system...'
    sleep 2
    shutdown now
fi
