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
alias summary='awk "{if(min==\"\"){min=max=\$1}; if(\$1>max) {max=\$1}; if(\$1<min) {min=\$1}; total+=\$1; count+=1} END {print \"avg:\" total/count, \"max:\" max, \"min:\"min}"'
alias rsummary='Rscript -e "d <- (as.numeric (readLines (\"stdin\"))); summary(d); print(paste(\"SD:\", sd(d)))"'
