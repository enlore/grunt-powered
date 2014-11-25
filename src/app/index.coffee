app = require "./app"

PORT = app.get "port"
HOST = app.get "host"

app.listen PORT, HOST, () ->
    console.log "##### _ >Listening on " + HOST + ":" + PORT
