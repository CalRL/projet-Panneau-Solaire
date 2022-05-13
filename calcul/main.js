const { fs } = require("fs");
const axios = require("axios").default;
const SunCalc = require("suncalc");
const Math = require("mathjs");

var lat = 45.93668;
var lng = 6.13304;
var height = 486;

var sunpos = SunCalc.getPosition(new Date(), lat, lng);
console.log(sunpos);

//var rndmAltitude = sunpos.altitude
//var rndmAzimuth = sunpos.azimuth // *180/Math.PI;
console.log(sunpos.azimuth, sunpos.altitude);
var aziRadToDeg = (1 * sunpos.azimuth * 180) / Math.pi;
var altRadToDeg = (1 * sunpos.altitude * 180) / Math.pi;
console.log(altRadToDeg, aziRadToDeg);

var times = SunCalc.getTimes(new Date(), lat, lng, height);
console.log(times);
var sunrise = SunCalc.getPosition(times.sunrise, lat, lng);
var sunset = SunCalc.getPosition(times.sunset, lat, lng);
var futureDate = new Date("April 14, 17:00:00");
var futureTimes = SunCalc.getPosition(new Date(), lat, lng, height);
console.log(sunrise, sunset);
console.log(futureTimes);
/* deprecated
//console.log(object.azimuth)
//console.log(object.altitude)
// url builder
//URL (IA): https://www.suncalc.org/#/45.93668,6.13304,15/2015.05.11/13:15/1/2
//var url = 'https://www.suncalc.org/#/45.93668,6.13304,15/'+ yyyy + '.' + mm + '.' + dd + '/' + hours + ':' + mins + '/1/2'
//console.log(url)
*/

/* 

░█████╗░░█████╗░███╗░░░███╗███╗░░░███╗██╗░░░██╗███╗░░██╗██╗░█████╗░░█████╗░████████╗██╗░█████╗░███╗░░██╗
██╔══██╗██╔══██╗████╗░████║████╗░████║██║░░░██║████╗░██║██║██╔══██╗██╔══██╗╚══██╔══╝██║██╔══██╗████╗░██║
██║░░╚═╝██║░░██║██╔████╔██║██╔████╔██║██║░░░██║██╔██╗██║██║██║░░╚═╝███████║░░░██║░░░██║██║░░██║██╔██╗██║
██║░░██╗██║░░██║██║╚██╔╝██║██║╚██╔╝██║██║░░░██║██║╚████║██║██║░░██╗██╔══██║░░░██║░░░██║██║░░██║██║╚████║
╚█████╔╝╚█████╔╝██║░╚═╝░██║██║░╚═╝░██║╚██████╔╝██║░╚███║██║╚█████╔╝██║░░██║░░░██║░░░██║╚█████╔╝██║░╚███║
░╚════╝░░╚════╝░╚═╝░░░░░╚═╝╚═╝░░░░░╚═╝░╚═════╝░╚═╝░░╚══╝╚═╝░╚════╝░╚═╝░░╚═╝░░░╚═╝░░░╚═╝░╚════╝░╚═╝░░╚══╝


_________                                     .__               __  .__               
\_   ___ \  ____   _____   _____  __ __  ____ |__| ____ _____ _/  |_|__| ____   ____  
/    \  \/ /  _ \ /     \ /     \|  |  \/    \|  |/ ___\\__  \\   __\  |/  _ \ /    \ 
\     \___(  <_> )  Y Y  \  Y Y  \  |  /   |  \  \  \___ / __ \|  | |  (  <_> )   |  \
 \______  /\____/|__|_|  /__|_|  /____/|___|  /__|\___  >____  /__| |__|\____/|___|  /
        \/             \/      \/           \/        \/     \/                    \/ 

*/

// const express = require("express");
// const app = express();
// const chalk = require("Chalk");
// const { SerialPort } = require("serialport");
// const { SerialPortStream, data } = require("@serialport/stream");

const { SerialPort } = require("serialport");
const { SerialPortStream } = require('@serialport/stream');
const sps = new SerialPortStream({ path: 'COM6', baudRate: 9600 })
const serialport = new SerialPort({ path: 'COM6', baudRate: 9600 })
sps.write('a')

// const port = 3000;

// const arduinoCOMPort = "COM6";

// const arduinoSerialPort = new SerialPort({
//   path: arduinoCOMPort,
//   baudRate: 9600, 
// });

// arduinoSerialPort.on("open", function () {
//   console.log(
//     chalk.white("[") + chalk.green("+") + chalk.white("]") + " " + "Serial Port : Connected"
//   );
//   arduinoSerialPort.write("main screen turn on", function (err) {
//     if (err) {
//       return console.log("Error on write:", err.message);
//     }
//   });
// });
