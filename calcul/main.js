const { fs } = require('fs');
const axios = require('axios').default;
const SunCalc = require('suncalc');

var lat = 45.93668
var lng = 6.13304
var height = 486

var sunpos = SunCalc.getPosition(new Date, lat, lng)
console.log(sunpos)
// url builder
//URL (IA): https://www.suncalc.org/#/45.93668,6.13304,15/2015.05.11/13:15/1/2
//var url = 'https://www.suncalc.org/#/45.93668,6.13304,15/'+ yyyy + '.' + mm + '.' + dd + '/' + hours + ':' + mins + '/1/2'
//console.log(url)


