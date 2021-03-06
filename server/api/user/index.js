'use strict';

var express = require('express');
var controller = require('./user.controller');
var config = require('../../config/environment');
var auth = require('../../auth/auth.service');
var jwt = require('express-jwt');
var secret = require('../../config/environment').secrets.session;
var jwtMiddleware = jwt({secret: secret});

var router = express.Router({mergeParams: true});

router.use('/:id/pets', require('./pet'));
router.get('/', auth.hasRole('admin'), controller.index);
router.delete('/:id', auth.hasRole('admin'), controller.destroy);
router.get('/me', auth.isAuthenticated, controller.me);
router.put('/:id/password', auth.isAuthenticated, controller.changePassword);
router.get('/:id', auth.isAuthenticated, controller.show);
router.post('/', controller.create);

module.exports = router;
