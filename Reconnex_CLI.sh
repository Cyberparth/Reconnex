#!/bin/bash

# ========================================
# Reconnex : Automated Recon Tool
# Author   : CyberParth
# Github   : https://github.com/Cyberparth
#=========================================

#=====Colours======
HIGH_INTENSITY_RED="\e[0;91m"
RED="\033[1;31m"
GREEN="\033[1;32m"
CYAN="\033[1;36m"
YELLOW="\033[1;33m"
BLUE="\e[0;34m"
PURPLE="\e[0;35m"
WHITE="\e[0;37m"
NC="\033[0m"  #No Colour

#========ASCII BANNER===========
echo -e "${RED}"
#!/bin/bash

# ========================================
# Reconnex : Automated Recon Tool
# Author   : CyberParth
# Github   : https://github.com/Cyberparth
#=========================================

#=====Colours======
HIGH_INTENSITY_RED="\e[0;91m"
RED="\033[1;31m"
GREEN="\033[1;32m"
CYAN="\033[1;36m"
YELLOW="\033[1;33m"
BLUE="\e[0;34m"
PURPLE="\e[0;35m"
WHITE="\e[0;37m"
NC="\033[0m"  #No Colour

#========ASCII BANNER===========
echo -e "${RED}"
cat << "EOF" 
                              / __ \___  _________  ____  ____  ___  _  _   Version:0.1
                             / /_/ / _ \/ ___/ __ \/ __ \/ __ \/ _ \| |/_/
                            / _, _/  __/ /__/ /_/ / / / / / / /  __/>  <
                           /_/ |_|\___/\___/\____/_/ /_/_/ /_/\___/_/|_|
EOF
echo -e "${NC}"
echo -e "${YELLOW} 	 				 Author: CyberParth ${NC}"
echo -e "${CYAN}			 Github: https://github.com/Cyberparth/Reconnex  ${NC}"

#CONFIG
TOOL_DIR="/usr/bin"
WORDLIST=$TOOL_DIR                           #  [to be updated not complete]

#ARG CHECK
if [ "$#" -ne 1 ]; then
    echo -e "${RED} Usage: $0 <target-domain(example.com)>${NC}"
    exit 1
fi


TARGET=$1
BASE_DIR=$(pwd)


echo -e "${HIGH_INTENSITY_RED}[*] Starting recon on: $TARGET${NC}"
echo -e "${HIGH_INTENSITY_RED}[*] Saving results in: $BASE_DIR${NC}"






#****************************************************************************************************
echo -e "${YELLOW}=============== SUBDOMAIN ENUMERATION =============${NC}"
echo -e "${PURPLE}[1/5]Starting Subdomain Enumeration...${NC}"            #First Phase Started

echo -e "${BLUE}[+]Subfinder is Running... ${NC}"
subfinder -d $TARGET -silent -o subfinder.txt 
echo -e "${RED}Result saved in subfinder.txt ${NC}"

echo -e "${BLUE}[+]Findomain is Running... ${NC}"
subfinder -d $TARGET --quiet -o findomain.txt 
echo -e "${RED}Result saved in findomain.txt ${NC}"

echo -e "${BLUE}[+]Amass is Running... ${NC}"
amass enum -passive -d $TARGET -o amass_raw.txt 
echo -e "${RED}Raw data saved in amass_raw.txt ${NC}"
echo -e "${CYAN}Filtering the Raw data ${NC}"
grep -E "^[a-zA-Z0-9.-]+\$" amass_raw.txt > amass.txt 2>/dev/null
echo -e "${RED}Filtered data Results are saved in amass.txt ${NC}"
rm -fr amass_raw.txt                           #Raw data removed
echo -e "${WHITE}Raw data Removed.${NC}"

echo -e "${BLUE}[+]Assetfinder is Running...${NC}"
assetfinder --subs-only $TARGET | grep -E "^[a-zA-Z0-9.-]+\$" > assetfinder.txt 2>/dev/null
echo -e "${RED}Results are saved in assetfinder.txt ${NC}"


#echo -e "${BLUE}[+]sublist3r is Running...${NC} "
#sublist3r -d $TARGET -o sublister.txt 2>/dev/null
#echo -e "${RED}Results are saved in sublister.txt ${NC}"

echo -e "${BLUE}[+]dnsx is Running...${NC}"
*.txt | sort -u | dnsx -silent -o dnsx_raw.txt 2>/dev/null
echo -e "${RED}Raw data is saved in dns_raw.txt ${NC}"
grep -E "^[a-zA-Z0-9.-]+\$" dnsx_raw.txt > dnsx.txt 2>/dev/null
echo -e "${RED}Results are saved in dns.txt ${NC}"
rm -fr dnsx_raw.txt                           #Raw data removed
echo -e "${WHITE}Raw data Removed.${NC}"

# Merge and removing duplicate everything
echo -e "${BLUE} Merging and Removing Duplicates ${NC}"
cat *.txt | sort -u > all_subdomains.txt
echo -e "${RED}Results are saved in all_subdomains.txt ${NC}"
echo -e "${CYAN}[*] Total unique subdomains: $(wc -l < all_subdomains.txt)${NC}"




#****************************************************************************************************

echo -e "${YELLOW}=================ENUM LIVE HOSTS ====================${NC}"
echo -e "${PURPLE}[2/5] Probing Live Hosts...${NC}"
echo -e "${BLUE}[*]httpx is now starting ${NC}"
httpx -l all_subdomains.txt -silent -o live_subdomains.txt
echo -e "${RED}Results of httpx is given input to find Endpoints via katana tool ${NC}"
echo -e "${BLUE}[*]katana is Starting...${NC}"
katana -list live_subdomains.txt -o live_endpoints.txt
echo -e "${RED}Final Results of Alive hosts are Stored in live_endpoints.txt ${NC}"
echo -e "${CYAN}[*] Alive hosts: $(wc -l < live_endpoints.txt)${NC}"





#****************************************************************************************************


echo -e "${YELLOW}============Screenshot Everything by eyewitness Tool====================${NC}"
echo "${PURPLE} [3/5] Screenshoting by eyewitness tool ${NC}"
echo -e "${BLUE}[*]Eyewitness is Starting...${NC}"
eyewitness --web -f live_subdomains.txt --threads 10 -d screenshots 2>/dev/null
echo -e "${RED}Resuls for eyewitness are  saved ${NC} "


 
#**********************************************************************************************
echo -e "${YELLOW}========= CRAWLING & ARCHIVES ==========${NC}"
echo -e "${PURPLE}[4/5] Gathering Archived URLs...${NC}"
echo -e "${BLUE}[*]gau is Starting...${NC}"
gau --threads 5 --subs $TARGET > gau.txt 2>/dev/null
echo -e "${RED}Results of gau are stored in gau.txt ${NC}"
echo -e "${BLUE}[*]waybackurl is Starting... ${NC}"
cat all_subdomains.txt | waybackurls > wayback.txt 2>/dev/null
echo -e "${RED}Results for waybackurl is stored in wayback.txt ${NC}"
cat gau.txt wayback.txt | sort -u > all_urls.txt 2>/dev/null
echo -e "${RED}The Final Archive URL's Result is stored in all_urls.txt ${NC}"
echo -e "${CYAN}[*] Total URLs collected: $(wc -l < all_urls.txt)${NC}"






#****************************************************************************************************
echo -e "${YELLOW}===== AUTOMATED VULNERABILITY SCAN =====${NC}"
echo -e "${PURPLE}[5/5] Running nuclei scan...${NC}"
echo -e "${BLUE}[*]nuclei is Starting... ${NC}"
cat all_subdomains.txt | nuclei -t templates/ -o nuclei.txt 2>/dev/null
echo -e "${RED}Results of nuclei are stored in nuclei.txt ${NC}"
echo -e "${BLUE}[*]nmap is Starting...${NC}"
nmap -sVC -T4 -iL all_subdomains.txt -oN nmap.txt 2>/dev/null
echo -e "${RED}Result for nmap is stored in nmap.txt ${NC}"
echo -e "${BLUE}[*]nikto is Starting... {NC}"
nikto -h all_subdomains.txt -timeout 10 -output nikto.txt 2>/dev/null
echo -e "${RED}Result for nikto is saved in nikto.txt ${NC}"


#*****************************************************************************************************
echo -e "${YELLOW}=============== PARAMETER DISCOVERY ================{NC}"
echo -e "${PURPLE}[5/5]Running Paramspider...${NC}"
paramspider -d $TARGET -o param.txt
echo -e "${RED}Result for Paramspider saved in param.txt ${NC}"
arjun -i all_urls.txt -o arjun_params.txt
echo -e "${RED}Result for arjun is saved in arjun_params.txt ${NC}"
 


#*****************************************************************************************************
echo -e "${YELLOW}=============== JAVASCRIPT RECON ================{NC}"
echo -e "${PURPLE}[5/5]Running subjs...${NC}"

