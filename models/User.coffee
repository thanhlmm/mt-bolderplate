mongoose = require 'mongoose'
AutoIncrement = require 'mongoose-sequence'
Schema = mongoose.Schema

xMen = new mongoose.Schema {
    UID: Number
    name: String
    avatar: String
    like: Array
    date:
        type: Date
        default: Date.now
}
xMen.plugin AutoIncrement, {inc_field: 'UID'}
module.exports = mongoose.model('Xmen', xMen)