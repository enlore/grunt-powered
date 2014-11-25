(function() {
  var HOST, PORT, app;

  app = require("./app");

  PORT = app.get("port");

  HOST = app.get("host");

  app.listen(PORT, HOST, function() {
    return console.log("##### _ >Listening on " + HOST + ":" + PORT);
  });

}).call(this);
