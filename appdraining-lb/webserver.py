from flask import Flask
app = Flask(__name__)

import time

@app.route("/")
def hello():
    with open("/data/webserveroutput.txt", "a") as wo:
        wo.write("incoming request at " + time.strftime("%c") + ".\n")
        
    return "Hello World!"

    if __name__ == "__main__":
            app.run()
