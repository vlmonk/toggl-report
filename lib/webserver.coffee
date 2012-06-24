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
  app.set 'views', __dirname + '/../views'

  app.get '/', (req, res) ->
    res.render 'index.jade', { layout: false }

  app.listen port
