import flask
from flask import request, Response

app = flask.Flask(__name__)
app.config["DEBUG"] = True

@app.route('/service/sub')
def sub():
    qp = request.args
    va = qp.get('va')
    vb = qp.get('vb')
    result = float(va) - float(vb)  
    print("VA: " + str(va) + " VB: " + str(vb) + " == " + str(result))
    return Response(str(result))

app.run(host='0.0.0.0')