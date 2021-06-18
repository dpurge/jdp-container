import os 
from flask import Flask

from api import hello

app = Flask(__name__)

envvar_prefix = 'LEARN_API_REST'
config = os.environ.get('{}_CONFIG'.format(envvar_prefix), default='ProductionConfig')
host = os.environ.get('{}_HOST'.format(envvar_prefix), default='localhost')
port = os.environ.get('{}_PORT'.format(envvar_prefix), default='8080')

app.config.from_object('cfg.{}'.format(config))
app.register_blueprint(hello)

if __name__ == '__main__':
    app.run(host = host, port = port)
