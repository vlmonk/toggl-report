global.Toggl = {}

Toggl.db = require './lib/mongodb'
Toggl.webserver = require './lib/webserver'

Toggl.db.start ->
  Toggl.webserver.start process.env.PORT || 8123
