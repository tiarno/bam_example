from bottle import Bottle, route, view, request
from bson.json_util import dumps, loads
from bson.objectid import ObjectId
import pymongo

conn = pymongo.MongoReplicaSetClient(
        'example02.unx.sas.com, example01.unx.sas.com',
        replicaSet='rs1')
db = conn.test
app = Bottle()

@app.get('/')
@view('people')
def people():
    p = db.people.find().sort([('name', 1)])
    return {'results': list(p)}

@app.get('/<name>')
@view('person')
def person(name):
    person = db['people'].find_one({'name':name})
    person['_id'] = str(person['_id'])
    return {'person': person}

@app.post('/')
def update_person():
    data = request.body.read()
    person = loads(data)
    person['_id'] = ObjectId(person['_id'])
    db['people'].save(person)