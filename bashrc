# ~/.bashrc

# /////////////////////// MAP CAPS LOCK TO ESC //////////////////////////////////////
setxkbmap -option caps:escape
# to clear all mappings 
# setxkbmap -option

# ////////////////////////// ALIASES   //////////////////////////////////////////////
alias cdmm="cd ~/Development/setu/enieslobby/spike"

function rm () {
    [ $1 == "-rf" ] && shift;
    [ $1 == "-r" ] && shift;
    mkdir -p /tmp/recycle_bin && mv -b -- $@ /tmp/recycle_bin
}
function mailme(){
	mutt -s "\Attachments are the root cause of all evil/" -a $1 < /dev/null -- dhiraj@setu.co
}
function mailpeeps(){
	attachment=$1
	shift
	mutt -s "\Attachments are the root cause of all evil/" -a $attachment < /dev/null -- dhiraj@setu.co $@
}

# ////////////////////// PATH ///////////////////////////////////////////////////////
export PATH=$PATH:$HOME/.npm_packages/bin:$HOME/go/bin;

# ////////////////////// PS1 PROMPT /////////////////////////////////////////////////
export PS1='\e[33;1m[\u@\h \W]\$ \e[0m'

# ////////////////////// DUAL MONITORS //////////////////////////////////////////////
xrandr --output DP1 --auto --output HDMI1 --auto --right-of DP1


# ---------------------- SYSTEM GENERATED ------------------------------------------
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/opt/sdks/google-cloud-sdk/path.bash.inc' ]; then . '/home/opt/sdks/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/opt/sdks/google-cloud-sdk/completion.bash.inc' ]; then . '/home/opt/sdks/google-cloud-sdk/completion.bash.inc'; fi

source <(kubectl completion bash)
. "$HOME/.cargo/env"
source /usr/share/nvm/init-nvm.sh
