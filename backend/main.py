
from model.Model import Model

m = Model()
m.run_model()
# #
from flask import Flask
# from flask import request
#
app = Flask(__name__)


# @app.route("/<gene1>/<gene2>/<gene3>/<gene4>/<mutation>/", methods=['GET'])
# def test(gene1, gene2, gene3, gene4, mutation):
#     res = m.test_gene_from_front(gene1, gene2, gene3, gene4, mutation)
#     return {"response": res}
#
@app.route("/test/<g1>/<g2>/<g3>/<g4>/<mu>", methods=['POST', 'GET'])
def home(g1, g2, g3, g4, mu):
    res = m.test_gene_from_front(float(g1), float(g2), float(g3), float(g4), float(mu))
    # print(type(float(g1)), "  ", g2, " ", g3, " ", g4, " ", mu)
    return {"response": res}
#
#
app.run(debug=False)
