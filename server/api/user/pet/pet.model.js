'use strict';

var mongoose = require('mongoose'),
    Schema = mongoose.Schema;

var PetSchema = new Schema({
  name: String,
  src: String,
  feedDates: [Date],
  happiness:  {
    type: Number,
    default: 100
  },
  hasMaster: {
    type: Boolean,
    default: false
  },
  master: Schema.Types.ObjectId,
  feedPeriod: Number,
  tags: [String]
});

module.exports = mongoose.model('Pet', PetSchema);
