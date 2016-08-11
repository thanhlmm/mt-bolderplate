express = require 'express'
mongoose = require 'mongoose'
bodyParser = require 'body-parser'
_ = require 'lodash'
app = express()

mongoose.connect 'mongodb://localhost/xproject'; #Change your db name here
mongoose.connection.on 'error', ->
    console.log('MongoDB Connection Error. Please make sure that MongoDB is running.');
    process.exit(1);

app.use bodyParser.json()
app.use bodyParser.urlencoded extended: true
app.use (req, res, next) ->
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
  next();

#Load Modal 
User = require('./models/User'); # Viet hoa cho biet cai nay la model

# Logic processor
app.get '/greeting', (req, res) ->
    res.end 'Hello world, this is CuThanh.com bolderplate'


app.listen '2700';
console.log 'Your sever is up and running in port 2700'