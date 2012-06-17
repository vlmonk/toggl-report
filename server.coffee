express = require 'express'
app     = express.createServer()

app.use express.logger()
app.use express.static(__dirname + '/public')
app.set 'views', __dirname + '/views'

app.get '/', (req, res) ->
  res.render 'index.jade', { layout: false }

app.listen process.env.PORT || 8123
