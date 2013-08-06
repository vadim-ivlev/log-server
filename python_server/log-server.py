#!/usr/bin/python
from BaseHTTPServer import BaseHTTPRequestHandler, HTTPServer
# import os
import time
import subprocess
from time import gmtime, strftime

PORT_NUMBER = 8080
LOG_FILE_NAME = "access_log"
TAIL_SIZE = "5000"


#This class will handles any incoming request from
#the browser
class myHandler(BaseHTTPRequestHandler):

    #Handler for the GET requests
    def do_GET(self):

        current_time = strftime("Current_time - - [%d/%b/%Y:%H:%M:%S ]", gmtime())

        start_time = time.time()

        # os.system('tail -c {0} {1} > hits.txt'.format(TAIL_SIZE, LOG_FILE_NAME))
        # subprocess.call(["tail", "-c", TAIL_SIZE, LOG_FILE_NAME, ">", "hits.txt"])

        # f = open('hits.txt')
        # text = f.read()
        # f.close()

        text = subprocess.check_output(["tail", "-c", TAIL_SIZE, LOG_FILE_NAME])

        end_time = time.time()

        text2 = "\n".join(text.split("\n")[1:])

        # time.sleep(2)

        self.send_response(200)
        self.send_header('Content-type', 'text/plain')
        self.end_headers()

        # self.wfile.write(current_time)
        self.wfile.write("{} Execution_time:{} seconds \n".format(current_time, end_time - start_time))
        self.wfile.write(text2)
        

        return


try:
    #Create a web server and define the handler to manage the
    #incoming request
    server = HTTPServer(('', PORT_NUMBER), myHandler)
    print 'Started httpserver on port ', PORT_NUMBER
    print '^C to stop.'

    #Wait forever for incoming htto requests
    server.serve_forever()

except KeyboardInterrupt:
    print '^C received, shutting down the web server'
    server.socket.close()

