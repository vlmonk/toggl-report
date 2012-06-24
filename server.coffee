global.Toggl = {}

webserver = require './lib/webserver'

webserver.start process.env.PORT || 8123
