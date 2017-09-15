from flask import Flask
app = Flask(__name__)

@app.route('/')
def ml_server():
        return 'ml server here!'
