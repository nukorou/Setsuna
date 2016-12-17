from .. import app
from flask import render_template
import os


@app.route('/')
@app.route('/index')
def view_index():
    contributions = ['con', 'con2']
    return render_template('index.html', contributions=contributions)
