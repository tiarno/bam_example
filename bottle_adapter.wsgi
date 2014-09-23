import sys, bottle
sys.path.insert(0,'/var/www/bottle')
import people

bottle.TEMPLATE_PATH.insert(0, '/var/www/bottle/views/people')

application = bottle.default_app()
application.mount('/people', people.app)

bottle.debug(True)
#bottle.run(host='example02', port=8090, debug=True)