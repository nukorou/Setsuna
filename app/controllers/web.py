from flask import render_template, Blueprint

app = Blueprint('web', __name__)


@app.route('/')
@app.route('/index')
def view_index():
    contributions = ['con', 'con2']
    return render_template('index.html', contributions=contributions)
