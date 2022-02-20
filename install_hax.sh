#!/bin/bash

sudo apt-get update --fix-missing
sudo apt-get install -y \
    binutils \
    ltrace \
    strace \
    gdb \
    gdbserver \
    gdb-multiarch \
    libssl-dev \
    libffi-dev \
    python3-dev \
    ruby \
    netcat \
    gnupg-agent \
    ghex \
    openjdk-11-jdk \
    httpie

python3 -m pip install --upgrade pip

sudo git clone https://github.com/pwndbg/pwndbg.git /opt/pwndbg
bash -c 'cd /opt/pwndbg && ./setup.sh'

(mkdir -p $HOME/virtualenvironments || : ) 2> /dev/null
python3 -m venv $HOME/virtualenvironments/hax
echo '
alias hax="source $HOME/virtualenvironments/hax/bin/activate"' >> $HOME/.zshrc
source $HOME/virtualenvironments/hax/bin/activate
pip install httpx ipython angr pwntools ropper pycryptodomex z3-solver

deactivate

wget -O /tmp/ghidra.zip https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_10.1.2_build/ghidra_10.1.2_PUBLIC_20220125.zip
sudo unzip -d /opt/ /tmp/ghidra.zip
rm /tmp/ghidra.zip


wget -O /tmp/ninja.zip https://cdn.binary.ninja/installers/BinaryNinja-demo.zip
sudo unzip -d /opt/ /tmp/ninja.zip
rm /tmp/ninja.zip

