from flask import Flask
from flask_cache import Cache
from app.controllers import web, api
import os
from flask_compress import Compress
from werkzeug.contrib.profiler import ProfilerMiddleware

application = Flask(__name__)

application.register_blueprint(web.app)
application.register_blueprint(api.app)

application.config['PROFILE'] = True
application.wsgi_app = ProfilerMiddleware(application.wsgi_app, sort_by=['tottime'], restrictions=[20])

cache = Cache(application, config={'CACHE_TYPE': 'simple'})

Compress(application)

if not os.environ.get('PRODUCTION'):
    # configuration
    DEBUG = True

if __name__ == "__main__":
    # no index
    application.run()
