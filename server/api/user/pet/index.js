'use strict';

var express = require('express');
var controller = require('./pet.controller');

var router = express.Router({mergeParams: true});
router.all('/', function(req, res, next) {
    console.log('test');
    next();
});
router.get('/', controller.index);
router.get('/:petId', controller.show);
router.post('/', controller.create);
router.put('/:petId', controller.update);
router.patch('/:petId', controller.update);
router.delete('/:petId', controller.destroy);

module.exports = router;
