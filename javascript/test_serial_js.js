const { SerialPort } = require("serialport");

const serialport = new SerialPort({ path: 'COM6', baudRate: 9600, autoOpen:true})
serialport.write('')
