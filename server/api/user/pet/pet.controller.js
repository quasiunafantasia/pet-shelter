/**
 * Using Rails-like standard naming convention for endpoints.
 * GET     /things              ->  index
 * POST    /things              ->  create
 * GET     /things/:id          ->  show
 * PUT     /things/:id          ->  update
 * DELETE  /things/:id          ->  destroy
 */

'use strict';

var _ = require('lodash');
var Pet = require('./pet.model');
//var User = require('./../user.model');
function createPet () {
  return new Pet({
    src: "https://d2k1ftgv7pobq7.cloudfront.net/images/stickers/frown.png",
    name: "Zhorik"
  });

}

// Get list of things
exports.index = function(req, res) {
  //debugger;
  var reqParams = req.originalUrl.split('/');
  var userId = reqParams[reqParams.indexOf('users') + 1];
  console.log(userId);
  Pet.find({master: userId}).exec(function(err, data) {
    res.json(data);
  });
};

// Get a single thing
exports.show = function(req, res) {
  console.log(req.param('petId'));
  Pet.find({_id: req.param('petId')}).exec(function(err, data) {
    console.log(data);
    res.json(data[0]);
  });
};

// Creates a new thing in the DB.
exports.create = function(req, res) {
  res.json(JSON.stringify({thisIs:'post'}));
};

// Updates an existing thing in the DB.
exports.update = function(req, res) {
  res.json(JSON.stringify({thisIs:'update'}));

};

// Deletes a thing from the DB.
exports.destroy = function(req, res) {
  res.json(JSON.stringify({thisIs:'delete'}));
};
