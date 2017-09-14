from flask import Flask
app = Flask(__name__)

from os import listdir
from os.path import isfile, join

@app.route('/')
def hello_world():
    onlyfiles = [f for f in listdir('./') if isfile(join('./', f))]
    fcount = 0
    for fil in onlyfiles:
        if ('_checkin.txt' in fil):
            fcount += 1
            
    return str(fcount)

@app.route('/checkin/<vmname>')
def checkin(vmname):
    # show the user profile for that user
    fname = vmname + '_checkin.txt'
    with open(fname, 'w') as f:
        f.write("checking in!")
        
    return 'VM ' + vmname + ' checked in successfully.'
