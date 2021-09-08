from aiohttp import web

from aiohttp_example import config_and_constatns as config
from aiohttp_example.routes import add_routes


def get_app() -> web.Application:
    app = web.Application()
    add_routes(app)
    return app


if __name__ == "__main__":
    app = get_app()
    web.run_app(app=app, host=config.HOST, port=config.PORT)
