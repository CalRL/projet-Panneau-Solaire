const { fs } = require('fs');
const axios = require('axios').default;
const SunCalc = require('suncalc');
const Math = require('mathjs');

var lat = 45.93668
var lng = 6.13304
var height = 486

var sunpos = SunCalc.getPosition(new Date, lat, lng)
console.log(sunpos)

var rndmAzimuth = sunpos.azimuth // *180/Math.PI;
console.log(rndmAzimuth)

var times = SunCalc.getTimes(new Date(), lat, lng);
console.log(times)
// url builder
//URL (IA): https://www.suncalc.org/#/45.93668,6.13304,15/2015.05.11/13:15/1/2
//var url = 'https://www.suncalc.org/#/45.93668,6.13304,15/'+ yyyy + '.' + mm + '.' + dd + '/' + hours + ':' + mins + '/1/2'
//console.log(url)


