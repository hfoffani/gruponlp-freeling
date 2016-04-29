##############################################################
#  PyNLPl - FreeLing Library
#       by Maarten van Gompel (proycon)
#       http://ilk.uvt.nl/~mvgompel
#       Radboud University Nijmegen
#       
#       Licensed under GPLv3
# 
# This is a Python library for on-the-fly communication with
# a FreeLing server. Allowing on-the-fly lemmatisation and
# PoS-tagging. It is recommended to pass your data on a 
# sentence-by-sentence basis to FreeLingClient.process()
#
# Make sure to start Freeling (analyzer)  with the --server 
# and --flush flags !!!!!
#
###############################################################

from __future__ import print_function
from __future__ import unicode_literals
from __future__ import division
from __future__ import absolute_import    
    
import socket
import sys

def u(s, enc):
    return s

class FreeLingClient(object):
    def __init__(self, host, port, encoding='utf-8', timeout=120.0):
        """Initialise the client, set channel to the path and filename where the server's .in and .out pipes are (without extension)"""
        self.encoding = encoding
        self.BUFSIZE = 10240
        self.socket = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
        self.socket.settimeout(timeout)
        self.socket.connect( (host,int(port)) )
        self.encoding = encoding
        self.socket.sendall('RESET_STATS\0')
        r = self.socket.recv(self.BUFSIZE)
        if not r.strip('\0') == 'FL-SERVER-READY':
            raise Exception("Server not ready")

        
    def process(self, sourcewords, debug=False):
        """Process a list of words, passing it to the server and realigning the output with the original words"""

        self.socket.sendall(sourcewords.encode(self.encoding) +'\n\0')
        if debug: print("Sent:",sourcewords.encode(self.encoding),file=sys.stderr)
        
        results = []
        done = False
        while not done:    
            data = b""
            while not data:
                buffer = self.socket.recv(self.BUFSIZE)
                if debug: print("Buffer: ["+repr(buffer)+"]",file=sys.stderr)
                if buffer[-1] == '\0':
                    data += buffer[:-1]
                    done = True
                    break
                else:
                    data += buffer

            
            data = u(data,self.encoding)
            if debug: print("Received:",data,file=sys.stderr) 
            if not data == 'FL_SERVER_READY':
                results.append(data)
                done = True

        return ''.join(results)



from SimpleWebSocketServer import SimpleWebSocketServer, WebSocket

flcli = None
trace = True

class SimpleFreeLing(WebSocket):

    def handleMessage(self):
        if trace: print(self.address, 'analyze:', self.data)
        try:
            resp = unicode(flcli.process(self.data, debug=trace))
            self.sendMessage(resp)
        except Exception as e:
            print(e)

    def handleConnected(self):
        if trace: print(self.address, 'connected')

    def handleClose(self):
        if trace: print(self.address, 'closed')


import sys

if __name__ == "__main__":
    flcli = FreeLingClient('192.168.1.226', 50005)
    if len(sys.argv) > 1 and sys.argv[1] == '--server':
        server = SimpleWebSocketServer('', 8008, SimpleFreeLing)
        server.serveforever()
    else:
        s = 'La casa es bonita.'
        print( s )
        res = flcli.process(s)
        print( res )

