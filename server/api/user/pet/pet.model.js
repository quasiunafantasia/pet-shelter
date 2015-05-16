'use strict';

var mongoose = require('mongoose'),
    Schema = mongoose.Schema;

var PetSchema = new Schema({
//todo
});

module.exports = mongoose.model('Pet', PetSchema);
