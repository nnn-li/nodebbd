"use strict";

var nconf = require('nconf');
var databaseName = nconf.get('database');
var winston = require('winston');

if (!databaseName) {
	winston.info('数据库类型没设置! Run ./nodebb setup');
	process.exit();
}

var primaryDB = require('./database/' + databaseName);

module.exports = primaryDB;