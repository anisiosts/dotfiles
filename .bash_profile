#----- Utils -----

alias code='open -a "Visual Studio Code"'
alias docs='cd ~/Documents'
alias down='cd ~/Downloads'
alias labs='cd ~/Labs'
alias tool='cd ~/Tools'
alias scrp='cd ~/Scripts'
alias bp='vim ~/.bash_profile'

function mcd
    mkdir $argv
    cd $argv
end

function startlab 
    
    # cria a pasta com o nome indicado na pasta labs
    mkdir ~/Labs/$argv[1]
    
    # copia e cola a apk la
    cp $argv[1] ~/Labs/$argv[1]/$argv[1]
    cd ~/Labs/$argv[1]
    
    # roda apktool (criando uma pasta com o nome apktool)
    apktool d -o apktool $argv[1]
    
    # roda jadx (criando uma pasta com o nome jadx)
    jadx $argv[1] -d jadx
    
    # roda dex2jar (criando uma pasta com o nome dex2jar)
    dex2jar -o dex2jar/$argv[1].jar $argv[1]
    
    # Joga a apk no mobsf
    python3 ~/Scripts/mobsf.py $argv[1]	

    clear

    # roda initial android checks
    ~/Scripts/iac.sh

    # prox passos, instalar apk no device e abrir o vscode nessa pasta
end


#----- Mobile Hacking Tools -----

alias emulator="~/Library/Android/sdk/tools/emulator"
alias adb="~/Library/Android/sdk/platform-tools/adb"
alias jadx="~/Tools/jadx/bin/jadx"
alias dex2jar="~/Tools/dex2jar/dex2jar.sh"
alias jd-gui="java -jar ~/Tools/jd-gui/jd-gui.jar"
alias apktool="java -jar ~/Tools/apktool/apktool.jar"
alias mobsf='docker run -it -d  -p 8000:8000 opensecurity/mobile-security-framework-mobsf:latest'
alias avd='~/Library/Android/sdk/tools/bin/avdmanager'

#----- Hacking Tools -----

alias pappy='~/Tools/pappy-proxy/start'

