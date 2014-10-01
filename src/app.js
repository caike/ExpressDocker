'use strict'

var express = require('express');
var app = express();

app.get('/', function(request, response) {
  response.send('Responding from Docker');
});

app.listen(process.env.PORT || 8080, function() {
  console.log('Listening from Docker');
});
