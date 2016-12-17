from pymongo import MongoClient
import os

# 生存時間
life = 6

if os.environ.get('PRODUCTION'):
    # 本番設定
    MONGO_URL = os.environ.get('MONGODB_URI')
    connect = MongoClient(MONGO_URL)
    posts = connect['setsuna']['posts']
else:
    # ローカル設定
    connect = MongoClient('127.0.0.1', 27017)
    posts = connect['setsuna']['posts']
