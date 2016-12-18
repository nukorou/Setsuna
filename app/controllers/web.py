from flask import render_template, Blueprint

app = Blueprint('web', __name__)


@app.route('/')
@app.route('/index')
def view_index():
    return render_template('index.html')
