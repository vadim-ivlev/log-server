#!/usr/bin/python
from BaseHTTPServer import BaseHTTPRequestHandler, HTTPServer
import os
import time
#import subprocess
from time import gmtime, strftime

PORT_NUMBER = 8081
LOG_FILE_NAME = "/var/log/httpd/access_log"
TAIL_FILE_NAME = "images_acces_tail.txt"
TAIL_SIZE = "30000"


#This class will handles any incoming request from

class myHandler(BaseHTTPRequestHandler):

    #Handler for the GET requests
    def do_GET(self):

        current_time = strftime("Current_time - - [%d/%b/%Y:%H:%M:%S ]", gmtime())

        start_time = time.time()

        os.system('tail -c %s %s > %s' % (TAIL_SIZE, LOG_FILE_NAME, TAIL_FILE_NAME))
        # subprocess.call(["tail", "-c", TAIL_SIZE, LOG_FILE_NAME, ">", "hits.txt"])

        f = open( TAIL_FILE_NAME )
        text = f.read()
        f.close()

        #text = subprocess.check_output(["tail", "-c", TAIL_SIZE, LOG_FILE_NAME])

        end_time = time.time()

        text2 = "\n".join(text.split("\n")[1:])


        self.send_response(200)
        self.send_header('Content-type', 'text/plain')
        self.send_header('Access-Control-Allow-Origin', '*')
        self.end_headers()

        self.wfile.write("Current time:%s  Execution_time:%f seconds \n" % (current_time, end_time - start_time))
        self.wfile.write(text2)
        

        return


try:
    #Create a web server and define the handler to manage the
    #incoming request
    server = HTTPServer(('', PORT_NUMBER), myHandler)
    print 'Started httpserver on port ', PORT_NUMBER
    print 'Log file: ', LOG_FILE_NAME
    print '^C to stop.'

    #Wait forever for incoming htto requests
    server.serve_forever()

except KeyboardInterrupt:
    print '^C received, shutting down the web server'
    server.socket.close()

