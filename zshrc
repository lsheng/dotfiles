# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git mvn brew jsontools screen zsh_reload kiji)

source $ZSH/oh-my-zsh.sh

# User configuration

# Tab complete known hosts
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

# Super secret git empty repo hash
export GIT_EMPTY_REPO_HASH=$(git hash-object -t tree /dev/null) # "4b825dc642cb6eb9a060e54bf8d69288fbee4904"

# OSX specific configuration
if [[ $OSTYPE == darwin* ]]; then
  export JAVA_HOME=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home

  alias chrome="open -a '/Applications/Google Chrome.app'"
fi

# Command aliases
alias mcs='mvn checkstyle:checkstyle -Dcheckstyle.output.format=plain -Dcheckstyle.output.file=$\{project.build.directory\}/checkstyle-result.txt -Dcheckstyle.failsOnError=true; cat `find . -name checkstyle-result.txt` | sed -e "s/.*kiji-.*\///g"'
alias mvn='~/bin/mvn'
alias sd='screen -dRUS dev' 

# Kiji Development Configuration

# Keep Maven from running out of memory when building Kiji.
export MAVEN_OPTS="-XX:MaxPermSize=1024m -Xmx1024m"

# Remove "Unable to load realm info from SCDynamicStore” error messages when building Kiji.
export HADOOP_OPTS="-Djava.security.krb5.realm= -Djava.security.krb5.kdc="

# Run Kiji Bento in headless mode
export BENTO_JAVA_OPTS="${BENTO_JAVA_OPTS} -Djava.awt.headless=true -XX:+UseConcMarkSweepGC -Xmx3g -Xms3g"

# Include Kiji developer tools on the path.
export PATH=$PATH:~/github/devtools/bin/
