express = require 'express'
sass    = require 'node-sass'

exports.start = (port) ->
  app = express.createServer()
  app.use express.logger()
  app.use sass.middleware
    src: __dirname + '/..'
    dest: __dirname + '/../public'
    debug: true

  app.use express.static(__dirname + '/../public')
  app.use require('connect-assets')()
  app.use(express.bodyParser());
  app.set 'views', __dirname + '/../views'

  app.get '/', (req, res) ->
    res.render 'index.jade', { layout: false }

  app.get '/settings/:key', (req, res) ->
    key = req.params.key
    Toggl.db.readSetting key, (err, result) ->
      res.send JSON.stringify(result)

  app.put '/settings/:key', (req, res) ->
    key   = req.params.key
    value = req.body.value
    Toggl.db.writeSetting key, value, (err, result) ->
      res.send JSON.stringify(result)

  app.listen port
