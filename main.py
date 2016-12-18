from flask import Flask
from app.controllers import web, api
import os
from app.models import conf as db

application = Flask(__name__)

application.register_blueprint(web.app)
application.register_blueprint(api.app)

if not os.environ.get('PRODUCTION'):
    # configuration
    DEBUG = True

if __name__ == "__main__":
    # no index
    db.posts.create_index("deleted_at", expireAfterSeconds=60)
    application.run()
