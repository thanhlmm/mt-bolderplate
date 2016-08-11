var _, app, bodyParser, express, mongoose;

express = require('express');

mongoose = require('mongoose');

bodyParser = require('body-parser');

_ = require('lodash');

app = express();

mongoose.connect('mongodb://localhost/xproject'); // Change your db name here

mongoose.connection.on('error', function() {
  console.log('MongoDB Connection Error. Please make sure that MongoDB is running.');
  return process.exit(1);
});

app.use(bodyParser.json());

app.use(bodyParser.urlencoded({
  extended: true
}));

app.use(function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
  return next();
});

// Load Modal 
// var User = require('./models/User'); # Viet hoa cho biet cai nay la model

// Logic processor
app.get('/greeting', function(req, res) {
  return res.end('Hello world, this is CuThanh.com bolderplate');
});


app.listen('2700');

console.log('Your sever is up and running in port 2700');
