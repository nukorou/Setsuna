from flask import render_template, Blueprint
from cache import cache

app = Blueprint('web', __name__)


@cache.cached(timeout=20)
@app.route('/')
@app.route('/index')
def view_index():
    return render_template('index.html')
