alias ll="ls -la"                                                                    
alias .="cd ../"                                                                     
alias ..="cd ../../"                                                                 
alias ...="cd ../../../"                                                             
alias ....="cd ../../../../"                                                         
alias jt="ssh reeb@jobtest.rostclust"                                                
alias jt2="ssh reeb@jobtest2.rostclust"                                              
alias webshare='python -c "import SimpleHTTPServer;SimpleHTTPServer.test()"'
alias b="cd $OLDPWD"
alias lg='logout'
alias ports='netstat -tulanp'
#Bioinformatics
alias nfas='grep -c "^>"'
alias singfas='awk "/^>/ {printf(\"\n%s\n\",\$0);next; } { printf(\"%s\",\$0);}  END {printf(\"\n\");}"' #cf. http://www.biostars.org/p/9262/#9264
