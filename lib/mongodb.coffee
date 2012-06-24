mongo = require 'mongodb'

exports.start = (cb) ->
  server = new mongo.Server 'localhost', 27017, { auto_reconnect: true}
  db     = new mongo.Db 'toggl-db', server

  db.open (err, db) ->
    if err
      console.info 'error mongodb: ' + err
    else
      cb()

