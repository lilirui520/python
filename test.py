# -*- coding: utf-8 -*-
from flask import Flask
import logging

app = Flask(__name__)


@app.route('/')
def root():
    app.logger.info('info log')
    app.logger.warning('warning log')
    return 'hello'

if __name__ == '__main__':
    app.debug = True
    handler = logging.FileHandler('/tmp/fluentd.log')
    app.logger.addHandler(handler)
    app.run(host='0.0.0.0', port=8080)
