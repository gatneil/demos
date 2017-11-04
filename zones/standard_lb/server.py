from flask import Flask
app = Flask(__name__)

@app.route('/', methods=['GET'])
def default_page():
    return "Hello World!"
