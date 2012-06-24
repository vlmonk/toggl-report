global.Toggl = {}

Toggl.db = require './lib/mongodb'
Toggl.webserver = require './lib/webserver'

port = process.env.PORT || 8123
database = process.env.MONGOHQ_URL || 'mongodb://localhost:27017/toggl-db'

Toggl.db.start database, ->
  Toggl.webserver.start port
