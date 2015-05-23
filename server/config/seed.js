/**
 * Populate DB with sample data on server start
 * to disable, edit config/environment/index.js, and set `seedDB: false`
 */

'use strict';

var User = require('../api/user/user.model');
var Pet = require('../api/user/pet/pet.model');

var testUser = new User({
    provider: 'local',
    name: 'Test User',
    email: 'test@test.com',
    password: 'test'
  });

var adminUser = new User({
    provider: 'local',
    role: 'admin',
    name: 'Admin',
    email: 'admin@admin.com',
    password: 'admin'
  });
User.create(testUser);
User.create(adminUser);

User.find({}).remove(function() {
  testUser,
  adminUser,
  function() {
      console.log('finished populating users');
    }
});

Pet.find({}).remove(function() {
  Pet.create({
    name: 'Dor',
    src: 'http://www.imath.kiev.ua/images/people/36.jpg',
    feedDates: new Date(),
    happines: 100,
    hasMaster: false,
    feedPeriod: 5,
    tags : ["Angry", "Evil"]
  }, {
    name: 'Misha',
    src: 'http://applstat.univ.kiev.ua/images/sav.jpg',
    feedDates: new Date(),
    happines: 10,
    hasMaster: false,
    feedPeriod: 20,
    tags : ["Mimimi", "Good"]
  }, {
    name: 'JosephYoung',
    src: 'http://lurkmore.so/images/thumb/6/6e/Stalin_1902.jpg/250px-Stalin_1902.jpg',
    feedDates: new Date(),
    happines: 55,
    hasMaster: false,
    feedPeriod: 30,
    tags : ["Young", "Stalin"]
  }, {
    name: 'JosephOld',
    src: 'http://sceptic-ratio.narod.ru/ku/pic2/stalin-24.jpg',
    feedDates: new Date(),
    happines: 100,
    hasMaster: false,
    feedPeriod: 30,
    tags : ["Old", "Stalin", "Strong"]
  }, {
    name: 'Stone',
    src: 'http://fs149.www.ex.ua/show/39847198/39847198.jpg?1600',
    feedDates: new Date(),
    happines: 100,
    hasMaster: true,
    master: testUser._id,
    feedPeriod: 0,
    tags : ["Strong"]
  },{
    name: 'BlackMaster',
    src: 'http://cs9261.vk.me/v9261350/d2f/Tl1a8BDCmMc.jpg',
    feedDates: new Date(),
    happines: 100,
    hasMaster: true,
    master : adminUser._id,
    feedPeriod: 0,
    tags : ["Sexy", "Very sexy", "Awesome"]
  }, function() {
      console.log('finished populating pets');
      console.log();
    }
  );
});

