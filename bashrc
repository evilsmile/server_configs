# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

export WORK_DIR=/home/ian/workspace/src

alias cdw='cd $WORK_DIR && export PS1="[\\u@\\h \\w][WorkRoot]\\$ "'
alias cdt='cd $WORK_DIR/tools && export PS1="[\\u@\\h \\w][Tool]\\$ "'
alias cds='cd $WORK_DIR/service && export PS1="[\\u@\\h \\w][Service]\\$ "'
alias cdc='cd $WORK_DIR/cgi && export PS1="[\\u@\\h \\w][Cgi]\\$ "'
alias cdb='cd $WORK_DIR/bin && export PS1="[\\u@\\h \\w][Bin]\\$ "'
alias cdl='cd $HOME/logs && export PS1="[\\u@\\h \\w][Log]\\$ "'
alias ps_clear='export PS1="[\\u@\\h \\w]\\$ "'

alias grep='grep --color=always'
alias grep_c='grep --include="*.c"'
alias grep_h='grep --include="*.h"'
alias grep_cpp='grep --include="*.cpp"'

alias ll='ls -lh' 
alias l='ls'

alias sqlplus='rlwrap sqlplus'
alias rman='rlwrap rman'

alias sql_db='sqlplus bcpuser/bcpuser@BCPDB'
alias xsql='mysql -u gctest -pgctest -h 192.168.0.40 --default-character-set=utf8 trade -A'
alias mc='make debug=1 clean'
alias mci='make debug=1 clean && make debug=1 install'
alias mi='make debug=1 install'

export LD_LIBRARY_PATH=/usr/local/lib/:/usr/local/serf/lib/:$LD_LIBRARY_PATH
export PATH=$HOME/tools:$PATH
export PREFIX='/home/ian/workspace/bcp2'
export POS_HOME='/home/ian/workspace/bcp2'
export PS1="[\\u@\\h \\w]\\$ "

unset SSH_ASKPASS

cdw
