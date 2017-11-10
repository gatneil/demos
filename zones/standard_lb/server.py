import math

from flask import Flask
app = Flask(__name__)

@app.route('/', methods=['GET'])
def default_page():
    res = 0
    for i in range(0, 10):
        res += math.sqrt(19)
        
    return str(res)
