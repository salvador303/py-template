

class BaseRequest:

    def __init__(self, raw_request):
        self.start = raw_request.get("start")
        self.end = raw_request.get("end")
        self.id = raw_request.get("id")


