#!/usr/bin/env python
# Why am I using bottle to serve such a simple website? Well, I hope to add
# some student interaction eventually rather than just service a static page.

from bottle import run, route, view, static_file

@route('/')
def index():
    return static_file('index.html', root="/data/www")

@route('/<filename>')
def staticfile(filename):
    return static_file(filename, root="/data/www")

run(host='0.0.0.0', port=8080, debug=True)
