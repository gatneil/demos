from flask import Flask
from flask import request
app = Flask(__name__)

from sumy.parsers.plaintext import PlaintextParser
from sumy.nlp.tokenizers import Tokenizer
from sumy.summarizers.lex_rank import LexRankSummarizer

@app.route('/', methods=['GET'])
def default_page():
        return "Hello Ignite!"

@app.route('/summarize', methods=['POST'])
def ml_server():
        parser = PlaintextParser.from_string(request.form['text'], Tokenizer("english"))
        summarizer = LexRankSummarizer()

        summary = summarizer(parser.document, 1)
        res = ""
        for sentence in summary:
                res += str(sentence)
            
        return res
