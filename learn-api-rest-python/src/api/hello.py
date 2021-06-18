from flask import Blueprint

hello = Blueprint('hello', __name__, url_prefix='/api/hello')

@hello.route('/', methods=('GET', 'POST'))
def index():
    return {'message': 'Hello World!'}

@hello.route("/<string:name>", methods=('GET', 'POST'))
def greet(name):
    return {'message': 'Hello {}!'.format(name)}
