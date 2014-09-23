from bottle import Bottle, route, view, request
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

@app.post('/<name>')
def update_person(name):
    person = {'name': name}
    person['age'] = request.POST.get('age')
    person['weight'] = request.POST.get('weight')
    person['height'] = request.POST.get('height')
    person['_id'] = ObjectId(request.POST.get('_id'))
    
    db['people'].save(person)
    return 'Thanks for your data.'