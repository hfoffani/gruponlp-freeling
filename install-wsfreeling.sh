
sudo apt-get install python-pip
sudo pip install https://github.com/dpallot/simple-websocket-server/zipball/master
sudo cp fl.py /usr/local/lib
sudo cp ws-freeling /etc/init.d
sudo chmod +x /etc/init.d/ws-freeling
sudo update-rc.d ws-freeling defaults

echo Restart so changes are in effect.


