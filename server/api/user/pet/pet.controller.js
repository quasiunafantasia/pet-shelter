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
function createPet () {
  return new Pet({
    src: "https://d2k1ftgv7pobq7.cloudfront.net/images/stickers/frown.png",
    name: "Zhorik"
  });

}

// Get list of things
exports.index = function(req, res) {
  console.log('query');
  var pets = [];
  for (var i = 0; i < 10; i++) {
    pets.push(createPet());
  }
  res.json(pets);
};

// Get a single thing
exports.show = function(req, res) {
  res.json(createPet());
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
