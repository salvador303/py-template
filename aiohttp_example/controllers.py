from aiohttp import web
from aiohttp.web_request import Request


class BaseController:

    async def get(self, request: Request):
        print(f"You've hit {request.url}")
        return web.json_response({"cool": "response"})

