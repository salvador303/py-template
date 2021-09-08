from aiohttp import web

from aiohttp_example.controllers import BaseController


def add_routes(app):
    app.add_routes([web.get('/', BaseController)
                    ])
