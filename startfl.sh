
# start FL
analyze -f es.cfg --server --port 50005 --output json --flush &

# wait for freeling
sleep 60

# start webscoket
python fl.py --server &

