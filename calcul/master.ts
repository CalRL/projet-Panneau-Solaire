const express = require('express');
const app = express();
const chalk = require('Chalk');
const SerialPort = require("serialport");
const SerialPortStream = require ('@serialport/stream');

const port = 3000;

const arduinoCOMPort = "COM3";

const arduinoSerialPort = new SerialPort(arduinoCOMPort, { baudrate: 9600 });

arduinoSerialPort.on('open', function() {
    console.log(chalk.white("[") + chalk.green('+') + chalk.white("]") + 'Serial Port')
})
function testFunc() {
    console.log(chalk.white("[") + chalk.green('+') + chalk.white("]") + ' ' + chalk.green('Serial Port : '))
};
testFunc();