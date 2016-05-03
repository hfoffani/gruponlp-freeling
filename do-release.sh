if [ \! -d releases ]; then
    mkdir releases
fi

FILES="README.md fl.py install-freeling.sh install-wsfreeling.sh ws-freeling"
tar cvzf releases/flserver.tgz $FILES
