from pymongo import MongoClient
import configparser
import os
from urllib import parse

if os.environ.get('PRODUCTION'):
    # 本番設定
    # port_number = os.environ.get('DB_PORT')
    MONGO_URL = os.environ.get('MONGODB_URI')
    connect = MongoClient(MONGO_URL)
    posts = connect['setsuna']['posts']
    life = 6
else:
    # Import config
    config = configparser.ConfigParser()
    config.read('setsuna.cfg')
    conf = config['laptop']
    port_number = int(conf['port'])

    # DB Connection
    connect = MongoClient(conf['address'], port_number)
    posts = connect[conf['database']][conf['collection']]

    # Setsuna configp
    life = int(conf['life'])
