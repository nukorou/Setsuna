from pymongo import MongoClient
import configparser
import os

if os.environ.get('PRODUCTION'):
    # 本番設定
    # port_number = os.environ.get('DB_PORT')
    connect = MongoClient(os.environ.get('REDISTOGO_URL'))
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
