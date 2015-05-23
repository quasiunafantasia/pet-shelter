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

function getUserId(req) {
  //TODO rewrite
  var reqParams = req.originalUrl.split('/');
  return reqParams[reqParams.indexOf('users') + 1];
}
function createPet () {
  return new Pet({
    src: "https://d2k1ftgv7pobq7.cloudfront.net/images/stickers/frown.png",
    name: "Zhorik"
  });
}

function searchByName(name) {
  return Pet.find({name: { $regex : new RegExp(name, 'i') }}).read('sp');
}

function searchByTag(tag) {
  return Pet.find({
    tags: { $regex : new RegExp(tag, 'i') }
  }).read('sp');
};

function writeData(err, data) {
  this.json(data);
}

// Get list of things
exports.index = function(req, res) {
  var userId = getUserId(req);
  if (userId === 'all') {
  /* perform "global" search" */
    var query;
    if (req.query.name) {
      query = searchByName(req.query.name);
    } else if (req.query.tag) {
      query = searchByTag(req.query.tag);
    } else {
      query = Pet; /* потому что могу :( */
    }
    query.$where('!this.master').read('sp').exec(writeData.bind(res));
  } else {
    Pet.find({master: getUserId(req)}).read('sp').exec(writeData.bind(res));
  }
};

// Get a single thing
exports.show = function(req, res) {
  Pet.findOne({_id: req.param('petId')}).read('sp').exec(writeData.bind(res));
};

// Creates a new thing in the DB.
exports.create = function(req, res) {
  console.log(Pet.create);
  Pet.create(req.body, writeData.bind(res));
};

// Updates an existing thing in the DB.
exports.update = function(req, res) {
  var userId = getUserId(req);
  if (userId === 'all') {
    Pet.findByIdAndUpdate(req.param('petId'), {
      $set: req.body
    }).read('sp').exec(writeData.bind(res));
  } else {
    res.json(JSON.stringify({thisIs:'update'}));
  }

};

// Deletes a thing from the DB.
exports.destroy = function(req, res) {
  console.log('test');
  Pet.findByIdAndUpdate(req.param('petId'), {
      $unset: {master: 1}
    }).read('sp').exec(writeData.bind(res));
};
