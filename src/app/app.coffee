path = require "path"

express = require "express"
app = express()

app.set "port", process.env.PORT || 3000
app.set "host", process.env.HOST || "127.0.0.1"

app.use express.static path.join __dirname, "../public"

sendFileOptions = options:
            root: path.join __dirname, "../public"

app.get "/", (req, res) ->
    res.sendFile "index.html", sendFileOptions

module.exports = app
