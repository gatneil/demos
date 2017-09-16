from flask import Flask
app = Flask(__name__)

from sumy.parsers.plaintext import PlaintextParser
from sumy.nlp.tokenizers import Tokenizer
from sumy.summarizers.lex_rank import LexRankSummarizer

@app.route('/')
def ml_server():
        parser = PlaintextParser.from_string("Hi there! My name is Neil. Things are cool.", Tokenizer("english"))
        summarizer = LexRankSummarizer()

        summary = summarizer(parser.document, 2)
        res = ""
        for sentence in summary:
                res += sentence
            
        return res
