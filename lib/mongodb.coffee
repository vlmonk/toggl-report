mongo = require 'mongodb'
instance = null

exports.start = (cb) ->
  server = new mongo.Server 'localhost', 27017, { auto_reconnect: true}
  db     = new mongo.Db 'toggl-db', server

  db.open (err, db) ->
    if err
      console.info 'error mongodb: ' + err
    else
      instance = db
      cb()

exports.readSetting = (key, cb) ->
  instance.collection 'settings', (err, collection) ->
    collection.findOne { key: key }, (err, item) ->
      value = if item then item.value else null
      cb null, { id: key, value: value }

exports.writeSetting = (key, value, cb) ->
  instance.collection 'settings', (err, collection) ->
    collection.findOne { key: key }, (err, item) ->
      if (item)
        collection.update { key: key }, { $set: { value: value }}, (err, result) ->
          cb null, { id: key, value: value }
      else
        collection.insert { key: key, value: value }, (err, result) ->
          cb null, { id: key, value: value }

