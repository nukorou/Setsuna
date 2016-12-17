from flask import Flask
from app.controllers import web, api
import os

application = Flask(__name__)

application.register_blueprint(web.app)
application.register_blueprint(api.app)

if os.environ.get('PRODUCTION'):
    # configuration
    DEBUG = True

if __name__ == "__main__":
    application.run()
