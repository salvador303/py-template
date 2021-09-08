from aiohttp import web
from aiohttp_example.routes import add_routes


async def test_hello(aiohttp_client, loop):
    app = web.Application()
    add_routes(app)
    client = await aiohttp_client(app)
    resp = await client.get('/')
    assert resp.status == 200
    text = await resp.text()
    assert 'Hello, world' in text