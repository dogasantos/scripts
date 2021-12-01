install_prepare() {
  apt-get update
  apt-get -y upgrade
  apt-get -y install awscli gcc wget curl make libpcap-dev zlib1g-dev libjpeg-dev unzip git python3-pip nmap vim build-essential pkg-config
  
}

install_eyewitness() {
    if [ -d  /usr/share/eyewitness ]
    then
        return 1
    fi
    echo "[*] Installing EyeWitness"

    cd /usr/share/
    git clone https://github.com/FortyNorthSecurity/EyeWitness.git eyewitness
    echo '#!/bin/bash' > /usr/bin/eyewitness
    echo "python /usr/share/eyewitness/EyeWitness.py \$@" >> /usr/bin/eyewitness
    chmod 755 /usr/bin/eyewitness
    echo "  + DONE"
}

install_masstomap() {
    if [ -d  /usr/share/masstomap ]
    then
        return 1
    fi
    echo "[*] Installing Masstomap"

    cd /usr/share/
    git clone https://github.com/dogasantos/masstomap.git masstomap
    echo '#!/bin/bash' > /usr/bin/masstomap
    echo "python /usr/share/masstomap/masstomap.py \$@" >> /usr/bin/masstomap
    cd masstomap
    pip install -r requirements.txt
    chmod 755 /usr/share/masstomap/masstomap.py
    chmod 755 /usr/bin/masstomap
    echo "  + DONE"
}

install_linkfinder() {
    if [ -d  /usr/share/linkfinder ]
    then
        return 1
    fi
    echo "[*] Installing Linkfinder"

    cd /usr/share
    git clone https://github.com/GerbenJavado/LinkFinder.git linkfinder
    pip install jsbeautifier argparse
    echo '#!/bin/bash' >/usr/bin/linkfinder
    echo "python /usr/share/linkfinder/mod_linkfinder.py \$@" >> /usr/bin/linkfinder
    chmod 755 /usr/bin/linkfinder
    echo "  + DONE"

}
install_s3scanner(){
    if [ -d  /usr/share/s3scanner ]
    then
        return 1
    fi
    echo "[*] Installing s3scanner"
    cd /usr/share/
    git clone https://github.com/sa7mon/S3Scanner.git s3scanner
    cd s3scanner
    pip install -r requirements.txt
    echo '#!/bin/bash' >/usr/bin/s3scanner
    echo "python /usr/share/s3scanner/s3scanner.py \$@" >> /usr/bin/s3scanner
    chmod 755 /usr/bin/s3scanner
    echo "  + NOTE: you must configure your awscli with your own aws key by using"
    echo "  + command: aws configure"
    echo "  + DONE"

}

install_wordlists(){
    echo "[*] Downloading Wordlists"
    dist=$(cat /etc/issue|head -n1|cut -f1 -d ' ')
    mkdir -p /usr/share/wordlists
    cd /usr/share/wordlists
    echo "  + RobotsDisallowed"
    git clone https://github.com/danielmiessler/RobotsDisallowed.git 
    echo "  + SecLists"
    git clone https://github.com/danielmiessler/SecLists.git
    #echo "  + Brazillian pt_BR"
    #git clone https://github.com/dogasantos/ptbr-wordlist.git
    echo "  + Commonspeak2"
    git clone https://github.com/assetnote/commonspeak2-wordlists.git
    echo " + public resolvers"
    git clone https://github.com/cujanovic/public-dns-resolvers.git
    
}


install_amass(){
  wget https://github.com/OWASP/Amass/releases/download/v3.15.1/amass_linux_amd64.zip -O amass.zip
  unzip amass.zip
  mv amass_linux_amd64/amass .
  rm -rf amass_linux_amd64 amass.zip
}
install_massdns(){
    if [ -d  /usr/share/massdns ]
    then
        return 1
    fi
    echo "[*] Installing massdns"
    cd /usr/share
    git clone https://github.com/blechschmidt/massdns.git
    cd massdns
    make
    make install
    echo "  + DONE"
}

install_masscan(){
    if [ -d  /usr/share/masscan ]
    then
        return 1
    fi
    echo "[*] Installing masscan"

    cd /usr/share
    git clone https://github.com/robertdavidgraham/masscan masscan
    cd masscan
    make
    make install
    echo "  + DONE"
}

install_gotools2() {
  cd /usr/share/
  git clone https://github.com/dogasantos/hakrawler.git
  cd hakrawler && go build -o hakrawler hakrawler.go
  cp hakrawler ~/go/bin/
  cd /usr/share/
  
  git clone https://github.com/dogasantos/tls-scan-hostgrabber.git
  cd tls-scan-hostgrabber
  go mod init https://github.com/dogasantos/tls-scan-hostgrabber
  go mod tidy
  go build -o tls-scan-hostgrabber tls-scan-hostgrabber.go
  cp tls-scan-hostgrabber ~/go/bin/

}


install_gotools() {
  if [ -d /usr/local/go ]
  then
    go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
    go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
    go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
    go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
    go install -v github.com/projectdiscovery/mapcidr/cmd/mapcidr@latest
    go get -v -u github.com/projectdiscovery/mapcidr/cmd/mapcidr
    go install -v github.com/projectdiscovery/mapcidr/cmd/mapcidr@latest
    go install -v github.com/projectdiscovery/shuffledns/cmd/shuffledns@latest
    go install -v github.com/projectdiscovery/proxify/cmd/proxify@latest
    go install -v github.com/projectdiscovery/dnsx/cmd/dnsx@latest
    go install -v github.com/projectdiscovery/notify/cmd/notify@latest
    go install -v github.com/projectdiscovery/chaos-client/cmd/chaos@latest
    go install -v github.com/ffuf/ffuf@latest
    go install -v github.com/003random/getJS@latest
    go install -v github.com/pwnesia/dnstake/cmd/dnstake@latest
    go install -v github.com/sensepost/gowitness@latest
    go install -v github.com/hahwul/dalfox/v2@latest
    go install -v github.com/dogasantos/prefixcheck/cmd/prefixcheck@latest
    go get -v github.com/dogasantos/tls-scan-hostgrabber
    go install -v github.com/cgboal/sonarsearch/cmd/crobat@latest
    go install -v github.com/tomnomnom/anew@latest
    go install -v github.com/tomnomnom/httprobe
    go install -v github.com/tomnomnom/waybackurls
    go install -v github.com/tomnomnom/qsreplace
    go install -v github.com/tomnomnom/unfurl
    echo "GO TOOLS OK"
  else
    echo "precisa instalar go manualmente primeiro (/usr/local/go)"
    echo "depois precisa setar o bashrc com as envs corretas GOPATH GOBIN GOROOT PATH"
    exit
  fi
}

# ORDEM:
wdir=$(pwd)
install_gotools


if [ $(id -u) -eq 0 ] 
then
  # root power
  install_prepare
  install_masscan
  install_massdns
  install_eyewitness
  install_masstomap
  install_linkfinder
  install_amass
  install_wordlists
  install_s3scanner
  install_gotools2
else
  #user 
  cp /usr/share/tls-scan-hostgrabber/tls-scan-hostgrabber ~/go/bin/
  cp /usr/share/hakrawler/hakrawler ~/go/bin/  
fi


cd $wdir

echo "concluido"
