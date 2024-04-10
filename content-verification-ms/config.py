import os

SECRET_KEY = os.urandom(32)

basedir = os.path.abspath(os.path.dirname(__file__))

DEBUG = True

DB_USER = os.environ.get('CONTENT_VERIFICATION_MYSQL_DB_USER')
DB_PASSWORD = os.environ.get('CONTENT_VERIFICATION_MYSQL_DB_PASSWORD')
DB_HOST = os.environ.get('CONTENT_VERIFICATION_MYSQL_DB_HOST')
DB_NAME = os.environ.get('CONTENT_VERIFICATION_MYSQL_DB_NAME')

SQLALCHEMY_DATABASE_URI = f'mysql+pymysql://{DB_USER}:{DB_PASSWORD}@{DB_HOST}/{DB_NAME}'

SQLALCHEMY_TRACK_MODIFICATIONS = False