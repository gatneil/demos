import math

from flask import Flask
app = Flask(__name__)

@app.route('/', methods=['GET'])
def default_page():
    res = 0
    for i in range(0, 1000000):
        res += math.sqrt(i)
        
    return str(res)
