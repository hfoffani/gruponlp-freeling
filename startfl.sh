
# start FL
analyzer -f es.cfg --server --port 50005 &

# wait for freeling
sleep 60

# start webscoket
python fl.py --server &

