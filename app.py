#Dylan Kennth Eliot

"""
This is a test app. It is stripped down for demonstration and templating purposes when used with the Acorn.io binary. 

"""

from flask import Flask

app = Flask(__name__)

@app.route('/')
def root():
    return """hello"""
